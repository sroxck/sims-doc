---
title: 解决Element resetFields()重置表单不生效的问题
date: 2021-01-13 18:02:46
permalink: /pages/3530ce/
sidebar: auto
categories:
  - 随笔
tags:
  - 
---
# 解决Element resetFields()重置表单不生效的问题



## 前言

由于最后在做公司后台在使用 element-ui 框架，开发过程中出现 resetFields表单无法重置的问题，在此记录下解决的办法，也能帮助到以后的同学少踩点坑

### 1.问题重现

因 “添加” 和 “编辑” 字段是一样的，所以我把它们放在了一个弹框表单里面，也节省了代码资源开销，如果你是分开写的弹框也就不会出现这个问题了。

> 重现步骤：进入列表页后，先打开编辑框，然后打开新增框，新增框会填充第一次打开的编辑框内容

### 2.resetFields()不生效的原因

1.此方法用于将form表单的数据设置为初始值  

2.而这个初始值是在form mounted生命周期被赋值上去的  

3.所以，在 form mounted之前，如果给form表单赋值了，那么后面调用resetFields()都是无效的，因为form表单的初始值已经在 mounted 之前就被赋值了

### 3.解决办法

只要在 form 表单 mounted之后再进行赋值操作这样就可以完美解决问题了，即在点击编辑赋值的时候使用 “this.$nextTick” 方法。上代码！  

``` javascript
使用this.$nextTick() 把编辑时需要回显的赋值操作放到这里面即可
```

### 总结

1. 使用 `this.$refs` 而不是 `this.$ref`
2. 配合使用 `this.$nextTick(() => {})`
3. `el-form` 中的 `model` / `ref` 以及 `el-form-item` 中的 `prop` 再检查一遍吧



