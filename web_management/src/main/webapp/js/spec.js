new Vue({
    el:"#app",
    data:{
        specList:[],//规格集合,
        page:0,//当前页码
        pageSize:10,//一页有多少行数据
        total:100,//总记录数
        maxPage:10,//最大页码数
        spec:{//规格信息
            specName:"",//规格名称
        },
        selectedId:[],//选中id的集合
        searchSpec:{//规格信息
            specName:"",//规格名称
        },
        specEntity:{
            spec:{},
            specOption:[]
        }
    },
    methods:{
        //分页查询
        pageHandler(page){
            this.page=page;
            axios.post("/spec/findPage?page="+this.page+"&pageSize="+this.pageSize,this.searchSpec).then(res=>{//成功返回
                this.total=res.data.total;
                this.specList=res.data.rows;//赋值
            }).catch(err=>{//失败返回
                alert("请求失败")
            });
        },
        /*添加规格选项*/
        addRow(){
            this.specEntity.specOption.push({})
        },
        /*删除规格选项*/
        deleteRow(index){
            this.specEntity.specOption.splice(index,1);
        },
        /*保存*/
        save(){
            var url=null;
            if(this.specEntity.spec.id!=null){
                url="/spec/update"
            }else{
                url="/spec/save";
            }
            axios.post(url,this.specEntity).then(res=>{
                if(res.data.success){
                    alert(res.data.message)
                    this.specEntity.spec={};
                    this.specEntity.specOption=[];
                    this.pageHandler(1);
                }else{
                    alert(res.data.message);
                }
            }).catch(err=>{
                alert("请求失败");
            })
        },
        /*根据id查询规格*/
        findSpecById(id){
            axios.get("/spec/findSpecById?id="+id).then(res=>{
                this.specEntity=res.data;
            }).catch(err=>{
                alert("请求失败");
            })
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
            console.log(this.selectedId);
        },
        /*删除品牌*/
        deleteById(){
            axios.post("/spec/deleteById",Qs.stringify({id:this.selectedId},{indices:false})).then(res=>{
                if(res.data.success){
                    alert(res.data.message)
                    this.pageHandler(1);
                }else{
                    alert(res.data.message);
                }
            }).catch(err=>{
                alert("请求失败")
            })
        }
    },
    created(){
        this.pageHandler(1)
    }
});