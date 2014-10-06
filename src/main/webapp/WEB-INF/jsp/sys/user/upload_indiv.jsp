<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/core/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首页大图编辑页</title>
<%@ include file="/core/includecss.jsp"%>
<script type="text/javascript">
function doUploadFile(fileType,userId,skip){
    var form = document.getElementById("uploadForm");
    form.action = "<%=request.getContextPath()%>/user/doUploadFile.action?dataId="+userId+"&fileType="+fileType+"&skip="+skip;
    form.submit();
}
</script>
</head>

<body>

<div id="wrapper">

  <form id="uploadForm" name="uploadForm" method="post" enctype="multipart/form-data">
    <table class="table_add">
      <thead>

        <tr>
          <c:if test="${ userModel.fileType eq 'photo' }">
            <td>
              <b>上传照片</b>
            </td>
          </c:if>
          <c:if test="${ userModel.fileType eq 'language_cert' }">
            <td>
              <b>上传语言证书</b>
            </td>
          </c:if>
          <c:if test="${ userModel.fileType eq 'translation_cert' }">
            <td>
              <b>上传翻译证书</b>
            </td>
          </c:if>
          <c:if test="${ userModel.fileType eq 'profession_cert' }">
            <td>
              <b>上传翻译证书</b>
            </td>
          </c:if>
          <c:if test="${ userModel.fileType eq 'authentication_file' }">
            <td>
              <b>上传认证资料</b>
            </td>
          </c:if>
        </tr>

        <tr>
          <td>文件：</td>
          <td><input type="file" name="upfile" multiple="false"/></td>
        </tr>

      </thead>
    </table>
  </form>

  <table class="table_add">
    <tr>
      <td>
        <input type="button" value="上传" onclick="doUploadFile('<c:out value="${ userModel.fileType }" escapeXml="true" />', '<c:out value="${ userModel.dataId }" escapeXml="true" />', 0)" />
      </td>
      <td>
        <input type="button" value="跳过" onclick="doUploadFile('<c:out value="${ userModel.fileType }" escapeXml="true" />', '<c:out value="${ userModel.dataId }" escapeXml="true" />', 1)" />
      </td>
    </tr>
  <table>

</div>

</body>
</html>
