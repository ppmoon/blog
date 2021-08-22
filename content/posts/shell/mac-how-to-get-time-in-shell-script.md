---
title: "Mac如何在shell脚本当中获取时间"
date: 2019-08-26T14:00:00+08:00
draft: false
categories: ["shell"]
tags: ["shell"]
---

# Mac如何在shell脚本当中获取时间

## 获取今天的时间

```shell
date
2019年 8月26日 星期一 14时02分23秒 CST
```
直接输入date就可以获取当前的时间（CST时间）
```shell
date -jnRu
Mon, 26 Aug 2019 06:06:29 +0000
```
如果加上参数`-jnRu`会显示格林威治时间(GMT)
## 时间格式化

```shell
date +"%Y-%m-%d %H:%M:%S"
2019-08-26 14:28:14
```
格式化数据可以直接使用加号，然后配合日期符号输出
常用日期符号

| 符号 | 代表意义 |
| ---- | ---- | 
| %Y  | 年 |
| %m  | 月 |
| %d  | 日 |
| %H | 时 |
| %M  | 分 |
| %S | 秒 |

## 获取昨天的时间

mac下的date命令计算时间的方法和linux会不太一样

命令参数为`[-v[+|-]val[ymwdHMS]]`

date 后加 -v 加减一个值，最后填写格式化参数格式化输出。都是在当前时间的基础上进行加减运算的
```shell
date -v-1d +"%Y-%m-%d"
2019-08-25
date -v-1y +"%Y-%m-%d"
2018-08-26
date -v+1m +"%Y-%m-%d"
2019-09-26
date -v+1H +"%Y-%m-%d %H:%M:%S"
2019-08-26 15:40:36
date -v+1M +"%Y-%m-%d %H:%M:%S"
2019-08-26 14:41:58
date -v+1S +"%Y-%m-%d %H:%M:%S"
2019-08-26 14:40:12
```

## 总结
编写shell脚本执行的时候需要使用到时间，更多关于date命令的使用方法可以使用
```shell
man date
```
进行查看详细的使用方法或者输入一个错误的参数比如
```shell
date h
date: illegal time format
usage: date [-jnRu] [-d dst] [-r seconds] [-t west] [-v[+|-]val[ymwdHMS]] ... 
            [-f fmt date | [[[mm]dd]HH]MM[[cc]yy][.ss]] [+format]
```
会提示提示部分使用方法。