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
    <div class="weizhi_bj">城市信息</div>
  </div>
  <form id="form" method="post">
    <table border="0" cellpadding="0" cellspacing="0" class="table_list">
      <tr>
        <th width="11%">城市信息列表</th>
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
              <th width="80%">城市 </th>
              <th width="20%"></th>
            </tr>
            <c:forEach var="var" items="${cityModel.items}">
  
              <tr onmouseover="this.className='over'" onmouseout="this.className='out'">
                    <td><div><c:out value="${var.city}" escapeXml="true"/></div></td>
                    <td>
                      <a href="<%=request.getContextPath()%>/city/goView.action?dataId=${ var.id }" >查看</a>
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
    <input type="hidden" name="currentPage" value="${cityModel.currentPage}"/>
  </form>

  <script type="text/javascript">
  $(".pager").pager({ pagenumber: ${cityModel.currentPage}, pagecount: ${cityModel.pageCount}, buttonClickCallback: pageClick });
  function pageClick(pageNum){
    $("input[name='currentPage']").val(pageNum);
    $("#form").submit();
  }


    function goCreate(){
        var form = document.getElementById("form");
        form.action = "<%=request.getContextPath()%>/city/goCreate.action";
        form.submit();
    }
    
    function doDelete(){
        var form = document.getElementById("form");
        form.action = "<%=request.getContextPath()%>/city/doDelete";
        form.submit();
    }
    
    function doQuery(){
        var form = document.getElementById("form");
        form.action = "<%=request.getContextPath()%>/city/query";
        form.submit();
    }
    
    
  </script>
</body>
</html>


