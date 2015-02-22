<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.yb.sys.entity.UserExt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>提示消息</title>

<style type="text/css">
u {
	text-decoration: none;
	white-space: nowrap;
}

* {
	font-family: Tahoma, Verdana, Arial, Helvetica, sans-serif;
	font-size: 12px;
}

.clearer {
	clear: both;
	display: block;
	font-size: 1px;
	height: 1px;
	margin: 0;
	padding: 0;
}

.info {
	width: 360px;
	margin: 0 auto;
	float: none;
	padding: 0;
}

#mq_info_title {
	position: relative;
	margin: 62px auto 40px;
	text-align: center;
	font-size: 20px;
	width: 500px;
}

.strong-info .info .subcolumn02 {
	padding-top: 40px;
}

.strong-info .info .subcolumn03 {
	margin-top: 0;
}

.err_m {
	margin-bottom: 14px;
}

@media screen and (max-width : 1024px) {
	* {
		font-family: HelveticaNeue, Helvetica, STHeiTi, sans-serif;
	}
	.mq_link_wrap {
		display: none;
	}
}
</style>
</head>
<body class="strong-info">
        <div id="mq_info_title">${title}</div>

	<div class="info" id="info">
		<div style="color:red">${err_msg}</div>
		<div class="clearer"></div>
		<div class="mq_link_wrap"></div>
	</div>
</body>
</html>
