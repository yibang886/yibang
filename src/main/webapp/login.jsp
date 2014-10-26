<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.yb.sys.entity.UserExt" %>
<%
UserExt baseUserExt = (UserExt)request.getSession().getAttribute("user");
if(baseUserExt!=null){ 
  if( baseUserExt.getuser_type()==2 || baseUserExt.getuser_type()==3 ) //管理员
  {
    response.sendRedirect(request.getContextPath()+"/admin.jsp");
  }
  else
  {
    //main page
    response.sendRedirect(request.getContextPath()+"/index.jsp");
  }
}
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<style type="text/css">
u {
	text-decoration: none;
	white-space: nowrap;
}

* {
	font-family: Tahoma, Verdana, Arial, Helvetica, sans-serif;
	font-size: 12px;
}

body {
	margin: 0;
	padding: 0;
	background: #F6F6F6;
}

form {
	margin: 0;
	padding: 0;
}

img {
	border: 0 none;
}

a {
	text-decoration: none;
}

em {
	font-style: normal;
}

.clearer {
	clear: both;
	display: block;
	font-size: 1px;
	height: 1px;
	margin: 0;
	padding: 0;
}

.signin {
	width: 360px;
	margin: 0 auto;
	float: none;
	padding: 0;
}

.signin .subcolumn01 .middle {
	float: left;
	width: 296px;
	height: 40px;
}

.signin .subcolumn01 .middle span {
	line-height: 40px;
	color: #000;
	font-weight: bold;
	font-size: 14px;
	padding-left: 4em;
}

.signin .subcolumn02 {
	width: 356px;
	overflow: hidden;
	zoom: 1;
	padding-bottom: 10px;
}

.strong-login .signin .subcolumn02 {
	padding-top: 20px;
}

.signin .subcolumn02 .signin-area {
	padding: 1px 17px;
	margin: 0 0 0 40px;
}

.signin .subcolumn02 .signin-area-bg {
	float: left;
	width: 296px;
}

.signin .subcolumn02 .signin-area-bg .padder {
	margin: 8px 0 0;
}

.signin .subcolumn02 .signin-area-bg .padder .sign-input {
	margin: 14px 0 0 0;
}

.signin .subcolumn02 .signin-area-bg .padder span.title {
	width: 60px;
	height: 20px;
	margin-right: 5px;
	_margin-top: 2px;
	text-indent: -999em;
	float: left;
	background: url("/style/5/images/login_btn.png") no-repeat;
}

.signin .subcolumn02 .signin-area-bg .padder span.account {
	background-position: 0 -36px;
}

.signin .subcolumn02 .signin-area-bg .padder span.password {
	background-position: -60px -36px;
}

.signin .subcolumn02 .signin-area-bg .padder span.code {
	background-position: -120px -36px;
}

.signin .subcolumn02 .signin-area-bg .padder span.input {
	display: block;
}

.signin .subcolumn02 .signin-area-bg .padder span.input a {
	margin-left: 7px;
	text-decoration: underline;
	color: #3472a3;
}

.signin .subcolumn02 .signin-area-bg .padder span.expand {
	padding-left: 5.9em;
	-moz-user-select: none;
	-khtml-user-select: none;
	width: 200px;
}

*:lang(en) .signin .subcolumn02 .signin-area-bg .padder span.expand {
	margin-left: -7px;
}

.signin .subcolumn02 .signin-area-bg .padder .input01 {
	width: 170px;
	border: 1px #ccc solid;
	color: #868686;
	font-size: 16px;
	padding: 2px;
	-moz-border-radius: 10px;
	-webkit-border-radius: 10px;
	-khtml-border-radius: 10px;
	-border-radius: 10px;
	outline: none;
}

.signin .subcolumn02 .signin-area-bg .padder .validate {
	color: #808080;
	margin: 0;
}

.valcode .pic {
	padding: 5px 0 0 68px;
}

.valcode .pic img {
	width: 130px;
	height: 53px;
}

.signin .subcolumn03 {
	clear: both;
}

.strong-login .signin .subcolumn03 {
	margin: 10px 0;
}

