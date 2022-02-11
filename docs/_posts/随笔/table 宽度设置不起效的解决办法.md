---
title: table 宽度设置不起效的解决办法
date: 2021-01-13 18:02:46
permalink: /pages/9f7739/
sidebar: auto
categories:
  - 随笔
tags:
  - 
---
# table 宽度设置不起效的解决办法

首先table设置了宽度,但是实际宽度和设置宽度不一致,可以使用

table-layout:fixed 解决 

表格算法模式,更改为由列宽来控制,而不设置是根据单元格设置 

设置了此属性,如果合并单元格之后,剩下的列的宽度是自动分配的,无法手动配置