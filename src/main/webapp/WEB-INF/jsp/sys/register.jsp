<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ page import="com.yb.sys.entity.UserExt" %>
<%@ include file="/core/include.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>译邦-注册</title>
    <meta name="keywords" content="译邦" />
    <meta name="description" content="译邦" />
    <base target="_blank" />

    <link href="<%=request.getContextPath()%>/resource/ybcss/bootstrap.part.hyg.css" rel="stylesheet" type="text/css" />
    <link href="<%=request.getContextPath()%>/resource/ybcss/project.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/jquery.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/bootstrap.min.js"></script>
</head>
<body>
<div class="pwindow register-page">
    <div class="phead">
        <div class="parea">
            <div class="hot-phone">
                客服热线：028-6580-6596
            </div>
            <div class="right-tools">
                <a href="goRegister.action" target="_self">注册</a>

                <%! UserExt baseUserExt = null; %>
                <% baseUserExt = (UserExt)request.getSession().getAttribute("user"); %>
               
                <c:choose>
                    <c:when test="<%= baseUserExt==null %>">
                        <a class="login-link" href="goLogin.action" target="_self">登录</a>
                    </c:when>
                    <c:otherwise>
                      <ul class="nav navbar-nav">
                        <li class="dropdown">
                          <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <%= baseUserExt.getemail() %>
                            <b class="caret"></b>
                          </a>
                          <ul class="dropdown-menu">
                            <li><a href="home?id=${user.id}&type=${user.user_type}" target="_self">空间</a></li>
                            <li><a href="<%=request.getContextPath()%>/logout.action" target="_self">退出</a></li>
                          </ul>
                        </li>
                      </ul>
                    </c:otherwise>
                </c:choose>

                <span class="spline">|</span><a href="aboutYibang.action" target="_self">关于</a>
            </div>            
        </div>
    </div>     
    <div class="pbody">
        <div class="parea head-search clearfix">
            <div class="logo"><a href="index.action" target="_self"><img src="<%=request.getContextPath()%>/resource/ybimg/logo.png" alt=""></a></div>
            <div class="search">
                <form id="search_form" method="get" target="_self">
                    <input name="st" type="text" class="search-input"/>
                    <input type="submit" value="搜索" class="search-btn" onclick="goTextSearch()"/>
                </form>
            </div>
        </div>

        <div class="pmain-content">
            <div class="parea">
                <div class="parea-wrap">

                    <div class="breadcrumb clearfix">
                        <div class="crumb">
                            <a href="index.action" target="_self">主页</a> &gt; <a>注册</a>
                        </div>
                        <div class="back-index">
                            <a href="index.action" target="_self">返回主页</a>
                        </div>
                    </div>
                    <div class="register-mod">
                        <div class="common-info-mod2">
                            <div class="cinfo-hd">
                                <h2>注册(带*号项为必填项; 移动电话、固定电话、QQ和微信至少选一)</h2>
                            </div>
                            <div class="cinfo-bd">
                                <form class="c-info-form modify-info-form" method="post" id="form" name="userForm" target="_self">
                                    <div class="form-group">
                                        <span class="form-label">登录邮箱(*)</span>
                                        <div class="form-control">
                                            <input required id="emailInput" name="userExt.email" type="email" 
                                                            value="<c:out value="${ userModel.userExt.email }" escapeXml="true" />" onblur="validateEmail()" onfocus="emailValid=2;"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <span class="form-label">登录密码(*)</span>
                                        <div class="form-control">
                                            <input required id="pwdInput" name="userExt.password" type="password" 
                                                            value="<c:out value="${ userModel.userExt.password }" escapeXml="true" />" />
                                            &nbsp;&nbsp;(6到10位密码)
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <span class="form-label">用户类型(*)</span>
                                        <div class="form-control">
                                            <select required name="userExt.user_type">
                                                <c:choose>
                                                    <c:when test="${userType==0}">
                                                        <option value="0" selected="true">个人译员</option>
                                                        <option value="1">翻译公司</option>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <option value="0">个人译员</option>
                                                        <option value="1" selected="true">翻译公司</option>
                                                    </c:otherwise>
                                                </c:choose>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <span class="form-label">移动电话</span>
                                        <div class="form-control">
                                            <input required id="mobInput" name="userExt.mobile" type="digits" 
                                                            value="<c:out value="${ userModel.userExt.mobile }" escapeXml="true" />" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <span class="form-label">固定电话</span>
                                        <div class="form-control">
                                            <input id="telInput" name="userExt.tel" type="digits" value="<c:out value="${ userModel.userExt.tel }" escapeXml="true" />" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <span class="form-label">传真</span>
                                        <div class="form-control">
                                            <input id="faxInput" name="userExt.fax" type="digits" value="<c:out value="${ userModel.userExt.fax }" escapeXml="true" />" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <span class="form-label">QQ号</span>
                                        <div class="form-control">
                                            <input id="qqInput" name="userExt.qq" type="digits" value="<c:out value="${ userModel.userExt.qq }" escapeXml="true" />" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <span class="form-label">微信号</span>
                                        <div class="form-control">
                                            <input id="wxInput" name="userExt.weixin" type="text" value="<c:out value="${ userModel.userExt.weixin }" escapeXml="true" />" />
                                        </div>
                                    </div> 

                                    <div class="form-btns">
                                        <input class="form-submit form-submit-b" type="button" value="提交" onclick="doUserCreate()" >
                                    </div> 
                                </form>
                            </div>
                        </div>                          
                    </div>

                </div>               
            </div>
        </div>        
    </div>  
    <div class="pfoot">
        <div class="parea">
            <div class="flinks">
                <div class="flinks-l">
                    <a href="index.action" target="_self">首页</a> | 
                    <a href="disclaimer.action" target="_self">免责声明</a> | 
                    <a href="aboutYibang.action" target="_self">关于译邦 </a> | 
                    <a href="onlineServ.action" target="_self">在线翻译 </a> |  
                    <a href="ally.action" target="_self">合作机构</a> | 
                    <a href="advertise.action" target="_self">广告服务 </a> | 
                    <a href="contactUs.action" target="_self">联系我们</a>            
                </div>
                <div class="flinks-r">
                    © 2014 译邦 All rights reserved 译邦信息服务(北京)有限公司 京ICP证 100953号
                </div>
            </div>
            <div class="frel-lst">
                    <ul>
                        <li style="margin-left:0px;">
                              <a href="http://www.itrust.org.cn" target="_blank">
                                  <img width="110" height="50" alt="中国互联网协会" src="http://i1.sinaimg.cn/home/main/index2013/footerlogo/footer_logo01.gif"></a>
                          </li>                    
                          <li>
                              <a href="http://www.bj.cyberpolice.cn/index.htm" target="_blank">
                                  <img src="http://i1.sinaimg.cn/home/main/index2013/footerlogo/footer_logo05.gif" width="105" height="50" alt="网络110报警服务"></a>
                          </li>

                          <li>
                              <a href="https://ss.knet.cn/verifyseal.dll?sn=2010091500100002145&amp;ct=df&amp;a=1&amp;pa=0.14296675658609825" target="_blank">
                                  <img src="http://i1.sinaimg.cn/home/main/index2013/footerlogo/footer_logo10_1.gif"  width="123" height="50" alt="可信网站"></a>
                          </li>
                      </ul>
            </div>        
        </div>                  
    </div>