.signin .subcolumn03 .left {
	float: left;
}

.signin .subcolumn03 .middle {
	float: left;
}

.signin .subcolumn03 .middle .middle-padder {
	float: left;
	padding: 15px 0 0 55px;
}

.signin-btn {
	background:
		url("https://ui.ptlogin2.qq.com/style.ssl/16/images/login_btn.png")
		no-repeat 0 0;
	font-size: 16px;
	width: 124px;
	height: 36px;
	border: 0;
	text-align: center;
	line-height: 20px;
	color: #0C4E7C;
	cursor: pointer;
	margin-left: 14px;
	margin-top: 14px;
}

.signin2 {
	float: left;
	margin-left: 0;
}

.signin .subcolumn03 .middle .signup-btn {
	background: url("/style/5/images/login_btn.png") no-repeat 0 0;
	width: 111px;
	height: 36px;
	display: block;
	border: 0;
	text-align: center;
	line-height: 20px;
	color: #0C4E7C;
	cursor: pointer;
	outline: none;
	float: left;
}

.signin .subcolumn03 .right {
	float: left;
}

.signin.yui-panel,.signin.yui-panel .hd,.signin.yui-panel .bd,.signin.yui-panel .ft
	{
	margin: 0;
	padding: 0;
	border: none;
	background: none;
}

.signin.yui-panel .hd {
	font-weight: normal;
}

.signin-area-bg .expand {
	display: block;
	width: 16em;
	margin-left: 55px;
}

.middle-padder {
	width: 280px;
}

.middle-padder span {
	float: left;
}

.valcode {
	padding: 2px 0 0 0;
}

.valcode a {
	color: #3472a3;
	text-decoration: underline;
}

.valcode .expand {
	padding: 10px 0;
	float: left;
}

.bottom-padder {
	clear: both;
	text-align: center;
	padding: 6px 0;
	width: 356px;
}

.bottom-padder a {
	color: #3472A3;
	margin: 10px;
	text-decoration: underline;
}

.verify_text {
	padding: 3px 0 0 68px;
}

.err_m {
	display: none;
	color: #f00;
}

.signin-extend {
	margin: 8px 0 0 58px;
}

.webqq-checkbox {
	font-size: 12px;
	line-height: 2;
	float: left;
	margin-right: 20px;
}

.webqq-checkbox span {
	width: 20px;
	height: 20px;
	float: left;
	cursor: pointer;
	background: url("/style/5/images/ptlogin.gif") no-repeat scroll -40px
		-16px transparent;
}

.webqq-checkbox .checked {
	background-position: -60px -16px;
}

.login-state-trigger {
	cursor: pointer;
	display: block;
	float: left;
	height: 16px;
	overflow: hidden;
	width: 120px;
	margin: 4px 0 0 0;
}

.login-state-trigger2 {
	margin: 10px 0 0 20px;
}

.login-state-down {
	background: url("/style/5/images/ptlogin.gif") no-repeat scroll 0 -22px
		transparent;
	float: left;
	height: 6px;
	margin-top: 5px;
	overflow: hidden;
	text-indent: -999em;
	width: 7px;
}

.login-state-show {
	float: left;
	height: 14px;
	overflow: hidden;
	text-indent: -999em;
	width: 14px;
	margin: 1px 4px 0 0;
}

.login-state-txt {
	float: left;
	margin-left: 5px; >
	line-height: 18px !important;
}

.login-state .callme {
	background: url("/style/5/images/ptlogin.png") -72px 0 no-repeat;
	_background: url("/style/5/images/ptlogin.gif") -72px 0 no-repeat;
}

.login-state .online {
	background: url("/style/5/images/ptlogin.png") 0 0 no-repeat;
	_background: url("/style/5/images/ptlogin.gif") 0 0 no-repeat;
}

.login-state .away {
	background: url("/style/5/images/ptlogin.png") -18px 0 no-repeat;
	_background: url("/style/5/images/ptlogin.gif") -18px 0 no-repeat;
}

.login-state .busy {
	background: url("/style/5/images/ptlogin.png") -36px 0 no-repeat;
	_background: url("/style/5/images/ptlogin.gif") -36px 0 no-repeat;
}

