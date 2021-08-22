---
title: "go如何进行交叉编译"
date: 2018-02-16T14:44:01+08:00
draft: false
categories: ["golang"]
tags: ["golang"]
---

# golang交叉编译

## 问题

golang如何在一个平台编译另外一个平台可以执行的文件。比如在mac上编译Windows和linux可以执行的文件。那么我们的问题就设定成：如何在mac上编译64位linux的可执行文件。

## 解决方案

golang的交叉编译要保证golang版本在1.5以上，本解决方案实例代码1.9版本执行的。

### 我们想要编译的文件hello.go

hello.go
```golang
package main

import "fmt"

func main() {
    fmt.Printf("hello, world\n")
}
```
### 在mac上编译64位linux的命令编译命令
bash:
```bash
GOOS=linux GOARCH=amd64 go build hello.go
```
上面这段代码直接在命令控制台里面运行就可以生成64位linux的可执行程序。

### 参数解析
这里用到了两个变量：
-   GOOS：目标操作系统
-   GOARCH：目标操作系统的架构

| OS | ARCH | OS version |
| ---- | ---- | ---- |
| linux | 386 / amd64 / arm | >= Linux 2.6 |
| darwin | 386 / amd64 | OS X (Snow Leopard + Lion) |
| freebsd | 386 / amd64 | >= FreeBSD 7 |
| windows | 386 / amd64 | >= Windows 2000 |

编译其他平台的时候根据上面表格参数执行编译就可以了。

## 扩展阅读

在网络上的诸多教程中可能会看到下面的编译命令
```bash
CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build hello.go
```
其中CGO_ENABLED=0的意思是使用C语言版本的GO编译器，参数配置为0的时候就关闭C语言版本的编译器了。自从golang1.5以后go就使用go语言编译器进行编译了。在golang1.9当中没有使用CGO_ENABLED参数发现依然可以正常编译。当然使用了也可以正常编译。比如把CGO_ENABLED参数设置成1，即在编译的过程当中使用CGO编译器，我发现依然是可以正常编译的。

实际上如果在go当中使用了C的库，比如```import "C"```默认使用go build的时候就会启动CGO编译器，当然我们可以使用CGO_ENABLED=0来控制go build是否使用CGO编译器。

以上若有错误欢迎指正。
