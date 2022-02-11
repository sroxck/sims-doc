---
title: 封装ui组件库
date: 2021-01-13 18:02:46
permalink: /pages/eb89e0/
sidebar: auto
categories: 
  - 随笔
tags: 
  - 
---

1. self修饰符
self修饰符可以让点击事件只由自身触发
2. sync修饰符
sync是一个语法糖,实现了1. @update:xxx 2 进行xxx赋值
`等效于`
``` vue
// 子
this.$emit('update:money',1000)

// 父
@update:money = "fn"
fn(e){
    this.money = e
}
```
::: tip 注意
update:xxx 是固定写法
后面的xxx要和 v-bind绑定的值一直,才可以将对应的值进行修改
:::

$mount方法是用来挂载我们的扩展的

vue.extend 可以继承组件
在写好一个组件后,可以写一个对应的js,将写好的组件导入到当前js,然后使用vue.extend扩展这个组件,就可以对这个组件进行操作
vue.extend返回一个构造对象,可以new一个实例对象出来,实例对象的构造函数可以传递一个对象参数,这个对象参数就是vue script中的内容,可以写生命周期,data,过滤器等等,进行操作

``` js
import vue from 'vue'
import message from './message.vue'
const mesObj = vue.extend(message)
// 这个函数创建了一个vue组件,并且赋值,还要一些额外操作,将vue组件挂载到dom中
function show(context,title="提示",time=3000,){
    // 实例化一个 vue组件,进行第二次扩展操作,给一些默认的赋值
    const _message = new mesObj({
        name:'message',
        data(){
            return {
                message:context,
                title:title,
                isLife:true,
            }
        }
    })
    // 添加到页面中
    console.log(_message.$mount()); // 获取组件挂载后的实例
    let ele = _message.$mount().$el
    document.body.appendChild(ele);
    setTimeout(() => {
        _message.isLife = false
    }, time);

}
// 注册一个install 方法,参数是vue实例,就可以使用vue.use来使用这个组件
show.install = (Vue) => {
    // 将组件注册到 vue 的 原型链里去,
    // 这样就可以在所有 vue 的实例里面使用 this.$toast()
    Vue.prototype.$message = show
};

// 导出
export default show


```
# 封装思路
1. 确定功能
2. 确定参数
3. 确定事件
4. 确定结构
5. 封装代码

插件的核心就是导出一个install方法,用vue.use就会调用这个install方法,而且参数是vue实例,可以进行组件的全局注册等等操作