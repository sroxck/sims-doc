---
title: vue计算属性排序表格
sidebar: auto
tags: vue
date: 2021-01-13 18:02:46
permalink: /pages/04bf2c/
categories: 
  - 随笔
---

# vue计算属性排序表格

本文档就是使用的此方法来进行更新时间的排序
``` vue
<script>
computed: {
    // 单页指定字段自定义规则排序
    newdataList: function() {
        return this.sortKey(this.anyList, "lastUpdated");
    },
}
// 根据给定的字段名称进行排序
sortKey(array, key) {
    return array.sort(function(a, b) {
    var x = new Date(a[key])
    var y = new Date(b[key])
    return x > y ? -1 : x < y ? 1 : 0;
    })
},
</script>
```
