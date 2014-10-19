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
        <th width="33%">按条件过滤</th>
        <th width="33%"/>
        <th width="33%"/>
      </tr>

      <tr>
        <td>
          <div>
            <b>审核状态：</b>
            <select name="individualQueryCon.valid_pass">
              <option value="3" <c:if test="${individualModel.individualQueryCon==null || individualModel.individualQueryCon.valid_pass>=3}"><c:out value="selected"/></c:if> >全部</option>
              <option value="0" <c:if test="${individualModel.individualQueryCon.valid_pass==0}"><c:out value="selected"/></c:if> >待审核</option>
              <option value="1" <c:if test="${individualModel.individualQueryCon.valid_pass==1}"><c:out value="selected"/></c:if> >审核通过</option>
              <option value="2" <c:if test="${individualModel.individualQueryCon.valid_pass==2}"><c:out value="selected"/></c:if> >审核未通过</option>
            </select>
          </div>
        </td>
        <td>
          <div>
            <b>认证状态：</b>
            <select name="individualQueryCon.auth_pass">
              <option value="3" <c:if test="${individualModel.individualQueryCon==null || individualModel.individualQueryCon.auth_pass>=3}"><c:out value="selected"/></c:if> >全部</option>
              <option value="0" <c:if test="${individualModel.individualQueryCon.auth_pass==0}"><c:out value="selected"/></c:if> >待认证</option>
              <option value="1" <c:if test="${individualModel.individualQueryCon.auth_pass==1}"><c:out value="selected"/></c:if> >认证通过</option>
              <option value="2" <c:if test="${individualModel.individualQueryCon.auth_pass==2}"><c:out value="selected"/></c:if> >认证未通过</option>
            </select>
          </div>
        </td>
        <td>
          <div>
            <input type="button" value="过滤" onclick="doQuery()"/>
          </div>
        </td>
      </tr>
    </table>

    <table border="0" cellpadding="0" cellspacing="0" class="table_list">
      <tr>
        <th width="10%">个人译员信息列表</th>
        <th width="90%">
          <div>
          </div>
        </th>
      </tr>


      <tr>
        <td colspan="2">
          <table border="0" cellpadding="0" cellspacing="0" class="table_date" id="dataTable">
            <tr>
                  <th width="20%"><div>近期照片 </div></th>
                  <th width="15%"><div>姓名 </div></th>
                  <th width="l5%"><div>邮箱 </div></th>
                  <th width="15%"><div>审核状态 </div></th>
                  <th width="15%"><div>认证状态 </div></th>
                  <th width="20%">操作 </th>
            </tr>

            <c:forEach var="var" items="${individualModel.items}">
              <tr onmouseover="this.className='over'" onmouseout="this.className='out'">
                    <td><div><img src="/ybfiles/individual/${var.id}/photo/small${var.photo_suffix}"/></div></td>
                    <td><div><c:out value="${var.name}" escapeXml="true"/></div></td>
                    <td><div><c:out value="${var.user.email}" escapeXml="true"/></div></td>
                    <td><div>
                        <c:if test="${var.valid_pass==0}"><c:out value="待审核" escapeXml="true"/></c:if>
                        <c:if test="${var.valid_pass==1}"><c:out value="审核通过" escapeXml="true"/></c:if>
                        <c:if test="${var.valid_pass==2}"><c:out value="审核未通过" escapeXml="true"/></c:if>
                    </div></td>
                    <td><div>
                        <c:if test="${var.auth_pass==0}"><c:out value="待认证" escapeXml="true"/></c:if>
                        <c:if test="${var.auth_pass==1}"><c:out value="认证通过" escapeXml="true"/></c:if>
                        <c:if test="${var.auth_pass==2}"><c:out value="认证未通过" escapeXml="true"/></c:if>
                    </div></td>
                    <td>
                      <%--
                      what not use href here? because we want to pass the individualModel.individualQueryCon back
                      to controller; thus we need to submit the form;
                      --%>
                      <a onclick="goView(${var.id})">查看</a>
                      &nbsp;&nbsp;
                      <a onclick="goEdit(${var.id})">编辑</a>
                      &nbsp;&nbsp;
                      <a onclick="goValidate(${var.id})">审核</a>
                      &nbsp;&nbsp;
                      <a onclick="goAuthenticate(${var.id})">认证</a>
                      &nbsp;&nbsp;
                      <a onclick="doDelete(${var.id})">删除</a>
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
    
    function doQuery(){
        var form = document.getElementById("form");
        form.action = "<%=request.getContextPath()%>/individual/query.action";
        form.submit();
    }

    function goView(id){
        var form = document.getElementById("form");
        form.action = "<%=request.getContextPath()%>/individual/goView.action?dataId="+id 
        form.submit();
    }

    function goEdit(id){
        var form = document.getElementById("form");
        form.action = "<%=request.getContextPath()%>/individual/goEdit.action?dataId="+id 
        form.submit();
    }

    function goValidate(id){
        var form = document.getElementById("form");
        form.action = "<%=request.getContextPath()%>/individual/goValidate.action?dataId="+id 
        form.submit();
    }

    function goAuthenticate(id){
        var form = document.getElementById("form");
        form.action = "<%=request.getContextPath()%>/individual/goAuthenticate.action?dataId="+id 
        form.submit();
    }

    function doDelete(id){
        var form = document.getElementById("form");
        form.action = "<%=request.getContextPath()%>/individual/doDelete.action?dataId="+id 
        form.submit();
    }

  </script>
</body>
</html>
