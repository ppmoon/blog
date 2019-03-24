---
title: "Mysql基本操作"
date: 2019-03-22T17:30:54+08:00
draft: false
tags: ["mysql"]
---

在开始讨论Mysql的基本操作之前我们需要先明确主体，即我们操作的是什么？下面我们忽略一些具体细节来了解一下Mysql这款数据库管理数据的结构和单元。

<div class="mermaid">
graph TD;
    Mysql-->Database1;
    Mysql-->Database2;
    Mysql-->Database3;
    Database1-->Table1;
    Database1-->Table2;
    Database1-->Table3;
    Database2-->Table4;
    Database3-->Table5;
    Database3-->Table6;
    Table3-->Data1;
    Table3-->Data2;
</div>

通过上图我们了解到Mysql可以管理多个数据库，每一个数据库又可以管理多个表，表里又管理了千千万万的数据；我们使用Mysql操作的就是数据库，数据库中的表格以及表格当中的数据。

接下来我们需要学习的内容围绕下面的5个问题：

1. 如何创建一个数据库？
2. 如何创建一个表？
3. 如何在表中创建数据？
4. 如何从表中检索数据？
5. 如何操作多个表？

# 如何创建一个数据库？

使用*create*命令用来创建数据库，命令格式为：
```
create database 数据库名称;
```

如果我们想创建一个test的数据库我们可以写：
```
create database test;
```
这样我们就创建了一个名称为test的数据库了
后面我们会发现*create*命令不仅可以创建数据库，还可以创建表以及一些其他东西。

## 如何查看刚刚创建的数据库呢？
我们可以先使用*show*命令用来查看现在Mysql都管理了哪些数据库。

```
mysql> show databases;
+----------+
| Database |
+----------+
| mysql    |
| test     |
| tmp      |
+----------+
```


*show*这个命令就如同字面翻译一样，显示，显示什么？ 显示databases，显示数据库，在后面我们会多次使用show这个命令。命令当中的数据库这个英文单词是复数形式，意味着显示很多数据库。（如果输入单数形式的database会显示错误，因为就没有这条命令，这里的提示只是为了方便记忆和理解）最后像其他大部分语言一样，命令语句结束以后要加一个分号用以表示命令输入完了。
如果你输入的命令有误Mysql会提示如下错误：
```
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'database' at line 1
```
这意味着我们的命令语法错误了，不符合Mysql的语法规则。错误会告诉我们错误的地方大概在哪里。

## 使用数据库

创建好数据库以后我们还要让mysql知道我们当前要操作的是那个数据库。使用*use*命令来告诉mysql我们正在操作的数据库是哪一个。语法为*use 数据库名称;*
```
use test;
```
这样mysql就会知道我们当前正在操作的数据库是test数据库，方便后续的命令执行。
如果没有使用*use*命令去创建数据库，mysql会返回给我们一个错误提示：
```
mysql> create table test;
ERROR 1046 (3D000): No database selected
```
错误1046没有数据库被选择。

