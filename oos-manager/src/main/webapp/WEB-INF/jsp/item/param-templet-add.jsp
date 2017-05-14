<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<div class="modal fade" id="templet_add_modal" tabindex="-1" role="dialog" aria-labelledby="addModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="addModalLabel">新增模板</h4>
            </div>
            <div class="modal-body" id="user_add_form">
                <form class="form-horizontal" id="paramTempletAddForm" role="form">
                    <div class="form-group">
                        <label for="cat" class="col-sm-2 control-label">商品类目</label>
                        <div class="col-sm-3">
                            <input type="button" id="cat" class="btn btn-info btn-sm form-control" value="选择类目">
                        </div>
                        <div class="col-sm-4">
                            <label id="cat_view" class="text-success control-label"></label>
                        </div>
                        <div class="col-sm-2">
                            <input type="hidden" id="cid" name="cid">
                        </div>
                    </div>
                    <div class="form-group addGroupTr" style="display: none;">
                        <label class="col-sm-2 control-label">规格参数</label>
                        <div class="col-sm-10">
                            <ul class="list-unstyled" style="padding: 5px 0;">
                                <li><a href="javascript:void(0)" class="btn btn-primary btn-sm addGroup">添加分组</a></li>
                            </ul>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary submit">添加</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
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
<div class="itemParamAddTemplate" style="display: none;">
    <li class="param">
        <ul class="list-unstyled">
            <li>
                <input type="text" style="width: 150px;" name="group"/>&nbsp;<a href="javascript:void(0)"
                                                                                class="btn btn-success btn-xs addParam"
                                                                                title="添加参数"><span
                    class="glyphicon glyphicon-plus"></span></a>
            </li>
            <li>
                <span>|-------</span><input style="width: 150px;" type="text" name="param"/>&nbsp;<a
                    href="javascript:void(0)" class="btn btn-danger btn-xs delParam" title="删除"><span
                    class="glyphicon glyphicon-remove"></span></a>
            </li>
        </ul>
    </li>
</div>