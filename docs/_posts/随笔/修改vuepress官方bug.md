---
title: 记录一次修改vuepress官方bug的经历
sidebar: auto
date: 2021-01-13 18:02:46
permalink: /pages/00361d/
categories: 
  - 随笔
tags: 
  - 
---

# 修改vuepress官方bug

## 问题描述
搜索功能不可用,报错,报错日志为无法使用split方法,目标不是数组

## 问题原因
文章的tags写的不是数组,而是字符串,但是tags如果多成数组的格式很麻烦,想写成字符串,用空格分开多个

## 解决方法
修改了源码,在SearchBox里面找到对应代码,将字符串用空格转换成数组,在进行split方法即可
