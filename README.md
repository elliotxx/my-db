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
* 开启数据库权限认证
    * mongodb 设置用户名和密码：[MongoDB如何设置权限（类似关系型数据库的用户名和密码）](http://www.cnblogs.com/itxiongwei/p/5520863.html)  
        1. 使用 mongod 启动服务时开启权限认证  
```mongod --dbpath ./db1 --port 20000 --auth    # 加上 --auth 或者在配置文件中加入 auth = true```  
        2. 创建管理员权限用户  
```use admin```  
```db.createUser({user:"admin",pwd:"admin123",roles:["userAdminAnyDatabase"]})```
        3. 登录管理员用户  
```use admin```  
```db.auth("admin","admin123")    # 返回 1 表示登陆成功```
        4. 创建普通用户  
```use admin	# 选择普通用户的认证服务器```  
```db.createUser(```    
```{```  
```	user:'guest',```  
```	pwd:'guest123',```  
```	roles:[{role:'readWrite',db:'test'}]	# 该用户 guest 对 test 数据库有 readWrite 权限```  
```}```  
```)```
        5. 普通用户远程连接  
        ```mongo --host 127.0.0.1 --port 27017 -u "guest" -p "guest123" --authenticationDatabase "admin"```
        6. 赋予用户角色  
        ```use admin```  
        ```db.grantRolesToUser( 'your_user', [ {role:'readWrite',db:'your_db'} ] )```
        7. 剥夺用户角色  
        ```use admin```  
        ```db.revokeRolesFromUser( 'your_user',[ {role:'readWrite',db:'your_db'} ] )```
        8. 删除用户  
        ```use admin```  
        ```db.dropUser('your_user')```
    * redis 设置访问密码
        1. 修改 redis.conf
        2. 将 ```#requirepass foobared``` 注释去掉，改为你的访问密码：```requirepass myPassword```
        3. 重启 Redis   
        4. 远程连接
            ```redis-cli -h 127.0.0.1 -p 6379 -a myPassword```
            
#### 参考资料
mongodb 3.4.5安装及安全配置  
https://my.oschina.net/u/2404183/blog/994005

Install MongoDB Community Edition on Ubuntu（官方文档）  
https://docs.mongodb.com/manual/tutorial/install-mongodb-on-ubuntu/

Mongodb 启动报错:"/sys/kernel/mm/transparent_hugepage/enabled is 'always'"  
http://blog.csdn.net/u013075468/article/details/51471033

线上环境部署MongoDB的官方建议  
http://www.cnblogs.com/ywcz060/p/5551776.html

Enable Auth（MongoDB 官方文档，开启权限认证，创建管理员用户，远程登录）  
https://docs.mongodb.com/manual/tutorial/enable-authentication/

Manage Users and Roles（MongoDB 官方文档，修改用户角色，修改用户密码，查看用户角色，查看角色权限）  
https://docs.mongodb.com/manual/tutorial/manage-users-and-roles/

Python Driver (PyMongo)（MongoDB 官方文档，pymongo）  
https://docs.mongodb.com/getting-started/python/client/

PyMongo 权限验证的例子（Authentication Examples）  
http://api.mongodb.com/python/current/examples/authentication.html

Redis Quick Start（Redis 官方文档）  
https://redis.io/topics/quickstart

redis配置认证密码  
http://blog.csdn.net/zyz511919766/article/details/42268219

Python操作redis（使用密码连接Redis）  
http://blog.csdn.net/pi9nc/article/details/17358757

Redis 命令查询（Redis 官方文档）  
https://redis.io/commands