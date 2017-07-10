<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ include file="/WEB-INF/jsp/tag.jsp" %>
<html>
<head>
    <meta charset="utf-8">
    <title>OOS分类</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <link rel="shortcut icon" type="image/x-icon" href="${basePath}/images/logo.jpg" media="screen"/>
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link href="${basePath}/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="${basePath}/css/cat.css" rel="stylesheet"/>
    <link href="${basePath}/css/common.css" rel="stylesheet"/>
</head>
<body style="background-color: #eee;">
<%--Header --start --%>
<jsp:include page="top.jsp"></jsp:include>
<%--Header --end --%>
<div class="container-fluid" style="margin-top: 100px;">
    <c:forEach items="${catList}" var="cat" varStatus="loop">
        <div class="row">
            <div class="col-md-3">
                <i class="color-mark"></i>
                <div class="floor-name">${cat.patentCat}</div>
            </div>
            <div class="col-md-9">
                <div class="hot-word-con">
                    <c:forEach items="${cat.hasLeaf}" var="two">
                        <a class="hot-word" href="#">${two.name}</a>
                    </c:forEach>
                </div>
            </div>
            <div class="col-md-12" style="margin-top: 10px;background-color: white;">
                <div class="col-md-2" style="padding: 0;">
                    <a class="big-banner-con" href="${catAdList[loop.count-1].url}" target="_blank">
                        <img src="${catAdList[loop.count-1].pic}"
                             style=" width: 219.83px;height: 440px;"/>
                    </a>
                </div>
                <div class="col-md-10">
                    <div class="row">
                        <c:forEach items="${cat.isLeaf}" var="leaf">
                            <div class="col-md-3" style="padding: 0;">
                                <a href="${basePath}/item/${leaf.id}.html" class="thumbnail" style="height: 220px;margin-bottom: 0;">
                                    <div class="caption">
                                        <h3>${leaf.name}</h3>
                                    </div>
                                    <img src="${leaf.pic}" alt="${leaf.name}">
                                </a>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
            <div class="col-md-12" style="height: 50px;"></div>
        </div>
    </c:forEach>
</div>
<jsp:include page="footer.jsp"></jsp:include>
<script>var basePath = '${basePath}';</script>
<script src="${basePath}/plugins/jquery/jquery.min.js" type="text/javascript"></script>
<script src="${basePath}/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="${basePath}/plugins/layer/layer.js"></script>
<script type="text/javascript">
    $(function () {
    });
</script>

</body>
</html>

