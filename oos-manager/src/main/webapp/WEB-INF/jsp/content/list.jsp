<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/jsp/tag.jsp" %>
<html>
<head>
    <meta charset="utf-8">
    <title>内容列表</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">

    <link href="${basePath}/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="${basePath}/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet"/>
    <link href="${basePath}/plugins/zTree/css/zTreeStyle/zTreeStyle.css" rel="stylesheet"/>
    <link href="${basePath}/plugins/kindeditor/themes/default/default.css" rel="stylesheet">
</head>

<body style="padding: 5px;">
<div class="container-fluid" style="padding: 0 10px;">
    <div class="row">
        <div class="col-md-2">
            <ul class="ztree" style="padding: 11px 0;" id="content_cat_tree"></ul>
            <input type="hidden" id="selectedCat" value=""/>
        </div>
        <div class="col-md-10">
            <div id="toolbar" class="btn-group">
                <button id="btn_add" type="button" class="btn btn-default">
                    <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
                </button>
                <button id="btn_edit" type="button" class="btn btn-default">
                    <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改
                </button>
                <button id="btn_delete" type="button" class="btn btn-default">
                    <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
                </button>
            </div>
            <table id="content-table"></table>
        </div>
    </div>
</div>
<jsp:include page="content-add.jsp"></jsp:include>
<jsp:include page="content-edit.jsp"></jsp:include>
<script>var basePath = '${basePath}';</script>
<script src="${basePath}/plugins/jquery/jquery.min.js" type="text/javascript"></script>
<script src="${basePath}/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="${basePath}/plugins/bootstrap-table/bootstrap-table.min.js" type="text/javascript"></script>
<script src="${basePath}/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js" type="text/javascript"></script>
<script src="${basePath}/plugins/zTree/js/jquery.ztree.core.js" type="text/javascript"></script>
<script src="${basePath}/plugins/kindeditor/kindeditor-all-min.js" type="text/javascript"></script>
<script src="${basePath}/plugins/kindeditor/lang/zh_CN.js" type="text/javascript"></script>
<script src="${basePath}/plugins/layer/layer.js"></script>
<script>
    var CT = {
        kingEditorParams: {
            //指定上传文件参数名称
            filePostName: "uploadFile",
            //指定上传文件请求的url。
            uploadJson: basePath + '/pic/upload',
            //上传类型，分别为image、flash、media、file
            dir: "image"
        },
        createEditor: function (select) {
            return KindEditor.create(select, CT.kingEditorParams);
        },
        /**
         * 初始化单图片上传组件 <br/>
         * 选择器为：.onePicUpload <br/>
         * 上传完成后会设置input内容以及在input后面追加<img>
         */
        initOnePicUpload : function(){
            $(".onePicUpload").click(function(){
                var _self = $(this);
                KindEditor.editor(CT.kingEditorParams).loadPlugin('image', function() {
                    this.plugin.imageDialog({
                        showRemote : false,
                        clickFn : function(url, title, width, height, border, align) {
                            var input = _self.siblings("input");
                            input.parent().find("img").remove();
                            input.val(url);
                            input.after("<a href='"+url+"' target='_blank'><img src='"+url+"' width='80' height='50'/></a>");
                            this.hideDialog();
                        }
                    });
                });
            });
        }
    };
    var setting = {
        async: {
            enable: true,
            autoParam: ["id"],
            type: "get",
            url: basePath + "/content/cat/list/tree"
        },
        callback: {
            onClick: function (event, treeId, treeNode, clickFlag) {
                if (!treeNode['isParent']) {
                    $("#selectedCat").val(treeNode.id);
                    $("#content-table").bootstrapTable("refresh");
                }
            }
        }
    };
    var contentAddEditor;
    //重置
    function clearForm() {
        $('#contentAddForm')[0].reset();
        contentAddEditor.html('');
        $('#contentAddForm img').remove();
    }
    //重置修改表单
    function clearEditForm() {
        $('#contentEditForm')[0].reset();
        contentAddEditor.html('');
        $('#contentEditForm img').remove();
    }
    //添加
    function submitForm() {
        //同步文本框中的商品描述
        contentAddEditor.sync();
        //$("#item-form").serialize()将表单序列号为key-value形式的字符串
        $.post(basePath + "/content/save", $("#contentAddForm").serialize(), function (result) {
            if (result && result['success']) {
                layer.alert(result['message'], {
                    skin: 'layui-layer-molv' //样式类名
                    , closeBtn: 0
                }, function (index) {
                    $("#content-table").bootstrapTable('refresh');
                    $("#content_add_modal").modal("hide");
                    layer.close(index);
                    clearForm();
                });
            } else {
                layer.msg(result['message']);
            }
        });
    }
    //修改
    function submitEditForm() {
        //同步文本框中的商品描述
        contentAddEditor.sync();
        $("#edit_id").attr("disabled", false);
        //$("#item-form").serialize()将表单序列号为key-value形式的字符串
        $.post(basePath + "/content/update", $("#contentEditForm").serialize(), function (result) {
            if (result && result['success']) {
                layer.alert(result['message'], {
                    skin: 'layui-layer-molv' //样式类名
                    , closeBtn: 0
                }, function (index) {
                    $("#content-table").bootstrapTable('refresh');
                    $("#content_edit_modal").modal("hide");
                    layer.close(index);
                    clearEditForm();
                });
            } else {
                layer.msg(result['message']);
            }
        });
    }

    $(function () {
        //初始化类目数
        $.fn.zTree.init($("#content_cat_tree"), setting);
        //1.初始化Table
        var oTable = new TableInit();
        oTable.Init();
        //2.初始化Button的点击事件
        var oButtonInit = new ButtonInit();
        oButtonInit.Init();
        CT.initOnePicUpload();
    });
    var TableInit = function () {
        var oTableInit = {};
        //初始化Table
        oTableInit.Init = function () {
            $('#content-table').bootstrapTable({
                url: basePath + '/content/data',         //请求后台的URL（*）
                method: 'post',                      //请求方式（*）
                contentType: "application/x-www-form-urlencoded; charset=UTF-8",//解决post无法传参问题
                toolbar: '#toolbar',                //工具按钮用哪个容器
                striped: true,                      //是否显示行间隔色
                cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
                pagination: true,                   //是否显示分页（*）
                sortable: true, //是否启用排序
                sortName: 'id',//初始化的时候排序的字段
                sortOrder: "asc", //排序方式
                queryParams: oTableInit.queryParams,//传递参数（*）
                sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
                pageNumber: 1,                       //初始化加载第一页，默认第一页
                pageSize: 6,                       //每页的记录行数（*）
                pageList: [6, 9, 20, 50],        //可供选择的每页的行数（*）
                strictSearch: true,
                showColumns: true,                  //是否显示所有的列
                showRefresh: true,                  //是否显示刷新按钮
                minimumCountColumns: 2,             //最少允许的列数
                clickToSelect: true,                //是否启用点击选中行
                height: 450,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
                uniqueId: "id",                     //每一行的唯一标识，一般为主键列
                showToggle: true,                    //是否显示详细视图和列表视图的切换按钮
                cardView: false,                    //是否显示详细视图
                detailView: false,                   //是否显示父子表
                columns: [
                    {
                        checkbox: true
                    },
                    {
                        field: 'id',
                        title: '内容ID'
                    },
                    {
                        field: 'title',
                        title: '标题'
                    },
                    {
                        field: 'subTitle',
                        title: '子标题'
                    },
                    {
                        field: 'titleDesc',
                        title: '标题描述'
                    },
                    {
                        field: 'url',
                        title: '链接'
                    },
                    {
                        field: 'pic',
                        title: '图片路径',
                    },
                    {
                        field: 'content',
                        title: '内容',
                        visible: false
                    }
                ]
            });
        };

        //得到查询的参数
        oTableInit.queryParams = function (params) {
            return {
                pageNumber: params.offset / params.limit + 1,
                pageSize: params.limit,
                catId: $("#selectedCat").val()
            };
        };
        return oTableInit;
    };


    var ButtonInit = function () {
        var oInit = {};
        oInit.Init = function () {
            //删除
            $("#btn_delete").click(function () {
                var arrselections = $("#content-table").bootstrapTable('getSelections');
                if (arrselections.length <= 0) {
                    layer.msg('请选择有效数据');
                    return;
                }
                var delete_cofirm_index = layer.confirm('确认要删除选中的数据吗？', {
                    btn: ['删除', '取消']
                }, function () {
                    $.ajax({
                        url: basePath + '/content/delete',
                        type: "POST",
                        dataType: "json",
                        contentType: "application/json",
                        data: JSON.stringify(arrselections),
                        success: function (result) {
                            layer.close(delete_cofirm_index);
                            if (result && result['success']) {
                                layer.alert(result['message'], {
                                    skin: 'layui-layer-molv'
                                    , closeBtn: 0
                                }, function (index) {
                                    $("#content-table").bootstrapTable('refresh');
                                    layer.close(index);
                                });
                            } else {
                                layer.msg(result['message']);
                            }
                        }
                    });
                });
            });
            //打开添加modal
            $("#btn_add").click(function () {
                //创建富文本编辑器
                contentAddEditor = CT.createEditor("#contentAddForm [name=content]");
                var selectedCatVal = $("#selectedCat").val();
                if(selectedCatVal == ""){
                    layer.msg("请选择内容类目进行添加");
                    return;
                }
                $("#contentAddForm [name=categoryId]").val(selectedCatVal);
                $("#content_add_modal").modal("show");
            });
            //修改
            $("#btn_edit").click(function () {
                var arrselections = $("#content-table").bootstrapTable('getSelections');
                if (arrselections.length > 1) {
                    layer.msg('只能选择一行进行编辑');
                    return;
                }
                if (arrselections.length <= 0) {
                    layer.msg('请选择有效数据');
                    return;
                }
                var selectedCatVal = $("#selectedCat").val();
                $("#contentEditForm [name=categoryId]").val(selectedCatVal);
                $("#edit_id").val(arrselections[0].id).attr("disabled", true);
                $("#edit_title").val(arrselections[0].title);
                $("#edit_subTitle").val(arrselections[0].subTitle);
                $("#edit_titleDesc").val(arrselections[0].titleDesc);
                $("#edit_url").val(arrselections[0].url);
                $("#edit_content").val(arrselections[0].content);
                //初始化富文本编辑器
                contentAddEditor = CT.createEditor("#contentEditForm [name=content]");
                $("#content_edit_modal").modal("show");
            });
        };
        return oInit;
    };
</script>
</body>
</html>
