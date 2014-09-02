<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登出</title>
</head>
<body>
<script type="text/javascript">
window.top.location = "<%=request.getContextPath()%>/login.jsp";
</script>
</body>
</html>