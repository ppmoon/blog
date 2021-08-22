---
title: "windows10安装mysql5.7"
date: 2016-01-27T17:30:54+08:00
draft: false
categories: ["mysql"]
tags: ["mysql"]
---

## 1.首先在mysql的官方网站下载mysql community server 5.7

由于我的win10是64位的所以我选择64zip下载。

http://dev.mysql.com/downloads/mysql/

![mysql下载页面
](http://upload-images.jianshu.io/upload_images/677473-eb53d313cb10a643.png)

不用注册直接点击No thanks,just start my downlload.

![不用注册](http://upload-images.jianshu.io/upload_images/677473-6f62b804ca626676.png)

## 2.解压文件为bin文件夹添加到环境变量

这部分很重要不赘述了。

![添加环境变量](http://upload-images.jianshu.io/upload_images/677473-892ca7aef4a4e1e1.png)

## 3.配置mysql配置文件

![mysql配置文件](http://upload-images.jianshu.io/upload_images/677473-2e7fa21425341d63.png)

配置mysql程序所在目录和mysql数据存放目录 

![目录](http://upload-images.jianshu.io/upload_images/677473-9f176b64c397503f.png)

记得去掉前面的#号

![配置](http://upload-images.jianshu.io/upload_images/677473-76fb364de7c1e2b2.png)

## 4.启动mysql

以管理员身份启动cmd

进入到mysql的解压的bin目录，在这里进行操作的目的是为了防止出错。

![进入mysql解压文件夹](http://upload-images.jianshu.io/upload_images/677473-14a980adc054790b.png)

输入

**mysqld -install**

在windows上安装mysql的服务。

![安装mysql服务](http://upload-images.jianshu.io/upload_images/677473-30f38363b4775294.png)

初始化data数据，这一步很重要不然mysql不能启动。

**mysqld --initialize**

这个时候我们才能看见data文件夹

![data](http://upload-images.jianshu.io/upload_images/677473-c3a884a9409190a6.png)

**net start mysql**

![启动mysql](http://upload-images.jianshu.io/upload_images/677473-a900a3decfcd2bd9.png)

我们可以在windows服务选项当中看到mysql的服务项目，可以设置成手动，使用的时候才启动它。

![服务](http://upload-images.jianshu.io/upload_images/677473-738a1703d5476222.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

## 5.进入mysql

因为我们初始化过mysql，mysql默认给我们一个初始密码，但是我没有设定保存到哪里所以我们找不到这个密码了O(∩_∩)O！！！

不过没关系我们修改mysql配置文件my.ini，在配置文件mysqld下面插入skip-grant-tables,让我们跳过验证，再进入到mysql。这里注意要重启mysql配置才会生效。

![跳过验证](http://upload-images.jianshu.io/upload_images/677473-0c1fe311189901ed.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![进入mysql](http://upload-images.jianshu.io/upload_images/677473-a3eb2be55b9dff57.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

## 6.重置root密码

```sql
update mysql.user set authentication_string=password('123456') where user='root' and Host = 'localhost';
```

![重置密码](http://upload-images.jianshu.io/upload_images/677473-df49d7939914034b.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

这样我们就可以用我们设置的密码登录mysql了。
