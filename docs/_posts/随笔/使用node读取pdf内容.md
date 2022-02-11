---
title: 使用node.js读取pdf内容
date: 2021-01-13 18:02:46
permalink: /pages/d8d512/
sidebar: auto
categories: 
  - 随笔
tags: 
  - 
---

# 使用node读取pdf内容

## 需求
读取pdf内容,自定义解析

## 解决
使用pdf2json插件

``` js
const PDFParser = require('pdf2json'); //引入
var pdfParser = new PDFParser(this, 1); // 创建pdf对象
pdfParser.loadPDF(`11.pdf`); // 读取pdf
pdfParser.on('pdfParser_dataError', errData =>reject( new Error(errData.parserError))); // 失败回调
pdfParser.on('pdfParser_dataReady', () => { // 读取完毕会带哦
    let data = pdfParser.getRawTextContent(); // 获取文本内容
    console.log(data);
});
```