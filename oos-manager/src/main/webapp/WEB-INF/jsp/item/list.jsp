<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/jsp/tag.jsp" %>
<html>
<head>
    <meta charset="utf-8">
    <title>商品列表</title>
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
            <form id="formSearch" class="form-horizontal">
                <div class="form-group" style="margin-top:15px">
                    <label class="control-label col-sm-1" for="search_itemId">商品ID</label>
                    <div class="col-sm-3">
                        <input type="text" class="form-control" id="search_itemId" placeholder="商品ID(精确查询)">
                    </div>
                    <label class="control-label col-sm-1" for="search_title">商品标题</label>
                    <div class="col-sm-3">
                        <input type="text" class="form-control" id="search_title" placeholder="标题(模糊查询)">
                    </div>
                    <div class="col-sm-4" style="text-align:left;">
                        <div class="btn-group" style="margin-left:50px">
                            <button type="button" id="btn_query" class="btn btn-primary"><span
                                    class="glyphicon glyphicon-search"></span> 查询
                            </button>
                            <button type="button" id="btn_query_clear" class="btn btn-warning"><span
                                    class="glyphicon glyphicon-refresh"></span> 清空查询条件
                            </button>
                        </div>
                    </div>
                </div>
            </form>
            <hr style="margin:0;">
            <div id="toolbar" class="btn-group">
                <button id="btn_edit" type="button" class="btn btn-default">
                    <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改
                </button>
                <button id="btn_delete" type="button" class="btn btn-default">
                    <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
                </button>
                <button id="btn_up" type="button" class="btn btn-default">
                    <span class="glyphicon glyphicon-arrow-up" aria-hidden="true"></span>上架
                </button>
                <button id="btn_down" type="button" class="btn btn-default">
                    <span class="glyphicon glyphicon-arrow-down" aria-hidden="true"></span>下架
                </button>
            </div>
            <table id="item-table"></table>
        </div>
    </div>
</div>
<jsp:include page="item-edit.jsp"></jsp:include>

<script>var basePath = '${basePath}';</script>
<script src="${basePath}/plugins/jquery/jquery.min.js" type="text/javascript"></script>
<script src="${basePath}/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="${basePath}/plugins/bootstrap-table/bootstrap-table.min.js" type="text/javascript"></script>
<script src="${basePath}/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js" type="text/javascript"></script>
<script src="${basePath}/plugins/tableExport.jquery.plugin-master/tableExport.min.js" type="text/javascript"></script>
<script src="${basePath}/plugins/bootstrap-table/extensions/export/bootstrap-table-export.min.js"
        type="text/javascript"></script>
