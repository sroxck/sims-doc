---
title: api使用思路
date: 2021-01-13 18:02:46
permalink: /pages/236d58/
sidebar: auto
categories:
  - 随笔
tags:
  - 
---
# 要灵活使用api,合理搭配
举例:判断上传文件的类型是否符合指定类型
使用api: file.split('.').pop().toLocaleLowerCase()
思路:文件名由文件名和后缀组成,通过.来连接
1. split() 已指定字符分割字符串并转为数组,这里已.来分割,并转换为数组,数组有两部分,[0]是文件名[1]是后缀名
2. pop() 删除数组中最后一个值,并返回删除的这个值,这里就可以拿到后缀名了
3. toLocalLowerCase() 转小写,统一转为小写来判断
