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
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
</head>
<body>
hello world!!!
name= ll${name} welcome!
<div id="appMain">
    <el-button type="primary">Click me!</el-button>
    <el-button :plain="true" @click="open">Show message</el-button>
    <el-button :plain="true" @click="openVn">VNode</el-button>
</div>

<%--<script type="text/javascript">--%>
<script type="text/babel">
    //注意：这时type不能为text/javascript了，要改为text/babel,解析babel文件（本地引入browser.js和polyfill.js后script标签的type要改为type=text/babel，用cdn方式引入是不需要修改的。）
    console.log("Hello start");
    const openVnDemo = () => {
        ElementPlus.ElMessage({
            message: Vue.h('p', null, [
                Vue.h('span', null, 'Message can be '),
                Vue.h('i', { style: 'color: teal' }, 'VNode'),
            ]),
        })
    }
    //app实例可以作为一个全局变量或者局部变量被外部页面使用
    /*const { createApp, h } = Vue;
    const app = createApp({
        methods: {
            open() {
                ElementPlus.ElMessage('This is a message.');
            },
            openVn() {
                ElementPlus.ElMessage({
                    message: h('p', null, [
                        h('span', null, 'Message can be '),
                        h('i', { style: 'color: teal' }, 'VNode'),
                    ]),
                });
            },
        },
    }).use(ElementPlus).mount('#appMain');*/

    const App = {
        data() {
            return {
                message: "Hello Element Plus",
            };
        },
        methods: {
            open() {
                ElementPlus.ElMessage('This is a message.');
            },
            openVn() {
                openVnDemo();
            },
        },
    };
    const app = Vue.createApp(App);
    app.use(ElementPlus);
    app.mount("#appMain");

    /*const {createApp} = Vue
    createApp({
        data() {
            return {
                btnName: '点我！',
                message: 'Hello Vue!'
            }
        },
        methods: {}
    }).mount('#appMain')*/

    /*var appMain = Vue.createApp({
        el: '#appMain',
        data: {
            btnName: '点我！'
        },
        methods: {
            open() {
                this.$message('这是一条消息提示');
            },

            open1() {
                const h = this.$createElement;
                this.$message({
                    message: h('p', null, [
                        h('span', null, '内容可以是 '),
                        h('i', {style: 'color: teal'}, 'VNode')
                    ])
                });
            }
        }
    });*/
    console.log("Hello end");
</script>
</body>
</html>
