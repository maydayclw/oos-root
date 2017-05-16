<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/tag.jsp" %>
<html>
<head>
    <meta charset="utf-8">
    <title>规格参数模板列表</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">

    <link href="${basePath}/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="${basePath}/plugins/bootstrap/css/bootstrap-table.min.css" rel="stylesheet"/>
    <link href="${basePath}/plugins/zTree/css/zTreeStyle/zTreeStyle.css" rel="stylesheet"/>
</head>

<body style="padding: 5px;">
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <h4>规格参数模板列表</h4>
            <hr>
            <div id="toolbar" class="btn-group">
                <button id="btn_add" type="button" class="btn btn-default" data-toggle="modal"
                        data-target="#templet_add_modal">
                    <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
                </button>
                <button id="btn_edit" type="button" class="btn btn-default">
                    <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改
                </button>
                <button id="btn_delete" type="button" class="btn btn-default">
                    <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
                </button>
            </div>
            <table id="templet-table"></table>
        </div>
    </div>
</div>
<jsp:include page="param-templet-add.jsp"></jsp:include>

<div class="modal fade" id="user_edit_modal" tabindex="-1" role="dialog" aria-labelledby="editModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="editModalLabel">修改用户</h4>
            </div>
            <div class="modal-body" id="user_edit_form">
                <form class="form-horizontal" role="form">
                    <div class="form-group">
                        <label for="edit_userId" class="col-md-4 control-label">用户ID</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="edit_userId"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_email" class="col-md-4 control-label">邮箱</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="edit_email"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_nickname" class="col-md-4 control-label">用户名</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="edit_nickname"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-2 col-md-offset-4 radio">
                            <label class="checkbox-inline">
                                <input type="radio" name="radio" id="edit_unlock" value="0" checked>不锁定
                            </label>
                        </div>
                        <div class="col-md-2 radio">
                            <label class="checkbox-inline">
                                <input type="radio" name="radio" id="edit_lock" value="1">锁定
                            </label>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" id="user_form_clear">清空</button>
                <button type="button" class="btn btn-primary" id="user_form_edit">修改</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<div class="modal fade" id="user_allot_modal" tabindex="-1" role="dialog" aria-labelledby="allotModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="allotModalLabel">分配权限</h4>
            </div>
            <div class="modal-body" id="user_allot_form"><%--从数据库去除角色列表--%>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="user_form_allot">分配</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<script>var basePath = '${basePath}';</script>
