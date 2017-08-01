#### 使用要求
* redis：要求系统已安装好 redis 到默认路径  
redis 4.0.1 安装：

```
wget http://download.redis.io/releases/redis-4.0.1.tar.gz
tar xzf redis-4.0.1.tar.gz
cd redis-4.0.1
make install
```
* mongo：要求将 mongodb 的命令都放到 my-db/mongodb/bin 目录下  
mongodb 3.4.6 ubuntu 64bit 安装：  

```
wget https://fastdl.mongodb.org/linux/mongodb-linux-x86_64-ubuntu1604-3.4.6.tgz
tar zxvf mongodb-linux-x86_64-ubuntu1604-3.4.6.tgz
cp -R mongodb-linux-x86_64-ubuntu1604-3.4.6/bin/ my-db/mongodb/
```

#### 使用方法
* 数据文件的放置  
    * redis 的数据文件 dump.rdb 文件放到 my-db/redis/ 目录下，便可直接使用  
    * mongo 的数据文件需要命令恢复

* 数据库的启动  
    * 在 my-db/redis/ 目录中运行 start-redis.sh 启动 redis  
    * 在 my-db/mongodb/ 目录中运行 start-mongod.sh 启动 mongodb  
mongodb 设置用户名和密码：[MongoDB如何设置权限（类似关系型数据库的用户名和密码）](http://www.cnblogs.com/itxiongwei/p/5520863.html)  
1.使用 mongod 启动服务时开启权限认证  
```mongod --dbpath ./db1 --port 20000 --auth    # 加上 --auth 或者在配置文件中加入 auth = true```  
2.设置管理员权限  
```use admin```  
```db.createUser({user:"root",pwd:"root123",roles:["userAdminAnyDatabase"]})```  
3.以该用户的身份登录  
```use admin```  
```db.auth("root","root123")    # 返回 1 表示登陆成功```

#### 参考资料
mongodb 3.4.5安装及安全配置  
https://my.oschina.net/u/2404183/blog/994005

Install MongoDB Community Edition on Ubuntu（官方文档）  
https://docs.mongodb.com/manual/tutorial/install-mongodb-on-ubuntu/

Mongodb 启动报错:"/sys/kernel/mm/transparent_hugepage/enabled is 'always'"  
http://blog.csdn.net/u013075468/article/details/51471033

线上环境部署MongoDB的官方建议  
http://www.cnblogs.com/ywcz060/p/5551776.html

