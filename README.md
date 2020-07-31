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
    
