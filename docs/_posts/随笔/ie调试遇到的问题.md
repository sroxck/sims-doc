---
title: 函证项目IE浏览器调试遇到的问题
sidebar: auto
date: 2021-06-13 18:02:46
permalink: /pages/af7277/
categories: 
  - 随笔
tags: 
  - 
---
# 函证项目IE浏览器调试遇到的问题

## 技术栈
框架:vue 脚手架:vue-cli3 基础管理系统框架:vue-admin-element

## 问题描述
项目启动在IE浏览器中为空白页面,报错为1002,1003,1004,1006等,报错指向编译好的1.js和app.js,不易调试

## 解决思路
查看报错所指向的代码,梳理流程,如果是登录后报错,那么就是登录后加载的插件有问题,逐一排查即可

## 问题原因
在项目中使用的2个插件所导致的
1. vue-super-slide 幻灯片插件
2. vuedraggable 拖拽表格插件,为后端基础框架所在,如果使用,需要替换相对应的文件

## 解决办法
需要替换2个组件的文件用来支持ie
1. helper.js
目录:`node_modules` -> `vuedraggable` -> `scr` -> `util`

2. vue-superslide.umd.min.js
目录:`node_modules` -> `vue-superside` -> `bib`