<script src="${basePath}/plugins/layer/layer.js"></script>
<script>
    $(function () {
        //1.初始化Table
        var oTable = new TableInit();
        oTable.Init();
        $("#btn_query").click(function () {
            $("#item-table").bootstrapTable('refresh');
        });
        $("#btn_query_clear").click(function () {
            $("#formSearch")[0].reset();
        });
        //2.初始化Button的点击事件
        var oButtonInit = new ButtonInit();
        oButtonInit.Init();
    });
    var TableInit = function () {
        var oTableInit = {};
        //初始化Table
        oTableInit.Init = function () {
            $('#item-table').bootstrapTable({
                url: basePath + '/item/data',         //请求后台的URL（*）
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
                height: 400,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
                uniqueId: "id",                     //每一行的唯一标识，一般为主键列
                showToggle: true,                    //是否显示详细视图和列表视图的切换按钮
                cardView: false,                    //是否显示详细视图
                detailView: false,                   //是否显示父子表
                showExport: true,                     //是否显示导出
                exportDataType: "basic",              //basic', 'all', 'selected'.
                columns: [
                    {
                        checkbox: true
                    },
                    {
                        field: 'id',
                        title: '商品ID',
                        sortable: true
                    },
                    {
                        field: 'title',
                        title: '标题',
                        sortable: true
                    },
                    {
                        field: 'sellPoint',
                        title: '卖点',
                        visible: false
                    },
                    {
                        field: 'price',
                        title: '价格',
                        sortable: true
                    },
                    {
                        field: 'groupPrice',
                        title: '拼团价格',
                        sortable: true
                    },
                    {
                        field: 'lowPrice',
                        title: '最低价格',
                        sortable: true
                    },
                    {
                        field: 'spec',
                        title: '规格',
                        visible: false
                    },
                    {
                        field: 'notice',
                        title: '预告',
                        visible: false
                    },
                    {
                        field: 'num',
                        title: '库存',
                        sortable: true
                    },
                    {
                        field: 'cid',
                        title: '类目ID'
                    },
                    {
                        field: 'status',
                        title: '状态'
                    }
                ]
            });
        };

        //得到查询的参数
        oTableInit.queryParams = function (params) {
            return {
                pageNumber: params.offset / params.limit + 1,
                pageSize: params.limit,
                id: $("#search_itemId").val(),
                title: $("#search_title").val(),
                sortName: params.sort,
                sortOrder: params.order
            };
        };
        return oTableInit;
    };


    var ButtonInit = function () {
        var oInit = {};
        oInit.Init = function () {
            //删除
            $("#btn_delete").click(function () {
                var arrselections = $("#item-table").bootstrapTable('getSelections');
                if (arrselections.length <= 0) {
                    layer.msg('请选择有效数据');
                    return;
                }
                var delete_cofirm_index = layer.confirm('确认要删除选中的数据吗？', {
                    btn: ['删除', '取消']
                }, function () {
                    $.ajax({
                        url: basePath + '/item/delete',
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
                                    $("#item-table").bootstrapTable('refresh');
                                    layer.close(index);
                                });
                            } else {
                                layer.msg(result['message']);
                            }
                        }
                    });
                });
            });
            //修改
            $("#btn_edit").click(function () {
                var arrselections = $("#item-table").bootstrapTable('getSelections');
                if (arrselections.length > 1) {
                    layer.msg('只能选择一行进行编辑');
                    return;
                }
                if (arrselections.length <= 0) {
                    layer.msg('请选择有效数据');
                    return;
                }
                console.log(arrselections[0]);
                $("#edit_itemId").val(arrselections[0].id).attr("disabled", true);
                $("#edit_title").val(arrselections[0].title);
                $("#edit_sellPoint").val(arrselections[0].sellPoint);
                $("#edit_price").val(arrselections[0].price);
                $("#edit_groupPrice").val(arrselections[0].groupPrice);
                $("#edit_lowPrice").val(arrselections[0].lowPrice);
                $("#edit_num").val(arrselections[0].num);
                $("#edit_spec").val(arrselections[0].spec);
                $("#edit_notice").val(arrselections[0].notice);
                $("#item_edit_modal").modal("show");
            });
            //修改modal中的清空按钮
            $("#item_form_clear").click(function () {
                $("#item_edit_form1")[0].reset();
            });
            //修改modal中的修改按钮
            $("#item_form_edit").click(function () {
                var id = $("#edit_itemId").val();
                var title = $("#edit_title").val();
                var sellPoint = $("#edit_sellPoint").val();
                var price = $("#edit_price").val();
                var groupPrice = $("#edit_groupPrice").val();
                var lowPrice = $("#edit_lowPrice").val();
                var num = $("#edit_num").val();
                var spec = $("#edit_spec").val();
                var notice = $("#edit_notice").val();
                if (id == "") {
                    layer.msg("商品ID不能为空");
                    return false;
                }
                if (title == "") {
                    layer.msg("标题不能为空");
                    return false;
                }
                if (price == "") {
                    layer.msg("价格不能为空");
                    return false;
                }
                if (groupPrice == "") {
                    layer.msg("团购价格不能为空");
                    return false;
                }
                if (lowPrice == "") {
                    layer.msg("最低价格不能为空");
                    return false;
                }
                if (spec == "") {
                    layer.msg("商品规格不能为空");
                    return false;
                }
                if (num == "") {
                    layer.msg("商品库存不能为空");
                    return false;
                }
                var item_edit_index = layer.load(1, {
                    shade: [0.1, '#fff']
                });
                $.post(basePath + '/item/update',
                    {
                        id: id,
                        title: title,
                        sellPoint: sellPoint,
                        price: price,
                        groupPrice: groupPrice,
                        lowPrice: lowPrice,
                        num: num,
                        spec: spec,
                        notice: notice
                    },
                    function (result) {
                        layer.close(item_edit_index);
                        if (result && result['success']) {
                            layer.alert(result['message'], {
                                skin: 'layui-layer-molv' //样式类名
                                , closeBtn: 0
                            }, function (index) {
                                $("#item-table").bootstrapTable('refresh');
                                $("#item_edit_modal").modal("hide");
                                layer.close(index);
                            });
                        } else {
                            layer.msg(result['message']);
                        }
                    },
                    'json'
                );
            });
            //上架
            $("#btn_up").click(function () {
                var arrselections = $("#item-table").bootstrapTable('getSelections');
                if (arrselections.length <= 0) {
                    layer.msg('请选择有效数据');
                    return;
                }
                var arrselectionsNew = [];
                var temp = 0;
                $.each(arrselections, function (i, arrselection) {
                    if (arrselection['status'] != 1) {//没有上架商品
                        arrselectionsNew.push(arrselection);
                    } else {
                        temp = temp + 1;
                    }
                });
                if (arrselections.length == temp) {
                    layer.msg('选中的商品全都已经上架,无需重复上架');
                    return;
                }
                $.ajax({
                    url: basePath + '/item/upOrDown',
                    type: "POST",
                    dataType: "json",
                    contentType: "application/json",
                    data: JSON.stringify(arrselectionsNew),
                    success: function (result) {
                        if (result && result['success']) {
                            layer.alert("上架成功", {
                                skin: 'layui-layer-molv'
                                , closeBtn: 0
                            }, function (index) {
                                $("#item-table").bootstrapTable('refresh');
                                layer.close(index);
                            });
                        } else {
                            layer.msg(result['message']);
                        }
                    }
                });
            });
            //下架
            $("#btn_down").click(function () {
                var arrselections = $("#item-table").bootstrapTable('getSelections');
                if (arrselections.length <= 0) {
                    layer.msg('请选择有效数据');
                    return;
                }
                var arrselectionsNew = [];
                var temp = 0;
                $.each(arrselections, function (i, arrselection) {
                    console.log(arrselection);
                    if (arrselection['status'] != 2) {//没有下架商品
                        arrselectionsNew.push(arrselection);
                    } else {
                        temp = temp + 1;
                    }
                });
                if (arrselections.length == temp) {
                    layer.msg('选中的商品全都已经下架,无需重复下架');
                    return;
                }
                $.ajax({
                    url: basePath + '/item/upOrDown',
                    type: "POST",
                    dataType: "json",
                    contentType: "application/json",
                    data: JSON.stringify(arrselectionsNew),
                    success: function (result) {
                        if (result && result['success']) {
                            layer.alert("下架成功", {
                                skin: 'layui-layer-molv'
                                , closeBtn: 0
                            }, function (index) {
                                $("#item-table").bootstrapTable('refresh');
                                layer.close(index);
                            });
                        } else {
                            layer.msg(result['message']);
                        }
                    }
                });
            });
        };
        return oInit;
    };
</script>
</body>
</html>
