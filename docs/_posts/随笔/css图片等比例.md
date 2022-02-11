---
title: css图片等比例
date: 2021-01-13 18:02:46
permalink: /pages/f8d035/
sidebar: auto
categories:
  - 随笔
tags:
  - 
---
# css 属性控制图片等比例显示
使用object-fit: contain;属性即可,还有几个属性可选
- fill	默认，不保证保持原有的比例，内容拉伸填充整个内容容器。
- contain	保持原有尺寸比例。内容被缩放。
- cover	保持原有尺寸比例。但部分内容可能被剪切。
- none	保留原有元素内容的长度和宽度，也就是说内容不会被重置。
- scale-down	保持原有尺寸比例。内容的尺寸与 none 或 contain 中的一个相同，取决于它们两个之间谁得到的对象尺寸会更小一些。
- initial	设置为默认值，关于 initial	
- inherit	从该元素的父元素继承属性。 关于 inherit