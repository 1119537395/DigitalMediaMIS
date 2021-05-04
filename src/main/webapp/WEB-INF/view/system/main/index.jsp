<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>后台管理界面</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Access-Control-Allow-Origin" content="*">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="icon" href="${Path}/static/media.png">
    <link rel="stylesheet" href="${Path}/static/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="${Path}/static/css/index.css" media="all" />
</head>
<body class="main_body">

<div class="layui-layout layui-layout-admin">

    <!-- 顶部 -->
    <div class="layui-header header">
        <div class="layui-main mag0">
            <a href="#" class="logo" style="font-size: 18px">数字媒体管理系统</a>

            <!-- 显示/隐藏菜单 -->
            <a href="javascript:;" class="seraph hideMenu icon-caidan"></a>

            <!-- 顶部右侧菜单 -->
            <ul class="layui-nav top_menu">
                <li class="layui-nav-item" id="userInfo">
                    <a href="javascript:;"><img src="${Path}/static/images/logo.jpg" class="layui-nav-img userAvatar" width="35" height="35"><cite class="adminName">${user.userName}</cite></a>
                    <dl class="layui-nav-child">
                        <%--<dd><a href="javascript:;" data-url="${Path}/static/page/user/userInfo.jsp"><i class="seraph icon-ziliao" data-icon="icon-ziliao"></i><cite>个人资料</cite></a></dd>--%>
                        <dd pc><a href="javascript:;" class="functionSetting"><i class="layui-icon">&#xe620;</i><cite>功能设定</cite><span class="layui-badge-dot"></span></a></dd>
                        <dd pc><a href="javascript:;" class="changeSkin"><i class="layui-icon">&#xe61b;</i><cite>更换皮肤</cite></a></dd>
                        <dd><a href="${Path}/login/toLogin" class="signOut"><i class="seraph icon-tuichu"></i><cite>退出</cite></a></dd>
                    </dl>
                </li>
            </ul>
        </div>
    </div>

    <!-- 左侧导航 -->
    <div class="layui-side layui-bg-black">
        <div class="user-photo">
            <a class="img" title="我的头像" ><img src="${Path}/static/images/logo.jpg" class="userAvatar"></a>
           <p><span class="userName">${user.userName}</span>，欢迎登陆</p>
        </div>

        <div class="navBar layui-side-scroll" id="navBar">
            <ul class="layui-nav layui-nav-tree">
                <li class="layui-nav-item layui-this">
                    <a href="javascript:;" data-url="${Path}/system/toDesktopManager"><span>系统首页</span></a>
                </li>
            </ul>
        </div>
    </div>

    <!-- 右侧内容 -->
    <div class="layui-body layui-form">
        <div class="layui-tab mag0" lay-filter="bodyTab" id="top_tabs_box">
            <ul class="layui-tab-title top_tab" id="top_tabs">
                <li class="layui-this" lay-id=""><i class="layui-icon">&#xe68e;</i> <cite>系统首页</cite></li>
            </ul>
            <ul class="layui-nav closeBox">
                <li class="layui-nav-item">
                    <a href="javascript:;"><i class="layui-icon caozuo">&#xe643;</i> 页面操作</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;" class="refresh refreshThis"><i class="layui-icon">&#xe669;</i> 刷新当前</a></dd>
                        <dd><a href="javascript:;" class="closePageOther"><i class="seraph icon-prohibit"></i> 关闭其他</a></dd>
                        <dd><a href="javascript:;" class="closePageAll"><i class="seraph icon-guanbi"></i> 关闭全部</a></dd>
                    </dl>
                </li>
            </ul>
            <div class="layui-tab-content clildFrame">
                <div class="layui-tab-item layui-show">
                    <iframe src="${Path}/system/toDesktopManager"></iframe>
                </div>
            </div>
        </div>
    </div>
    <!-- 底部 -->
    <div class="layui-footer footer">
        <p><span>copyright @2020 柚子茶</span></p>
    </div>
