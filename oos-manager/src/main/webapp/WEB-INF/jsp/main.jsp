<%--
  Created by IntelliJ IDEA.
  User: DAV5
  Date: 2017/4/16
  Time: 11:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/jsp/tag.jsp" %>
<html>

<head>
    <meta charset="utf-8">
    <title>OOS后台管理</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="shortcut icon" type="image/x-icon" href="${basePath}/images/logo.jpg" media="screen" />
    <link rel="stylesheet" href="${basePath}/plugins/layui/css/layui.css" media="all"/>
    <link rel="stylesheet" href="${basePath}/css/global.css" media="all">
    <link rel="stylesheet" href="${basePath}/plugins/font-awesome/css/font-awesome.min.css">

</head>

<body>
<div class="layui-layout layui-layout-admin" style="border-bottom: solid 5px #1aa094;">
    <div class="layui-header header header-demo">
        <div class="layui-main" style="margin: 0;">
            <div class="admin-login-box">
                <img class="logo" src="${basePath}/images/logo-header.png" width="80" height="48" alt="logo">
            </div>
            <ul class="layui-nav admin-header-item">
                <li class="layui-nav-item">
                    <a href="javascript:;" id="clearShiroCache">清除缓存</a>
                </li>
                <li class="layui-nav-item">
                    <a href="http://localhost:8082/oos/web/index.html" target="_blank">商品展示</a>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;" id="contract">联系管理员</a>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;" class="admin-header-user">
                        <img src="${basePath}/images/0.jpg"/>
                        <span>${activeUser.username}</span>
                    </a>
                    <span class="layui-nav-more" style="top:22px;"></span>
                    <dl class="layui-nav-child">
                        <dd id="info">
                            <a href="javascript:;"><i class="fa fa-user-circle" aria-hidden="true"></i> 个人信息</a>
                        </dd>
                        <dd>
                            <a href="javascript:;"><i class="fa fa-gear" aria-hidden="true"></i> 设置</a>
                        </dd>
                        <dd id="lock">
                            <a href="javascript:;">
                                <i class="fa fa-lock" aria-hidden="true"
                                   style="padding-right: 3px;padding-left: 1px;"></i> 锁屏 (Alt+L)
                            </a>
                        </dd>
                        <dd>
                            <a href="${basePath}/sys/logout"><i class="fa fa-sign-out" aria-hidden="true"></i> 注销</a>
                        </dd>
                    </dl>
                </li>
            </ul>
            <ul class="layui-nav admin-header-item-mobile">
                <li class="layui-nav-item">
                    <a href="login.html"><i class="fa fa-sign-out" aria-hidden="true"></i> 注销</a>
                </li>
            </ul>
        </div>
    </div>
    <div class="layui-side layui-bg-black" id="admin-side">
        <div class="layui-side-scroll" id="admin-navbar-side" lay-filter="side"></div>
    </div>
    <div class="layui-body" style="bottom: 0;border-left: solid 2px #1AA094;" id="admin-body">
        <div class="layui-tab admin-nav-card layui-tab-brief" lay-filter="admin-tab">
            <ul class="layui-tab-title">
                <li class="layui-this">
                    <i class="fa fa-dashboard" aria-hidden="true"></i>
                    <cite>控制面板</cite>
                </li>
            </ul>
            <div class="layui-tab-content" style="min-height: 150px; padding: 5px 0 0 0;">
                <div class="layui-tab-item layui-show">
                    <iframe src="${basePath}/controlpanel.jsp"></iframe>
                </div>
            </div>
        </div>
    </div>
    <div class="layui-footer footer footer-demo" id="admin-footer">
        <div class="layui-main">
            <p>2017 &copy;
                maydayclw@foxmail.com
            </p>
        </div>
    </div>
    <div class="site-tree-mobile layui-hide">
        <i class="layui-icon">&#xe602;</i>
    </div>
    <div class="site-mobile-shade"></div>

    <!--锁屏模板 start-->
    <script type="text/template" id="lock-temp">
        <div class="admin-header-lock" id="lock-box">
            <div class="admin-header-lock-img">
                <img src="${basePath}/images/0.jpg"/>
            </div>
            <div class="admin-header-lock-name" id="lockUserName">${activeUser.username}</div>
            <input type="text" class="admin-header-lock-input" value="输入密码解锁.." name="lockPwd" id="lockPwd"/>
            <button class="layui-btn layui-btn-small" id="unlock">解锁</button>
        </div>
    </script>
    <!--锁屏模板 end -->

    <script>var basePath = '${basePath}';</script>
    <script type="text/javascript" src="${basePath}/plugins/layui/layui.js"></script>
    <script type="text/javascript" src="${basePath}/datas/nav.js"></script>
    <script src="${basePath}/js/index.js"></script>
    <script>
        layui.use('layer', function () {
            var $ = layui.jquery,
                layer = layui.layer;
            $("#clearShiroCache").click(function () {
                var clearIndex = layer.load(1, {
                    shade: [0.1, '#fff'] //0.1透明度的白色背景
                });
                $.get(basePath + '/sys/clearShiroCache', {}, function (result) {
                    layer.close(clearIndex);
                    layer.msg(result['message']);
                });
            });
            $("#contract").click(function () {
                layer.open({
                    type: 1
                    ,title: false //不显示标题栏
                    ,closeBtn: true
                    ,area: '400px;'
                    ,shade: 0.5
                    ,id: 'LAY_ADMIN' //设定一个id，防止重复弹出
                    ,resize: false
                    ,btnAlign: 'c'
                    ,moveType: 1 //拖拽模式，0或者1
                    ,content: '<div style="padding: 50px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;">' +
                    '<h5>E-Mail:maydayclw@foxmail.com</h5><br>' +
                    '<h5>微信:maydayclw</h5><br>' +
                    '<h5>GitHub:https://github.com/maydayclw</h5><br>' +
                    '' +
                    '</div>'
                });
            });
        });

    </script>
</div>
</body>

</html>
