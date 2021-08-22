---
title: "mysql修改字段名称"
date: 2016-04-15T22:00:01+08:00
draft: false
categories: ["mysql"]
tags: ["mysql"]
---

# 在mysql当中如果字段创建以后想修改名字怎么办？
alter table 表名 change 旧字段名 新字段名 字段属性;
举个例子：

修改users表的name字段为username
```sql
alter table users change name username varchar(25);
```
个人觉得这个change的方法是销毁掉原来的字段再在原来的地方常见新字段的方法来更换字段名称。