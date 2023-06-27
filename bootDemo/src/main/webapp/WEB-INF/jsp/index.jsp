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
    <div class="common-layout">
        <el-container>
            <el-header style="background-color: #4db3ff;display: flex;justify-content:space-between;align-items: center">
                <div style="display: flex;justify-content:start;align-items: center">
                    <div><img src="http://lf3-cdn-tos.bytescm.com/obj/static/xitu_juejin_web/e08da34488b114bd4c665ba2fa520a31.svg" alt="稀土掘金"/></div>
                    <div>
                        <el-divider direction="vertical"/>
                    </div>
                    <div><span>天地一体化网站</span></div>
                </div>
                <div style="display: flex;justify-content:end;align-items: center">
                    <div><span>欢迎您，李涛（891234）！</span></div>
                    <div>
                        <el-dropdown>
                            <span class="el-dropdown-link">
                                <div style="display: flex;align-items: center">
                                    <div><el-avatar src="https://cube.elemecdn.com/0/88/03b0d39583f48206768a7534e55bcpng.png"/></div>
                                    <div>
                                        <el-icon class="el-icon--right">
                                            <arrow-down/>
                                        </el-icon>
                                    </div>
                                </div>
                            </span>
                            <template #dropdown>
                                <el-dropdown-menu>
                                    <el-dropdown-item>Action 1</el-dropdown-item>
                                    <el-dropdown-item>Action 2</el-dropdown-item>
                                    <el-dropdown-item>Action 3</el-dropdown-item>
                                    <el-dropdown-item disabled>Action 4</el-dropdown-item>
                                    <el-dropdown-item divided>Action 5</el-dropdown-item>
                                </el-dropdown-menu>
                            </template>
                        </el-dropdown>
                    </div>
                    <div>
                        <el-divider direction="vertical"/>
                    </div>
                    <div><img src="/api/image/AcademicCap.svg" alt="图标点击事件" style="height: 16px;width: 16px" @click="logout()"></div>
                </div>
            </el-header>
            <el-container>
                <el-aside style="width: 180px;height: calc(100vh - 76px)">
                    <el-menu
                            :default-active="menuActiveIndex"
                            :collapse="false"
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
                            <el-menu-item-group title="Group One-One">
                                <el-menu-item index="1-1" @click="addTab('baidu','https://www.baidu.com/','1-1')">baidu
                                </el-menu-item>
                                <el-menu-item index="1-2" @click="addTab('bing','https://www.bing.com/','1-2')">bing
                                </el-menu-item>
                            </el-menu-item-group>
                            <el-menu-item-group title="Group One-Two">
                                <el-menu-item index="1-3" @click="addTab('google','https://www.google.com.hk/','1-3')">
                                    google
                                </el-menu-item>
                            </el-menu-item-group>
                            <el-sub-menu index="1-4">
                                <template #title>item four</template>
                                <el-menu-item index="1-4-1">item one</el-menu-item>
                            </el-sub-menu>
                        </el-sub-menu>
                        <el-menu-item-group title="Group Two">
                            <el-menu-item index="2" @click="addTab('bilibili','https://www.bilibili.com/','2')">
                                <el-icon>
                                    <Clock/>
                                </el-icon>
                                <span>bilibili</span>
                            </el-menu-item>
                        </el-menu-item-group>
                        <el-menu-item-group title="Group Three">
                            <el-menu-item index="3" disabled>
                                <el-icon>
                                    <document/>
                                </el-icon>
                                <span>Navigator Three</span>
                            </el-menu-item>
                        </el-menu-item-group>
                        <el-menu-item index="4" @click="addTab('youku','https://www.youku.com/','4')">
                            <el-icon>
                                <setting/>
                            </el-icon>
                            <span>youku</span>
                        </el-menu-item>
                        <el-menu-item index="5" @click="addTab('childPage','http://localhost:8081/api/childPage','5')">
                            <el-icon>
                                <setting/>
                            </el-icon>
                            <span>childPage</span>
                        </el-menu-item>
                        <el-menu-item-group>
                            <template #title><span>Group One</span></template>
                            <el-sub-menu index="11">
                                <template #title>
                                    <el-icon><location /></el-icon>
                                    <span>Navigator One</span>
                                </template>
                                <el-menu-item-group>
                                    <template #title><span>Group One</span></template>
                                    <el-menu-item index="1-11">item one</el-menu-item>
                                    <el-menu-item index="1-21">item two</el-menu-item>
                                </el-menu-item-group>
                                <el-menu-item-group title="Group Two">
                                    <el-menu-item index="1-31">item three</el-menu-item>
                                </el-menu-item-group>
                                <el-sub-menu index="1-41">
                                    <template #title><span>item four</span></template>
                                    <el-menu-item index="1-4-11">item one</el-menu-item>
                                </el-sub-menu>
                            </el-sub-menu>
                        </el-menu-item-group>
                    </el-menu>
                </el-aside>
                <el-container>
                    <el-main>
                        <el-tabs
                                v-model="editableTabsValue"
                                type="card"
                                class="demo-tabs"
                                @tab-remove="removeTab"
                                @tab-click="tabClick"
                                style="height: calc(100vh - 116px)"
                        >
                            <el-tab-pane
                                    v-for="item in editableTabs"
                                    :closable="item.name === '首页' ? false : true"
                                    :key="item.name"
                                    :label="item.title"
                                    :name="item.name"
                            >
                                <iframe
                                        :src="item.url"
                                        style="width: 100%;height: calc(100vh - 156px)"
                                >
                                </iframe>
                            </el-tab-pane>
                        </el-tabs>
                    </el-main>
