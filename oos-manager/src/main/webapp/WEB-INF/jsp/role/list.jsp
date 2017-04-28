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
    <title>角色列表</title>
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
            <h4>角色列表</h4>
            <hr>
            <div id="toolbar" class="btn-group">
                <button id="btn_add" type="button" class="btn btn-default" data-toggle="modal"
                        data-target="#role_add_modal">
                    <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
                </button>
                <button id="btn_edit" type="button" class="btn btn-default">
                    <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改
                </button>
                <button id="btn_delete" type="button" class="btn btn-default">
                    <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
                </button>
                <button id="btn_auth" type="button" class="btn btn-default">
                    <span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"></span>授权
                </button>
            </div>
            <table id="role-table"></table>
        </div>
    </div>
</div>

<div class="modal fade" id="role_add_modal" tabindex="-1" role="dialog" aria-labelledby="addModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="addModalLabel">新增角色</h4>
            </div>
            <div class="modal-body" id="role_add_form">
                <form class="form-horizontal" role="form">
                    <div class="form-group">
                        <label for="roleName" class="col-md-4 control-label">角色名称</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="roleName" placeholder="请输入角色名称">
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
                <button type="button" class="btn btn-default" id="role_form_reset">重置</button>
                <button type="button" class="btn btn-primary" id="role_form_add">添加</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<div class="modal fade" id="role_edit_modal" tabindex="-1" role="dialog" aria-labelledby="editModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="editModalLabel">修改角色</h4>
            </div>
            <div class="modal-body" id="role_edit_form">
                <form class="form-horizontal" role="form">
                    <div class="form-group">
                        <label for="edit_roleId" class="col-md-4 control-label">角色ID</label>
                        <div class="col-md-6">
                            <input type="text" class="form-control" id="edit_roleId"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_roleName" class="col-md-4 control-label">角色名称</label>
                        <div class="col-md-6">
                            <input type="text" class="form-control" id="edit_roleName"/>
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
                <button type="button" class="btn btn-default" id="role_form_clear">清空</button>
                <button type="button" class="btn btn-primary" id="role_form_edit">修改</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<div class="modal fade" id="role_auth_modal" tabindex="-1" role="dialog" aria-labelledby="authModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="authModalLabel">授权</h4>
            </div>
            <div class="modal-body" id="role_auth_form"><%--从数据库去除资源列表--%>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="role_form_auth">授权</button>
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
            $('#role-table').bootstrapTable({
                url: basePath + '/role/data',         //请求后台的URL（*）
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
                        title: '角色ID'
                    },
                    {
                        field: 'name',
                        title: '角色名称'
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
            $("#role_form_reset").click(function () {
                $("#roleName").val("");
            });
            //清空
            $("#role_form_clear").click(function () {
                $("#edit_roleName").val("");
            });
            //授权
            $("#role_form_auth").click(function () {
                var $checkedArr = [];
                $("input[name='permissionArr']").each(function (i,d) {
                    if(d.checked){
                        $checkedArr.push(d.value);
                    }
                });
                console.log($checkedArr);
                var arrselections = $("#role-table").bootstrapTable('getSelections');
                if($checkedArr.length<1){
                    layer.msg("请选择要授权的资源");
                }
                var auth_edit_index = layer.load(1, {
                    shade: [0.1, '#fff']
                });
                console.log(arrselections[0]['id']);
                $.ajax({
                    url: basePath + '/sys/auth',
                    type: "POST",
                    dataType:"json",
                    data: {
                        roleId : arrselections[0]['id'],
                        permissionArr: $checkedArr
                    },
                    success: function (result) {
                        if (result && result['success']) {
                            layer.close(auth_edit_index);
                            layer.alert(result['message'], {
                                skin: 'layui-layer-molv' //样式类名
                                , closeBtn: 0
                            }, function () {
                                window.location.href = basePath + '/role/list';
                            });
                        } else {
                            layer.close(auth_edit_index);
                            layer.msg(result['message']);
                        }
                    }
                });
            });
            //添加角色
            $("#role_form_add").click(function () {
                var name = $("#roleName").val();
                var available = $("input:radio[name='radio']:checked").val();
                if (name == "") {
                    layer.msg("角色名称不能为空");
                    return false;
                }
                var role_add_index = layer.load(1, {
                    shade: [0.1, '#fff']
                });
                $.post(basePath + '/role/add',
                    {
                        name: name,
                        available: available
                    },
                    function (result) {
                        layer.close(role_add_index);
                        if (result && result['success']) {

                            layer.alert(result['message'], {
                                skin: 'layui-layer-molv' //样式类名
                                , closeBtn: 0
                            }, function () {
                                window.location.href = basePath + '/role/list';
                            });
                        } else {
                            var error = result['message'];
                            layer.msg(error);
                        }
                    },
                    'json'
                );
            });
            //修改角色
            $("#role_form_edit").click(function () {
                var id = $("#edit_roleId").val();
                var name = $("#edit_roleName").val();
                var available = $("input:radio[name='radio_edit']:checked").val();

                if (id == "") {
                    layer.msg("角色ID不能为空");
                    return false;
                }
                if (name == "") {
                    layer.msg("角色名称不能为空");
                    return false;
                }
                var role_edit_index = layer.load(1, {
                    shade: [0.1, '#fff']
                });
                $.post(basePath + '/role/update',
                    {
                        id: id,
                        name: name,
                        available: available
                    },
                    function (result) {
                        layer.close(role_edit_index);
                        if (result && result['success']) {
                            layer.alert(result['message'], {
                                skin: 'layui-layer-molv' //样式类名
                                , closeBtn: 0
                            }, function () {
                                window.location.href = basePath + '/role/list';
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
                var arrselections = $("#role-table").bootstrapTable('getSelections');
                if (arrselections.length > 1) {
                    layer.msg('只能选择一行进行编辑');
                    return;
                }
                if (arrselections.length <= 0) {
                    layer.msg('请选择有效数据');
                    return;
                }
                $("#edit_roleId").val(arrselections[0].id).attr("disabled", true);
                $("#edit_roleName").val(arrselections[0].name);
                if (arrselections[0].available == '0') {
                    $("#disavailable").attr("checked", "checked");
                }
                $("#role_edit_modal").modal("show");
            });

            $("#btn_delete").click(function () {
                var arrselections = $("#role-table").bootstrapTable('getSelections');
                if (arrselections.length <= 0) {
                    layer.msg('请选择有效数据');
                    return;
                }
                var delete_cofirm_index = layer.confirm('确认要删除选中的数据吗？', {
                    btn: ['删除', '取消']
                }, function () {
                    $.ajax({
                        url: basePath + '/role/delete',
                        type: "POST",
                        dataType: "json",
                        contentType: "application/json",
                        data: JSON.stringify(arrselections),
                        success: function (result) {
                            if (result && result['success']) {
                                layer.close(delete_cofirm_index);
                                layer.msg(result['message']);
                                window.location.href = basePath + '/role/list';
                            } else {
                                layer.close(delete_cofirm_index);
                                layer.msg(result['message']);
                            }
                        }
                    });
                });
            });
            $("#btn_auth").click(function () {
                var arrselections = $("#role-table").bootstrapTable('getSelections');
                if (arrselections.length > 1) {
                    layer.msg('只能选择一行进行编辑');
                    return;
                }
                if (arrselections.length <= 0) {
                    layer.msg('请选择有效数据');
                    return;
                }
                $("#role_auth_form").empty();
                //查询角色列表
                $.post(basePath + '/permission/all_data', {}, function (result) {
                    if (result) {
                        for (var i = 0; i < result.length; i++) {
                            var permission = result[i];
                            $("#role_auth_form").append(' <div class="checkbox"> <label> <input type="checkbox" name="permissionArr" value="' + permission["id"] + '">' + permission["name"] + '</label> </div>');
                        }
                    } else {
                        layer.msg("获取资源列表失败");
                    }
                });
                $("#role_auth_modal").modal('show');
            });
        };
        return oInit;
    };
</script>
</body>
</html>