<script src="${basePath}/plugins/jquery/jquery.min.js" type="text/javascript"></script>
<script src="${basePath}/plugins/bootstrap/js/bootstrap.js" type="text/javascript"></script>
<script src="${basePath}/plugins/bootstrap/js/bootstrap-table.min.js" type="text/javascript"></script>
<script src="${basePath}/plugins/bootstrap/js/bootstrap-table-zh-CN.min.js" type="text/javascript"></script>
<script src="${basePath}/plugins/zTree/js/jquery.ztree.core.js" type="text/javascript"></script>
<script src="${basePath}/plugins/layer/layer.js"></script>
<script>
    $(function () {
        //1.初始化Table
        var oTable = new TableInit();
        oTable.Init();
        //初始化类目数
        $.fn.zTree.init($("#cat_tree"), setting);
        $("#cat").click(function () {
            $("#cat_modal").modal("show");
        });
        //添加模板分组
        $(".addGroup").click(function () {
            var temple = $(".itemParamAddTemplate li").eq(0).clone();
            $(this).parent().parent().append(temple);
            temple.find(".addParam").click(function () {
                var li = $(".itemParamAddTemplate li").eq(2).clone();
                li.find(".delParam").click(function () {
                    $(this).parent().remove();
                });
                li.appendTo($(this).parentsUntil("ul").parent());
            });
            temple.find(".delParam").click(function () {
                $(this).parent().remove();
            });
        });
        //添加提交
        $("#templet_add_modal .submit").click(function () {
            var params = [];
            var groups = $("#templet_add_modal [name=group]");
            groups.each(function (i, e) {
                var p = $(e).parentsUntil("ul").parent().find("[name=param]");
                var _ps = [];
                p.each(function (_i, _e) {
                    var _val = $(_e).val();
                    if ($.trim(_val).length > 0) {
                        _ps.push(_val);
                    }
                });
                var _val = $(e).val();
                if ($.trim(_val).length > 0 && _ps.length > 0) {
                    params.push({
                        "group": _val,
                        "params": _ps
                    });
                }
            });
            var url = basePath + "/paramTemplet/save/" + $("#paramTempletAddForm [name=cid]").val();
            $.post(url, {"paramData": JSON.stringify(params)}, function (data) {
                if (data && data['success']) {
                    layer.alert("添加成功", {
                        skin: 'layui-layer-molv' //样式类名
                        , closeBtn: 0
                    }, function () {
                        window.location.href = basePath + '/paramTemplet/list';
                    });
                } else {
                    layer.msg(data['message']);
                }
            });
        });

        //初始化Button的点击事件
        var oButtonInit = new ButtonInit();
        oButtonInit.Init();
    });

    var TableInit = function () {
        var oTableInit = {};
        //初始化Table
        oTableInit.Init = function () {
            $('#templet-table').bootstrapTable({
                url: basePath + '/paramTemplet/data',         //请求后台的URL（*）
                method: 'get',                      //请求方式（*）
                toolbar: '#toolbar',                //工具按钮用哪个容器
                striped: true,                      //是否显示行间隔色
                cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
                pagination: true,                   //是否显示分页（*）
                sortable: false,                     //是否启用排序
                sortOrder: "asc",                   //排序方式
                queryParams: oTableInit.queryParams,//传递参数（*）
                sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
                pageNumber: 1,                       //初始化加载第一页，默认第一页
                pageSize: 6,                       //每页的记录行数（*）
                pageList: [6, 9, 20, 50],        //可供选择的每页的行数（*）
                search: true,                       //是否显示表格搜索，此搜索是客户端搜索，不会进服务端
                strictSearch: true,
                showColumns: true,                  //是否显示所有的列
                showRefresh: true,                  //是否显示刷新按钮
                minimumCountColumns: 2,             //最少允许的列数
                clickToSelect: true,                //是否启用点击选中行
                height: 410,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
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
                        title: 'ID'
                    },
                    {
                        field: 'itemCatId',
                        title: '商品类目ID'
                    },
                    {
                        field: 'paramData',
                        title: '规格(只显示分组名称)'
                    },
                    {
                        field: 'created',
                        title: '创建日期'
                    },
                    {
                        field: 'updated',
                        title: '更新日期'
                    }
                ]
            });
        };
        //得到查询的参数
        oTableInit.queryParams = function (params) {
            return {   //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
                pageNumber: params.offset / params.limit + 1,
                pageSize: params.limit
            };
        };
        return oTableInit;
    };


    var ButtonInit = function () {
        var oInit = {};
        var postdata = {};

        oInit.Init = function () {
            $("#btn_delete").click(function () {
                var arrselections = $("#templet-table").bootstrapTable('getSelections');
                if (arrselections.length <= 0) {
                    layer.msg('请选择有效数据');
                    return;
                }
                var delete_cofirm_index = layer.confirm('确认要删除选中的数据吗？', {
                    btn: ['删除', '取消']
                }, function () {
                    $.ajax({
                        url: basePath + '/paramTemplet/delete',
                        type: "POST",
                        dataType: "json",
                        contentType: "application/json",
                        data: JSON.stringify(arrselections),
                        success: function (result) {
                            layer.close(delete_cofirm_index);
                            if (result && result['success']) {
                                layer.alert("删除成功", {
                                    skin: 'layui-layer-molv' //样式类名
                                    , closeBtn: 0
                                }, function () {
                                    window.location.href = basePath + '/paramTemplet/list';
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

    function showSelectCat(treeNode) {
        var id = treeNode['id'];
        var name = treeNode['name'];
        //发送请求判断该类目是否有模板了
        $.post(basePath + '/paramTemplet/query',
            {
                itemCatId: id
            },
            function (result) {
                if (result && result['success']) {
                    //当这个类目有模板时，提示模板已经存在
                    $("#cid").val("");
                    $("#cat_view").text("");
                    $("#cat_modal").modal("hide");
                    layer.msg("该类目的规格参数模板已存在,请选择其它类目!");
                } else {
                    //否者显示选中的类目
                    $("#cid").val(id);
                    $("#cat_view").text(name);
                    $(".addGroupTr").show();
                    $("#cat_modal").modal("hide");
                }
            },
            'json'
        );
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
</body>
</html>
