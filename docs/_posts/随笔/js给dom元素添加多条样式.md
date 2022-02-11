---
title: js给dom元素添加多条样式
date: 2021-01-13 18:02:46
permalink: /pages/bdf4fc/
sidebar: auto
categories: 
  - 随笔
tags: 
  - 
---

# js给dom元素添加多条样式

## 问题 
使用DOM.style.xx一条一条去修改样式比较麻烦

## 解决
使用cssText可以传入一个字符串,是用分号分割的多条样式即可

## 注意
cssText会重写整个style,所以要先保存之前的样式,然后拼接上
``` js
const oldCssText = DOM.style.cssText
DOM.style.cssText = '样式;'  +  oldCssText
```