new Vue({
    el: "#app",
    data:{
        sellerList:[],
        seller:{},//添加商家实体
        searchSeller:{},//搜索品牌实体
        page: 1,  //显示的是哪一页
        pageSize: 10, //每一页显示的数据条数
        total: 10, //记录总数
        sellerdetail:{},
        maxPage:9,
    },
    methods: {
        pageHandler(page){
            this.page=page;
            this.searchSeller.status=0;
            axios.post("/seller/findPage?page="+this.page+"&pageSize="+this.pageSize,this.searchSeller).then(res=>{
                this.sellerList=res.data.rows;
                this.total=res.data.total;
            }).catch(err=>{
                alert("请求失败");
            })
        },
        detail(sellerId){
            axios.get("/seller/sellerdetail?sellerId="+sellerId).then(res=>{
              this.sellerdetail=res.data;
            }).catch(err=>{
                alert("请求失败")
            })
        },
        updateStatus(sellerId,status){
            var seller={
                sellerId:sellerId,
                status:status
            }
            axios.post("/seller/updateStatus",seller).then(res=>{
                if(res.data.success){
                    this.pageHandler(1);
                }else {
                    alert(res.data.message)

                }
            }).catch(err=>{
                    alert("请求失败");
            })
        }
    },
    created() {
        this.pageHandler(1);
    }
});