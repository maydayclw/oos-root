<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/jsp/tag.jsp" %>
<html>
<head>
    <meta charset="utf-8">
    <title>内容分类列表</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">

    <link href="${basePath}/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="${basePath}/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet"/>
</head>

<body style="padding: 5px;">
<div class="container-fluid" style="padding: 0 10px;">
    <div class="row">
        <div class="col-md-12">
            <h4>内容分类列表</h4>
            <hr style="margin:0;">
            <div id="toolbar" class="btn-group">
                <button id="btn_add" type="button" class="btn btn-default">
                    <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
                </button>
                <button id="btn_delete" type="button" class="btn btn-default">
                    <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
                </button>
            </div>
            <table id="content-cat-table"></table>
        </div>
    </div>
</div>
<jsp:include page="cat-add.jsp"></jsp:include>
<script>var basePath = '${basePath}';</script>
<script src="${basePath}/plugins/jquery/jquery.min.js" type="text/javascript"></script>
<script src="${basePath}/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="${basePath}/plugins/bootstrap-table/bootstrap-table.min.js" type="text/javascript"></script>
<script src="${basePath}/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js" type="text/javascript"></script>
<script src="${basePath}/plugins/layer/layer.js"></script>
<script>
    $(function () {
        //1.初始化Table
        var oTable = new TableInit();
        oTable.Init();
        //2.初始化Button的点击事件
        var oButtonInit = new ButtonInit();
        oButtonInit.Init();
    });
    var TableInit = function () {
        var oTableInit = {};
        //初始化Table
        oTableInit.Init = function () {
            $('#content-cat-table').bootstrapTable({
                url: basePath + '/content/cat/data',         //请求后台的URL（*）
                method: 'post',                      //请求方式（*）
                contentType: "application/x-www-form-urlencoded; charset=UTF-8",//解决post无法传参问题
                toolbar: '#toolbar',                //工具按钮用哪个容器
                striped: true,                      //是否显示行间隔色
                cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
                pagination: true,                   //是否显示分页（*）
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
                height: 400,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
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
                        title: 'ID',
                    },
                    {
                        field: 'parentId',
                        title: '父ID',
                    },
                    {
                        field: 'name',
                        title: '分类名称',
                    },
                    {
                        field: 'status',
                        title: '状态',
                    },
                    {
                        field: 'isParent',
                        title: '是否是父类目',
                    }
                ],
            });
        };

        //得到查询的参数
        oTableInit.queryParams = function (params) {
            return {
                pageNumber: params.offset / params.limit + 1,
                pageSize: params.limit,
            };
        };
        return oTableInit;
    };


    var ButtonInit = function () {
        var oInit = {};
        oInit.Init = function () {
            //打开添加modal
            $("#btn_add").click(function () {
                $("#content_cat option").remove();
                if ($("#content_cat option").length == 0) {
                    $.post(basePath + '/content/cat/parent',
                        {},
                        function (result) {
                            if (result && result['success']) {
                                $("#content_cat").append("<option value='0'>无父类目</option>");
                                var datas = result['data'];
                                $.each(datas, function (i, data) {
                                    var optionHtml = "<option value='" + data.id + "'>" + data.name + "</option>";
                                    $("#content_cat").append(optionHtml);
                                });
                            }
                        },
                        'json'
                    );
                }
                $("#content_cat_add_modal").modal("show");
            });
            //添加
            $("#content_cat_add").click(function () {
                if ($("#content_cat_name").val() == "") {
                    layer.msg("分类名称不能为空");
                    return;
                }
                $.post(basePath + '/content/cat/add', $("#contentCatAddForm").serialize(),
                    function (result) {
                        if (result && result['success']) {
                            layer.alert(result['message'], {
                                skin: 'layui-layer-molv'
                                , closeBtn: 0
                            }, function (index) {
                                $("#content-cat-table").bootstrapTable('refresh');
                                $("#content_cat_add_modal").modal("hide");
                                layer.close(index);
                            });
                        } else {
                            layer.msg(result['message']);
                        }
                    }
                );
            });
            //删除
            $("#btn_delete").click(function () {
                var arrselections = $("#content-cat-table").bootstrapTable('getSelections');
                if (arrselections.length <= 0) {
                    layer.msg('请选择有效数据');
                    return;
                }
                var delete_cofirm_index = layer.confirm('确认要删除选中的数据吗？', {
                    btn: ['删除', '取消']
                }, function () {
                    $.ajax({
                        url: basePath + '/content/cat/delete',
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
                                    $("#content-cat-table").bootstrapTable('refresh');
                                    layer.close(index);
                                });
                            } else {
                                layer.msg(result['message']);
                            }
                        }
                    });
                });
            });
        };
        return oInit;
    };
</script>
</body>
</html>
