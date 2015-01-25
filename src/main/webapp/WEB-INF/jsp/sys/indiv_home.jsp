<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ include file="/core/include.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>译邦-个人发布翻译任务</title>
    <meta name="keywords" content="译邦" />
    <meta name="description" content="译邦" />
    <base target="_blank" />
    <link href="<%=request.getContextPath()%>/resource/ybcss/project.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="pwindow i-translate-page">
    <div class="phead">
        <div class="parea">
            <div class="hot-phone">
                客服热线：400-888-8888
            </div>
            <div class="right-tools">
                <a href="">注册</a>
                <a href="" class="login-link">登录</a><span class="spline">|</span><a href="">关于</a>
            </div>            
        </div>
    </div>     
    <div class="pbody">
        <div class="parea head-search clearfix">
            <div class="logo"><img src="<%=request.getContextPath()%>/resource/ybimg/logo.png" alt=""></div>
            <div class="search">
            <form action="">
                <input type="text" class="search-input">
                <input type="submit" value="搜索" class="search-btn">
            </form>
            </div>
        </div>

        <div class="pmain-content">
            <div class="parea">
                <div class="parea-wrap">

                    <div class="breadcrumb clearfix">
                        <div class="crumb">
                            <a href="">主页</a> &gt; 
                            <c:choose>
                                <c:when test="${page==0}"><a>我的状态</a></c:when>
                                <c:when test="${page==1}"><a>修改基本信息</a></c:when>
                                <c:otherwise><a>发布翻译服务</a></c:otherwise>
                            </c:choose>
                            <a href=""></a>
                        </div>
                        <div class="back-index">
                            <a href="">返回主页</a>
                        </div>
                    </div>

                    <div class="common-info clearfix">
                        
                        <div class="c-info-sidebar">
                            <ul class="side-nav-lst">
                                <c:choose>
                                    <c:when test="${page==0}">
                                        <li class="current"><a class="nav-info">我的状态</a></li>
                                        <li><a class="nav-info-modify" href="home.action?type=0&id=${userId}&page=1" target="_self">修改基本信息</a></li>
                                        <li><a class="nav-publish" href="home.action?type=0&id=${userId}&page=2" target="_self">发布翻译服务</a></li>
                                    </c:when>
                                    <c:when test="${page==1}">
                                        <li><a class="nav-info" href="home.action?type=0&id=${userId}&page=0" target="_self">我的状态</a></li>
                                        <li class="current"><a class="nav-info-modify">修改基本信息</a></li>
                                        <li><a class="nav-publish" href="home.action?type=0&id=${userId}&page=2" target="_self">发布翻译服务</a></li>
                                    </c:when>
                                    <c:otherwise>
                                        <li><a class="nav-info" href="home.action?type=0&id=${userId}&page=0" target="_self">我的状态</a></li>
                                        <li><a class="nav-info-modify" href="home.action?type=0&id=${userId}&page=1" target="_self">修改基本信息</a></li>
                                        <li class="current"><a class="nav-publish">发布翻译服务</a></li>
                                    </c:otherwise>
                                </c:choose>
                            </ul>
                        </div>

                        <div class="c-info-mcnt">
                            <div class="c-info-wrap">
                                <div class="common-info-mod2">
                                    <div class="cinfo-hd">
                                        <c:choose>
                                            <c:when test="${page==0}"><h2>我的状态</h2></c:when>
                                            <c:when test="${page==1}"><h2>修改基本信息</h2></c:when>
                                            <c:otherwise><h2>发布翻译服务</h2></c:otherwise>
                                        </c:choose>
                                    </div>

                                    <c:choose>
                                        <c:when test="${page==0}">
                                        </c:when>
                                        <c:when test="${page==1}">
                                            <div class="cinfo-bd">
                                                <form class="c-info-form modify-info-form" method="post" id="userForm" target="_self">
                                                    <div class="form-group">
                                                        <span class="form-label">登录邮箱(*)</span>
                                                        <div class="form-control">
                                                            <input required id="emailInput" name="userExt.email" type="email" 
                                                                            value="<c:out value="${ userModel.userExt.email }" escapeXml="true" />" readonly>
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
                                                                <option value="0" <c:if test="${userModel.userExt.user_type==0}"><c:out value="selected"/></c:if> >个人译员</option>
                                                                <option value="1" <c:if test="${userModel.userExt.user_type==1}"><c:out value="selected"/></c:if> >翻译公司</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <span class="form-label">移动电话(*)</span>
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
                
                                                    <input type="hidden" value="${userId}" name="userExt.id"/>
                
                                                    <div class="form-btns">
                                                        <input class="form-submit blue-btn form-submit-s" type="button" value="保存" onclick="doUserEdit(0)">
                                                        <input class="form-submit blue-btn form-submit-s" type="button" value="取消" onclick="doUserEdit(1)">
                                                    </div>                         
                                                </form>
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <div class="cinfo-bd">
                                                <ul class="publish-flow clearfix">
                                                    <li class="step current">
                                                        <span>1</span>
                                                        <p>填写基本信息</p>
                                                        <i></i>
                                                    </li>
                                                    <li class="step">
                                                        <span>2</span>
                                                        <p>上传照片</p>
                                                        <i></i>
                                                    </li>
                                                    <li class="step">
                                                        <span>3</span>
                                                        <p>上传语言登记证书</p>
                                                        <i></i>                                                
                                                    </li>
                                                    <li class="step">
                                                        <span>4</span>
                                                        <p>上传翻译证书</p>
                                                        <i></i>                                                
                                                    </li>
                                                    <li class="step">
                                                        <span>5</span>
                                                        <p>上传毕业证书</p>
                                                        <i></i>                                                
                                                    </li>
                                                    <li class="step">
                                                        <span>6</span>
                                                        <p>上传认证资料</p>                                              
                                                    </li>
                                                </ul>
                                                <form class="c-info-form translate-form i-translate-form" method="post" action="" novalidate="novalidate">
                                                    <div class="clearfix">
                                                        <div class="form-group form-item2">
                                                            <span class="form-label">姓名</span>
                                                            <div class="form-control">
                                                                <input required name="name" type="text">
                                                            </div>
                                                        </div>
                                                        <div class="form-group form-item2">
                                                            <span class="form-label">性别</span>
                                                            <div class="form-control">
                                                                <select required name="sex">
                                                                    <option value="1">男</option>
                                                                    <option value="2">女</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="form-group form-item2">
                                                            <span class="form-label">教育水平</span>
                                                            <div class="form-control">
                                                                <select required name="education">
                                                                    <option value="1">本科</option>
                                                                    <option value="2">研究生</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="form-group form-item2">
                                                            <span class="form-label">毕业院校</span>
                                                            <div class="form-control">
                                                                <input required name="university" type="text">
                                                            </div>
                                                        </div>
                                                        <div class="form-group form-item2">
                                                            <span class="form-label">出生年月</span>
                                                            <div class="form-control">
                                                                <input required name="born" type="text">
                                                            </div>
                                                        </div>
                                                        <div class="form-group form-item2">
                                                            <span class="form-label">工作方式</span>
                                                            <div class="form-control">
                                                                <select required name="worktype">
                                                                    <option value="1">兼职</option>
                                                                    <option value="2">全职</option>
                                                                </select> 
                                                            </div>
                                                        </div> 
                                                    </div>                                                   
                                                    <div class="form-group">
                                                        <span class="form-label">所在城市</span>
                                                        <div class="form-control">
                                                            <select required name="city">
                                                                <option value="1">北京</option>
                                                                <option value="2">上海</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <span class="form-label">语种</span>
                                                        <div class="form-control">
                                                            <span class="checkbox"><input name="langue" value="1" type="checkbox">英语</span>
                                                            <span class="checkbox"><input name="langue" value="1" type="checkbox">英语</span>
                                                            <span class="checkbox"><input name="langue" value="1" type="checkbox">英语</span>
                                                            <span class="checkbox"><input name="langue" value="1" type="checkbox">英语</span>
                                                            <span class="checkbox hide-check"><input name="langue" value="1" type="checkbox">英语</span>
                                                            <span class="checkbox hide-check"><input name="langue" value="1" type="checkbox">英语</span>
                                                            <span class="checkbox hide-check"><input name="langue" value="1" type="checkbox">英语</span>
                                                            <span class="checkbox hide-check"><input name="langue" value="1" type="checkbox">英语</span>
                                                            <span class="checkbox hide-check"><input name="langue" value="1" type="checkbox">英语</span>
                                                            <a class="more-check">更多&gt;&gt;</a>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <span class="form-label">专业领域</span>
                                                        <div class="form-control">
                                                            <span class="checkbox"><input name="field" value="1" type="checkbox">医学</span>
                                                            <span class="checkbox"><input name="field" value="1" type="checkbox">医学</span>
                                                            <span class="checkbox"><input name="field" value="1" type="checkbox">医学</span>
                                                            <span class="checkbox"><input name="field" value="1" type="checkbox">医学</span>
                                                            <span class="checkbox"><input name="field" value="1" type="checkbox">医学</span>
                                                            <span class="checkbox"><input name="field" value="1" type="checkbox">医学</span>
                                                            <span class="checkbox hide-check"><input name="field" value="1" type="checkbox">医学</span>
                                                            <span class="checkbox hide-check"><input name="field" value="1" type="checkbox">医学</span>
                                                            <a class="more-check">更多&gt;&gt;</a>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <span class="form-label">文档类型</span>
                                                        <div class="form-control">
                                                            <span class="checkbox"><input name="doctype" value="1" type="checkbox">论文</span>
                                                            <span class="checkbox"><input name="doctype" value="1" type="checkbox">论文</span>
                                                            <span class="checkbox"><input name="doctype" value="1" type="checkbox">论文</span>
                                                            <span class="checkbox"><input name="doctype" value="1" type="checkbox">论文</span>
                                                            <span class="checkbox"><input name="doctype" value="1" type="checkbox">论文</span>
                                                            <span class="checkbox"><input name="doctype" value="1" type="checkbox">论文</span>
                                                            <span class="checkbox hide-check"><input name="doctype" value="1" type="checkbox">论文</span>
                                                            <span class="checkbox hide-check"><input name="doctype" value="1" type="checkbox">论文</span>
                                                            <span class="checkbox hide-check"><input name="doctype" value="1" type="checkbox">论文</span>
                                                            <span class="checkbox hide-check"><input name="doctype" value="1" type="checkbox">论文</span>
                                                            <span class="checkbox hide-check"><input name="doctype" value="1" type="checkbox">论文</span>
                                                            <a class="more-check">更多&gt;&gt;</a>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <span class="form-label">翻译类型</span>
                                                        <div class="form-control">
                                                            <span class="checkbox"><input name="translatetype" value="1" type="checkbox">论文</span>
                                                            <span class="checkbox"><input name="translatetype" value="1" type="checkbox">论文</span>
                                                            <span class="checkbox hide-check"><input name="translatetype" value="1" type="checkbox">论文</span>
                                                            <span class="checkbox hide-check"><input name="translatetype" value="1" type="checkbox">论文</span>
                                                            <span class="checkbox hide-check"><input name="translatetype" value="1" type="checkbox">论文</span>
                                                            <span class="checkbox hide-check"><input name="translatetype" value="1" type="checkbox">论文</span>
                                                            <a class="more-check">更多&gt;&gt;</a>
                                                        </div>
                                                    </div>
                                                    <div class="clearfix">
                                                        <div class="form-group form-item2">
                                                            <span class="form-label">工作经验</span>
                                                            <div class="form-control">
                                                                <input name="work_experience" type="text"><span class="unit">年</span>
                                                            </div>
                                                        </div>
                                                        <div class="form-group form-item2">
                                                            <span class="form-label">翻译经验</span>
                                                            <div class="form-control">
                                                                <input name="trans_experience" type="text"><span class="unit">万字</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                                                                  
                                                    <div class="form-group">
                                                        <span class="form-label">翻译作品</span>
                                                        <div class="form-control">
                                                            <textarea name="production" rows="3"></textarea>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <span class="form-label">个人简介</span>
                                                        <div class="form-control">
                                                            <textarea name="introduce" rows="3"></textarea>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <span class="form-label">个人主页</span>
                                                        <div class="form-control">
                                                            <input name="url" type="text">
                                                        </div>
                                                    </div>
        
                                                    <div class="form-btns">
                                                        <input class="form-submit blue-btn form-submit-s" type="submit" value="保存">
                                                        <button class="form-cancel" type="reset" style="margin-left:40px;">取消</button>
                                                    </div>                         
                                                </form>
                                            </div>
                                        </c:otherwise>
                                    </c:choose>
                                </div>                               
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
                    <a href="">首页</a> | 
                    <a href="">合作机构</a> | 
                    <a href="">在线翻译 </a> |  
                    <a href="">关于译邦 </a> | 
                    <a href="">新手指引 </a> | 
                    <a href="">广告服务</a> | 
                    <a href="">联系我们</a>            
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
        if(mob!=null) mob=mob.trim();
        if(mob==null || mob=="")
        {
            alert("移动电话号码不能为空");
            return 0;
        }

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

        var tel = document.getElementById("telInput").value;
        if(tel!=null) 
        {
            tel=tel.trim();
            if(tel != "")
            {
                if(!digitPattern.test(tel))
                {
                    alert("固定电话号码必须为数字");
                    return 0;
                }
                if(tel.length < 7 || tel.length > 16)
                {
                    alert("固定电话号码长度不正确");
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
                if(!digitPattern.test(fax))
                {
                    alert("传真号码必须为数字");
                    return 0;
                }
                if(fax.length < 7 || fax.length > 16)
                {
                    alert("传真号码长度不正确");
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
                if(wx.length > 32)
                {
                    alert("微信号码长度不正确");
                    return 0;
                }
            }
        }

        return 1;
    }

    function doUserEdit(cancel){
        var form = document.getElementById("userForm");
        if(cancel==1)
        {
            document.getElementById("pwdInput").value="";
            document.getElementById("mobInput").value="";
            document.getElementById("telInput").value="";
            document.getElementById("faxInput").value="";
            document.getElementById("qqInput").value="";
            document.getElementById("wxInput").value="";
            form.action = "<%=request.getContextPath()%>/doUserEdit.action?cancel=1";
            form.submit();
        }
        else
        {
            form.action = "<%=request.getContextPath()%>/doUserEdit.action";
            if(validate()==1)
            {
                form.submit();
            }
        }
    }
</script>
</body>
</html>
