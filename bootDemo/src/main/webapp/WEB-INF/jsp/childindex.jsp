<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <%--引入element-ui--%>
    <!-- 引入样式 -->
    <link rel="stylesheet" href="/api/static/lib/vue/elementuiplus/index.css">
    <%--兼容ie，支持ES6，必须引入babel-core-->browser.min.js（让低版本浏览器解析ES6语法转为ES5）【新版本叫babel-standalone-->babel.min.js，否则最好使用6.0.0以下版本的browser.min.js】和polyfill.min.js--%>
    <script type="text/javascript" src="/api/static/lib/babel.min.js"></script>
    <%--解决ES6新API的解决方法（让低版本浏览器解析Promise等API）--%>
    <script type="text/javascript" src="/api/static/lib/polyfill.min.js"></script>
    <%--引入VUE--%>
    <script type="text/javascript" src="/api/static/lib/vue/vue.global.js"></script>
    <%--引入element-ui--%>
    <!-- 引入组件库 -->
    <script type="text/javascript" src="/api/static/lib/vue/elementuiplus/index.full.js"></script>
    <!-- 图标Icon -->
    <script type="text/javascript" src="/api/static/lib/vue/elementuiplus/index.iife.min.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
</head>
<body>
<div id="appChildMain">
    <el-steps :active="active" finish-status="success">
        <el-step title="Step 1" />
        <el-step title="Step 2" />
        <el-step title="Step 3" />
    </el-steps>

    <el-button style="margin-top: 12px" @click="next">Next step</el-button>
</div>

<%--<script type="text/javascript">--%>
<script type="text/babel">
    //注意：这时type不能为text/javascript了，要改为text/babel,解析babel文件（本地引入browser.js和polyfill.js后script标签的type要改为type=text/babel，用cdn方式引入是不需要修改的。）

    let keyName = '01';
    console.log('testJson','${testJson}');
    var testJsonObj = JSON.parse('${testJson}');
    console.log('testJsonObj', testJsonObj);
    let mapValue = testJsonObj[keyName];
    console.log('mapValue', mapValue);

    //app实例可以作为一个全局变量或者局部变量被外部页面使用
    const {createApp, h, ref} = Vue;
    const appChild = createApp({
        setup() {
            console.log('setup!');

            const message = ref('Hello, Vue 3!');
            const active = ref(0);

            Vue.watch(message, (newVal, oldVal) => {
                console.log('Message changed:', newVal, oldVal);
            });

            const next = () =>{
                message.value = "100";

                var parentVue = window.parent.app;
                console.log('parentVue',parentVue)
                // 获取父容器的 Vue 实例
                var parentInstance = window.parent.appInstance;
                console.log('parentInstance', parentInstance);
                // 调用父容器 Vue 实例的方法
                //parentInstance.parentMethod();
                //菜单跳转
                parentInstance.addTab('bilibili', 'https://www.bilibili.com/','2');
                if (active.value++ > 2) active.value = 0;
            }

            return {
                next
            };
        },
        /*data() {
            return {
                message: "Hello Element Plus",
                active: ref(0),
            };
        },
        methods: {
            next() {
                var parentVue = window.parent.app;
                console.log('parentVue',parentVue)
                // 获取父容器的 Vue 实例
                var parentInstance = window.parent.appInstance;
                console.log('parentInstance', parentInstance);
                // 调用父容器 Vue 实例的方法
                //parentInstance.parentMethod();
                //菜单跳转
                parentInstance.addTab('bilibili', 'https://www.bilibili.com/','2');
                if (this.active++ > 2) this.active = 0
            }
        },*/
    });
    //注册Element Plus UI插件
    appChild.use(ElementPlus);
    //注册Element Plus Icon组件
    for (const [key, component] of Object.entries(ElementPlusIconsVue)) {
        appChild.component(key, component)
    }
    var appChildMainInstance = appChild.mount("#appChildMain");

    /*console.log('appChildMainVue',appChild)
    console.log('appChildMainInstance',appChildMainInstance)*/
</script>
</body>
</html>
