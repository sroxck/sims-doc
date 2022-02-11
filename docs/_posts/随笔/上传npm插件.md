---
title: 上传npm插件
date: 2021-01-13 18:02:46
permalink: /pages/bb5579/
sidebar: auto
categories: 
  - 随笔
tags: 
  - 
---

# 上传npm插件

## 首先创建一个新的文件,取名为tool.js
``` zsh
cd Desktop && mkdir tool // 进入桌面,创建tool文件夹
cd tool && touch tool.js // 进入tool文件夹,创建tool.js文件
code . // 使用vscode打开文件夹
```

## 写入你需要的程序
``` js
function printHelloWorld(){
    console.log("hello,world")
}
```
## 导出
``` js
module.exports = {printHelloWorld}
```
## 上传npm
``` git
npm login // 登录
npm publish //发布
```
## 使用
``` js
import $tool from 'tool'
$tool.printHelloWorld
// 导出的是一个对象,所以使用方法就是对象.方法,也可以直接导出方法或者一个类.灵活使用,推荐对象.函数
```
::: tip 注意事项
1. 默认npm会将本目录所有文件进行发布,可以使用npmignore和gitignore进行过滤
2. npmignore无法过滤index.js,如果需要使用webpack压缩,主文件不要使用index.js,或者index.js在另一个目录里面
3. 使用webpack 压缩打包的情况下,默认会输出一个dist文件,如果我们想让插件导入的时候,自动引入dist下面压缩好的文件,需要修改package.json文件的main字段,设置为你想要导入时自动寻找的路径,默认当前目录index,找不到会自动找dist/main.js,建议手动修改为./dist/main.js
4. npm每次发布,版本号必须进行更改
5. webpack.config.js设置entry入口文件,即要打包的文件
:::
