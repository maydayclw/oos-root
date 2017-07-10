<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ include file="/WEB-INF/jsp/tag.jsp" %>
<html>
<head>
    <meta charset="utf-8">
    <title>OOS海淘拼团-资讯</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <link rel="shortcut icon" type="image/x-icon" href="${basePath}/images/logo.jpg" media="screen"/>
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link href="${basePath}/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="${basePath}/css/common.css" rel="stylesheet"/>
    <link href="${basePath}/css/information.css" rel="stylesheet"/>
</head>

<body style="background-color: #eee;">
<%--Header --start --%>
<jsp:include page="top.jsp"></jsp:include>
<%--Header --end --%>
<div class="jumbotron" style="background: url('${basePath}/images/bg.jpg')">
    <div class="container" >
        <hgroup>
            <h1>海淘资讯</h1>
            <h4>海淘拼团的最新动态、资源等...</h4>
        </hgroup>
    </div>
</div>

<div id="information">
    <div class="container">
        <div class="row">
            <div class="col-md-8 info-left">
                <div class="container-fluid" style="padding:0;">
                    <c:forEach items="${informationList}" var="information">
                        <div class="row info-content">
                            <a href="${information.url}" target="_blank">
                                <div class="col-md-5 col-sm-5 col-xs-5">
                                    <img src="${information.pic}" class="img-responsive" alt="">
                                </div>
                                <div class="col-md-7 col-sm-7 col-xs-7">
                                    <h4>${information.title}</h4>
                                    <p class="hidden-xs">${information.subTitle}</p>
                                    <p><fmt:formatDate value="${information.updated}" pattern="yyyy-MM-dd"/></p>
                                </div>
                            </a>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <div class="col-md-4 info-right hidden-xs hidden-sm">
                <blockquote>
                    <h2>热门资讯</h2>
                </blockquote>
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-5 col-sm-5 col-xs-5" style="margin:12px 0;padding:0;">
                            <img src="img/info3.jpg" class="img-responsive" alt="">
                        </div>
                        <div class="col-md-7 col-sm-7 col-xs-7" style="padding-right:0">
                            <h4>六家互联网公司发声明 抵制流量劫持等违法行为</h4>
                            <p>admin 15 / 10 / 11</p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-5 col-sm-5 col-xs-5" style="margin:12px 0;padding:0;">
                            <img src="img/info1.jpg" class="img-responsive" alt="">
                        </div>
                        <div class="col-md-7 col-sm-7 col-xs-7">
                            <h4>广电总局发布TVOS2.0 华为阿里参与研发</h4>
                            <p>admin 15 / 10 / 11</p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-5 col-sm-5 col-xs-5" style="margin:12px 0;padding:0;">
                            <img src="img/info2.jpg" class="img-responsive" alt="">
                        </div>
                        <div class="col-md-7 col-sm-7 col-xs-7">
                            <h4>苹果四寸手机为何要配置强大的A9处理器？</h4>
                            <p>admin 15 / 10 / 11</p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-5 col-sm-5 col-xs-5" style="margin:12px 0;padding:0;">
                            <img src="img/info3.jpg" class="img-responsive" alt="">
                        </div>
                        <div class="col-md-7 col-sm-7 col-xs-7" style="padding-right:0">
                            <h4>六家互联网公司发声明 抵制流量劫持等违法行为</h4>
                            <p>admin 15 / 10 / 11</p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-5 col-sm-5 col-xs-5" style="margin:12px 0;padding:0;">
                            <img src="img/info1.jpg" class="img-responsive" alt="">
                        </div>
                        <div class="col-md-7 col-sm-7 col-xs-7">
                            <h4>广电总局发布TVOS2.0 华为阿里参与研发</h4>
                            <p>admin 15 / 10 / 11</p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-5 col-sm-5 col-xs-5" style="margin:12px 0;padding:0;">
                            <img src="img/info2.jpg" class="img-responsive" alt="">
                        </div>
                        <div class="col-md-7 col-sm-7 col-xs-7">
                            <h4>苹果四寸手机为何要配置强大的A9处理器？</h4>
                            <p>admin 15 / 10 / 11</p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-5 col-sm-5 col-xs-5" style="margin:12px 0;padding:0;">
                            <img src="img/info3.jpg" class="img-responsive" alt="">
                        </div>
                        <div class="col-md-7 col-sm-7 col-xs-7" style="padding-right:0">
                            <h4>六家互联网公司发声明 抵制流量劫持等违法行为</h4>
                            <p>admin 15 / 10 / 11</p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-5 col-sm-5 col-xs-5" style="margin:12px 0;padding:0;">
                            <img src="img/info1.jpg" class="img-responsive" alt="">
                        </div>
                        <div class="col-md-7 col-sm-7 col-xs-7">
                            <h4>广电总局发布TVOS2.0 华为阿里参与研发</h4>
                            <p>admin 15 / 10 / 11</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-12">
                <ul id='bp-element'></ul>
            </div>
        </div>
    </div>
</div>


<jsp:include page="footer.jsp"></jsp:include>
<script>var basePath = '${basePath}';</script>
<script src="${basePath}/plugins/jquery/jquery.min.js" type="text/javascript"></script>
<script src="${basePath}/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="${basePath}/plugins/bootstrap/js/bootstrap-paginator.min.js" type="text/javascript"></script>
<script type="text/javascript">
    $(function () {
        var element = $('#bp-element');
        options = {
            bootstrapMajorVersion:3, //对应的bootstrap版本
            currentPage: ${currentPage}, //当前页数，这里是用的EL表达式，获取从后台传过来的值
            numberOfPages: 5, //每页页数
            totalPages:${totalPages}, //总页数，这里是用的EL表达式，获取从后台传过来的值
            shouldShowPage:true,//是否显示该按钮
            itemTexts: function (type, page, current) {//设置显示的样式，默认是箭头
                switch (type) {
                    case "first":
                        return "首页";
                    case "prev":
                        return "上一页";
                    case "next":
                        return "下一页";
                    case "last":
                        return "末页";
                    case "page":
                        return page;
                }
            },
            //点击事件
            onPageClicked: function (event, originalEvent, type, page) {
                location.href = basePath+"/information.html?pageSize=8&pageNumber=" + page;
            }
        };
        element.bootstrapPaginator(options);
    });
</script>

</body>
</html>
