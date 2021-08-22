---
title: "学习如何使用mysql的手册"
date: 2019-03-20T19:44:01+08:00
draft: false
categories: ["mysql"]
tags: ["mysql"]
---

mysql不同的版本会有不同的语法特性，如何才能知道当前版本的语法是什么样子的呢？最好的办法就是查看mysql的帮助手册。

查看mysql的手册只需要一个问号 + 关键词 就可以了：
比如我要查看show命令的使用说明可以直接在mysql的控制台输入 ? show
```
mysql> ? show
```
注意问号后面有空格。
就可以得到show命令的使用说明
```
Name: 'SHOW'
Description:
SHOW has many forms that provide information about databases, tables,
columns, or status information about the server. This section describes
those following:

SHOW {BINARY | MASTER} LOGS
SHOW BINLOG EVENTS [IN 'log_name'] [FROM pos] [LIMIT [offset,] row_count]

······

flexibility in specifying which rows to display. See
http://dev.mysql.com/doc/refman/5.7/en/extended-show.html.

URL: http://dev.mysql.com/doc/refman/5.7/en/show.html
```
同理我们可以输入 ? select ? int ? update 等等查看命令数据类型在当前版本的解释说明。这个小技巧在我们学习mysql和日常使用当中都会产生事半功倍的效果哦。

## 思考
让我们思考一下 问号 + 命令 查看mysql手册这条命令的逻辑。
问号 ？ 表示疑问，命令表示疑问的主体。? show 是不是颇有一种 what is show? 的感觉？这样看起来就更像是在更电脑提问了吧。