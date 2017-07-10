<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<div class="modal fade" id="content_add_modal" tabindex="-1" role="dialog" aria-labelledby="addModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" style="width: 820px;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="addModalLabel">新增内容</h4>
            </div>
            <div class="modal-body" id="content_add_form">
                <form class="form-horizontal" id="contentAddForm" role="form">
                    <input type="hidden" name="categoryId"/><%--内容类目ID--%>
                    <div class="form-group">
                        <label for="title" class="col-sm-2 control-label">内容标题</label>
                        <div class="col-sm-5">
                            <input type="text" class="form-control" id="title" name="title"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="subTitle" class="col-sm-2 control-label">子标题</label>
                        <div class="col-sm-5">
                            <input type="text" class="form-control" id="subTitle" name="subTitle"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="titleDesc" class="col-sm-2 control-label">内容描述</label>
                        <div class="col-sm-8">
                            <textarea class="form-control" id="titleDesc" name="titleDesc" rows="3" placeholder="该输入内容描述"></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="url" class="col-sm-2 control-label">URL</label>
                        <div class="col-sm-5">
                            <input type="text" class="form-control" id="url" name="url"/>
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
                        <label for="content" class="col-sm-2 control-label">内容</label>
                        <div class="col-sm-10">
                            <textarea style="width:460px;visibility:hidden;" id="content" name="content"></textarea>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" id="content_clear" class="btn btn-warning" onclick="clearForm()">重置</button>
                <button type="button" id="content_add" class="btn btn-primary" onclick="submitForm()">添加</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>