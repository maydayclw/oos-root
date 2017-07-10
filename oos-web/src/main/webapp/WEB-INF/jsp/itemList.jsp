<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ include file="/WEB-INF/jsp/tag.jsp" %>
<html>
<head>
    <meta charset="utf-8">
    <title>OOS海淘拼团-商品列表</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <link rel="shortcut icon" type="image/x-icon" href="${basePath}/images/logo.jpg" media="screen"/>
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link href="${basePath}/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="${basePath}/css/carousel.css" rel="stylesheet"/>
    <link href="${basePath}/css/index.css" rel="stylesheet"/>
    <link href="${basePath}/css/common.css" rel="stylesheet"/>
</head>

<body style="background-color: #eee;">
<%--Header --start --%>
<jsp:include page="top.jsp"></jsp:include>
<%--Header --end --%>
<div style="height: 100px;"></div>
<div class="container">
    <input type="hidden" id="catId" value="${catId}"/>
    <div class="row">
        <c:forEach items="${itemList}" var="item">
            <div class="col-sm-6 col-md-3" style="height: 361px;padding: 0;">
                <a href="#" class="thumbnail" target="_blank">
                    <img src="${item.image}" alt="${item.title}" style="height: 253px;">
                    <div class="caption" style="height: 98px;">
                        <p>${item.title}</p>
                        <p style="color: red;">价格:${item.price}</p>
                        <p style="color: red;">团购价格:${item.groupPrice}</p>
                    </div>
                </a>
            </div>
        </c:forEach>
        <div class="col-md-12">
            <ul id='bp-element-item'></ul>
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
        var element = $('#bp-element-item');
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
                location.href = basePath+"/item/${catId}.html?pageSize=20&pageNumber=" + page;
            }
        };
        element.bootstrapPaginator(options);
    });
</script>

</body>
</html>
