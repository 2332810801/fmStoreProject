new Vue({
    el:"#app",
    data:{
        categoryList1:[],//分类1数据列表
        categoryList2:[],//分类2数据列表
        categoryList3:[],//分类3数据列表
        grade:1,  //记录当前级别
        catSelected1:-1,//分类1选中的id
        catSelected2:-1,//分类2选中的id
        catSelected3:-1,//分类3选中的id,
        typeItemID:"",//模板ID
        brandList:[],//品牌列表
        selBrand:-1,//当前选中的品牌
        curImageObj:{
            color:"",//颜色,
            url:"",//地址
        },
        ImageList:[],//图片数组
        specList:[],//从服务器获取的所有规格列表,
        specSelList:[],//当前选中的规格
        isEnableSpec:1, //是否启用规格
        rowList:[],//规格显示
        goodsEntity:{
            goods:{},
            goodsDesc:{},
            itemList:{}
        },//最终保存商品的实体

    },
    methods:{
        loadCateData (id) {
            axios.post("/itemCat/findByParentId?parentId="+id)
                .then(res=>{
                    if (this.grade == 1){
                        //取服务端响应的结果
                        this.categoryList1 = res.data;
                    }
                    if (this.grade == 2){
                        //取服务端响应的结果
                        this.categoryList2 =res.data;
                    }
                    if (this.grade == 3){
                        //取服务端响应的结果
                        this.categoryList3 =res.data;
                    }
                }).catch(err=>{
                    alert("请求失败");
            })
        },
        getCatSelected(grade) {//选项改变时调用
            if(grade == 1){ //第1级选项改变
                this.categoryList2 = [];//清空二级分类数据
                this.catSelected2=-1;   //默认选择
                this.categoryList3 = []; //清空三级分类数据
                this.catSelected3=-1; //默认选择
                this.grade = grade+1; // 加载第2级的数据
                this.loadCateData(this.catSelected1);
            }
            if(grade == 2) { //第2级选项改变
                this.categoryList3 = [];//清空三级分类数据
                this.catSelected3=-1;//默认选择
                this.grade = grade + 1;// 加载第3级的数据
                this.loadCateData(this.catSelected2);
            }
            if (grade == 3){ //第3级选项改变
                //加载模板
               axios.get("/itemCat/findTypeId?id="+this.catSelected3).then(res=>{
                 this.typeItemID=res.data.typeId;
               }).catch(err=>{
                   alert("请求失败")
               })
            }
        },
        //文件上传
        uploadFile(){
            var formData = new FormData();
            formData.append('file', file.files[0])
            const instance=axios.create({
                withCredentials: true
            });
            instance.post('/upload/uploadFile', formData).then(res=> {
              if(res.data.success){
                  this.curImageObj.url=res.data.message;
              }else {
                  alert(res.data.message);
              }
            }).catch(err=> {
                alert("请求异常")
            });
        },
        /*保存商品图片到数据库*/
        saveImage(){
            if(this.curImageObj.color==''&&this.curImageObj.url==''){
                alert("请输入颜色和上传图片");
                return;
            }
            var obj={color:this.curImageObj.color,url:this.curImageObj.url}
            this.ImageList.push(obj);
            this.curImageObj.color="";
            this.curImageObj.url="";
        },
        /*删除图片*/
        delImage(url,index){
            /*发送删除图片的请求*/
            axios.get("/upload/delteImage?url="+url).then(res=>{
                if(res.data.success){
                    this.ImageList.splice(index,1);
                }else{
                    alert(res.data.message)
                }
            }).catch(err=>{
                alert("请求失败")
            })
        },
        searchObjectByKey:function(list,keyName,keyValue){
            for(var i=0;i<list.length;i++){
                if(list[i][keyName] == keyValue){
                    return list[i];
                }
            }
            return null;
        },
        updateSpecState(event,specName,optionName){
            var obj=this.searchObjectByKey(this.specSelList,"specName",specName);
            if(obj!=null){
                if(event.target.checked){
                    /*选中*/
                    obj.specOptions.push(optionName);
                }else {
                    /*取消选中*/
                  var idx= obj.specOptions.indexOf(optionName);
                  obj.specOptions.splice(idx,1);
                  /*判断规格选项中是否还有选项*/
                  if(obj.specOptions.length==0){
                      var idx=this.specSelList.indexOf(obj);
                      this.specSelList.splice(idx,1);
                  }
                }
            }else{
                this.specSelList.push({"specName":specName,"specOptions":[optionName]})
            }
            this.createRowList();
        },
        createRowList() {
            var rowList = [
                {spec:{},price:0,num:9999,status:'0',isDefault:'0'}
            ];
            for(var i = 0; i< this.specSelList.length; i++ ){
                var specObj = this.specSelList[i];
                var specName = specObj.specName; //选择版本
                var specOptions = specObj.specOptions; //["6G+64G","8G+128G"]
                var newRowList = [];
                for(var j=0; j<rowList.length; j++){
                    var oldRow = rowList[j]; //{spec:{选择颜色:星云紫},price:0,num:9999,status:'0',isDefault:'0'}
                    for(var k=0; k<specOptions.length; k++ ){
                        var newRow = JSON.parse(JSON.stringify(oldRow));
                        //{spec:{选择颜色:星云紫,选择版本:8G+128G},price:0,num:9999,status:'0',isDefault:'0'}
                        newRow.spec[specName] = specOptions[k];
                        newRowList.push(newRow);
                    }
                }
                rowList = newRowList;
            }
            this.rowList = rowList;
        },
        /*保存商品*/
        saveGoods(){

                this.goodsEntity.goods.category1Id = this.catSelected1;
                this.goodsEntity.goods.category2Id = this.catSelected2;
                this.goodsEntity.goods.category3Id = this.catSelected3;
                this.goodsEntity.goods.typeTemplateId=this.typeItemID,
                this.goodsEntity.goods.brandId=this.selBrand,
                this.goodsEntity.goods.isEnableSpec=this.isEnableSpec,
                this.goodsEntity.goodsDesc.itemImages=this.ImageList,
                this.goodsEntity.goodsDesc.specificationItems=this.specSelList,
                this.goodsEntity.goodsDesc.introduction=UE.getEditor('editor').getContent()
                this.goodsEntity.itemList = this.rowList;

                /*判断数据正确性*/
                if(this.catSelected1===-1&&this.catSelected1==null){
                    alert("请选择一级分类")
                    return;
                }
                if(this.catSelected2===-1&&this.catSelected2==null){
                    alert("请选择二级分类")
                    return;
                 }
                if(this.catSelected3===-1&&this.catSelected3==null){
                    alert("请选择三级分类")
                    return;
                }
                if(this.typeItemID==null){
                    alert("模板ID异常");
                    return;
                }
                if(this.selBrand===-1&&this.selBrand==null){
                    alert("请选择品牌");
                    return;
                }
             //发送请求
             axios.post("/goods/add",this.goodsEntity).then(res=> {
                     console.log(res.data);
                    location.href="goods.html";
                 }).catch(err=>{
                 alert("请求失败");
             });
        }
    },
    watch: { //监听属性的变化
        typeItemID(newValue, oldValue) {
            this.brandList =[];
            this.specList=[];
            this.selBrand = -1;
            axios.post("/temp/findOne.do?id="+newValue).then(res=>{
                this.brandList = JSON.parse(res.data.brandIds);
                }).catch(err=> {
                console.log(err);
            });
            axios.get("/temp/findBySpecList?id="+newValue)
                .then(res=>{
                    this.specList = res.data;
                    console.log(res.data.specList.options);
                }).catch(err=> {
            });
        },
    },
    created() {
        this.loadCateData(0);
    }
});
