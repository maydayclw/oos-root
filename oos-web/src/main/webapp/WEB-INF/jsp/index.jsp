<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ include file="/WEB-INF/jsp/tag.jsp" %>
<html>
<head>
    <meta charset="utf-8">
    <title>OOS海淘拼团</title>
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
<div id="itemCarousel" class="carousel slide">
    <ol class="carousel-indicators" id="carousel-indicators">
    </ol>
    <div class="carousel-inner" id="carousel-inner">
    </div>
    <a href="#itemCarousel" data-slide="prev" class="carousel-control left">
        <span class="glyphicon glyphicon-chevron-left"></span>
    </a>
    <a href="#itemCarousel" data-slide="next" class="carousel-control right">
        <span class="glyphicon glyphicon-chevron-right"></span>
    </a>
</div>
<div class="container">
    <p class="hot_title">
        <img src="${basePath}/images/hot_title.png">
    </p>
    <div class="row">
        <c:forEach items="${hotAd}" var="ad">
            <div class="col-sm-6 col-md-3">
                <a href="${ad.url}" class="thumbnail" target="_blank">
                    <img src="${ad.pic}"
                         alt="${ad.subTitle}">
                </a>
            </div>
        </c:forEach>
    </div>
    <p class="hot_title">
        <img src="${basePath}/images/global_price.png">
    </p>
    <div class="row">
        <c:forEach items="${globalPrice}" var="global">
            <div class="col-sm-6 col-md-3" style="height: 361px;padding: 0;">
                <a href="${global.url}" class="thumbnail" target="_blank">
                    <img src="${global.pic}" alt="${global.title}" style="height: 253px;">
                    <div class="caption" style="height: 98px;">
                        <p>${global.title}</p>
                        <p style="color: red;">${global.subTitle}</p>
                    </div>
                </a>
            </div>
        </c:forEach>
    </div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
<script>var basePath = '${basePath}';</script>
<script src="${basePath}/plugins/jquery/jquery.min.js" type="text/javascript"></script>
<script src="${basePath}/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="${basePath}/plugins/layer/layer.js"></script>
<script type="text/javascript">
    $(function () {
        var carouselAds = ${carouselAd};
        $.each(carouselAds, function (i, carouselAd) {
            var div1, div2;
            if (i == 0) {
                div1 = '<li data-target="#itemCarousel" data-slide-to="0" class="active" ></li>';
                div2 = '<div class="item active" style="background-color: ' + carouselAd.backgroundColor + '">' +
                    '<a href="' + carouselAd.href + '" target="_blank">' +
                    '<img src="' + carouselAd.src + '" alt="' + carouselAd.alt + '">' +
                    '</a>' +
                    '</div>';
            } else {
                div1 = '<li data-target="#itemCarousel" data-slide-to="' + (i) + '" ></li>';
                div2 = '<div class="item" style="background-color: ' + carouselAd.backgroundColor + '">' +
                    '<a href="' + carouselAd.href + '" target="_blank">' +
                    '<img src="' + carouselAd.src + '" alt="' + carouselAd.alt + '">' +
                    '</a>' +
                    '</div>';
            }
            $("#carousel-indicators").append(div1);
            $("#carousel-inner").append(div2);
        });
        $("#itemCarousel").carousel({
            interval: 4000
        });
    });
</script>

</body>
</html>
