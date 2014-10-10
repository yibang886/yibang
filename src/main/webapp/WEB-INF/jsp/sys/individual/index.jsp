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
            <%-- <input name="add" type="button" value="导出excel" onclick="toExcel();" /> --%> 
            <%-- 不能直接创建个人译员；只能通过用户发布的方式
            <input type="button" value="新增" onclick="goCreate()" />&nbsp;&nbsp;
            --%>
          </div>
        </th>
      </tr>
      <tr>
        <td colspan="2">
          <table border="0" cellpadding="0" cellspacing="0" class="table_date" id="dataTable">
            <tr>
                  <th width="20%"><div>近期照片 </div></th>
                  <th width="20%"><div>姓名 </div></th>
                  <th width="10%"><div>性别 </div></th>
                  <th width="20%"><div>出生年 </div></th>
                  <th width="20%"><div>邮箱 </div></th>
                  <th width="20%">操作 </th>
            </tr>

            <c:forEach var="var" items="${individualModel.items}">
              <tr onmouseover="this.className='over'" onmouseout="this.className='out'">
                    <td><div><img src="/ybfiles/individual/${var.id}/photo/small${var.photo_suffix}"/></div></td>
                    <td><div><c:out value="${var.name}" escapeXml="true"/></div></td>
                    <td><div>
                        <c:if test="${var.gender==0}"><c:out value="男" escapeXml="true"/></c:if>
                        <c:if test="${var.gender==1}"><c:out value="女" escapeXml="true"/></c:if>
                    </div></td>
                    <td><div><c:out value="${var.birth_year}" escapeXml="true"/></div></td>
                    <td><div><c:out value="${var.user.email}" escapeXml="true"/></div></td>
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


    /*
     *不能直接创建个人译员；只能通过用户发布的方式
    function goCreate(){
        var form = document.getElementById("form");
        form.action = "<%=request.getContextPath()%>/individual/goCreate.action";
        form.submit();
    }
    */
    
    function doDelete(){
        var form = document.getElementById("form");
        form.action = "<%=request.getContextPath()%>/individual/doDelete.action";
        form.submit();
    }
    
    function doQuery(){
        var form = document.getElementById("form");
        form.action = "<%=request.getContextPath()%>/individual/query.action";
        form.submit();
    }
  </script>
</body>
</html>
