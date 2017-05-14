<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/tag.jsp" %>
<html>
<head>
    <meta charset="utf-8">
    <title>商品表单</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link href="${basePath}/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="${basePath}/plugins/zTree/css/zTreeStyle/zTreeStyle.css" rel="stylesheet"/>
    <link href="${basePath}/plugins/kindeditor/themes/default/default.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <form class="form-horizontal" id="item-form" role="form">
        <div class="form-group">
            <label for="cat" class="col-sm-1 control-label">类目</label>
            <div class="col-sm-2">
                <input type="button" id="cat" class="btn btn-default btn-sm form-control" value="选择类目">
            </div>
            <div class="col-sm-4">
                <label id="cat_view" class="text-success control-label"></label>
            </div>
            <div class="col-sm-2">
                <input type="hidden" id="cid" name="cid">
            </div>
        </div>
        <div class="form-group">
            <label for="title" class="col-sm-1 control-label">标题</label>
            <div class="col-sm-8">
                <input class="form-control" id="title" type="text" placeholder="该输入商品标题">
            </div>
        </div>
        <div class="form-group">
            <label for="sell_point" class="col-sm-1 control-label">卖点</label>
            <div class="col-sm-10">
                <input class="form-control" id="sell_point" type="text" placeholder="该输入商品卖点">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-1 control-label" for="price">价格</label>
            <div class="col-sm-2 input-group">
                <div class="input-group-addon">￥</div>
                <input type="number" class="form-control" id="price">
            </div>
            <label class="col-sm-2 control-label" for="group_price">商品拼团价格</label>
            <div class="col-sm-2 input-group">
                <div class="input-group-addon">￥</div>
                <input type="number" class="form-control" id="group_price">
            </div>
            <label class="col-sm-2 control-label" for="low_price">商品超低价格</label>
            <div class="col-sm-2 input-group">
                <div class="input-group-addon">￥</div>
                <input type="number" class="form-control" id="low_price">
            </div>
        </div>
        <div class="form-group">
            <label for="num" class="col-sm-1 control-label">库存</label>
            <div class="col-sm-2">
                <input class="form-control" id="num" type="number">
            </div>
            <label for="spec" class="col-sm-2 control-label">商品规格</label>
            <div class="col-sm-6">
                <input class="form-control" id="spec" type="text" placeholder="该输入商品规格">
            </div>
        </div>
        <div class="form-group">
            <label for="notice" class="col-sm-1 control-label">预告</label>
            <div class="col-sm-8">
                <textarea class="form-control" id="notice" rows="3" placeholder="该输入商品预告"></textarea>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-1 control-label">图片</label>
            <div class="col-sm-8">
                <a href="javascript:void(0)" class="btn btn-default picFileUpload">上传图片</a>
                <input type="hidden" name="image"/>
            </div>
        </div>
        <div class="form-group">
            <label for="desc" class="col-sm-1 control-label">详情</label>
            <div class="col-sm-10">
                <textarea style="width:778px;visibility:hidden;" id="desc" name="desc"></textarea>
            </div>
        </div>
    </form>
</div>
<div class="modal fade" id="cat_modal" tabindex="-1" role="dialog" aria-labelledby="catModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="catModalLabel">选择类目</h4>
            </div>
            <div class="modal-body">
                <ul class="ztree" id="cat_tree"></ul>
            </div>
            <div class="modal-footer">
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<script>var basePath = '${basePath}';</script>
<script src="${basePath}/plugins/jquery/jquery.min.js" type="text/javascript"></script>
<script src="${basePath}/plugins/bootstrap/js/bootstrap.js" type="text/javascript"></script>
<script src="${basePath}/plugins/zTree/js/jquery.ztree.core.js" type="text/javascript"></script>
<script src="${basePath}/plugins/kindeditor/kindeditor-all-min.js" type="text/javascript"></script>
<script src="${basePath}/plugins/kindeditor/lang/zh_CN.js" type="text/javascript"></script>
<script type="text/javascript">
    var OOS = {
        kingEditorParams: {
            //指定上传文件参数名称
            filePostName: "uploadFile",
            //指定上传文件请求的url。
            uploadJson: basePath + '/pic/upload',
            //上传类型，分别为image、flash、media、file
            dir: "image"
        },
        createEditor : function(select){
            return KindEditor.create(select, OOS.kingEditorParams);
        },
        init: function (data) {
            this.initPicUpload(data);
        },
        initPicUpload: function (data) {
            $(".picFileUpload").each(function (i, e) {
                var _ele = $(e);
                _ele.siblings("div.pics").remove();
                _ele.after('\
    			<div class="pics">\
        			<ul class="list-inline"></ul>\
        		</div>');
                // 回显图片
                if (data && data.pics) {
                    var imgs = data.pics.split(",");
                    for (var i in imgs) {
                        if ($.trim(imgs[i]).length > 0) {
                            _ele.siblings(".pics").find("ul").append("<li><a href='" + imgs[i] + "' target='_blank'><img src='" + imgs[i] + "' width='80' height='50' /></a></li>");
                        }
                    }
                }
                //给“上传图片按钮”绑定click事件
                $(e).click(function () {
                    var form = $(this).parentsUntil("form").parent("form");
                    //打开图片上传窗口
                    KindEditor.editor(OOS.kingEditorParams).loadPlugin('multiimage', function () {
                        var editor = this;
                        editor.plugin.multiImageDialog({
                            clickFn: function (urlList) {
                                var imgArray = [];
                                KindEditor.each(urlList, function (i, data) {
                                    imgArray.push(data.url);
                                    form.find(".pics ul").append("<li><a href='" + data.url + "' target='_blank'><img src='" + data.url + "' width='80' height='50' /></a></li>");
                                });
                                form.find("[name=image]").val(imgArray.join(","));
                                editor.hideDialog();
                            }
                        });
                    });
                });
            });
        }
    };
    function showSelectCat(treeNode) {
        var id = treeNode['id'];
        var name = treeNode['name'];
        $("#cid").val(id);
        $("#cat_view").text(name);
        $("#cat_modal").modal("hide");
    }
    var setting = {
        async: {
            enable: true,
            autoParam: ["id"],
            type: "get",
            url: basePath + "/itemCat/list"
        },
        callback: {
            onClick: function (event, treeId, treeNode, clickFlag) {
                if (!treeNode['isParent']) {
                    showSelectCat(treeNode);
                }
            }
        }
    };
</script>
<script type="text/javascript">
    $(function () {
        //初始化类目数
        $.fn.zTree.init($("#cat_tree"), setting);
        //创建富文本编辑器
        itemAddEditor = OOS.createEditor("#item-form [name=desc]");
        //初始化图片上传组件
        OOS.init({
            fun: function (node) {
                //OOS.changeItemParam(node, "itemAddForm");
            }
        });
        $("#cat").click(function () {
            $("#cat_modal").modal("show");
        });
    });
</script>
</body>
</html>
