<%--
  @author xietao.x@qq.com
  Created by 2018/5/7
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- Excel上传模态框 -->
<div class="modal fade" id="upload-excel-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header bg-info">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×
                </button>
                <h4 class="modal-title">
                    请选择要上传的文件
                </h4>
            </div>
            <div class="modal-body">
                <div id="upload-excel" class="dropzone"></div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default btn-white" data-dismiss="modal">
                    完成
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->