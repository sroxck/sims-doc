---
title: 使用node读取excel文件
date: 2021-01-13 18:02:46
permalink: /pages/1f6150/
sidebar: auto
categories: 
  - 随笔
tags: 
  - 
---

# 使用node读取excel文件

使用 node-xlsx 插件

``` js
var xlsx = require('node-xlsx').default; // 引入插件
// parse方法的参数为要解析的excel的路径
var list = xlsx.parse('33.xlsx'); // 读取文件
// 输出数据
console.log(res);

```