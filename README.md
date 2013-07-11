DD-Shopping
===========

该项目为本人独立完成。

项目名称：通用电子商务平台 
项目时间：2013年4月 - 2013年5月
软件环境：Windows + Tomcat6.0 + MySQL + Redis        
开发工具：Intellij IDEA 
所用技术：数据抓取，SpringMVC，MyBatis，Javamail，Javascript，AJAX等
项目描述：
  一、DataPre是自己实现的定向抓取当当网数据的模块，利用Jsoup和HtmlUnit实现定下抓取，
    封然后装所需数据，通过事务保存至数据库，并同时下载图片。
  二、DDWeb是通用平台项目：
    1.利用SpringMVC和MyBatis作为架构
    2.利用cookie管理用户登录、状态及浏览历史等信息
    3.注册验证利用Javamail发送邮件验证链接
    4.并利用redis作为缓存服务器存储常用信息
    5.利用MyBatis监听器实现物理分页
    6.利用Maven管理项目依赖
	并在此平台基础上实现大部分功能。

