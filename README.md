# cloud_layui 权限管理系统




![active4j](https://zh-active4j-1251505225.cos.ap-shanghai.myqcloud.com/active4jboot/logo.png "active4j")

# 项目介绍

cloud_layui是基于springcloud alibaba+layui整合开发前后端分离权限管理系统。
以Spring Framework为核心容器，Spring MVC为模型视图控制器，Mybatis Plus为数据访问层， spring security为权限授权层, Redis为分布式缓存,
注册中心、配置中心选型Nacos，权限认证使用Redis,
流量控制框架选型Sentinel,
layui+layuimini作为前端框架并进行前后端分离的开源框架。

# 技术文档
- 讨论加群：qq群①：601212472   
- 演示地址：[http://money.goodym.cn/layuidemo/page/login.html](http://money.goodym.cn/layuidemo/page/login.html "http://money.goodym.cn/layuidemo/page/login.html")

# 配套详细视频教程
- 视频教程地址：[http://java.goodym.cn/html/1571623967758.html](http://java.goodym.cn/html/1571623967758.html "http://java.goodym.cn/html/1571623967758.html")


# 项目特点
- 开箱即用，节省开发时间，提高开发效率
- 代码全部开源，持续更新，共同维护
- 基于springcloud alibaba，简化了大量项目配置和maven依赖，让您更专注于业务开发
- 友好的代码结构及注释，便于阅读及二次开发
- 使用分包分层设计，工程拆分，分为dao，service，Controller，view层，层次清楚，低耦合，高内聚。
- 灵活的权限控制, 整合spring security，可控制到页面或按钮，满足绝大部分的权限需求,优化权限注解方便权限配置
- 日志记录采用aop方式，可对用户所有操作进行记录
- 引入swagger文档支持，方便编写API接口文档
- 项目采用前后端分离架构，提升效率
- 前端组件丰富，集成layuimini，基本涵盖了所有前端开发需求
- 支持多种浏览器: Google, 火狐, IE,360等


# 组织结构

```html
active4j
├── active4j-common  公有工具类工程
    - com.active4j.common.cache 本地缓存
    - com.active4j.common.context.util  容器工具
    - com.active4j.common.func  常用功能组件
    - com.active4j.common.redis 集成redis
    - com.active4j.common.threadpool 集成线程池
    - com.active4j.common.util  常用工具包
    - com.active4j.common.web.config  springmvc配置
├── active4j-entity  实体工程
    - com.active4j.entity.base 基础实体
    - com.active4j.entity.commcon 公用实体
    - com.active4j.entity.func 系统常用组件功能实体
    - com.active4j.entity.system 系统管理模块实体
├── active4j-dao     dao层
    - com.active4j.dao.config 数据源配置
    - com.active4j.dao.func 系统常用组件功能
    - com.active4j.dao.system.dao  系统管理模块
    - com.active4j.dao.system.dao.sql sql文件
├── active4j-service service层
    - com.active4j.service.func 系统常用组件功能服务
    - com.active4j.service.monitor 系统监控模块服务
    - com.active4j.service.system 系统管理模块服务
    - com.active4j.service.system.util 系统管理工具包
├── active4j-web     controller层
    - com.active4j.web.core 核心配置包，包括shiro、springmvc、swagger2等
    - com.active4j.web.func 系统常用组件功能控制器
    - com.active4j.web.monitor.controller 监控模块控制器
    - com.active4j.web.system.controller 系统管理模块控制器
    - com.active4j.web.system.wrapper 响应结果集包装工具包
    - com.active4j.web.common.controller 公共控制器包
├── active4j-ui      基于layui的前端UI，前后端分离


```


# 技术选型
### 服务端
| 技术 | 说明 | 官网  |
| ------------ | ------------ | ------------ |
|Spring Boot2|核心框架|[https://spring.io/projects/spring-boot/](https://spring.io/projects/spring-boot/ "https://spring.io/projects/spring-boot/")|
|Spring MVC|视图框架|[http://docs.spring.io/spring/docs/current/spring-framework-reference/htmlsingle/#mvc](http://docs.spring.io/spring/docs/current/spring-framework-reference/htmlsingle/#mvc "http://docs.spring.io/spring/docs/current/spring-framework-reference/htmlsingle/#mvc")|
|Apache Shiro|权限框架|[http://shiro.apache.org/](http://shiro.apache.org/ "http://shiro.apache.org/")|
|MyBatis|持久层框架|[http://www.mybatis.org/mybatis-3/zh/index.html](http://www.mybatis.org/mybatis-3/zh/index.html "http://www.mybatis.org/mybatis-3/zh/index.html")|
|MyBatis-Plus|MyBatis增强工具|[https://mp.baomidou.com/](https://mp.baomidou.com/ "https://mp.baomidou.com/")|
|Alibaba Druid|数据库连接池|[https://github.com/alibaba/druid](https://github.com/alibaba/druid "https://github.com/alibaba/druid")|
|Redis|分布式缓存数据库|[https://redis.io/](https://redis.io/ "https://redis.io/")|
|Quartz|作业调度框架|[http://www.quartz-scheduler.org/](http://www.quartz-scheduler.org/ "http://www.quartz-scheduler.org/")|
|ActiveMQ|消息队列|[http://activemq.apache.org/](http://activemq.apache.org/ "http://activemq.apache.org/")|
|SLF4J|日志组件|[http://www.slf4j.org/](http://www.slf4j.org/ "http://www.slf4j.org/")|
|QcloudCOS|腾讯云存储|[https://www.qcloud.com/product/cos](https://www.qcloud.com/product/cos "https://www.qcloud.com/product/cos")|
|Maven|项目构建管理|[http://maven.apache.org/](http://maven.apache.org/ "http://maven.apache.org/")|
|swagger2|文档生成工具|[https://swagger.io/](https://swagger.io/ "https://swagger.io/")|
|Apache Commons|工具类|[http://commons.apache.org/](http://commons.apache.org/ "http://commons.apache.org/")|
|fastjson|JSON解析库|[https://github.com/alibaba/fastjson](https://github.com/alibaba/fastjson "https://github.com/alibaba/fastjson")|
### 前端
|技术|名称|官网|
| ------------ | ------------ | ------------ |
|jQuery|js库|[http://jquery.com/](http://jquery.com/ "http://jquery.com/")|
|layui.table|数据表格|[https://www.layui.com/doc/modules/table.html](https://www.layui.com/doc/modules/table.html "https://www.layui.com/doc/modules/table.html")|
|bootstrap-treeview|树形结构|[http://www.treejs.cn/v3/](http://www.treejs.cn/v3/ "http://www.treejs.cn/v3/")|
|layui|前端框架|[https://www.layui.com/](https://www.layui.com/ "https://www.layui.com/")|
|layui.layer|弹出组件|[https://www.layui.com/doc/modules/layer.html](https://www.layui.com/doc/modules/layer.html "https://www.layui.com/doc/modules/layer.html")|
|layui.treeTable|树形表格|[https://fly.layui.com/jie/30625/](https://fly.layui.com/jie/30625/ "https://fly.layui.com/jie/30625/")|

# 功能列表
```html
- 项目主页：介绍项目简介、技术介绍、更新日志等信息
    ○ 示例主页一
    ○ 示例主页二
    ○ 示例主页三
- 系统管理
    ○ 用户管理：用于管理后台系统的用户，可进行增删改查等操作
    ○ 部门管理：通过不同的部门来管理和区分用户
    ○ 菜单管理：维护系统菜单，操作权限，按钮权限
    ○ 角色管理：维护系统角色信息，以角色为单位分配系统权限
    ○ 数据字段管理：对系统中经常使用的一些较为固定的数据进行维护，如：是否、男女、类别、级别等
    ○ 日志管理：系统正常操作日志记录和查询；系统异常信息日志记录和查询
- 系统监控
    ○ Druid连接池监控：监视当前系统数据库连接池状态，可进行分析SQL找出系统性能瓶颈
    ○ 服务器监控：显示服务器内存信息、CPU信息、磁盘信息、JVM信息等性能指标
    ○ 在线用户列表：显示在线用户信息
- 常用功能
    ○ 邮件发送：集成邮件发送功能，富文本编辑器支持，发送普通文本，HTML文本等
    ○ 微信支付：集成微信native支付功能
    ○ 支付宝支付：集成支付宝网站二维码支付功能
    ○ 短信服务
        •阿里云短信：集成阿里云短信SDK
        •腾讯云短信：集成腾讯云短信SDK
        •云潮云短信：集成云潮云短信SDK
    ○ 定时任务：支持注解配置定时任务，支持动态维护定时任务，引入Quartz分布式定时调度
    ○ 富文本编辑器：集成layui社区的layedit、kz.layedit、tinymce编辑器
    ○ 上传下载：集成普通文件上传、图片上传、多文件上传、拖动上传、腾讯云COS存储等功能
    ○ 导入导出：引入POI工具，整合excel等导入导出功能
    ○ 系统消息：支持发送系统消息
    ○ 验证码：集成google验证码插件，支持算术验证码、动态验证码
- 前端实例组件
    ○ 格栅
    ○ 按钮
    ○ 表单
    ○ 导航
    ○ 选项卡
    ○ 进度条
    ○ 面板
    ○ 徽章
    ○ 时间线
    ○ 动画
    ○ 辅助
    ○ 通用弹出层
    ○ 上传
    ○ 时间日期
    ○ 数据表格
    ○ 分页
    ○ 滑块
    ○ 评分
    ○ 轮播
    ○ 流加载
    ○ 工具
    ○ 代码修饰
    ○ 颜色选择器
```

# 更新日志
## 2020-3-12 active4jboot版本发布
# 版权声明
Active4j使用 MIT License 协议.

# 演示截图

