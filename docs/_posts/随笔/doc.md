---
title: doc
date: 2021-01-13 18:02:46
permalink: /pages/b88350/
sidebar: auto
categories:
  - 随笔
tags:
  - 
---
# 梳理一下思路

## 1.将树形结构的主要内容提取为对象
将下图数据
<!-- ![img](./doc/img/data.png) -->
转换为以下格式
<!-- ![img](./doc/img/data1.png)    -->
主要是转换为table表格组件可以循环的格式,将原本内容加入到一个数组中,为增加行功能做铺垫
转换后的对象:`treeMap`
## 循环对象渲染表格
`<el-table v-for="(value,key,index) in treeMap" :key="index" :data="value">`

表格绑定值为循环出的当前项,当前项有几个对象,表格就有几行(新增行会增加对象,就会新增一行)

## 新增行功能
将表格绑定值追加一份当前对象,并去除cName属性

## 任务条件下拉切换
任务条件下拉循环值为表格当前项的childList字段,v-model绑定值为表单当前项的checkType值,会根据当前绑定的checkType值,去表格当前项中循环找到符合的一项,这一项的type如果为1(输入框),则将当前项的show设置为true,展示输入框,如果不是1,则将这一项的option属性赋值给`rightMap[scope.row.checkType]`,这样每次赋值都是一个独立的作用域


## 任务值下拉切换
任务值下拉循环值为`rightMap[scope.row.checkType]`,v-model绑定值为表单当前项的value值,会根据当前绑定的checkType值,去表格当前项中循环找到符合的一项,将这一项的value值赋值为当前v-model绑定的值

## 绑定值总结
左侧下拉值会绑定到当前对象的checkType上,右侧会绑定到当前对象的value上
<!-- ![img](./doc/img/data2.png) -->

最后生成对象
<!-- ![img](./doc/img/data4.png) -->

## 保存时操作
将map对象中对应cName的值取出放入源数据中,将map对象中数组拼接为源数据的childList,将元childList赋值给sourceList

