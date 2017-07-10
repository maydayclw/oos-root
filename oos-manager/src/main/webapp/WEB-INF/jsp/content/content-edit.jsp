<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<div class="modal fade" id="content_edit_modal" tabindex="-1" role="dialog" aria-labelledby="editModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" style="width: 820px;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="editModalLabel">修改内容</h4>
            </div>
            <div class="modal-body" id="content_edit_form">
                <form class="form-horizontal" id="contentEditForm" role="form">
                    <div class="form-group">
                        <label for="edit_id" class="col-sm-2 control-label">内容ID</label>
                        <div class="col-sm-5">
                            <input type="text" class="form-control" id="edit_id" name="id"/>
                        </div>
                    </div>
                    <input type="hidden" name="categoryId"/><%--内容类目ID--%>
                    <div class="form-group">
                        <label for="edit_title" class="col-sm-2 control-label">内容标题</label>
                        <div class="col-sm-5">
                            <input type="text" class="form-control" id="edit_title" name="title"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_subTitle" class="col-sm-2 control-label">子标题</label>
                        <div class="col-sm-5">
                            <input type="text" class="form-control" id="edit_subTitle" name="subTitle"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_titleDesc" class="col-sm-2 control-label">内容描述</label>
                        <div class="col-sm-8">
                            <textarea class="form-control" id="edit_titleDesc" name="titleDesc" rows="3"></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_url" class="col-sm-2 control-label">URL</label>
                        <div class="col-sm-5">
                            <input type="text" class="form-control" id="edit_url" name="url"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">图片</label>
                        <div class="col-sm-8">
                            <input type="hidden" name="pic" />
                            <a href="javascript:void(0)" class="col-sm-2 btn btn-primary btn-sm onePicUpload">图片上传</a>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_content" class="col-sm-2 control-label">内容</label>
                        <div class="col-sm-10">
                            <textarea style="width:460px;visibility:hidden;" id="edit_content" name="content"></textarea>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" id="content_clear" class="btn btn-warning" onclick="clearEditForm()">重置</button>
                <button type="button" id="content_add" class="btn btn-primary" onclick="submitEditForm()">修改</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>