---
title: element表单验证
date: 2022-03-02 15:43:35
permalink: /pages/1f4124/
sidebar: auto
categories:
  - 随笔
tags:
  - 
---
<!--
 * @Author: Jingdongdong
 * @Date: 2022-03-02 15:43:35
 * @LastEditTime: 2022-03-02 15:45:36
 * @LastEditors: Jingdongdong
 * @Description: 
-->

## element表单验证

1. 表单form要有rule属性绑定值
2. 表当form-item 要有prop 值要和绑定值一样 并且多级对象的情况下 比如 form.ca.xx  要绑定ca.xx
3. 验证规则  `leaderId: [{ required: true, message: '请选择牵头单位', trigger: 'blur' }],`
4. 使用 pattern 来用正则校验 `leaderId: [{ required: true, message: '请选择牵头单位', trigger: 'blur',pattern:/ss/ }],`
5. 多级对象绑定的规则,属性名要用字符串`"ca.xx": [{ required: true, message: '请选择牵头单位', trigger: 'blur',pattern:/ss/ }],`