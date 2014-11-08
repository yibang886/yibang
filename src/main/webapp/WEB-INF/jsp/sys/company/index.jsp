<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ page import="com.yb.sys.entity.UserExt" %>
<%@ include file="/core/include.jsp"%>
<!DOCTYPE html>
<html>

<head>
<title>HTML Page Title</title>
<link href="<%=request.getContextPath()%>/resource/styles/gzt_css.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/resource/js/pager/Pager.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/jquery.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/pager/jquery.pager.js"></script>

<link href="<%=request.getContextPath()%>/resource/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/bootstrap.min.js"></script>

<script type="text/javascript">
$(".pager").pager({ pagenumber: ${entityModel.currentPage}, pagecount: ${entityModel.pageCount}, buttonClickCallback: pageClick });

function pageClick(pageNum)
{
  $("input[name='currentPage']").val(pageNum);
  $("#form").submit();
}

function goView(id){
  var form = document.getElementById("form");
  form.action = "<%=request.getContextPath()%>/company/goView.action?dataId="+id
  form.submit();
}

function goEdit(id){
  var form = document.getElementById("form");
  form.action = "<%=request.getContextPath()%>/company/goEdit.action?dataId="+id
  form.submit();
}

function goValidate(id){
  var form = document.getElementById("form");
  form.action = "<%=request.getContextPath()%>/company/goValidate.action?dataId="+id 
  form.submit();
}

function goAuthenticate(id){
  var form = document.getElementById("form");
  form.action = "<%=request.getContextPath()%>/company/goAuthenticate.action?dataId="+id 
  form.submit();
}

function doDelete(id){
  var form = document.getElementById("form");
  form.action = "<%=request.getContextPath()%>/company/doDelete.action?dataId="+id
  form.submit();
}

function doQuery()
{
  var form = document.getElementById("form");
  form.action = "<%=request.getContextPath()%>/company/query";
  form.submit();
}

</script>

</head>

<body>

  <nav class="navbar navbar-default" role="navigation">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">译邦网-翻译公司</a>
    </div>
  
    <%! UserExt baseUserExt = null; %>
    <% baseUserExt = (UserExt)request.getSession().getAttribute("user"); %>

    <c:if test="<%= baseUserExt!=null %>">
      <div>
        <ul class="nav navbar-nav navbar-right">
          <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <%= baseUserExt.getemail() %>
              <b class="caret"></b>
            </a>
            <ul class="dropdown-menu">
              <li class="divider"></li>
              <li><a href="<%=request.getContextPath()%>/user/logout.action">退出</a></li>
            </ul>
          </li>
        </ul>
      </div>
    </c:if>
    <c:if test="<%= baseUserExt==null %>">
      <div>
        <ul class="nav navbar-nav navbar-right">
          <li class="active"><a href="<%=request.getContextPath()%>/login.jsp">登录</a></li>
        </ul>
      </div>
    </c:if>
  </nav>

  <%--
  <div class="weizhi">
    <div class="weizhi_bj">翻译公司信息</div>
  </div>
  --%>

  <form id="form" name="companyForm" method="post">

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
            <select name="companyQueryCon.valid_pass">
              <option value="3" <c:if test="${entityModel.companyQueryCon==null || entityModel.companyQueryCon.valid_pass>=3}"><c:out value="selected"/></c:if> >全部</option>
              <option value="0" <c:if test="${entityModel.companyQueryCon.valid_pass==0}"><c:out value="selected"/></c:if> >待审核</option>
              <option value="1" <c:if test="${entityModel.companyQueryCon.valid_pass==1}"><c:out value="selected"/></c:if> >审核通过</option>
              <option value="2" <c:if test="${entityModel.companyQueryCon.valid_pass==2}"><c:out value="selected"/></c:if> >审核未通过</option>
            </select>
          </div>
        </td>

        <td>
          <div>
            <b>认证状态：</b>
            <select name="companyQueryCon.auth_pass">
              <option value="3" <c:if test="${entityModel.companyQueryCon==null || entityModel.companyQueryCon.auth_pass>=3}"><c:out value="selected"/></c:if> >全部</option>
              <option value="0" <c:if test="${entityModel.companyQueryCon.auth_pass==0}"><c:out value="selected"/></c:if> >待认证</option>
              <option value="1" <c:if test="${entityModel.companyQueryCon.auth_pass==1}"><c:out value="selected"/></c:if> >认证通过</option>
              <option value="2" <c:if test="${entityModel.companyQueryCon.auth_pass==2}"><c:out value="selected"/></c:if> >认证未通过</option>
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
        <th width="10%">翻译公司信息列表</th>
        <th width="90%">
          <div>
          </div>
        </th>
      </tr>

      <tr>
        <td colspan="2">
          <table border="0" cellpadding="0" cellspacing="0" class="table_date" id="dataTable">
            <tr>
              <th width="15%"><div>公司logo</div></th>
              <th width="20%"><div>公司名称</div></th>
              <th width="15%"><div>所在城市</div></th>
              <th width="15%"><div>审核状态</div></th>
              <th width="15%"><div>认证状态</div></th>
              <th width="20%">操作 </th>
            </tr>

            <c:forEach var="var" items="${entityModel.items}">
              <tr onmouseover="this.className='over'" onmouseout="this.className='out'">
                <td><div><img src="${var.logo}" style="width:70px;height:56px;" /></div></td>
                <td><div><c:out value="${var.name}" escapeXml="true"/></div></td>
                <td><div><c:out value="${var.city.city}" escapeXml="true"/></div></td>
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

    <input type="hidden" name="currentPage" value="${entityModel.currentPage}"/>

  </form>

</body>
</html>
