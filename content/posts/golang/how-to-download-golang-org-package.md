---
title: "国内go如何下载golang-org的包"
date: 2018-04-25T12:14:01+08:00
draft: false
categories: ["golang"]
tags: ["golang"]
---

# 如何下载golang.org的包？

由于墙的原因，golang.org这个域名下的资源是无法访问的。我们无法下载golang.org上面的包，好在golang的包都管理在github所以我们可以访问github来下载golang.org的包。

# 解决方案

下载github上的包并替换到golang.org的目录里。
![GOPATH](https://upload-images.jianshu.io/upload_images/677473-3391c5bcbfb736dc.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
GOPATH的目录是这样的。我们通过go get下载的包会
![GOPATH](https://upload-images.jianshu.io/upload_images/677473-812d837f0a0c16ac.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
其中google.golang.org和golang.org在国内是无法直接使用go get获取的。所以我们使用github的替代方案。

#### 以下载grpc为例
grpc官方提供的下载命令是：
````
go get google.golang.org/grpc
````
因为无法访问，所以我们需要在`$GOPATH/src`目录下面创建一个`google.golang.org`的目录。
在github上找到对应的grpc的包，https://github.com/grpc/grpc-go 
其实google.golang.org对应的就是https://github.com/grpc/grpc-go
然后我们进入到`$GOPATH/src/google.golang.org`这个目录。执行git命令
````
git clone --depth=1 https://github.com/grpc/grpc-go.git grpc
````
命令解析：
其中--depth=1 这个参数的意思是只克隆最新的commit分支。不加也行。
最后的grpc表示的是将克隆的文件存放到那个文件夹里面。
执行完上面的命令，我们就成功的将grpc的包下载到本地了。

````
go get google.golang.org/grpc
````
golang当中go get其实执行了两个操作，一个是git clone 另外一个go install。所以我们还要进入到`$GOPATH/src/google.golang.org/grpc`当中执行以下`go install` 。这个命令会在`$GOPATH/pkg/google.golang.org/grpc`下面生成一个grpc.a的外部包文件。用于和其他程序访问和编译。并且在`go install`的过程当中我们可以检查哪些相关依赖的包没有安装，可以使用相同的办法进行安装。

# 注意
为什么不能直接git clone到src目录里使用？其实这样也没问题的。但是会引来一个麻烦，就是go的import引入包是通过src下面的路径来引入的。引用第三方的包的时候可能还是会使用到golang.org目录下的包，这个时候你可能需要修改代码或者去迁移还是很麻烦。所以才有以上git clone 然后替换目录的办法。
