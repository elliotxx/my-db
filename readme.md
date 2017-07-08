#### 使用要求
* redis：要求系统已安装好 redis 到默认路径
* mongo：要求将 mongodb 的命令都放到 my-db/mongodb/bin 目录下

#### 使用方法
* 数据文件的放置  
redis 的数据文件 dump.rdb 文件放到 my-db/redis/ 目录下，便可直接使用  
mongo 的数据文件需要命令恢复

* 数据库的启动  
在 my-db/redis/ 目录中运行 start-redis.sh 启动 redis  
在 my-db/mongodb/ 目录中运行 start-mongod.sh 启动 mongodb

