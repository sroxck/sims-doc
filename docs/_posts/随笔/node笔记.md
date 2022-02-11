---
title: node笔记
date: 2021-01-13 18:02:46
permalink: /pages/24ccbf/
sidebar: auto
categories: 
  - 随笔
tags: 
  - 
---
## 使用命令行工具: poweShell 使用node
## js中存在两大问题,文件依赖和命名冲突
node.js中规定一个js文件就是一个模块,模块内部定义的变量和函数,默认情况下,外部无法访问   
模块内部可以使用exports对象进行成员导出,使用require导入   
## 导出成员,exports和module.exports 都可以,已module.exports为准   
## 系统模块
### 文件模块 fs
        fs.readFile(文件路径,[文件编码],回调函数)
            回调函数中有2个形参 err和doc err为null 说明读取成功 err为一个对象说明读取失败
            doc就是读取的文件内容
        writeFile(文件名(路径),写入的数据,回调函数)
            写入文件不存在会自动创建
            err为null说明写入成功
### 路径模块 path
        path.join(路径,路径,路径...) 路径拼接
        在node中使用绝对路径
        在node中的相对路径大多数时候是相对于命令行执行目录的
        使用__dirname 可以获取当前文件的绝对路径
        require中的相对路径是相对文件的
## 第三方模块
    通常由多个文件组成的文件夹,又名包
    有2中存在方式,已JS库形式,已命令行工具形式
    npmjs.com 第三方模块储存和分发的仓库
    npm : node package manage node第三方管理工具
    使用npm下载第三方模块
        npm install 模块名 默认下载到命令行执行目录
        分为全局安装(命令行工具)和本地安装(js文件)
### 第三方模块 nodemon  
        nodemon 是一个命令行工具,辅助开发,作用是保存文件后自动执行文件,不需要重新输入命令
        使用方法:使用nodemon代替node命令
### 第三方模块 nrm 
        nrm是npm下载管理工具,可以快速切换npm下载地址,切换到国内淘宝的下载地址,速度会快很多
        使用方法: nrl ls 显示可用下载地址 nrm use 地址 使用下载地址
## 前端构建工具 gulp
    将机械化操作编写成任务,用命令行执行,用机器代替手工
### gulp能做什么
        html,css,js文件压缩
        es6,less等语法转换
        公共文件抽离
        修改文件,浏览器自动刷新
### gulp提供的方法(使用方法)
        gulp.src()获取任务需要处理的文件
        gulp.dest()输出文件
        gulp.task() 创建任务
        gulp.watch()监视文件变化
        .pipe() 处理操作
### gulp使用方法
        下载gulp  npm install gulp
        在项目根目录下新建gulpfile.js文件
        重构项目文件结构:src目录放源文件.dist目录放修改后的文件
        在gulpfile.js中编写任务,在命令行中执行任务
### 复制任务
        gulp.task('first', () => {
        console.log('第一个gulp任务');
        gulp.src('./src/css/base.css')
        .pipe(gulp.dest('dist/css'));})
### gulp插件
        gulp-htmlmin html压缩
        gulp-csso css压缩
        gulp-babel js语法转换
        gulp-less  less语法转换
        gulp-uglify js压缩
        gule-file-include  抽取公共文件  语法@@include(路径)
        browsersync 浏览器同步
### package.json文件的使用
        项目描述文件,记录了当前项目信息,名称,版本,作者,项目依赖第三方包的信息,传输文件不需要传输node_modules  package.json中有第三方依赖的信息,使用npm install 会默认下载所需要的第三方
        使用 npm init -y 生成package.json
## node.js模块查找规则
### 省略后缀查找机制
        如果省略后缀,先找同名js文件,找不到再找同名文件夹
        如果找到的是同名文件夹,就会去找文件夹中的index.js
        如果没有index.js就会去当前文件夹中的pakeage.js中查找main选项中有没有入口文件
        如果指定的入口文件不存在或没有指定入口文件,就会报错
### 没有路径也没有后缀查找机制
        node.js会假设它是系统模块,去node_modules文件夹中查找是否有同名js文件
        没有就找有没有同名文件夹
        如果找到的是同名文件夹,就会去找文件夹中的index.js
        如果没有index.js就会去当前文件夹中的pakeage.js中查找main选项中有没有入口文件
        如果指定的入口文件不存在或没有指定入口文件,就会报错
## Node服务器
### 创建服务器
        const http = require('http') //引用系统模块
        const app = http.createServer()//创建web服务器
        app.on('request',(request,response)=>{//request 请求事件
                request.method //获取请求的方式
                req.url //获取请求的地址
                req.headers //获取请求报文(请求头?)
                response.end('相应结果')//作出相应
        })
        app.listen(3000) //监听3000端口