.login-state .silent {
	background: url("/style/5/images/ptlogin.png") -108px 0 no-repeat;
	_background: url("/style/5/images/ptlogin.gif") -108px 0 no-repeat;
}

.login-state .hidden {
	background: url("/style/5/images/ptlogin.png") -54px 0 no-repeat;
	_background: url("/style/5/images/ptlogin.gif") -54px 0 no-repeat;
}

.statePanel {
	position: absolute;
	right: 57px;
	top: 20px;
	z-index: 10;
	margin: 0;
	border-width: 1px;
	border-style: solid;
	border-color: #ccc #6a6a6a #666 #cdcdcd;
	padding: 0;
	width: 100px;
	height: 133px;
	overflow: hidden;
	background: white;
	font-size: 12px;
	line-height: 1.5;
	display: none;
}

.statePanel .statePanel_li {
	display: block;
	float: left;
	margin: 0;
	padding: 3px 0;
	width: 100px;
	height: 16px;
	line-height: 16px;
	overflow: hidden;
	zoom: 1;
	cursor: pointer;
}

.stateSelect_icon {
	float: left;
	margin: 2px 0 0 5px;
	width: 14px;
	height: 14px;
	overflow: hidden;
}

.stateSelect_text {
	margin: 0 0 0 22px;
}

.main {
	background-color: #ffffff;
}
</style>
<title>译邦管理系统</title>
<style>
.main {
	background-color: #ffffff;
}

/*修改*/
* {
	font-family: '微软雅黑', 'Helvetica Neue', Helvetica, Arial, sans-serif;
}

.login-state-trigger {
	float: right;
}

.signin {
	position: relative;
	width: 700px;
}

.signin .subcolumn02 {
	width: 100%;
	overflow: visible;
}

.qrlogin {
	float: left;
	text-align: center;
}

.signin .subcolumn02 .signin-area {
	float: left;
	width: 240px;
	margin: 0 0 0 50px;
	/*text-align: center;*/
}

.qr_title_text,.qr_title_text a,.input_login_text,.m_input_login_text {
	margin: 0;
	padding: 0;
	font-size: 18px;
	color: rgb(131, 131, 131);
	font-weight: 100;
	margin-bottom: 30px;
}

.qr_title_text { /*text-indent: -9999px;*/
	/*background:url("/style.ssl/16/images/safe_title.png") no-repeat;*/
	width: 200px;
	margin: 0;
	display: inline-block;
	height: 40px;
	margin-bottom: 15px;
}

.strong-login .signin .subcolumn02 {
	padding-top: 40px;
}

.signin-area {
	margin: 0 0 0 50px;
}

.signin .subcolumn02 .signin-area-bg {
	margin-top: 0;
}

.sign-input {
	margin-top: 0;
}

.signin .subcolumn02 .signin-area-bg .padder .input01 {
	-webkit-border-radius: 5px;
	-khtml-border-radius: 5px;
	-border-radius: 5px;
	height: 30px;
	width: 240px;
	padding-left: 10px;
}

.signin .subcolumn03 .middle .middle-padder {
	padding: 0;
}

.input_login_text,.m_input_login_text {
	text-align: left;
}

.m_input_login_text {
	display: none;
}

.qrlogin {
	width: 340px;
}

.strong-login .signin .subcolumn03 {
	margin-top: 0;
}

.signin .subcolumn03 .middle .signin-btn {
	color: white;
	font-size: 16px;
	width: 124px;
	background: url("/style.ssl/16/images/login_btn.png") no-repeat 0 0;
}

.signin .subcolumn02 .signin-area-bg .padder .sign-input {
	margin-top: 0;
}

.signin .subcolumn02 .signin-area-bg .padder {
	margin-top: 0;
}
/*#loginform{
	background-image: url('/style.ssl/16/images/login_middle_line.png');
	background-repeat: no-repeat;
	background-position: center 0;
}*/
.signin-area-bg {
	position: relative;
	_height: 253px;
	min-height: 253px;
}

.logins {
	margin-top: 10px;
}

