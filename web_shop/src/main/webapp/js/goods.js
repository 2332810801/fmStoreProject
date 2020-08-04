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
        getBrandList(){
            axios.get("/brand/findBrandAll").then(res=>{
                this.brandList=res.data;
            }).catch(err=>{
                alert("请求失败");
            })
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
        }
    },
    created() {
        this.loadCateData(0);
        this.getBrandList();
    }
});
