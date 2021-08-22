---
title: "Go编写一个简单的web服务器"
date: 2017-04-19T01:27:01+08:00
draft: false
categories: ["golang"]
tags: ["golang"]
---

Go是一款静态里语言，特点就是拥有极好的并发编程体验。下面是使用Go实现的一个并发，非阻塞的web服务器。

## 代码
````golang
package main

import (
	"fmt"
	"net/http"
	"strings"
	"log"
)

func sayhelloName(w http.ResponseWriter, r *http.Request) {
	r.ParseForm()  //解析参数，默认是不会解析的
	fmt.Println(r.Form)  //这些信息是输出到服务器端的打印信息
	fmt.Println("path", r.URL.Path)
	fmt.Println("scheme", r.URL.Scheme)
	fmt.Println(r.Form["url_long"])
	for k, v := range r.Form {
		fmt.Println("key:", k)
		fmt.Println("val:", strings.Join(v, ""))
	}
	fmt.Fprintf(w, "Hello astaxie!") //这个写入到w的是输出到客户端的
}

func main() {
	http.HandleFunc("/", sayhelloName) //设置访问的路由
	err := http.ListenAndServe(":9090", nil) //设置监听的端口
	if err != nil {
		log.Fatal("ListenAndServe: ", err)
	}
}
````
## 代码解析
*package main* 表示的是包名，需要在文件的第一行声明，package main这个包名表示go程序是一个可独立运行的程序，每一个go程序都应当有一个main为名称的包。
*import* 导入需要使用到的类库，这里和python已经java都类似。其中fmt——Formatting包含了一些格式化的IO操作。
*func sayhelloName* 在go当中，函数使用func声明，后面跟函数名，然后是参数，go当中声明一个变量的类型的时候会把类型写在后面比如`var a int`。sayhelloName这个函数，w的数据类型是http.ResponseWriter，用于响应http。r是一个http.Request指针，用于接受请求。
*main* main()函数 其中http.HandleFunc用于处理路由，ListenAndServer用来监听请求。
*log* log主要用来在命令行状态下输出日志

## 关于并发
#### ListenAndServe
这里创建web服务其实只是简单的使用了golang自带的http包的ListenAndServe()函数，即便是官方实现的包，在web服务领域当中也有不俗的表现，原因就在于ListenAndServe()函数当中在处理请求的时候给每一个连接创建了一个协程*go c.serve(ctx)*这样golang默认的http请求拥有更好的并发性能。
