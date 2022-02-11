---
title: 解决for循环中定时器问题
sidebar: auto
date: 2021-01-13 18:02:46
permalink: /pages/08d805/
categories: 
  - 随笔
tags: 
  - 
---
# 解决for循序中定时器问题

## 问题复现

``` js
for(var i = 1; i<= 5; i++){
    setTimeout(function(){
        console.log(i)
    },i*1000)
}
```
预期打印:1 2 3 4 5

实际打印:6 6 6 6 6

## 问题原因
在for循序初始化语句中定义的var声明是全局变量,当定时器执行时,定时器输出i的值的时候去找到i,此时值已经改变

## 解决方案
1. 使用闭包
``` js
for(var i = 1; i<=5; i++){
    (function(j){
        setTimeout(function(j)=>{
            console.log(j)
        },j*1000)
    })(i)
}
```
利用了自执行函数的封闭式作用域,完成了闭包,将i的值传递给IIFE的作用域,此时i作为参数会被缓存
::: tip 
小知识:函数的参数名,到传参的过程,实际上是声明了一个变量,进行接收
:::
2. setTimeout 第三参数
```js
for(var i = 1; i<=5; i++){
    setTimeout(function(){
        console.log(i)
    },i*1000,i)
}
```
::: tip
很多人不知道定时器的第三个参数,在定时器启动时,第三个及以后的参数,会作为定时器执行方法的参数传递进去,相当于进行了一次闭包
:::

3. 使用let
```js
for(let i = 1; i<=5; i++){
    setTimeout(function(){
        console.log(i)
    },i*1000)
}
```
Let 关键字会生成块级作用域