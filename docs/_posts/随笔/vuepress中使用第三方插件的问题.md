---
title: vuepress中使用第三方插件的问题
sidebar: auto
date: 2021-01-13 18:02:46
permalink: /pages/ddb38c/
categories: 
  - 随笔
tags: 
  - 
---

## 问题
使用Velocity动画库为文档添加动画效果的时候，在本地运行正常，打包失败，报错window未定义
## 原因
因为vuepress是基于node服务的，任何第三方插件只要在一引入就会调用浏览器api，dom和bom的话，就会报错
## 解决
需要让操作浏览器api的第三方插件在mounted阶段载入，可以通过`import('package).then`引入,在then中使用

## 实例
``` js
// 打包报错的写法
//  import Velocity from 'velocity-animate' 
//  import 'velocity-animate/velocity.ui.js'

// 正确的写法
import('velocity-animate').then(module => {
    // 引入多个包有依赖关系就在then中继续引入
   import('velocity-animate/velocity.ui.js').then(module => {
       // 全部引用完成执行代码
      this.$nextTick(()=>{
          Velocity(document.querySelectorAll('.doc-list'), 'transition.slideLeftBigIn', { stagger: 100 })
      })
  })
})
```