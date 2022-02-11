---
title: 项目中,input回车查询导致路由问号刷新
sidebar: auto
date: 2021-01-13 18:02:46
permalink: /pages/33c413/
categories: 
  - 随笔
tags: 
  - 
---
# 项目中,input回车查询导致路由问号刷新
### 原因
W3C 标准中有如下规定：
当一个 form 元素中只有一个输入框时，在该输入框中按下回车应提交该表单。
### 解决
如果希望阻止这一默认行为，可以在 `<el-form> `标签上添加 `@submit.native.prevent`