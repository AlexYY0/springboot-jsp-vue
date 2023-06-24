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
<div id="appMain">
    <%--<el-button type="primary">Click me!</el-button>
    <el-button :plain="true" @click="open">Show message</el-button>
    <el-button :plain="true" @click="openVn">VNode</el-button>--%>
    <el-row class="tac">
        <el-col :span="6">
            <h5 class="mb-2">Default colors</h5>
            <el-menu
                    default-active="2"
                    class="el-menu-vertical-demo"
                    @open="handleOpen"
                    @close="handleClose"
            >
                <el-sub-menu index="1">
                    <template #title>
                        <el-icon>
                            <location/>
                        </el-icon>
                        <span>Navigator One</span>
                    </template>
                    <el-menu-item-group title="Group One">
                        <el-menu-item index="1-1" @click="addTab(editableTabsValue)">item one</el-menu-item>
                        <el-menu-item index="1-2" @click="addTab(editableTabsValue)">item two</el-menu-item>
                    </el-menu-item-group>
                    <el-menu-item-group title="Group Two">
                        <el-menu-item index="1-3" @click="addTab(editableTabsValue)">item three</el-menu-item>
                    </el-menu-item-group>
                    <el-sub-menu index="1-4">
                        <template #title>item four</template>
                        <el-menu-item index="1-4-1">item one</el-menu-item>
                    </el-sub-menu>
                </el-sub-menu>
                <el-menu-item index="2">
                    <el-icon>
                        <Clock/>
                    </el-icon>
                    <span>Navigator Two</span>
                </el-menu-item>
                <el-menu-item index="3" disabled>
                    <el-icon>
                        <document/>
                    </el-icon>
                    <span>Navigator Three</span>
                </el-menu-item>
                <el-menu-item index="4">
                    <el-icon>
                        <setting/>
                    </el-icon>
                    <span>Navigator Four</span>
                </el-menu-item>
            </el-menu>
        </el-col>
        <el-col :span="18">
            <h5 class="mb-2">Custom colors</h5>
            <el-tabs
                    v-model="editableTabsValue"
                    type="card"
                    class="demo-tabs"
                    closable
                    @tab-remove="removeTab"
            >
                <el-tab-pane
                        v-for="item in editableTabs"
                        :key="item.name"
                        :label="item.title"
                        :name="item.name"
                >
                    {{ item.content }}
                </el-tab-pane>
            </el-tabs>
        </el-col>
    </el-row>
</div>

<%--<script type="text/javascript">--%>
<script type="text/babel">
    //注意：这时type不能为text/javascript了，要改为text/babel,解析babel文件（本地引入browser.js和polyfill.js后script标签的type要改为type=text/babel，用cdn方式引入是不需要修改的。）
    //es6 demo
    const openVnDemo = () => {
        ElementPlus.ElMessage({
            message: Vue.h('p', null, [
                Vue.h('span', null, 'Message can be '),
                Vue.h('i', {style: 'color: teal'}, 'VNode'),
            ]),
        })
    }

    const handleOpen = (key: string, keyPath: string[]) => {
        console.log(key, keyPath)
    }
    const handleClose = (key: string, keyPath: string[]) => {
        console.log(key, keyPath)
    }

    /*let tabIndex = 2
    const editableTabsValue = Vue.ref('2')
    const editableTabs = Vue.ref([
        {
            title: 'Tab 1',
            name: '1',
            content: 'Tab 1 content',
        },
        {
            title: 'Tab 2',
            name: '2',
            content: 'Tab 2 content',
        },
    ])*/

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
                tabIndex: 0,
                editableTabsValue: Vue.ref('0'),
                editableTabs : Vue.ref([
                ])
            };
        },
        methods: {
            open() {
                ElementPlus.ElMessage('This is a message.');
            },
            openVn() {
                openVnDemo();
            },
            handleOpen(key, keyPath) {
                handleOpen(key, keyPath);
            },
            handleClose(key, keyPath) {
                handleClose(key, keyPath);
            },
            addTab(targetName) {
                const newTabName = `\${++this.tabIndex}`;
                console.log("addTab" + newTabName);
                console.log(this.editableTabs);
                this.editableTabs.push({
                    title: 'New Tab',
                    name: newTabName,
                    content: 'New Tab content',
                })
                this.editableTabsValue = newTabName
            },
            removeTab(targetName) {
                const tabs = this.editableTabs
                let activeName = this.editableTabsValue
                if (activeName === targetName) {
                    tabs.forEach((tab, index) => {
                        if (tab.name === targetName) {
                            const nextTab = tabs[index + 1] || tabs[index - 1]
                            if (nextTab) {
                                activeName = nextTab.name
                            }
                        }
                    })
                }
                this.editableTabsValue = activeName
                this.editableTabs.value = tabs.filter((tab) => tab.name !== targetName)
            },
        },
    };
    const app = Vue.createApp(App);
    //注册Element Plus UI插件
    app.use(ElementPlus);
    //注册Element Plus Icon组件
    for (const [key, component] of Object.entries(ElementPlusIconsVue)) {
        app.component(key, component)
    }
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
</script>
</body>
</html>