<%--                    <el-footer>Footer</el-footer>--%>
                </el-container>
            </el-container>
        </el-container>
    </div>
</div>

<!-- 引入水印生成js -->
<script type="text/javascript" src="/api/static/lib/watermark.js"></script>
<%--<script type="text/javascript">--%>
<script type="text/babel">
    //注意：这时type不能为text/javascript了，要改为text/babel,解析babel文件（本地引入browser.js和polyfill.js后script标签的type要改为type=text/babel，用cdn方式引入是不需要修改的。）

    const handleOpen = (key: string, keyPath: string[]) => {
        console.log(key, keyPath)
    }
    const handleClose = (key: string, keyPath: string[]) => {
        console.log(key, keyPath)
    }

    //app实例可以作为一个全局变量或者局部变量被外部页面使用
    const {createApp, h, ref} = Vue;
    const app = createApp({
        data() {
            return {
                message: "Hello Element Plus",
                menuActiveIndex: '1-2',
                editableTabsValue: ref('首页'),
                editableTabs: ref([
                    {
                        title: '首页',
                        name: '首页',
                        url: 'https://www.bing.com/',
                        menuIndex: '1-2',
                    },
                ])
            };
        },
        methods: {
            open() {
                ElementPlus.ElMessage('This is a message.');
            },
            openVn() {
                ElementPlus.ElMessage({
                    message: h('p', null, [
                        h('span', null, 'Message can be '),
                        h('i', {style: 'color: teal'}, 'VNode'),
                    ]),
                });
            },
            handleOpen(key, keyPath) {
                //console.log(this);
                handleOpen(key, keyPath);
            },
            handleClose(key, keyPath) {
                handleClose(key, keyPath);
            },
            addTab(tabName, url, index) {
                console.log('parentThis: ', this);
                const tabs = this.editableTabs
                // 判断当前标签页数组中是否存在当前选中的标签，根据标签名匹配
                let tab = tabs.filter((item) => item.name === tabName)[0];
                if (!tab) {
                    this.editableTabs.push({
                        title: tabName,
                        name: tabName,
                        url: url,
                        menuIndex: index,
                    })
                }
                this.editableTabsValue = tabName
                //菜单选中
                this.refreshMenuActive(index);
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
                                //菜单选中
                                this.refreshMenuActive(nextTab.menuIndex);
                            }
                        }
                    })
                }
                this.editableTabsValue = activeName
                this.editableTabs = tabs.filter((tab) => tab.name !== targetName)
            },
            tabClick(tabsPaneContext, event) {
                //console.log('tabsPaneContext', tabsPaneContext, 'event', event);
                const tabs = this.editableTabs
                let tab = tabs.filter((item) => item.name === tabsPaneContext.paneName)[0];
                //菜单选中
                this.refreshMenuActive(tab.menuIndex);
            },
            logout() {
                ElementPlus.ElMessageBox.confirm(
                    '是否确定退出?',
                    'Warning',
                    {
                        confirmButtonText: '确定',
                        cancelButtonText: '取消',
                        type: 'warning',
                    }
                )
                    .then(() => {
                        ElementPlus.ElMessage({
                            type: 'success',
                            message: '成功点击了确定按钮',
                        })
                    })
                    .catch(() => {
                        ElementPlus.ElMessage({
                            type: 'info',
                            message: '成功点击了取消按钮',
                        })
                    })
            },
            refreshMenuActive(activeIndex) {
                this.menuActiveIndex = activeIndex;
            },
            parentMethod() {
                console.log("父容器的parentMethod方法被调用了！");
            },
        },
        mounted() {
            /*Vue.watch(this.menuActiveIndex, (newVal, oldVal) => {
                console.log('Message changed:', newVal, oldVal);
            });*/
        },
    });
    //注册Element Plus UI插件
    app.use(ElementPlus);
    //注册Element Plus Icon组件
    for (const [key, component] of Object.entries(ElementPlusIconsVue)) {
        app.component(key, component)
    }
    const appInstance = app.mount("#appMain");

    // createWaterMark("我是水印");
    useWatermark().setWatermark("我是水印");

    /*console.log('app',app);
    console.log('appInstance', appInstance);
    console.log('appInstance.message', appInstance.message);
    console.log('appInstance.$data.message', appInstance.$data.message);
    app._component.methods.parentMethod();
    appInstance.parentMethod();*/

    /*const App = {
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
    app.mount("#appMain");*/

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
<style>
    .el-menu--collapse>.el-menu-item-group>ul>.el-sub-menu>.el-sub-menu__title>span, .el-menu--collapse>.el-menu-item-group>ul>.el-menu-item>span, .el-menu--collapse>.el-menu-item>span, .el-menu--collapse>.el-sub-menu>.el-sub-menu__title>span, .el-menu--collapse>.el-menu-item-group>.el-menu-item-group__title {
        height: 0;
        width: 0;
        overflow: hidden;
        visibility: hidden;
        display: inline-block;
    }
    /*::-webkit-scrollbar {
        display: none; !* Chrome Safari *!
    }*/
</style>
</body>
</html>
