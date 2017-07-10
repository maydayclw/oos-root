<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<div class="modal fade" id="content_cat_add_modal" tabindex="-1" role="dialog" aria-labelledby="addModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="addModalLabel">新增内容类目</h4>
            </div>
            <div class="modal-body" id="content_cat_add_form">
                <form class="form-horizontal" id="contentCatAddForm" role="form">
                    <div class="form-group">
                        <label for="content_cat" class="col-sm-2 control-label">父类目</label>
                        <div class="col-sm-3">
                            <select id="content_cat" class="form-control" name="parentId">
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="content_cat_name" class="col-sm-2 control-label">分类名称</label>
                        <div class="col-sm-5">
                            <input type="text" class="form-control" id="content_cat_name" name="name"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="status_radio" class="col-sm-2 control-label">状态</label>
                        <div id="status_radio" class="col-sm-2 radio">
                            <label class="checkbox-inline">
                                <input type="radio" name="status" id="edit_unlock" value="1" checked>正常
                            </label>
                        </div>
                        <div class="col-sm-2 radio">
                            <label class="checkbox-inline">
                                <input type="radio" name="status" id="edit_lock" value="2">无效
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="isParent_radio" class="col-sm-2 control-label">是否父类</label>
                        <div id="isParent_radio" class="col-sm-2 radio">
                            <label class="checkbox-inline">
                                <input type="radio" name="isParent" value="1">是
                            </label>
                        </div>
                        <div class="col-sm-2 radio">
                            <label class="checkbox-inline">
                                <input type="radio" name="isParent" value="0" checked>否
                            </label>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" id="content_cat_add" class="btn btn-primary submit">添加</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>