#p {
	margin-top: 18px;
}

#qrlogin_step1 {
	position: relative;
	width: 184px;
	height: 184px;
	margin: 0 auto;
	border: 1px solid rgb(139, 141, 144);
}

#qrlogin_step2 {
	display: none;
	height: 380px;
	width: 700px;
	background: #F6F6F6;
	position: absolute;
	top: 0;
	left: 0;
	z-index: 10;
}

#qrlogin_img {
	margin-top: 14px;
	width: 156px;
}

#qrlogin_step2 .kao {
	margin: 80px 0 0 100px;
	text-align: left;
	color: rgb(131, 131, 131);
	padding-top: 1px;
}

.kao_logo {
	width: 136px;
	height: 192px;
	float: left;
	background: url("/style.ssl/16/images/scan_succ.png") no-repeat 0 0;
}

.kao_title {
	font-size: 18px;
	margin: 65px 0 15px 140px;
}

.kao_tips {
	font-size: 14px;
	margin-left: 140px;
}

#cancel_qrlogin {
	color: #579fe9;
}

.service_items_container {
	width: 280px;
	color: rgb(131, 131, 131);
}

.service_items_container a.suggestion {
	border-right: none;
}

#mq_login_title {
	position: relative;
	margin: 62px auto 40px;
	text-align: center;
	font-size: 30px;
	width: 500px;
}

.mq_link_wrap {
	margin-top: 30px;
	text-align: center;
}

#mq_link {
	background: rgb(131, 182, 247);
	border-radius: 5px;
	color: white;
	box-shadow: 1px 1px 3px rgba(0, 0, 0, 0.7);
	padding: 8px;
}

.logins:after {
	visibility: hidden;
	display: block;
	font-size: 0;
	content: " ";
	clear: both;
	height: 0;
}

.logins {
	zoom: 1;
}

.left {
	margin-bottom: 80px;
}

.qrlogin_bg {
	position: relative;
}

.qrlogin_logo {
	width: 42px;
	height: 47px;
	position: absolute;
	left: 50%;
	top: 50%;
	margin: -24px 0 0 -21px;
	background: url('/style.ssl/16/images/icon_qq_QR.png') center center;
}

.guide_img {
	cursor: pointer;
	display: none;
	position: absolute;
	width: 200px;
	height: 362px;
	right: -215px;
	top: -80px;
	z-index: 99;
	opacity: 0;
	-webkit-transition: opacity 0.4s;
}

.guide_img_inner {
	pointer-events: none;
	width: 245px;
	height: 300px;
	background: url('/style.ssl/16/images/default_qq_QR.png');
	background-size: 100% 100%;
}

.mq_logo {
	display: none;
}

.copyright_page_footer {
	text-align: center;
	color: #555;
	margin-top: 40px;
}

.signin .subcolumn02 .signin-area-bg .padder span.title {
	width: 70px;
	height: 20px;
	margin-right: 5px;
	margin-top: 10px;
	float: left;
	font-size: 16px;
	background: none;
	text-indent: 0;
}

.title.code {
	width: 150px;
	margin: 10px 0;
}

#verifycode {
	margin-top: 5px;
	width: 100px;
}

#verifyshow {
	float: left;
	clear: left;
	padding: 0;
}

#imgVerify {
	float: left;
}

#changeimg_link {
	float: left;
	margin: 10px 10px 0 10px;
	padding: 4px 2px;
}

.use_tips {
	margin-top: 20px;
	display: inline-block;
	padding: 10px 15px;
	background: rgb(233, 233, 233);
	-webkit-border-radius: 25px;
	-khtml-border-radius: 25px;
	-border-radius: 25px;
	color: rgb(115, 115, 115);
}

.use_tips a {
	color: rgb(52, 129, 207);
}

.question_icon {
	margin-left: 5px;
	padding: 2px 10px;
	background:
		url('https://ui.ptlogin2.qq.com/style.ssl/16/images/question_icon.png')
		no-repeat;
}

#qr_mask_wrap {
	display: none;
}

.qr_mask {
	cursor: pointer;
	background: black;
	opacity: 0.8;
}

