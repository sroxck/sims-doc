---
title: React
date: 2021-01-13 18:02:46
permalink: /pages/f8e1a2/
sidebar: auto
categories:
  - 随笔
tags:
  - 
---
# React

构建用户界面的一个javascript库,区别于vue,更加灵活,小巧,但是编写起来更加复杂,主要用于构建UI界面,Facebook公司内部框架,于2013年开源

特点:

1. 声明式的设计
2. 高效,采用虚拟DOM来实现DOM的渲染,最大限度减少DOM操作
3. 灵活,跟其他库可以灵活搭配使用
4. JSX,在JS中写HTML,javascript语法的扩展
5. 组件化,模块化.代码容易复用,大型项目适合使用react
6. 单向数据流,没有实现数据的双向绑定 数据->视图->事件->数据

### 创建项目:

1. 通过script标签引入,仅用于学习调试

   ``` js
   <script crossorigin src="https://unpkg.com/react@16/umd/react.development.js"></script>
   <script crossorigin src="https://unpkg.com/react-dom@16/umd/react-dom.development.js"></script>
   ```

2. 通过React脚手架,Create React App 创建项目使用,进行开发,部署

   ``` js
   1. npm install -g create-react-app
   2. 创建项目 Create-react-app projectName(项目名)
   ```

### react 渲染元素 (jsx)

``` 
let div = <div>helloword</div>    
```

使用jsx的写法,可以创建JS元素对象,jsx元素对象或者组件对象,必须只有一个根元素

