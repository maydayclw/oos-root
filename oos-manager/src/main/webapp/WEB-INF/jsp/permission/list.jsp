<%--
  Created by IntelliJ IDEA.
  User: DAV5
  Date: 2017/4/18
  Time: 15:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/jsp/tag.jsp" %>
<html>
<head>
    <meta charset="utf-8">
    <title>资源列表</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">

    <link href="${basePath}/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="${basePath}/plugins/bootstrap/css/bootstrap-table.min.css" rel="stylesheet"/>
</head>

<body style="padding: 5px;">
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <h4>资源列表</h4>
            <hr>
            <div id="toolbar" class="btn-group">
                <button id="btn_add" type="button" class="btn btn-default" data-toggle="modal"
                        data-target="#permission_add_modal">
                    <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
                </button>
                <button id="btn_edit" type="button" class="btn btn-default">
                    <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改
                </button>
                <button id="btn_delete" type="button" class="btn btn-default">
                    <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
                </button>
            </div>
            <table id="permission-table"></table>
        </div>
    </div>
</div>

<div class="modal fade" id="permission_add_modal" tabindex="-1" role="dialog" aria-labelledby="addModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="addModalLabel">新增资源</h4>
            </div>
            <div class="modal-body" id="permission_add_form">
                <form class="form-horizontal" role="form">
                    <div class="form-group">
                        <label for="permissionId" class="col-md-4 control-label">资源ID</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="permissionId" placeholder="请输入资源ID">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="permissionName" class="col-md-4 control-label">资源名称</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="permissionName" placeholder="请输入资源名称">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="permissionType" class="col-md-4 control-label">资源类型</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="permissionType" placeholder="请输入资源类型">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="permissionURL" class="col-md-4 control-label">资源URL</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="permissionURL" placeholder="请输入资源URL">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="permissionCode" class="col-md-4 control-label">资源代码</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="permissionCode" placeholder="请输入资源代码">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-2 col-md-offset-4 radio">
                            <label class="checkbox-inline">
                                <input type="radio" name="radio" id="a" value="1" checked>有效
                            </label>
                        </div>
                        <div class="col-md-2 radio">
                            <label class="checkbox-inline">
                                <input type="radio" name="radio" id="da" value="0">无效
                            </label>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" id="permission_form_reset">重置</button>
                <button type="button" class="btn btn-primary" id="permission_form_add">添加</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<div class="modal fade" id="permission_edit_modal" tabindex="-1" role="dialog" aria-labelledby="editModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="editModalLabel">修改资源</h4>
            </div>
            <div class="modal-body" id="permission_edit_form">
                <form class="form-horizontal" role="form">
                    <div class="form-group">
                        <label for="edit_permissionId" class="col-md-4 control-label">资源ID</label>
                        <div class="col-md-6">
                            <input type="text" class="form-control" id="edit_permissionId"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_permissionName" class="col-md-4 control-label">资源名称</label>
                        <div class="col-md-6">
                            <input type="text" class="form-control" id="edit_permissionName"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_permissionType" class="col-md-4 control-label">资源类型</label>
                        <div class="col-md-6">
                            <input type="text" class="form-control" id="edit_permissionType"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_permissionURL" class="col-md-4 control-label">资源URL</label>
                        <div class="col-md-6">
                            <input type="text" class="form-control" id="edit_permissionURL"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_permissionCode" class="col-md-4 control-label">资源代码</label>
                        <div class="col-md-6">
                            <input type="text" class="form-control" id="edit_permissionCode"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-2 col-md-offset-4 radio">
                            <label class="checkbox-inline">
                                <input type="radio" name="radio_edit" id="available" value="1" checked>有效
                            </label>
                        </div>
                        <div class="col-md-2 radio">
                            <label class="checkbox-inline">
                                <input type="radio" name="radio_edit" id="disavailable" value="0">无效
                            </label>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" id="permission_form_clear">清空</button>
                <button type="button" class="btn btn-primary" id="permission_form_edit">修改</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<script>var basePath = '${basePath}';</script>