.qr_mask,.qr_mask_text {
	display: block;
	position: absolute;
	width: 100%;
	height: 100%;
	left: 0;
	top: 0;
	color: white;
	line-height: 184px;
}

.qr_mask_text {
	cursor: pointer;
}

.signin_sep {
	float: left;
	width: 1px;
	margin: 0 5px;
	height: 345px;
	position: relative;
}

.signin_sep_line {
	background: #E6E6E6;
	width: 100%;
	height: 100%;
	display: block;
}

.signin_sep_text {
	background: #F6F6F6;
	color: #b8b8b8;
	position: absolute;
	top: 40%;
	padding: 3px 0;
	width: 40px;
	display: block;
	left: -20px;
	text-align: center;
}

.err_m {
	margin-bottom: 14px;
}
.footer {
		width: 310px;
		margin: 0 auto;
	}
@media screen and (max-width : 1024px) {
	* {
		font-family: HelveticaNeue, Helvetica, STHeiTi, sans-serif;
	}
	.m_input_login_text {
		text-align: left;
	}
	.signin .subcolumn02 .signin-area {
		width: 100%;
		float: none;
		margin: 0 auto;
		padding: 0;
	}
	.signin_sep {
		display: none;
	}
	#qrlogin {
		display: none;
	}
	#loginform {
		background: none;
	}
	#mq_login_title {
		display: none;
	}
	.service_items_container {
		display: none;
	}
	.signin {
		width: auto;
	}
	.m_input_login_text {
		display: block;
	}
	.input_login_text {
		display: none;
	}
	.mq_link_wrap {
		display: none;
	}
	#u,#p {
		-moz-box-sizing: border-box;
		-webkit-box-sizing: border-box;
		box-sizing: border-box;
		width: 100%;
		padding: 5px;
		height: 45px;
	}
	#u {
		-moz-box-shadow: inset 0px 1px 4px rgba(0, 0, 0, .2);
		-webkit-box-shadow: inset 0px 1px 4px rgba(0, 0, 0, .2);
		box-shadow: inset 0px 1px 4px rgba(0, 0, 0, .2);
		-moz-border-radius: 4px 4px 0 0;
		-webkit-border-radius: 4px 4px 0 0;
		border-radius: 4px 4px 0 0;
	}
	#p {
		margin-top: -1px;
		-moz-border-radius: 0 0 4px 4px;
		-webkit-border-radius: 0 0 4px 4px;
		border-radius: 0 0 4px 4px;
	}
	#login_button {
		width: 100%;
		border: 1px solid #40a217;
		background: #71c228;
		background: -webkit-gradient(linear, left top, left bottom, from(#71c228),
			to(#75c92a) );
		background: -webkit-linear-gradient(top, #71c228, #75c92a);
		background: -moz-linear-gradient(top, #71c228, #75c92a);
		background: -ms-linear-gradient(top, #71c228, #75c92a);
		background: -o-linear-gradient(top, #71c228, #75c92a);
		background: linear-gradient(top, #71c228, #75c92a);
		filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#71c228',
			endColorstr='#75c92a', GradientType=0 );
		-webkit-box-shadow: 0 1px 1px rgba(0, 0, 0, 0.13), inset 0 1px 1px
			#9ed74a;
		-moz-box-shadow: 0 1px 1px rgba(0, 0, 0, 0.13), inset 0 1px 1px #9ed74a;
		box-shadow: 0 1px 1px rgba(0, 0, 0, 0.13), inset 0 1px 1px #9ed74a;
		margin: 0 auto;
		display: block;
		-moz-border-radius: 4px;
		-webkit-border-radius: 4px;
		border-radius: 4px;
		font-weight: bold;
		height: 46px;
		clear: left;
	}
	.signin .subcolumn02 .signin-area-bg {
		float: none;
		width: auto;
	}
	.left {
		width: 100%;
	}
	.padder {
		
	}
	.signin .subcolumn03 .middle .middle-padder {
		width: auto;
		float: none;
	}
	.signin .subcolumn03 .middle {
		float: none
	}
	#loginState {
		border: 1px solid rgb(207, 207, 207);
		background: #FFFFFF;
		background: -webkit-gradient(linear, left top, left bottom, from(#FFFFFF),
			to(#CECECE) );
		background: -webkit-linear-gradient(top, #FFFFFF, #CECECE);
		background: -moz-linear-gradient(top, #FFFFFF, #CECECE);
		background: -ms-linear-gradient(top, #FFFFFF, #CECECE);
		background: -o-linear-gradient(top, #FFFFFF, #CECECE);
		background: linear-gradient(top, #FFFFFF, #CECECE);
		filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#FFFFFF',
			endColorstr='#CECECE', GradientType=0 );
		padding: 10px 10px;
		width: 80px;
		margin: 0 0 10px;
		-moz-border-radius: 4px;
		-webkit-border-radius: 4px;
		border-radius: 4px;
	}
	.strong-login .signin .subcolumn02 {
		padding: 20px 10px;
		box-sizing: border-box;
		-webkit-box-sizing: border-box;
		-moz-box-sizing: border-box;
	}
	.mq_logo {
		display: inline-block;
		width: 31px;
		height: 34px;
		background-color: red;
		background: url('/style.ssl/16/images/mq_icon.png');
		background-size: 100% 100%;
		margin-bottom: -10px;
	}
	.m_input_login_text {
		font-size: 20px;
		margin-left: 10px;
		color: rgb(31, 31, 31);
		display: inline-block;
	}
	.login-state-trigger {
		float: left;
	}
	.statePanel .statePanel_li {
		width: 150px;
		padding: 10px 15px;
	}
	.statePanel {
		width: 150px;
		height: 220px;
		-moz-border-radius: 4px;
		-webkit-border-radius: 4px;
		border-radius: 4px;
	}
	#verifycode_wrap {
		float: left;
	}
	.left {
		margin-bottom: 0px;
	}
	.signin-area-bg {
		min-height: 0;
	}
	#verifycode {
		margin-top: 0px;
		width: 60px;
		height: 45px;
	}
	.use_tips {
		display: none;
	}
	.qr_mask,.qr_mask_text,#qr_mask_wrap {
		display: none;
	}
	
}
</style>
</head>
<body class="strong-login">

	<div id="mq_login_title">译邦管理系统</div>
	<div class="signin" id="login">

		<form id="loginform" autocomplete="off" name="loginform"
			action="<%=request.getContextPath()%>/user/login" method="post"
			style="margin: 0px;">
			<div class="subcolumn02" style="position: relative;">
				<div>
					<div id="signinArea" class="signin-area"
						style="margin: auto 30% auto 70%">
						<h4 class="input_login_text">邮箱密码登录</h4>
						<div class="signin-area-bg">
							<div class="padder">
								<div id="err_m" class="err_m"></div>
								<div class="sign-input">
									<span class="input"><input autocomplete="on"
										name="email" id="u" type="text" style="ime-mode: disabled"
										class="input01" tabindex="1" value="登录邮箱"
										onfocus="if (value =='登录邮箱'){value =''}"
										onblur="if (value ==''){value='登录邮箱';}" /></span>
								</div>
								<div class="sign-input">
									<span class="input"><input name="password" id="p"
										maxlength="16" type="password" class="input01" tabindex="2" /></span>
								</div>
								<%--  
								<div class="sign-input">
									<span class="input">
										<input name="yanzhengma" type="text" class="input01" tabindex="3" style="width:120px;margin-top: 18px;"/>
										<img name="yanzhengma"  src="<%=request.getContextPath()%>/image.jsp" width="60" height="20" border="1" align="absmiddle">
									</span>
								</div>
								--%>
								<input type="submit" class="signin-btn signin2" tabindex="6"
									id="login_button" value="登  录">
								<div class="clearer"></div>
							</div>
						</div>
					</div>
				</div>
        <div style="color:red">${error}</div>
			</div>
			<div class="clearer"></div>
			<div class="mq_link_wrap"></div>
		</form>
	</div>
	<div class="footer">Copyright @2007-2014 Yibang-Project. All Rights Reserved.</div>
	<%--4--%>
</body>
</html>
