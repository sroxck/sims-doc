---
title: 解决使用git导致eslint检测的问题
date: 2021-01-13 18:02:46
permalink: /pages/264704/
sidebar: auto
categories:
  - 随笔
tags:
  - 
---
# git eslint问题

使用git提交会触发eslint自动检测,需要去掉一行代码即可

​`"pre-commit": "lint-staged"`