<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//StringBuffer sbMenu = (StringBuffer)session.getAttribute("menu");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="resource/css/tree.css" rel="stylesheet" type="text/css" >
<script type="text/javascript" src="resource/js/funcTree.js"></script>
<script type="text/javascript">
	<%
	StringBuffer sbMenu = new StringBuffer();
	sbMenu.append("var Tree = new Array;");

  sbMenu.append("Tree[")
 	  .append(0)
	  .append("]")
 	  .append(" = ")
 	  .append("\"")
 	  .append("1")
 	  .append("|")
 	  .append("")
 	  .append("|")
 	  .append("目录")
 	  .append("|").append(request.getContextPath() + "/language/query.action").append("\";");

    sbMenu.append("Tree[")
	  .append(1)
	  .append("]")
	  .append(" = ")
	  .append("\"")
	  .append("2")
	  .append("|")
	  .append("1")
	  .append("|")
	  .append("个人译员")
	  .append("|").append(request.getContextPath() + "/individual/query.action").append("\";");

    sbMenu.append("Tree[")
	  .append(2)
	  .append("]")
	  .append(" = ")
	  .append("\"")
	  .append("3")
	  .append("|")
	  .append("1")
	  .append("|")
	  .append("用户")
	  .append("|").append(request.getContextPath() + "/user/query.action").append("\";");
    
    sbMenu.append("Tree[")
	  .append(3)
	  .append("]")
	  .append(" = ")
	  .append("\"")
	  .append("4")
	  .append("|")
	  .append("1")
	  .append("|")
	  .append("语种")
	  .append("|").append(request.getContextPath() + "/language/query.action").append("\";");

    sbMenu.append("Tree[")
	  .append(4)
	  .append("]")
	  .append(" = ")
	  .append("\"")
	  .append("5")
	  .append("|")
	  .append("1")
	  .append("|")
	  .append("专业领域")
	  .append("|").append(request.getContextPath() + "/field/query.action").append("\";");

    sbMenu.append("Tree[")
	  .append(5)
	  .append("]")
	  .append(" = ")
	  .append("\"")
	  .append("6")
	  .append("|")
	  .append("1")
	  .append("|")
	  .append("服务项目")
	  .append("|").append(request.getContextPath() + "/transtype/query.action").append("\";");

    sbMenu.append("Tree[")
	  .append(6)
	  .append("]")
	  .append(" = ")
	  .append("\"")
	  .append("7")
	  .append("|")
	  .append("1")
	  .append("|")
	  .append("文档类型")
	  .append("|").append(request.getContextPath() + "/doctype/query.action").append("\";");

    sbMenu.append("Tree[")
	  .append(7)
	  .append("]")
	  .append(" = ")
	  .append("\"")
	  .append("8")
	  .append("|")
	  .append("1")
	  .append("|")
	  .append("推荐位")
	  .append("|").append(request.getContextPath() + "/recompos/query.action").append("\";");

    sbMenu.append("Tree[")
	  .append(8)
	  .append("]")
	  .append(" = ")
	  .append("\"")
	  .append("9")
	  .append("|")
	  .append("1")
	  .append("|")
	  .append("教育水平")
	  .append("|").append(request.getContextPath() + "/education/query.action").append("\";");

    sbMenu.append("Tree[")
	  .append(9)
	  .append("]")
	  .append(" = ")
	  .append("\"")
	  .append("10")
	  .append("|")
	  .append("1")
	  .append("|")
	  .append("城市")
	  .append("|").append(request.getContextPath() + "/city/query.action").append("\";");

    sbMenu.append("Tree[")
	  .append(10)
	  .append("]")
	  .append(" = ")
	  .append("\"")
	  .append("11")
	  .append("|")
	  .append("1")
	  .append("|")
	  .append("毕业院校")
	  .append("|").append(request.getContextPath() + "/school/query.action").append("\";");

		out.print(sbMenu);
	%>
</script>
</head>
<body>
<body bgcolor="#f3f3f3"  leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" style="background:url(resource/images/lefttreebg.jpg) left top repeat-x ; ">
	<div id="tree">
		<script type="text/javascript">
			createTree(Tree,null,null,7,null,null);
		</script>
	</div>
</body>
</body>
</html>
