---
title: "Golang面试题：是否是平衡的二叉树"
date: 2020-06-28T00:00:00+08:00
draft: false
tags: ["golang"]
---

# 问题：给定一个二叉树，判断其是否是高度平衡的二叉树

高度平衡的二叉树定义：一颗二叉树，每一个节点的左右子树的高度差的绝对值不超过1。

示例 1:

给定二叉树 [3,9,20,null,null,15,7]

````
    3
   / \
  9  20
    /  \
   15   7
````
返回 true

示例 2:

给定二叉树 [1,2,2,3,3,null,null,4,4]
````
       1
      / \
     2   2
    / \
   3   3
  / \
 4   4
 ````
返回 false

# 解题思路：

在理解题意以后，我们需要先分解下问题。首先要先获取节点高度，然后再再进行比对判断，判断每一个节点左右子树的高度差的绝对值是否超过1。

我们需要了解如何遍历二叉树，这样才能知道树的高度。还要了解递归的思想可以让代码逻辑更加清晰。

## 树节点的结构体

````golang
type TreeNode struct {
    left *TreeNode
    right *TreeNode
    value int
}
````

## 判断大小和求绝对值的函数准备

````golang
func max(a,b int) int {
    if a > b {
        return a
    }
    return b
}
func abs(a int) int {
    if a >=0 {
        return a
    }
    return -a
}
````

## 如何获取节点高度？

利用深度遍历递归的去获取节点高度。利用递归不停向下寻找到节点为空的位置计算高度。

````golang
func getHeight(root *TreeNode) int {
    if root == nil {
        return 0
    }
    return 1 + max(getHeight(root.left),getHeight(root.right))
}
````

## 如何判断是否是高度平衡二叉树

通过递归的方式判断每一个节点二叉树的高度的绝对值是否大于1

````golang
func isBalanced(root *TreeNode) bool {
    if root == nil {
        return true
    }
    // 判断当前节点是否满足，不满足后面就不用看了。
    if abs(getHeight(root.left)-getHeight(root.right)) > 1{
        return false
    }
    // 如果满足条件继续向下递归，并返回结果。
    return isBalanced(root.left) && isBalanced(root.right)
}
````

## 完整代码

````golang
type TreeNode struct {
    left *TreeNode
    right *TreeNode
    value int
}

func max(a,b int) int {
    if a > b {
        return a
    }
    return b
}
func abs(a int) int {
    if a >= 0 {
        return a
    }
    return -a
}
func getHeight(root *TreeNode) int {
    if root == nil {
        return 0
    }
    return 1 + max(getHeight(root.left),getHeight(root.right))
}
func isBalanced(root *TreeNode) bool {
    if root == nil {
        return true
    }
    if abs(getHeight(root.left)-getHeight(root.right)) > 1 {
        return false
    }
    return isBalaned(root.left) && isBalaned(root.right)
}
````

如有错误，欢迎指正和讨论。