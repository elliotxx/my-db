#### 使用要求
* redis：要求系统已安装好 redis 到默认路径
* mongo：要求将 mongodb 的命令都放到 my-db/mongodb/bin 目录下  
mongodb 3.4.6 ubuntu 64bit 版本下载命令：  
```wget https://fastdl.mongodb.org/linux/mongodb-linux-x86_64-ubuntu1604-3.4.6.tgz```

#### 使用方法
* 数据文件的放置  
redis 的数据文件 dump.rdb 文件放到 my-db/redis/ 目录下，便可直接使用  
mongo 的数据文件需要命令恢复

* 数据库的启动  
在 my-db/redis/ 目录中运行 start-redis.sh 启动 redis  
在 my-db/mongodb/ 目录中运行 start-mongod.sh 启动 mongodb

#### 参考资料
mongodb 3.4.5安装及安全配置  
https://my.oschina.net/u/2404183/blog/994005

Install MongoDB Community Edition on Ubuntu（官方文档）  
https://docs.mongodb.com/manual/tutorial/install-mongodb-on-ubuntu/

Mongodb 启动报错:"/sys/kernel/mm/transparent_hugepage/enabled is 'always'"  
http://blog.csdn.net/u013075468/article/details/51471033

线上环境部署MongoDB的官方建议  
http://www.cnblogs.com/ywcz060/p/5551776.html

