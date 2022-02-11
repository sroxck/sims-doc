---
title: 判断两个Object数组对象是否相等
date: 2021-01-13 18:02:46
permalink: /pages/9a2bfa/
sidebar: auto
categories: 
  - 随笔
tags: 
  - 
---
# 判断两个Object数组对象是否相等

## 问题
list1 = [{xx:2},{xx:4}]
list2 = [{xx:32},{xx:4}]

求两个list是否相同

## 解决

1. 可以循环判断每个值是否相等,有一个相等就不继续循环了,可以用some
2. 利用JSON.stringify 把两个数组对象都转成字符串判断是否相等,如果有一点点不一样,都会是false(推荐做法,时间空间复杂度友好)