</div>

    <script type="text/javascript" src="${Path}/static/layui/layui.js"></script>
    <script type="text/javascript" src="${Path}/static/js/cache.js"></script>
    <script type="text/javascript">
        var $,tab,dataStr,layer;
        layui.config({
            base : "${Path}/static/js/"
        }).extend({
            "bodyTab" : "bodyTab"
        })
        layui.use(['bodyTab','form','element','layer','jquery'],function(){
            var form = layui.form,
                element = layui.element;
            $ = layui.$;
            layer = parent.layer === undefined ? layui.layer : top.layer;
            tab = layui.bodyTab({
                openTabNum : "50",  //最大可打开窗口数量
                // 加载左侧导航菜单栏
                url : "${Path}/menu/loadLeftNavigationMenuBar"
            });

            //通过顶部菜单获取左侧二三级菜单
            function getData(json){
                $.getJSON(tab.tabConfig.url,function(data){
                    dataStr = data;
                    //重新渲染菜单
                    tab.render();
                });
            }
            //页面加载时判断左侧菜单是否显示
            //通过顶部菜单获取左侧菜单
            $(".topLevelMenus li,.mobileTopLevelMenus dd").click(function(){
                if($(this).parents(".mobileTopLevelMenus").length != "0"){
                    $(".topLevelMenus li").eq($(this).index()).addClass("layui-this").siblings().removeClass("layui-this");
                }else{
                    $(".mobileTopLevelMenus dd").eq($(this).index()).addClass("layui-this").siblings().removeClass("layui-this");
                }
                $(".layui-layout-admin").removeClass("showMenu");
                $("body").addClass("site-mobile");
                getData($(this).data("menu"));
                //渲染顶部窗口
                tab.tabMove();
            })

            //隐藏左侧导航
            $(".hideMenu").click(function(){
                if($(".topLevelMenus li.layui-this a").data("url")){
                    layer.msg("此栏目状态下左侧菜单不可展开");
                    return false;
                }
                $(".layui-layout-admin").toggleClass("showMenu");
                //渲染顶部窗口
                tab.tabMove();
            })

            getData("contentManagement");

            // 添加新窗口
            $("body").on("click",".layui-nav .layui-nav-item a:not('.mobileTopLevelMenus .layui-nav-item a')",function(){
                //如果不存在子级
                if($(this).siblings().length == 0){
                    addTab($(this));
                    $('body').removeClass('site-mobile');  //移动端点击菜单关闭菜单层
                }
                $(this).parent("li").siblings().removeClass("layui-nav-itemed");
            })


            //刷新后还原打开的窗口
            if(cacheStr == "true") {
                if (window.sessionStorage.getItem("menu") != null) {
                    menu = JSON.parse(window.sessionStorage.getItem("menu"));
                    curmenu = window.sessionStorage.getItem("curmenu");
                    var openTitle = '';
                    for (var i = 0; i < menu.length; i++) {
                        openTitle = '';
                        if (menu[i].icon) {
                            if (menu[i].icon.split("-")[0] == 'icon') {
                                openTitle += '<i class="seraph ' + menu[i].icon + '"></i>';
                            } else {
                                openTitle += '<i class="layui-icon">' + menu[i].icon + '</i>';
                            }
                        }
                        openTitle += '<cite>' + menu[i].title + '</cite>';
                        openTitle += '<i class="layui-icon layui-unselect layui-tab-close" data-id="' + menu[i].layId + '">&#x1006;</i>';
                        element.tabAdd("bodyTab", {
                            title: openTitle,
                            content: "<iframe src='" + menu[i].href + "' data-id='" + menu[i].layId + "'></frame>",
                            id: menu[i].layId
                        })
                        //定位到刷新前的窗口
                        if (curmenu != "undefined") {
                            if (curmenu == '' || curmenu == "null") {  //定位到后台首页
                                element.tabChange("bodyTab", '');
                            } else if (JSON.parse(curmenu).title == menu[i].title) {  //定位到刷新前的页面
                                element.tabChange("bodyTab", menu[i].layId);
                            }
                        } else {
                            element.tabChange("bodyTab", menu[menu.length - 1].layId);
                        }
                    }
                    //渲染顶部窗口
                    tab.tabMove();
                }
            }else{
                window.sessionStorage.removeItem("menu");
                window.sessionStorage.removeItem("curmenu");
            }
        })

        //打开新窗口
        function addTab(_this){
            tab.tabAdd(_this);
        }


    </script>
</body>
</html>