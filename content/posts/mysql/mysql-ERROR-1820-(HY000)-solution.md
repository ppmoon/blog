---
title: "mysql ERROR 1820 (HY000)解决办法"
date: 2016-02-01T19:44:01+08:00
draft: false
categories: ["mysql"]
tags: ["mysql"]
---

本解决办法是针对如何错误提示：
ERROR 1820 (HY000): You must reset your password using ALTER USER statement before executing this statement.
为了保证安全，mysql会对用户的密码设置使用期限，我们只要让他不过期就可以了。
step 1: SET PASSWORD = PASSWORD(‘写你的新密码‘);
step 2: ALTER USER ‘root‘@‘localhost‘ PASSWORD EXPIRE NEVER;
step 3: flush privileges;

![图示](http://upload-images.jianshu.io/upload_images/677473-9be5717310a573d1.png)