</div>
<script src="ybjs/jquery-1.7.2.js"></script>
<script src="ybjs/jquery.validate.min.js"></script>
<script src="ybjs/messages_zh.js"></script>
<script src="ybjs/form.js"></script>

<script type="text/javascript">
    //IE doesn't support string trim, this makes it support;
    String.prototype.trim=function(){return this.replace(/(^\s*)|(\s*$)/g,"");}

    //global variables;
    emailValid = 0;

    function getXMLHttpRequest() 
    {  
      var xmlHttp;
      if(window.XMLHttpRequest) 
      {
          var xmlHttp = new window.XMLHttpRequest();
      } 
      else if (window.ActiveXObject) 
      {
          var xmlHttp = new window.ActiveXObject('Microsoft.XMLHTTP');
      }
      return xmlHttp;
    }  

    function change() 
    {
        if (xmlHttp.readyState == 4) 
        {
            if (xmlHttp.status == 200) 
            {
                var json = eval("("+xmlHttp.responseText+")");
                if(json.NumWithEmail>0)
                {
                  alert("该邮箱已被注册,请更换邮箱");
                  emailValid = 0;
                }
                else if(json.NumWithEmail==0)
                {
                  emailValid = 1;
                }
                else
                {
                  alert("由于未知原因,不能验证邮箱地址是否唯一");
                  emailValid = 0;
                }
            }
        }
    }

    function checkEmailUnique(email)
    {
      var url = "emailUnique.action?email="+email;

      xmlHttp = getXMLHttpRequest();
      if(xmlHttp == null)
          alert('Failed to get XMLHttpRequest');
      else
      {
          xmlHttp.onreadystatechange = change;
          xmlHttp.open("GET",url,true);
          xmlHttp.send(null);
      }
    }

    function validateEmail()
    {
        var email = document.getElementById("emailInput").value;
        if(email!=null) email = email.trim();
        if(email==null || email=="")
        {
            alert("邮箱地址不能为空");
            emailValid = 0;
            return 0;
        }

        if(email.length > 32)
        {
            alert("邮箱地址长度必须<=32");
            emailValid = 0;
            return 0;
        }

        var emailPattern = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/;  
        if(!emailPattern.test(email))
        {
            alert("邮箱地址无效");
            emailValid = 0;
            return 0;
        }

        checkEmailUnique(email);
    }

    function getLength(str)
    {
        var count = 0;
        for(var i = 0; i < str.length; i++) 
        {
            count++;
            if(escape(str.charAt(i)).length > 4) count++;
        }
        return count;
    }

    function validate()
    {
        var digitPattern = /^\d+(\.\d+)?$/;

        var pwd = document.getElementById("pwdInput").value;
        if(pwd==null || pwd=="")
        {
            alert("密码不能为空");
            return 0;
        }
        if(pwd.length < 6 || pwd.length > 10)
        {
            alert("密码长度必须6到10位");
            return 0;
        }

        var mob = document.getElementById("mobInput").value;
        if(mob!=null) 
        {
            mob=mob.trim();
            if(mob != "")
            {
                if(!digitPattern.test(mob))
                {
                    alert("移动电话号码必须为数字");
                    return 0;
                }
                if(mob.length < 11 || mob.length > 16)
                {
                    alert("移动电话号码长度不正确");
                    return 0;
                }
            }
        }

        var tel = document.getElementById("telInput").value;
        if(tel!=null) 
        {
            tel=tel.trim();
            if(tel != "")
            {
                var telPattern = /^\d{3,4}-\d{7,8}$/;
                if(!telPattern.test(tel))
                {
                    alert("固定电话号码格式：区号(3至4位)-电话号码(7至8位)");
                    return 0;
                }
            }
        }

        var fax = document.getElementById("faxInput").value;
        if(fax!=null) 
        {
            fax=fax.trim();
            if(fax != "")
            {
                var faxPattern = /^\d{3,4}-\d{7,8}$/;
                if(!faxPattern.test(fax))
                {
                    alert("传真号码格式：区号(3至4位)-电话号码(7至8位)");
                    return 0;
                }
            }
        }

        var qq = document.getElementById("qqInput").value;
        if(qq!=null) 
        {
            qq=qq.trim();
            if(qq != "")
            {
                if(!digitPattern.test(qq))
                {
                    alert("QQ号码必须为数字");
                    return 0;
                }
                if(qq.length < 4 || qq.length > 16)
                {
                    alert("QQ号码长度不正确");
                    return 0;
                }
            }
        }

        var wx = document.getElementById("wxInput").value;
        if(wx!=null) 
        {
            wx=wx.trim();
            if(wx != "")
            {
                if(getLength(wx) > 32)
                {
                    alert("微信号码长度不正确");
                    return 0;
                }
            }
        }

        if( (mob==null || mob=="") && (tel==null || tel=="") && (qq==null || qq=="") && (wx==null || wx=="") )
        {
            alert("移动电话、固定电话、QQ和微信不能全部为空！");
            return 0;
        }

        return 1;
    }

    function doUserCreate(){
        var form = document.getElementById("form");
        form.action = "<%=request.getContextPath()%>/doRegister.action";
        
        if(validate()==0)
          return 0;

        if(emailValid==0)
        {
          alert("邮箱地址为空、无效或者不唯一");
          return 0;
        }

        if(emailValid==2)
        {
          alert("正在验证邮箱是否唯一,稍后重新提交");
          return 0;
        }

        form.submit();
    }
        
    function doUserEdit(){
        var form = document.getElementById("form");
        form.action = "<%=request.getContextPath()%>/doUserEdit.action";
        if(validate()==1)
        {
            form.submit();
        }
    }

    function goTextSearch()
    {
        var form = document.getElementById("search_form");
        form.action = "<%=request.getContextPath()%>/search.action";
        form.submit();
    }
</script>

</body>
</html>
