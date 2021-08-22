---
title: "golang-uint类型如何转换成string"
date: 2018-04-28T21:18:01+08:00
draft: false
categories: ["golang"]
tags: ["golang"]
---

## 问题golang uint类型如何转换成string
这里值得注意的地方时，本文说的不是uint8，uint64就是uint类型。

## 解决方法

````
var a uint = 1
b := strconv.Itoa(int(a))
c := string(b)
d := string(a)
fmt.Println(c)
````
使用strconv的Itoa方法先将uint转换成int类型，再将int类型转换成string。