### Node响应
    response.writeHead()设置响应报文
        第一个参数是htpp状态码 如200 404 等
        第二个参数是一个对象,json格式 {}
            对象中包括相应类型 content-type:text/html;charset=uft8设置响应格式和编码
    请求参数
        系统模块 url  处理url的
        用法:const url = require('url'),可以写入第二个参数true 将查询参数解析成对象
        url.parse()方法:解析url,返回对象,把url中各个部分拆分成属性放入对象中
        url.parse()返回结果中,pathname是不包含参数的地址
        使用系统模块path 中path.join方法拼接路径,会自动加上系统分隔符//或者\\
    post请求参数
        post参数通过事件的方式接受,data事件和end事件
        当请求参数传递时触发data事件,传递完毕后触发end事件
        request.on(data) request.on(end)
        系统模块 querystring 
        使用querystring.pase() 把字符串(json)转换为对象
        post请求参数被放置在请求体中,获取post数据使用data和end事件,获取get数据使用url中的pathname
    路由 route
        路由是指客户端请求地址与服务器程序代码的对应关系,简单来说就是请求什么响应什么,就是判断并响应的代码
    静态资源处理 static
        使用第三方插件模块,mime判断页面请求类型,并返回
        mime.getType(路径) 根据路径返回资源类型
    Node异步编程 Promise
        promise是解决node.js中异步回调地狱的问题,是Es6语法
        promise是构造函数,需要通过new的方式实例化,并且要传递一个匿名函数作为参数.函数有2个形参,resolve和reject
        语法 
        let promise = new Promise((resolve,reject)=>{
        setTimeout(() => {
                          if(false){
                               resolve('哈哈')
                           }else{
                               reject('失败了')
                           }
        }, 200);
          })
        promise.then(result=>console.log(result)).catch(error=>console.log(error))
        异步执行完成后,resolve(传出结果),外面使用then((result)=>{log(result)})接收
        异步执行失败后,reject(传出结果),外面使用catch((result)=>{log(result)})接收
        resolve和reject可以使用链式编程
## MongDB数据库
    数据库相关概念
        database:数据库,数据库软件可以有多个数据库
        collection:集合,一组数据的集合,可以理解为js的数组
        document:文档,一条具体的数据,可以理解为js的对象
        field:字段,文档中的属性名称,可以理解为js对象的属性
    数据库链接
        node需要安装mongoose模块,npm install mongoose
        使用mongoose提供的connect方法链接数据库
        mongoose.connect('数据库地址').then(回调函数).catch(回调函数)
        then返回链接成功后的信息,catch返回失败的对象
        在MongoDB中链接的数据库不存在,MongoDB会自动创建
    创建集合
        创建集合分两步,一是对集合设定规则,二是创建集合并应用,创建mongoose.Schema构造函数的实例即可
        设定集合规则:
        const xxxSchema = new mongoose.Schema({name:String,author:String}) 给mongoose.Schema构造函数传入一个对象,写入属性名和数据类型
        创建集合并应用规则
        mongoose.model()用来创建集合
        conse Xxx = mongoose.model('集合名称(首字母大写)',规则名),会返回一个构造函数
    创建文档
        创建文档实际上就是向集合中插入数据PS集合创建后不插入文档,数据库内不显示,好比创建了一个li不追加到ul中
        创建文档的方法,1:创建集合实例 2:调用实例对象下的save方法.或者使用构造函数的create方法
        const xxxs = new xx({name:'猪肘子',author:'啊哈哈'})
        xxxs.save()
        或者使用↓↓
        Xxx(创建集合model方法返回的构造函数).create({name:'猪肘子',author:'啊哈哈'}).then(result=>成功的代码).catch(err=>失败的代码)
    mongoDB数据库导入数据
        mongoimport -d 要导入进哪个数据库的名字 -c 要导入到集合的名字 --file 要导入的文件
        注意,导入数据库要先将MongoDB的安装目录下的bin目录添加到系统环境变量path中
    查找数据
        集合构造函数.find({查询条件}).then(()=>{查询结果})
        .find()查询,没有查询条件对象默认查询所有文档
        find({"name" : {$regex:'大虾'}}) 模糊查询
        限定查询:$gt 大于  $lt 小于 例 : find({age{$gt:3,$lt:9}})
        匹配包含:$in 例 .find({hobbies:{$in:打豆豆}}),常用于搜索查询
        查询字段:.find().select('字段') 不想查询的字段用负号
        排序查询:.find().sort(age) 升序,降序加负号
        跳过限制:.find().skip(跳过多少条开始查询).limit(限定查询几条)
    删除文档
        删除单个 .findOneAndDelete({查询条件}).then((res)=>{}),查找一个文档并删除,查找到多个只删除找到的第一个
        删除多个 .deleteMany({删除条件}).then((res)=>{})
    更新文档
        更新单个 集合构造函数.updateOne({查询条件},{要修改的值}).then((res)=>{})
        更新多个 集合构造函数.updateMany({查询条件},{要修改的值}).then((res)=>{})
    mongoose验证
        创建集合规则时,可以设置字段的验证规则,验证失败则不插入文档
        验证使用对象设置 例 name:{type:String,required:true},限制name字段是类型是字符串,而且必须填写
        required:true  必传字段,添加此属性的字段,必须添加
        minlength:长度  限制最小长度
        maxlength:长度  限制最大长度
        trim:true 去除两端空格
        min:n 限制数值类型最小为n
        max:n 限制数值类型最大为n
        default:指定默认值,例 default:Date.now  不传会自动使用默认值
        enum:['1','2','3'] 指定传入值,传入的必须是数组内的值
        重点:unique:true 传入的值不能和数据库内的重复
        自定义验证器:validate:{validetor:(v)=>{v&&v.length>4},message:'自定义错误信息'} 验证v存在并且v的长度大于4
    集合关联
        不同集合的数据是有关系的,比如文章和用户在不同的集合中,但是用户发布的文章,需要关联起来,就需要使用集合关联
        使用方法:使用ID进行关联
        使用populate进行关联查询
        id的类型:mongoose.Schema.Types.ObjectId,ref:'要关联的集合'
        .find().populate(关联集合属性)查询关联
## 第三方路由模块 router
    1 获取路由对象 const getRouter = require("router"),router = getRouter(),
    2 调用路由对象提供的方法创建路由 router.get('/add',()=>{})
    3 启用路由 在请求事件中使用 router(res,req,()=>{必填回调函数})
## 第三方静态资源处理模块 serve-static
    1 引入模块 const servestatic = require(' serve-static')
    2 调用方法创建静态资源服务并制定静态资源目录,并在请求事件中开启const serve = serve-static('静态资源目录') ,serve(res,req,callback)