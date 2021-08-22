---
title: "SQL的IN操作符"
date: 2017-08-30T23:00:01+08:00
draft: false
categories: ["mysql"]
tags: ["mysql"]
---

## IN操作符
IN操作符允许我们在WHERE子句中规定多个值。
这个操作符可以让我们在表中选取有一定规律的特定值，比如多个同样的订单选取最新的一个。

SQL IN 语法
```sql
SELECT 列名
FROM 表明
WHERE 列名 IN (value1,value2,...)
```
## 例子
简单的例子网上有，这里说一个复杂点的例子

![image.png](http://upload-images.jianshu.io/upload_images/677473-186cc777919401fc.png)
有如上图所示的表
#### 查询要求
1.我们要在指定chain_id上只查询一条时间最新的数据。比如ID 4和5 chain_id都为4，但是我们只能显示7月3日的ID为5的数据。
2.这条数据的on_off如果为0我们是不抽取这条数据出来的。
```sql
SELECT *
FROM file 
WHERE created_at in (
SELECT MAX(created_at)
FROM file WHERE chain_id in (1,2,3,4) && on_off <> 0
GROUP BY chain_id
);
```
#### 查询结果

![image.png](http://upload-images.jianshu.io/upload_images/677473-eca0a610de9fcaf0.png)

#### SQL语句的解析
上面使用了两个WHERE...IN，第一层我们想找时间最大的数据条目，第二层我们要求同时这个数据是我们的制定的chain_id,并且on_off不能为0 。同时满足三个条件得出我们的结果。
实际上是先找出了指定chain_id上on_off不为0的数据，然后再从这个数据集当中找到指定chain_id时间最大的那些数据。
