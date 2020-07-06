---
title: "Golang面试题：给定一个非空二叉树，返回其最大路径和"
date: 2020-07-06T00:00:00+08:00
draft: false
tags: ["golang"]
---

# 问题：给定一个非空二叉树，返回其最大路径和

示例1：
````
输入: [1,2,3]

       1
      / \
     2   3

输出: 6
````
2+1+3 = 6

示例2：
````
输入: [-10,9,20,null,null,15,7]

   -10
   / \
  9  20
    /  \
   15   7

输出: 42
````
15+20+7 = 42

# 解题思路

这道题主要难在理解题意，什么是最大路径和？

路径：就是从一个节点a到达另外一个节点b的这个 a,b的序列

路径和：就是路径序列a,b节点上的值的和

根据题意最大路径和，意味着我们要找一条路径，这条路径要比其他路径的和的值都大。

由此我们想到了如下信息：

1.遍历二叉树的节点，我们可以使用递归的方法遍历节点，获取某一个分支的路径和。

2.路径有很多，路径和的值就会很多，因为只需要最大路径和。所以我们需要一个maxSum变量用来存最大值。

3.路径是从某一个结点出发的，我们需要一个函数maxGain来计算某一个节点以及其左或者右子树的最大路径和，通过比较确定最大值。

## 代码实现

### 二叉树的数据结构
````golang
type TreeNode struct {
	left *TreeNode
	right *TreeNode
	value int
}
````
### maxSum变量
我们可以设置一个最大路径和的全局变量
````golang
var maxSum = math.MinInt32
````
这里设置了一个int32最小的证书。主要是因为二叉树当中会有负数存在。所以以一个最小的整数作为比较值而不是用0来初始化这个变量。

### maxGain函数
这个函数求某一个节点以及其左或者右子树的最大路径和
````golang
func maxGain(node *TreeNode) int {
    if node == nil {
        return 0
    }
    // 如果这个节点的和小于0，肯定不是最大的了。就放弃了。但是要注意如果题型发生变化，在某些情况下，节点都是负数那我们应该如何处理？。
    leftGain := max(maxGain(node.left),0)
    rightGain := max(maxGain(node.right),0)
    // 节点的最大路径和是该节点的值和左右子树的值的和
    maxNodePathSum := node.value + leftGain + rightGain
    // 判断下这个节点是不是最大的
    maxSum = max(maxSum,maxNodePathSum)
    // 要把节点的以及其左或者右子树的最大路径和返回，递归用
    return node.value + max(leftGain,rightGain)
}
````

### 比较函数

````golang
func max(a,b int) int {
    if a > b {
        return a
    }
    return b
}
````

### 完整代码

````golang
type TreeNode struct {
	left *TreeNode
	right *TreeNode
	value int
}
var maxSum = math.MinInt32
func maxGain(node *TreeNode) int {
    if node == nil {
        return 0
    }
    // 如果这个节点的和小于0，肯定不是最大的了。就放弃了。但是要注意如果题型发生变化，在某些情况下，节点都是负数那我们应该如何处理？。
    leftGain := max(maxGain(node.left),0)
    rightGain := max(maxGain(node.right),0)
    // 节点的最大路径和是该节点的值和左右子树的值的和
    maxNodePathSum := node.value + leftGain + rightGain
    // 判断下这个节点是不是最大的
    maxSum = max(maxSum,maxNodePathSum)
    // 要把节点的以及其左或者右子树的最大路径和返回，递归用
    return node.value + max(leftGain,rightGain)
}
func maxPathSum(root *TreeNode) int {
    // 从跟节点开始
    maxGain(root)
	return maxSum
}
````

以上代码使用了maxSum作为全局变量，在一般答题网站上跑多个测试用例会有问题。可以利用匿名函数的方式把maxGain函数放到maxPathSum当中。

如有错误，欢迎指正和讨论。