---
title: macOs设置文件权限
sidebar: auto
date: 2021-01-13 18:02:46
permalink: /pages/c141c3/
categories: 
  - 随笔
tags: 
  - 
---

## 问题
最近还原了系统,导致一些原本有的权限失效了,shell脚本无法执行

## 解决
`chmod u+x *.sh` 

## 说明
`chmod`是权限管理命令`change the permissions mode of a file`的缩写。
`u`代表所有者。`x`代表执行权限。’+’ 表示增加权限。
`chmod u+x file.sh` 就表示对当前目录下的file.sh文件的所有者增加可执行权限