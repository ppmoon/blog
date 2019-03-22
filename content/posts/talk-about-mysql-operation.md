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

*show*这个命令就如同直面翻译一样，显示，显示什么？ 显示databases，显示数据库，在后面我们会多次使用show这个命令。命令当中的数据库这个英文单词是复数形式，意味着显示很多数据库。（如果输入单数形式的database会显示错误，因为就没有这条命令，这里的提示只是为了方便记忆和理解）最后像其他大部分语言一样，命令语句结束以后要加一个分号用以表示命令输入完了。
如果你输入的命令有误Mysql会提示如下错误：
```
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'database' at line 1
```
这意味着我们的命令语法错误了，不符合Mysql的语法规则。错误会告诉我们错误的地方大概在哪里。