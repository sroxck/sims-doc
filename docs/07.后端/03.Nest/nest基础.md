---
title: nest基础
date: 2022-02-15 15:42:03
permalink: /pages/f33401/
categories:
  - 后端
  - Nest
tags:
  - 
---
<!--
 * @Author: Jingdongdong
 * @Date: 2022-02-15 15:42:03
 * @LastEditTime: 2022-02-15 16:13:43
 * @LastEditors: Jingdongdong
 * @Description: 
-->
# nest框架的使用
nest是基于express开发的框架,使用mvc思想

## 快速上手

 安装nest
`npm i -g @nestjs/cli`

 创建项目
`nest new 项目名称`

项目分为模块(module),控制器(Controller)

生成模块
`nest g(生成) mo 模块名`

生成控制器
`nest g co 控制器名`

> 可以用-h查看支持

nest接入swagger生成api文档

安装swagger
`npm i --save @nestjs/swagger swagger-ui-express`

使用
``` ts
//main.ts
import { SwaggerModule, DocumentBuilder } from '@nestjs/swagger';
  const config = new DocumentBuilder()
    .setTitle('微前端服务API') 
    .setDescription('微前端演示服务')
    .setVersion('1.0')
    .build();
  const document = SwaggerModule.createDocument(app, config);
  // api-docs: 文档地址
  SwaggerModule.setup('api-docs', app, document);
```
  
 swagger 装饰器

 `ApiTags` 装饰当前控制器(路由)的名称
 `ApiOperation` 装饰当前接口的名称

 nest 接口取参数
 @Body() body, @Query() query,@Param() param
 获取全部不用传参 获取指定 就传参


 数据库 mongdb nest模型  `typegoose`

安装
`yarn add @hasezoey/typegoose@`
`next mongoose  @types/mongoose`

 `yarn add @hasezoey/typegoose@next mongoose @types/mongoose`

 开启验证
  安装 `yarn add class-validator class-trans`
former

使用 // 开启验证管道
  `app.useGlobalPipes(new ValidationPipe())`


// 使用依赖注入替换typegoose
 ` constructor(@InjectModel(Posts) private readonly postModel:ModelType<Posts>){} `

 