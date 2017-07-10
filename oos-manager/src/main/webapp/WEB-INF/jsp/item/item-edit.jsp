<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<div class="modal fade" id="item_edit_modal" tabindex="-1" role="dialog" aria-labelledby="editModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="editModalLabel">修改商品</h4>
            </div>
            <div class="modal-body" id="item_edit_form">
                <form class="form-horizontal" role="form" id="item_edit_form1">
                    <div class="form-group">
                        <label for="edit_itemId" class="col-md-2 control-label">ID</label>
                        <div class="col-md-6">
                            <input type="text" class="form-control" id="edit_itemId"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_title" class="col-md-2 control-label">标题</label>
                        <div class="col-md-8">
                            <input type="text" class="form-control" id="edit_title"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_sellPoint" class="col-md-2 control-label">卖点</label>
                        <div class="col-md-10">
                            <input type="text" class="form-control" id="edit_sellPoint"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-2 control-label" for="edit_price">价格</label>
                        <div class="col-md-2">
                            <input type="number" class="form-control" id="edit_price">
                        </div>
                        <label class="col-md-2 control-label" for="edit_groupPrice">拼团价格</label>
                        <div class="col-md-2">
                            <input type="number" class="form-control" id="edit_groupPrice">
                        </div>
                        <label class="col-md-2 control-label" for="edit_lowPrice">超低价格</label>
                        <div class="col-md-2">
                            <input type="number" class="form-control" id="edit_lowPrice">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_num" class="col-md-2 control-label">库存</label>
                        <div class="col-md-3">
                            <input class="form-control" id="edit_num" type="number">
                        </div>
                        <label for="edit_spec" class="col-md-2 control-label">商品规格</label>
                        <div class="col-md-5">
                            <input class="form-control" id="edit_spec" type="text">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_notice" class="col-md-2 control-label">预告</label>
                        <div class="col-md-9">
                            <input type="text" class="form-control" id="edit_notice"/>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" id="item_form_clear">清空</button>
                <button type="button" class="btn btn-primary" id="item_form_edit">修改</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
