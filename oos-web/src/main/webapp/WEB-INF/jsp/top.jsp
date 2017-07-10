<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/tag.jsp" %>
<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container">
        <a href="#" class="navbar-brand" style="padding: 0;"><img width="56" height="40" src="${basePath}/images/logo-header.png"
                                                                  style="margin-top: 5px;" alt="OOS"></a>
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbar-collapse">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="${basePath}/index.html"><span class="glyphicon glyphicon-home"></span> 首页</a></li>
                <li><a href="#"><span class="glyphicon glyphicon-heart-empty"></span> 格子铺</a></li>
                <li><a href="${basePath}/cat.html"><span class="glyphicon glyphicon-tree-conifer"></span> 分类</a></li>
                <li><a href="${basePath}/information.html"><span class="glyphicon glyphicon-list"></span> 海淘资讯</a></li>
                <li><a href="#"><span class="glyphicon glyphicon-info-sign"></span> 关于</a></li>
            </ul>
        </div>
    </div>
</nav>