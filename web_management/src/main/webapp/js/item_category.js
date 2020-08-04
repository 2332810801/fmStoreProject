new Vue({
    el: "#app",
    data:{
        categoryList:[],
        grade:1, /*当前级别*/
        entity1:{}, /*面包屑导航1*/
        entity2:{} /*面包屑导航2*/
    },
    methods: {
        selectCateByParentId (id) {
            axios.post("/itemCat/findByParentId?parentId="+id).then( res=>{
                    //取服务端响应的结果
                    this.categoryList =res.data;
                console.log(res.data);
            }).catch(err=>{
                alert("请求失败")
            })
        },
        nextGrade(entity){
            if (this.grade == 1){//如果当前是第一级, 面包屑导航为空
                this.entity1 = {};
                this.entity2 = {};
            }
            if (this.grade == 2){ //第2级,把当前的分类显示在第1个面包屑上
                this.entity1 = entity;
                this.entity2 = {};
            }
            if (this.grade == 3){ //第3级,把当前点击分类显示到第二个面包屑上
                this.entity2 = entity;
            }
               this.selectCateByParentId(entity.id);
        },
        setGrade:function(value){
            this.grade = value;
        }
    },
    created() {
        this.selectCateByParentId(0);
    }
});