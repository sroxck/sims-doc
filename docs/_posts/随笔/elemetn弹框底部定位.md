---
title: element ui 弹框底部定位
date: 2021-01-13 18:02:46
permalink: /pages/0b2787/
sidebar: auto
categories: 
  - 随笔
tags: 
  - 
---

# 问题
底部定位用fexld不合适

# 解决
给el-dialog-body 一个高度,高度是header-footer
然后让body overflow-y = auto 里面内容的高度正常 就可以了