<script src="${basePath}/plugins/jquery/jquery.min.js" type="text/javascript"></script>
<script src="${basePath}/plugins/bootstrap/js/bootstrap.js" type="text/javascript"></script>
<script src="${basePath}/plugins/bootstrap/js/bootstrap-table.min.js" type="text/javascript"></script>
<script src="${basePath}/plugins/bootstrap/js/bootstrap-table-zh-CN.min.js" type="text/javascript"></script>
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
        var oTableInit = new Object();
        //初始化Table
        oTableInit.Init = function () {
            $('#permission-table').bootstrapTable({
                url: basePath + '/permission/data',         //请求后台的URL（*）
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
                        title: '资源ID'
                    },
                    {
                        field: 'name',
                        title: '资源名称'
                    },
                    {
                        field: 'type',
                        title: '资源类型'
                    },
                    {
                        field: 'url',
                        title: '资源URL'
                    },
                    {
                        field: 'percode',
                        title: '资源代码'
                    },
                    {
                        field: 'available',
                        title: '是否有效'
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
        var oInit = new Object();
        var postdata = {};

        oInit.Init = function () {
            //重置
            $("#permission_form_reset").click(function () {
                $("#permissionId").val("");
                $("#permissionName").val("");
                $("#permissionType").val("");
                $("#permissionURL").val("");
                $("#permissionCode").val("");
            });
            //清空
            $("#permission_form_clear").click(function () {
                $("#edit_permissionName").val("");
                $("#edit_permissionType").val("");
                $("#edit_permissionURL").val("");
                $("#edit_permissionCode").val("");
            });
            //添加资源
            $("#permission_form_add").click(function () {
                var id = $("#permissionId").val();
                var name = $("#permissionName").val();
                var type = $("#permissionType").val();
                var url = $("#permissionURL").val();
                var percode = $("#permissionCode").val();
                var available = $("input:radio[name='radio']:checked").val();
                if (id == "") {
                    layer.msg("资源ID不能为空");
                    return false;
                }
                if (name == "") {
                    layer.msg("资源名称不能为空");
                    return false;
                }
                if (type == "") {
                    layer.msg("资源类型不能为空");
                    return false;
                }
                if (url == "") {
                    layer.msg("资源URL不能为空");
                    return false;
                }
                if (percode == "") {
                    layer.msg("资源代码不能为空");
                    return false;
                }
                var permission_add_index = layer.load(1, {
                    shade: [0.1, '#fff']
                });
                $.post(basePath + '/permission/add',
                    {
                        id: id,
                        name: name,
                        type: type,
                        url: url,
                        percode: percode,
                        available: available
                    },
                    function (result) {
                        layer.close(permission_add_index);
                        if (result && result['success']) {

                            layer.alert(result['message'], {
                                skin: 'layui-layer-molv'
                                , closeBtn: 0
                            }, function () {
                                window.location.href = basePath + '/permission/list';
                            });
                        } else {
                            var error = result['message'];
                            layer.msg(error);
                        }
                    },
                    'json'
                );
            });
            //修改资源
            $("#permission_form_edit").click(function () {
                var id = $("#edit_permissionId").val();
                var name = $("#edit_permissionName").val();
                var type = $("#edit_permissionType").val();
                var url = $("#edit_permissionURL").val();
                var percode = $("#edit_permissionCode").val();
                var available = $("input:radio[name='radio_edit']:checked").val();
                if (id == "") {
                    layer.msg("资源ID不能为空");
                    return false;
                }
                if (name == "") {
                    layer.msg("资源名称不能为空");
                    return false;
                }
                if (type == "") {
                    layer.msg("资源类型不能为空");
                    return false;
                }
                if (url == "") {
                    layer.msg("资源URL不能为空");
                    return false;
                }
                if (percode == "") {
                    layer.msg("资源代码不能为空");
                    return false;
                }
                var permission_edit_index = layer.load(1, {
                    shade: [0.1, '#fff']
                });
                $.post(basePath + '/permission/update',
                    {
                        id: id,
                        name: name,
                        type: type,
                        url: url,
                        percode: percode,
                        available: available
                    },
                    function (result) {
                        layer.close(permission_edit_index);
                        if (result && result['success']) {
                            layer.alert(result['message'], {
                                skin: 'layui-layer-molv'
                                , closeBtn: 0
                            }, function () {
                                window.location.href = basePath + '/permission/list';
                            });
                        } else {
                            var error = result['message'];
                            layer.msg(error);
                        }
                    },
                    'json'
                );
            });
            $("#btn_edit").click(function () {
                var arrselections = $("#permission-table").bootstrapTable('getSelections');
                if (arrselections.length > 1) {
                    layer.msg('只能选择一行进行编辑');
                    return;
                }
                if (arrselections.length <= 0) {
                    layer.msg('请选择有效数据');
                    return;
                }
                $("#edit_permissionId").val(arrselections[0].id).attr("disabled", true);
                $("#edit_permissionName").val(arrselections[0].name);
                $("#edit_permissionType").val(arrselections[0].type);
                $("#edit_permissionURL").val(arrselections[0].url);
                $("#edit_permissionCode").val(arrselections[0].percode);
                if (arrselections[0].available == '0') {
                    $("#disavailable").attr("checked", "checked");
                }
                $("#permission_edit_modal").modal("show");
            });

            $("#btn_delete").click(function () {
                var arrselections = $("#permission-table").bootstrapTable('getSelections');
                if (arrselections.length <= 0) {
                    layer.msg('请选择有效数据');
                    return;
                }
                var delete_cofirm_index = layer.confirm('确认要删除选中的数据吗？', {
                    btn: ['删除', '取消']
                }, function () {
                    $.ajax({
                        url: basePath + '/permission/delete',
                        type: "POST",
                        dataType: "json",
                        contentType: "application/json",
                        data: JSON.stringify(arrselections),
                        success: function (result) {
                            if (result && result['success']) {
                                layer.close(delete_cofirm_index);
                                layer.msg(result['message']);
                                window.location.href = basePath + '/permission/list';
                            } else {
                                layer.close(delete_cofirm_index);
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
