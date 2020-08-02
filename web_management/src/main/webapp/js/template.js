Vue.component('v-select', VueSelect.VueSelect);
new Vue({
    el:"#app",
    data:{
        tempList:[],
        temp:{},
        searchTemp:{},
        page: 1,  //显示的是哪一页
        pageSize: 10, //每一页显示的数据条数
        total: 150, //记录总数
        maxPage:9,
        selectIds:[], //记录选择了哪些记录的id
        /*品牌选项*/
        brandsOptions: [],
        placeholder: '可以进行多选',
        selectBrands: [],
        sel_brand_obj: [],
        /*规格选项*/
        specOptions: [],
        selectSpecs: [],
        sel_spec_obj: [],
        addname:"",//添加的模板名称
        updateId:"",//修改模板id
        selectedId:[],
    },
    methods:{
        //分页查询
        pageHandler(page){
            this.page=page;
            axios.post("/temp/findPage?page="+this.page+"&pageSize="+this.pageSize,this.searchTemp).then(res=>{//成功返回
                console.log(res);
                this.total=res.data.total;
                this.tempList=res.data.rows;//赋值
            }).catch(err=>{//失败返回
                alert("请求失败")
            });
        },
        // 定义方法：获取JSON字符串中的某个key对应值的集合
        jsonToString : function(jsonStr,key){
            // 将字符串转成JSOn:
            var jsonObj = JSON.parse(jsonStr);
            var value = "";
            for(var i=0;i<jsonObj.length;i++){
                if(i>0){
                    value += ",";
                }
                value += jsonObj[i][key];
            }
            return value;
        },

        selected_brand: function(values){
            this.selectBrands =values.map(function(obj){
                return obj
            });
            console.log(this.selectBrands);
        },
        selecte_spec: function(values){
            this.selectSpecs =values.map(function(obj){
                return obj.id
            });
            console.log(this.sel_spec_obj);
        },
        selLoadData () {
            axios.get("/brand/selectOptionList").then(res=> {
                    this.brandsOptions = res.data;
                }).catch(err=>{
                alert("请求失败")
            });
            axios.get("/spec/selectOptionList")
                .then(res=> {
                    this.specOptions = res.data;
                }).catch(err=>{
                alert("请求失败")
            });
        },
        save() {
            var url="";
            if(this.updateId!=null&&""!==this.updateId){
                url="/temp/update";
            }else {
                url="/temp/add";
            }
            var addentity={
                id:this.updateId,
                name:this.addname,
                specIds:this.sel_spec_obj,
                brandIds:this.sel_brand_obj,
            };
            axios.post(url,addentity).then(res=>{
                    this.pageHandler(1);
                }).catch(err=> {
                    alert("请求失败")
            });
        },

        deleteSelection(event,id){//记录选中id
            //判断checkbox是否为选中状态
            if(event.target.checked){//选中
                this.selectedId.push(id);
            }else{
                //未选中
                var idx= this.selectedId.indexOf(id);
                this.selectedId.splice(idx,1)//删除元素
            }
        },
        /*删除模板*/
        deleteById(){
            axios.post("/temp/deleteById",Qs.stringify({id:this.selectedId},{indices:false})).then(res=>{
                if(res.data.success){
                    alert(res.data.message)
                    this.pageHandler(1);
                }else{
                    alert(res.data.message);
                }
            }).catch(err=>{
                alert("请求失败")
            })
        },
        findWithId(id){
            axios.get("/temp/findWithId?id="+id).then(res=>{
                console.log(res.data);
                this.updateId=res.data.id;
                this.addname=res.data.name;//模板类别
            }).catch(err=>{
                alert("请求失败")
            })
        },
        clearId(){
            this.updateId="";
            this.addname="";
            this.selectBrands=[];
            this. sel_brand_obj=[];
            this.selectSpecs=[];
            this.sel_spec_obj=[];
        }
    },
    created(){
        this.pageHandler(1);
        this.selLoadData();
    }
});