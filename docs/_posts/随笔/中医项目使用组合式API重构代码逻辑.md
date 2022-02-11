---
title: 中医项目使用组合式API重构代码逻辑
date: 2021-11-17 14:03:56
permalink: /pages/9ee492/
sidebar: auto
categories:
  - 随笔
tags:
  - 
---

## 遇到的问题
项目随着需求的改动越来越多,追加的功能越来越多,在 `options Api`的功能划分下,代码显得越来越臃肿,非常难易维护

当我们的组件变得更大时，业务逻辑关注点的代码也会变长，假如想找到某个在多处代码中有频繁操作的属性进行新需求的具体操作，会在100甚至更多行代码中跳来跳去，找到属于该属性的逻辑，尤其是刚接手项目的新人来说，这会导致组件难以阅读和理解。
## 举个栗子🌰
如果一个组件中有数百行代码，那么就必须在多个部分`data`、`methods`、`computed`等中为单个特性(例如搜索功能)添加代码。

**这意味着仅一项功能的代码可能会分散分布在数百行中，并分布在几个不同的位置，从而使其难以阅读或维护**。
## options的缺陷与composition的优点

#### options
- 缺点:虽然组件化和mixin可以一定程度缓解vue代码冗余,过长,不易维护,但其根本模式存在this这个黑盒,过多组件的维护成本更加高昂,mixin又无法区别来源,导致维护更加不易,最关键的一点因为其提供的填鸭模式(指定区域做指定事)容易固化前端开发的思维,如左图所示,所以vue官方诞生了新的composition模式

#### composition
- 优点:CompositionAPI中能够配置与相同逻辑问题相关的代码，并且可以进一步拆分为hooks,这正是我们需要的。如右图所示
<div>
    <img src="/img/test.png" style="text-algin:center">
 </div>


## 使用composition Api 重构中医项目代码,页面实例展示

> 这里用首页作为参考,展示重构的差异化 
<div>
    <img src="/img/home.png" style="text-algin:center">
 </div>

 首先分析一下这个页面的功能,上半区数据展示,下半区可视化图表展示,图表拥有季度和月度,以及年份的切换功能,我们先看一下传统optionsApi实现的代码

 ``` js
export default {
  components: {
    scard,
    universalChart,
    maps
  },
  data() {
    return {
      titleList: {
        hosTotal: '', // 已接入医院
        taskTotal: '', // 累计创建任务数量
        allRecord: '', // 平台总条目数
        codeStatus: '' // 协作单位节点状态
      },
      pickerOptions:{
        disabledDate: time => time.getFullYear()>new Date().getFullYear(),
      },
      monthlyRadio:"month",
      pickerTime:new Date().getFullYear()+'',
      styleObj: {
        background: '#fff',
        borderRadius: '8px'
      },
      tableData: [],
      diseaseChartType: [], // 获取到医院名称id组成的列表
      diseaseChart: {},
      /* === hospitalNumber end === */
      radio: '',
      value: ''
    }
  },
  computed: {
  },
  filters: {
  },
  created() {
    /* this.initData() */
    this.requireData()
  },
  mounted() {
    this.initData()
  },
  activated() {
    this.axiosCury = this.prefix('/cebp-dwh')
  },
  deactivated() {
  },
  beforeDestroy() {
  },
  methods: {
    initData() {
      this.getTitleInfo()
      this.getBarChart()
    },
    /* 获取头部统计数据 */
   async getTitleInfo() {
      try {
        const {data} = await this.recordCountInfo({})
        this.titleList = {
          recordCountInfo: data.allCount,
          recordCountInfoToYear: data.countOfYear,
          recordCountInfoToMonth: data.countOfMonth
        }
      } catch (error) {
        console.log(error);
      }
    },
    async getBarChart(){
      //没返回code
      try {
        const {data} = await this.recordCountInfoByMonthOrQuarter({show:this.monthlyRadio,year:this.pickerTime,count:10})
        if(data){
          this.diseaseChart.series = data.dataList
          this.diseaseChart.series.forEach(element =>  element.type = 'bar')
          this.diseaseChart.xAxis = data.xAxis
          this.diseaseChart.yAxis = data.yAxis
          this.$refs.diseaseChart.initChart()
        }
      } catch (error) {
        console.log(error);
      }
      
    },
    prefix(prefix) {
      return function(mid) {
        return function(last) {
          return function(params, type = 'get') {
            if (type == 'get') {
              return getFun(prefix + mid + last, params)
            } else if (type == 'post') {
              return postFun(prefix + mid + last, params)
            }
          }
        }
      }
    },
    requireData() {
      this.prefixData = this.prefix('/cebp-dwh')('/api/home')
    },
    //数据总量
    recordCountInfo(params) {
      return this.prefixData('/recordCountInfo')(params)
    },
    //柱状图
    recordCountInfoByMonthOrQuarter(params) {
      return this.prefixData('/recordCountInfoByMonthOrQuarter')(params)
    },
  }
}
```
::: tip
可以看到简单的3个功能,代码长达100行,下面我们看一下compositionApi的实现
:::

``` js
export default defineComponent({
  components: { universalChart, scard ,},
  setup() {
    /** 数据卡片 */
    const titleList = ref({})
    const getTitle = async() => {
      const response = await getFun('/cebp-dwh/api/home/recordCountInfo', {})
      const { data: { allCount, countOfMonth, countOfYear }} = response
      titleList.value = {
        recordCountInfo: allCount,
        recordCountInfoToYear: countOfYear,
        recordCountInfoToMonth: countOfMonth
      }
    }
    onBeforeMount(getTitle)
    /** 柱状图 */
    const { plainData } = useHome()
    const diseaseChartRef = ref(null)
    const getBarChart = async() => {
      const { monthlyRadio, pickerTime } = plainData
      const request = { show: monthlyRadio.value, year: pickerTime.value, count: 10 }
      const { data } = await getFun('/cebp-dwh/api/home/recordCountInfoByMonthOrQuarter', request)
      data.dataList.forEach((element) => (element.type = 'bar'))
      plainData.diseaseChart.series = data.dataList
      plainData.diseaseChart.xAxis = data.xAxis
      plainData.diseaseChart.yAxis = data.yAxis
      diseaseChartRef.value.initChart()
    }
    onMounted(getBarChart)
    return { titleList, ...plainData, diseaseChartRef, getBarChart }
  }
})
```
::: tip
仅用30行代码就实现了相同功能,结构更简洁,可阅读性提升明显
:::
<div>
    <img src="/img/op.png" style="text-algin:center">
 </div>

 可以看到相关功能的代码,包含定义,方法,等逻辑被放在了一起,后续还可以封装为函数或者hooks,维护和拓展性都得到了提高