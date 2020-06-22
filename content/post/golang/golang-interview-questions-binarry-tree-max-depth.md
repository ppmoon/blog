---
title: "Golang面试题：二叉树的最大深度"
date: 2020-06-22T00:00:00+08:00
draft: false
tags: ["golang"]
---

# 问题：求二叉树的最大深度
给定一个二叉树,返回其最大深度。
示例：
````
      1
    /   \
   2     3
  / \   / \
 4   5 6   7
````
返回最大深度为3

# 解题思路
利用深度优先或者广度优先遍历二叉树，找到树的最大深度。

## 二叉树的结构体
````golang
type TreeNode struct {
	left *TreeNode // 左子节点
	right *TreeNode // 右子节点
	value int // 值
}
````
## 深度优先搜索
### 主要思路
1.深度优先搜索和二叉树的前序遍历比较类似。
2.利用递归的方式不停下探树的深度。
3.递归的终止条件是如果节点为空就返回0。然后判断左右子树最大值同时加1来表示当前节点的高度。
````golang
func maxDepth(root *TreeNode) int {
	// 如果节点为空就不再递归下探深度
	if root == nil {
		return 0
	}
	left := maxDepth(root.left)
	right := maxDepth(root.right)
	if left > right {
		return left + 1
	}
	return right + 1
}
````
时间复杂度：O(n)其中n为节点数量。因为每个节点都要访问一次
空间复杂度：O(logN)其中N是节点数量。在树不是平衡的情况下，空间复杂度是O(N),比如树比较瘸腿一路左子树的情况下。但是如果树比较平衡的情况下空间复杂度是O(logN)。

## 广度优先搜索
### 主要思路
1.广度优先搜索利用迭代的方式将每一层的节点都放入到队列当中。
2.队列出队清空进入下一层。
3.利用一个变量来标记深度。每次进入下一次都给这个变量加1来记录深度。
````golang
func maxDepth(root *TreeNode) int {
	// 根节点如果为0直接返回0
	if root == nil {
		return 0
	}
	queue := make([]*TreeNode,0) // 创建一个队列
	queue = append(queue,root) // 把根节点放入队列
	depth := 0 // 声明深度变量
	for len(queue) > 0 { // 队列里有值就一直循环
		size := len(queue) // 这里要把当前一层的队列遍历一遍全部出队
		for i:=0;i<size;i++{
			v := queue[0]
			queue = queue[1:] // 出队
			if v.left != nil {
				queue = append(queue,v.left) // 如果有左子树，就左子树入队
			}
			if v.right != nil {
				quque = append(queue,v.right) // 如果有右子树，就右子树入队
			}
		}
		depth++ // 清出一层后给变量加1
	}		
	return depth
}
````
时间复杂度：O(n),n代表节点，每一个节点都要遍历一遍。
空间复杂度：O(n),最坏的情况下，队列当中装满了一层的节点。

如有错误，欢迎指正和讨论。