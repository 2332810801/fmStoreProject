# fmstoreproject
分布式商城

下载 

> git clone git@github.com:2332810801/fmStoreProject.git

注意事项：

duboo地址：
 
 文件地址：common/src/resources/properties/dubbox.properties
 address=192.168.0.108:2181 
    
    
调用方服务zookeeper地址
文件地址：

web_management/src/resources/spring/springmvc.xml
<dubbo:registry address="zookeeper://192.168.0.108:2181"/>
    
数据库：fmstore

sql文件：/doc/fmstore.sql

表名称以及备注：

tb_brand：品牌

tb_goods_desc：商品详情

tb_item：商品明细

tb_seller：商家

tb_content：内容（广告）

tb_item_cat：商品分类

tb_content_category：内容（广告）类型

tb_goods：商品

tb_type_template：类型模板：用于关联品牌和规格

tb_order：订单

tb_specification_option：规格选项

tb_order_item：订单明细

tb_specification：规格

tb_pay_log：支付日志

tb_user：用户