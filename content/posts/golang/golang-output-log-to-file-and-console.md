---
title: "Golang将日志同时输出到控制台和文件"
date: 2020-03-11T21:16:01+08:00
draft: false
categories: ["golang"]
tags: ["golang"]
---

# 问题背景

日常开发当中需要将golang的log包打印的日志同时输出到控制台和文件，应该如何解决这个问题？

# 解决思路

log包可以通过SetOutput()方法指定日志输出的方式（Writer），但是只能指定一个输出的方式（Writer）。我们利用io.MultiWriter()将多个Writer拼成一个Writer使用的特性，把log.Println()输出的内容分流到控制台和文件当中。

# 代码

````golang
package main

import (
	"io"
	"log"
	"os"
)

func main()  {
	logFile, err := os.OpenFile("log.txt", os.O_CREATE | os.O_APPEND | os.O_RDWR, 0666)
	if err != nil {
		panic(err)
	}
	defer logFile.Close()
	mw := io.MultiWriter(os.Stdout,logFile)
	log.SetOutput(mw)
	log.Println("log test")
}

````