<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ include file="/core/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>信息维护</title>
<link href="<%=request.getContextPath()%>/resource/styles/gzt_css.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/resource/js/pager/Pager.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/jquery.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/pager/jquery.pager.js"></script>
</head>
<body>
  <div class="weizhi">
    <div class="weizhi_bj">个人译员信息</div>
  </div>
  <form id="form" method="post">
    <table border="0" cellpadding="0" cellspacing="0" class="table_list">
      <tr>
        <th width="11%">个人译员信息列表</th>
        <th width="89%">
          <div>
            <!-- <input name="add" type="button" value="导出excel" onclick="toExcel();" /> --> 
            <input type="button" value="新增" onclick="goCreate()" />&nbsp;&nbsp;
          </div>
        </th>
      </tr>
      <tr>
        <td colspan="2">
          <table border="0" cellpadding="0" cellspacing="0" class="table_date"
            id="dataTable">
            <tr>
                  <th width="30%">发布用户 </th>
                  <th width="30%">姓名 </th>
                  <th width="30%">性别 </th>
                  <th width="30%">出生 </th>
                  <th width="30%">近期照片 </th>
              <th width="10%"></th>
            </tr>
            <c:forEach var="var" items="${individualModel.items}">
  
              <tr onmouseover="this.className='over'" onmouseout="this.className='out'">
                    <td><div><c:out value="${var.user_id}" escapeXml="true"/></div></td>
                    <td><div><c:out value="${var.name}" escapeXml="true"/></div></td>
                    <td><div><c:out value="${var.gender}" escapeXml="true"/></div></td>
                    <td><div><c:out value="${var.birth_year}" escapeXml="true"/></div></td>
                    <td><div><c:out value="${var.photo}" escapeXml="true"/></div></td>
                    <td>
                      <a href="<%=request.getContextPath()%>/individual/goView.action?dataId=${ var.id }" >查看</a>
                      &nbsp;&nbsp;
                      <a href="<%=request.getContextPath()%>/individual/goEdit.action?dataId=${ var.id }" >编辑</a>
                      &nbsp;&nbsp;
                      <a href="<%=request.getContextPath()%>/individual/doDelete.action?dataId=${ var.id }" >删除</a>
                    </td>
              </tr>
            </c:forEach>
          </table>
        </td>
      </tr>
      <tr>
        <td height="40" colspan="2">
          <div class="pager"></div>
        </td>
      </tr>
    </table>
    <input type="hidden" name="currentPage" value="${individualModel.currentPage}"/>
  </form>

  <script type="text/javascript">
  $(".pager").pager({ pagenumber: ${individualModel.currentPage}, pagecount: ${individualModel.pageCount}, buttonClickCallback: pageClick });
  function pageClick(pageNum){
    $("input[name='currentPage']").val(pageNum);
    $("#form").submit();
  }


    function goCreate(){
        var form = document.getElementById("form");
        form.action = "<%=request.getContextPath()%>/individual/goCreate.action";
        form.submit();
    }
    
    function doDelete(){
        var form = document.getElementById("form");
        form.action = "<%=request.getContextPath()%>/individual/doDelete";
        form.submit();
    }
    
    function doQuery(){
        var form = document.getElementById("form");
        form.action = "<%=request.getContextPath()%>/individual/query";
        form.submit();
    }
    
    
  </script>
</body>
</html>


