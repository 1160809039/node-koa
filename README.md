# 项目简介
语言是node.js 用koa开发的博客后台api接口，数据库是mysql和mongodb。<br/>
前端页面angualr写的,地址是 [https://github.com/1160809039/angular](https://github.com/1160809039/angular)
<hr/>

|author|shaozeming|
|:---|:---|
|qq|1160809039|

<hr/>

## 环境要求
需要node环境 mysql mongodb rabbitmq(可以小改) 七牛云存储


<hr/>

## 运行
使用根目录下 myblogs.sql文件在数据库中执行<br/>
修改 config/config.js中mongodb配置<br/>
修改 utils/mysqlutils.js中mysql配置<br/>
修改 utils/uploadutils.js中七牛云配置<br/>
运行 npm run start<br/>
