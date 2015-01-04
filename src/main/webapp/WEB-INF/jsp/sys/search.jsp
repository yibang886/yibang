<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.yb.sys.entity.UserExt" %>
<%@ page import="com.yb.sys.entity.LanguageExt" %>
<%@ page import="com.yb.sys.entity.TranstypeExt" %>
<%@ page import="com.yb.sys.entity.DoctypeExt" %>
<%@ page import="com.yb.sys.entity.CityExt" %>
<%@ page import="com.yb.sys.entity.FieldExt" %>
<%@ page import="com.yb.sys.entity.EducationExt" %>
<%@ include file="/core/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>译邦-搜索结果页</title>
    <meta name="keywords" content="译邦" />
    <meta name="description" content="译邦" />
    <base target="_blank" />
    <link href="<%=request.getContextPath()%>/resource/ybcss/project.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript">
        function QueryParamObj()
        {
            this["sp"]=0; //service provider: 0:all; 1:individual; 2:company
            this["vf"]=0; //verify status:    0:all; 1:passed;     2: not passed
            this["au"]=0; //auth status:      0:all; 1:passed;     2: not passed
            this["lg"]=0; //language:         0:all; other:lang-id
            this["tt"]=0; //translate type:   0:all; other:translate typd id;
            this["dt"]=0; //doc type:         0:all; other: doc type id;
            this["fd"]=0; //field:            0:all; other: field id;
            this["ct"]=0; //city:             0:all; other:city-id

            //individual specific params
            this["ws"]=0;  //work style:      0:all; 1:full-time;  2: part-time
            this["ed"]=0;  //education:       0:all; other: education id;

            //page number
            this["pg"]=1;
        }

        function HiddenSettingsObj()
        {
            this["sp"]=0; //service provider: never hidden;
            this["vf"]=0; //verify status:    never hidden;
            this["au"]=0; //auth status:      never hidden;
            this["lg"]=1; //language:         controlled by user and hidden initially;
            this["tt"]=0; //translate type:   never hidden;
            this["dt"]=1; //doc type:         controlled by user and hidden initially;
            this["fd"]=1; //field:            controlled by user and hidden initially;
            this["ct"]=1; //city:             controlled by user and hidden initially;
            
            //individual specific params
            this["ws"]=0; //work style:       never hidden if queryParamObj["sp"]=1 (individual selected);
            this["ed"]=0; //education:        never hidden if queryParamObj["sp"]=1 (individual selected);
        }

        //global variables;
        queryParamObj = new QueryParamObj();
        hiddenSettingsObj = new HiddenSettingsObj();


        function process_indiv_specific(spValue)
        {
          if(spValue!=1) //not individual selected
          {
            queryParamObj["ws"]=0; //clear condition workstyle
            queryParamObj["ed"]=0; //clear condition workstyle
          }

          for(var i=0; i<3; i++)
          {
            var elmt = document.getElementById("ws"+i);
            if(elmt != null)
            {
              if(spValue==1) //individual selected
              {
                if(queryParamObj["ws"]==i)
                {
                  elmt.className = "search-param s-p-active";
                }
                else
                {
                  elmt.className = "search-param";
                }
              }
              else
              {
                elmt.className = "search-param s-p-hiden";
              }
            }
          }

          for(var i=0; i<7; i++) //hard-code number of educations
          {
            var elmt = document.getElementById("ed"+i);
            if(elmt != null)
            {
              if(spValue==1) //individual selected
              {
                if(queryParamObj["ed"]==i)
                {
                  elmt.className = "search-param s-p-active";
                }
                else
                {
                  elmt.className = "search-param";
                }
              }
              else
              {
                elmt.className = "search-param s-p-hiden";
              }
            }
          }
        }

        function queryWithNewCond(cond,value,total)
        {
          if(queryParamObj[cond] == value)
          {
            //value for this cond doesn't change, do nothing;
            return;
          }

          //when the search conditions are changed, reset page number to 1;
          updatePgNumber(1, 6); //hard-code number of page number positions;

          queryParamObj[cond] = value; //update the cond to the new value;

          for(var i=0;i<total;i++)
          {
            var elmt = document.getElementById(cond+i);
            if(elmt!=null)
            {
              if(i == value)
              {
                  elmt.className = "search-param s-p-active";
              }
              else
              {
                if(hiddenSettingsObj[cond]==1 && i>15)
                {
                    elmt.className = "search-param s-p-hiden";
                }
                else
                {
                    elmt.className = "search-param";
                }
              }
            }
          }

          if(cond=="sp") //if we are changing service provider;
          {
            process_indiv_specific(value);
          }

          queryByAjax("query.action");
        }

        function queryByAjax(url)
        {
          var first=1;
          for(var attr in queryParamObj)
          {
            if(queryParamObj[attr] != '0')
            {
                if(first==1)
                {
                  first=0;
                  url = url+"?"+attr+"="+queryParamObj[attr];
                }
                else
                {
                  url = url+"&"+attr+"="+queryParamObj[attr];
                }
            }
          }

          xmlHttp = getXMLHttpRequest();

          if(xmlHttp == null)
          {
              alert('Failed to get XMLHttpRequest');
          }
          else
          {
              xmlHttp.onreadystatechange = change;
              xmlHttp.open("GET",url,true);
              xmlHttp.send(null);
          }
        }

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
                    var str = xmlHttp.responseText;

                    var start=str.indexOf("<body>")+6;
                    var end=str.indexOf("</body>");

                    str=str.substr(start,end-start);

                    var resultElmt = document.getElementById("search_result");
                    resultElmt.innerHTML = str;
                }
            }
        }
        
        function more_hide(cond, elemtId, total)
        {
          var more_hide_elemt = document.getElementById(elemtId);

          if(hiddenSettingsObj[cond] == 1) //hidden currently, so expand
          {
            for (var i=0; i<total; i++) 
            {
              var elmt = document.getElementById(cond+i);
              if(elmt != null)
              {
                if(i==queryParamObj[cond])
                {
                  elmt.className = "search-param s-p-active";
                }
                else
                {
                  elmt.className = "search-param";
                }
              }
            }

            //set to expanded
            if(isIE())
            {
              more_hide_elemt.innerText = "隐藏<<";
            }
            else
            {
              more_hide_elemt.textContent = "隐藏<<";
            }
            hiddenSettingsObj[cond] = 0; 
          }
          else //expanded currently, so hide
          {
            for (var i=0; i<total; i++) 
            {
              var elmt = document.getElementById(cond+i);
              if(elmt != null)
              {
                if (i==queryParamObj[cond])
                {
                  elmt.className = "search-param s-p-active";
                }
                else
                {
                  if(i<=15)
                  {
                    elmt.className = "search-param";
                  }
                  else
                  {
                    elmt.className = "search-param s-p-hiden";
                  }
                }
              }
            }

            //set to hidden
            if(isIE())
            {
              more_hide_elemt.innerText = "更多>>";
            }
            else
            {
              more_hide_elemt.textContent = "更多>>";
            }
            hiddenSettingsObj[cond] = 1; 
          }
        }

        function isIE()
        {  
          if (window.navigator.userAgent.toLowerCase().indexOf("msie")>=1) 
            return true; 
          else 
            return false; 
        } 

        function queryWithNewPage(pg_pos,total)
        {
          var curPg = queryParamObj["pg"];

          if(pg_pos == "p")  //点击"上一页"
          {
            if(curPg==1)
              return;

            curPg--;
            if(curPg%6 == 0) //e.g. if pg=7 and "上一页" is clicked, we need to show numbers: 1,2,3,4,5,6
            {
              for(var i=1;i<=total;i++)
              {
                var elmt = document.getElementById("pg_pos_"+i);
                if(elmt != null)
                {
                  if(isIE())
                    elmt.innerText = curPg - (total-i);
                  else
                    elmt.textContent = curPg - (total-i);
                }
              }
            }
          }
          else if(pg_pos == "n")  //点击"下一页"
          {
            if(curPg%6 == 0) //e.g. if pg=6 and "下一页" is clicked, we need to show numbers: 7,8,9,10,11,12
            {
              for(var i=1;i<=total;i++)
              {
                var elmt = document.getElementById("pg_pos_"+i);
                if(elmt != null)
                {
                  if(isIE())
                    elmt.innerText = curPg+i;
                  else
                    elmt.textContent = curPg+i;
                }
              }
            }
            curPg++;
          }
          else //a position between 1 and 6 is selected;
          {
            //calculate position of previouse page number;
            var curPos = curPg%6;
            if(curPos==0) 
              curPos += 6;

            //calculate the distance between prev page number and the one selected;
            var distance = curPos - pg_pos;

            //if the same page is selected;
            if(distance==0)
              return;

            curPg = curPg - distance;
          }

          //update the final page number;
          updatePgNumber(curPg, total);
          queryByAjax("query.action");
        }

        function updatePgNumber(pgNo, total)
        {
          queryParamObj["pg"] = pgNo;

          //high light the page number that is selected; that is to calculate the position corresponding to
          //the final page number, then high light it and disable others;
          var pos = pgNo%6;
          if(pos==0) 
            pos += 6;

          for(var i=1;i<=total;i++)
          {
            var elmt = document.getElementById("pg_pos_"+i);
            if(elmt != null)
            {
              if(pos == i)
                elmt.className = "page active";
              else
                elmt.className = "page";
            }
          }
        }
    </script>
</head>

<body>
<div class="pwindow search-page">
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
                            <a href="">主页</a> &gt; <a href="">筛选结果</a>
                        </div>
                        <div class="back-index">
                            <a href="index.action" target="_self">返回主页</a>
                        </div>
                    </div>

                    <div class="search-options green-mod">
  
                        <dl class="search-option-item no-border clearfix">
                            <dt>服务主体：</dt>
                            <dd class="clearfix">
                                <span id="sp0" class="search-param s-p-active"><a onclick="queryWithNewCond('sp',0,3)">全部</a></span>
                                <span id="sp1" class="search-param"><a onclick="queryWithNewCond('sp',1,3)">个人译员</a></span> 
                                <span id="sp2" class="search-param"><a onclick="queryWithNewCond('sp',2,3)">翻译公司</a></span>
                            </dd>
                        </dl>

                        <dl class="search-option-item no-border clearfix">
                          <!--<dt>工作方式：</dt>-->
                            <dd class="clearfix">
                                <span id="ws0" class="search-param s-p-hiden"><a onclick="queryWithNewCond('ws',0,3)">全部</a></span>
                                <span id="ws1" class="search-param s-p-hiden"><a onclick="queryWithNewCond('ws',1,3)">全职</a></span> 
                                <span id="ws2" class="search-param s-p-hiden"><a onclick="queryWithNewCond('ws',2,3)">兼职</a></span>
                            </dd>
                        </dl>

                        <dl class="search-option-item no-border clearfix">
                          <!--<dt>译员学历：</dt>-->
                            <dd class="clearfix">
                                <%
                                    List<EducationExt> eds = (List<EducationExt>) request.getAttribute("educations");
                                    Integer size_ed = eds.size()+1;  //plus 1 for '全部'
                                %>
                                <span id="ed0" class="search-param s-p-hiden"><a onclick="queryWithNewCond('ed',0,<%=size_ed%>)">全部</a></span>
                                <c:forEach items="${educations}" var="var">
                                    <span id="ed${var.id}" class="search-param s-p-hiden"><a onclick="queryWithNewCond('ed',${var.id},<%=size_ed%>)">${var.education}</a></span>
                                </c:forEach>
                            </dd>
                        </dl>

                        <dl class="search-option-item clearfix">
                            <dt>是否审核：</dt>
                            <dd class="clearfix">
                                <span id="vf0" class="search-param s-p-active"><a onclick="queryWithNewCond('vf',0,3)">全部</a></span>
                                <span id="vf1" class="search-param"><a onclick="queryWithNewCond('vf',1,3)">已审核</a></span> 
                                <span id="vf2" class="search-param"><a onclick="queryWithNewCond('vf',2,3)">未审核</a></span>
                            </dd>
                        </dl>

                        <dl class="search-option-item clearfix">
                            <dt>是否认证：</dt>
                            <dd class="clearfix">
                                <span id="au0" class="search-param s-p-active"><a onclick="queryWithNewCond('au',0,3)">全部</a></span>
                                <span id="au1" class="search-param"><a onclick="queryWithNewCond('au',1,3)">已认证</a></span> 
                                <span id="au2" class="search-param"><a onclick="queryWithNewCond('au',2,3)">未认证</a></span>
                            </dd>
                        </dl>

                        <dl class="search-option-item clearfix">
                            <dt>翻译语言：</dt>
                            <dd class="clearfix">
                                <%
                                    List<LanguageExt> langs = (List<LanguageExt>) request.getAttribute("languages");
                                    Integer size_lg = langs.size()+1;  //plus 1 for '全部'
                                %>
                                <span id="lg0" class="search-param s-p-active"><a onclick="queryWithNewCond('lg',0,<%=size_lg%>)">全部</a></span>
                                <c:forEach items="${languages}" var="var">
                                    <c:choose>
                                        <c:when test="${var.id <= 15}">
                                            <span id="lg${var.id}" class="search-param"><a onclick="queryWithNewCond('lg',${var.id},<%=size_lg%>)">${var.language}</a></span>
                                        </c:when>
                                        <c:otherwise>
                                            <span id="lg${var.id}" class="search-param s-p-hiden"><a onclick="queryWithNewCond('lg',${var.id},<%=size_lg%>)">${var.language}</a></span>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                                <a class="s-p-more" id="lg_more_hide" onclick="more_hide('lg','lg_more_hide',<%=size_lg%>)">更多&gt;&gt;</a>
                            </dd>
                        </dl>

                        <dl class="search-option-item clearfix">
                            <dt>翻译类型：</dt>
                            <dd class="clearfix">
                                <%
                                    List<TranstypeExt> trtypes = (List<TranstypeExt>) request.getAttribute("transtypes");
                                    Integer size_tt = trtypes.size()+1;  //plus 1 for '全部'
                                %>
                                <span id="tt0" class="search-param s-p-active"><a onclick="queryWithNewCond('tt',0,<%=size_tt%>)">全部</a></span>
                                <c:forEach items="${transtypes}" var="var">
                                    <span id="tt${var.id}" class="search-param"><a onclick="queryWithNewCond('tt',${var.id},<%=size_tt%>)">${var.transtype}</a></span>
                                </c:forEach>
                            </dd>
                        </dl>

                        <dl class="search-option-item clearfix">
                            <dt>文档类型：</dt>
                            <dd class="clearfix">
                                <%
                                    List<DoctypeExt> dtypes = (List<DoctypeExt>) request.getAttribute("doctypes");
                                    Integer size_dt = dtypes.size()+1;  //plus 1 for '全部'
                                %>
                                <span id="dt0" class="search-param s-p-active"><a onclick="queryWithNewCond('dt',0,<%=size_dt%>)">全部</a></span>
                                <c:forEach items="${doctypes}" var="var">
                                    <c:choose>
                                        <c:when test="${var.id <= 15}">
                                            <span id="dt${var.id}" class="search-param"><a onclick="queryWithNewCond('dt',${var.id},<%=size_dt%>)">${var.doctype}</a></span>
                                        </c:when>
                                        <c:otherwise>
                                            <span id="dt${var.id}" class="search-param s-p-hiden"><a onclick="queryWithNewCond('dt',${var.id},<%=size_dt%>)">${var.doctype}</a></span>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                                <a class="s-p-more" id="dt_more_hide" onclick="more_hide('dt','dt_more_hide',<%=size_dt%>)">更多&gt;&gt;</a>
                            </dd>
                        </dl>

                        <dl class="search-option-item clearfix">
                            <dt>专业领域：</dt>
                            <dd class="clearfix">
                                <%
                                    List<FieldExt> fds = (List<FieldExt>) request.getAttribute("fields");
                                    Integer size_fd = fds.size()+1;  //plus 1 for '全部'
                                %>
                                <span id="fd0" class="search-param s-p-active"><a onclick="queryWithNewCond('fd',0,<%=size_fd%>)">全部</a></span>
                                <c:forEach items="${fields}" var="var">
                                    <c:choose>
                                        <c:when test="${var.id <= 15}">
                                            <span id="fd${var.id}" class="search-param"><a onclick="queryWithNewCond('fd',${var.id},<%=size_fd%>)">${var.field}</a></span>
                                        </c:when>
                                        <c:otherwise>
                                            <span id="fd${var.id}" class="search-param s-p-hiden"><a onclick="queryWithNewCond('fd',${var.id},<%=size_fd%>)">${var.field}</a></span>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                                <a class="s-p-more" id="fd_more_hide" onclick="more_hide('fd','fd_more_hide',<%=size_fd%>)">更多&gt;&gt;</a>
                            </dd>
                        </dl>


                        <dl class="search-option-item clearfix">
                            <dt>所在城市：</dt>
                            <dd class="clearfix">
                                <%
                                    List<CityExt> cts = (List<CityExt>) request.getAttribute("cities");
                                    Integer size_ct = cts.size()+1;  //plus 1 for '全部'
                                %>
                                <span id="ct0" class="search-param s-p-active"><a onclick="queryWithNewCond('ct',0,<%=size_ct%>)">全部</a></span>
                                <c:forEach items="${cities}" var="var">
                                    <c:choose>
                                        <c:when test="${var.id <= 15}">
                                            <span id="ct${var.id}" class="search-param"><a onclick="queryWithNewCond('ct',${var.id},<%=size_ct%>)">${var.city}</a></span>
                                        </c:when>
                                        <c:otherwise>
                                            <span id="ct${var.id}" class="search-param s-p-hiden"><a onclick="queryWithNewCond('ct',${var.id},<%=size_ct%>)">${var.city}</a></span>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                                <a class="s-p-more" id="ct_more_hide" onclick="more_hide('ct','ct_more_hide',<%=size_ct%>)">更多&gt;&gt;</a>
                            </dd>
                        </dl>
                    </div>

                    <div id="search_result" class="search-result company-lst-3 green-mod">
                        <c:if test="${empty companies && empty individuals}">
                            <h2>没有任何翻译服务提供者！</h2>
                        </c:if>
                    
                        <c:if test="${!empty companies}">
                            <c:forEach var="comp" items="${companies}">
                                <div class="company-card-3 clearfix">                        
                                    <div class="pic-block">
                                        <img src="${comp.logo}" alt=""><i></i>
                                    </div>
                                    <h2>
                                        <b>${comp.name}</b>
                                        <c:if test="${comp.auth_pass==1}">
                                            <div class="authen-s-flag1"></div>
                                        </c:if>
                                    </h2>
                                    <p class="other-info">
                                        <b>支持语种：</b>
                                        <c:forEach var="lang" items="${comp.languages}">
                                            ${lang.language}
                                        </c:forEach>
                                        ----
                                        <b>支持领域：</b>
                                        <c:forEach var="field" items="${comp.fields}">
                                            ${field.field}
                                        </c:forEach>
                                        ----
                                        <b>翻译类型：</b>
                                        <c:forEach var="transtype" items="${comp.transtypes}">
                                            ${transtype.transtype}
                                        </c:forEach>
                        
                                        <br>
                        
                                        <c:if test="${!empty comp.user.tel}">
                                            <span class="info-item">电话：${comp.user.tel}</span>
                                        </c:if>
                                        &nbsp;&nbsp;
                                        <c:if test="${!empty comp.user.mobile}">
                                            <span class="info-item">手机：${comp.user.mobile}</span>
                                        </c:if>
                                        &nbsp;&nbsp;
                                        <c:if test="${!empty comp.user.qq}">
                                            <span class="info-item">QQ：${comp.user.qq}</span>
                                        </c:if>
                                        &nbsp;&nbsp;
                                        <c:if test="${!empty comp.user.weixin}">
                                            <span class="info-item">微信：${comp.user.weixin}</span>
                                        </c:if>
                                        &nbsp;&nbsp;
                                        <c:if test="${!empty comp.user.email}">
                                            <span class="info-item">邮箱：${comp.user.email}</span>
                                        </c:if>
                                    </p>
                                </div> 
                            </c:forEach>
                        </c:if>
                    
                        <c:if test="${!empty individuals}">
                            <c:forEach var="indiv" items="${individuals}">
                                <div class="company-card-3 clearfix">                        
                                    <div class="pic-block">
                                        <img src="${indiv.photo}" alt=""><i></i>
                                    </div>
                                    <h2>
                                        <b>${indiv.name}</b>
                                        <c:if test="${indiv.auth_pass==1}">
                                            <div class="authen-s-flag1"></div>
                                        </c:if>
                                    </h2>
                                    <p class="other-info">
                                        <b>支持语种：</b>
                                        <c:forEach var="lang" items="${indiv.languages}">
                                            ${lang.language}
                                        </c:forEach>
                                        ----
                                        <b>支持领域：</b>
                                        <c:forEach var="field" items="${indiv.fields}">
                                            ${field.field}
                                        </c:forEach>
                                        ----
                                        <b>翻译类型：</b>
                                        <c:forEach var="transtype" items="${indiv.transtypes}">
                                            ${transtype.transtype}
                                        </c:forEach>
                        
                                        <br>
                        
                                        <c:if test="${!empty indiv.user.tel}">
                                            <span class="info-item">电话：${indiv.user.tel}</span>
                                        </c:if>
                                        &nbsp;&nbsp;
                                        <c:if test="${!empty indiv.user.mobile}">
                                            <span class="info-item">手机：${indiv.user.mobile}</span>
                                        </c:if>
                                        &nbsp;&nbsp;
                                        <c:if test="${!empty indiv.user.qq}">
                                            <span class="info-item">QQ：${indiv.user.qq}</span>
                                        </c:if>
                                        &nbsp;&nbsp;
                                        <c:if test="${!empty indiv.user.weixin}">
                                            <span class="info-item">微信：${indiv.user.weixin}</span>
                                        </c:if>
                                        &nbsp;&nbsp;
                                        <c:if test="${!empty indiv.user.email}">
                                            <span class="info-item">邮箱：${indiv.user.email}</span>
                                        </c:if>
                                    </p>
                                </div> 
                            </c:forEach>
                        </c:if>
                    </div>

                    <div class="pages-lst">
                        <a id="pg_pos_p" class="page" onclick="queryWithNewPage('p',6)">上一页</a>
                        <a id="pg_pos_1" class="page active" onclick="queryWithNewPage(1,6)">1</a>
                        <a id="pg_pos_2" class="page" onclick="queryWithNewPage(2,6)">2</a>
                        <a id="pg_pos_3" class="page" onclick="queryWithNewPage(3,6)">3</a>
                        <a id="pg_pos_4" class="page" onclick="queryWithNewPage(4,6)">4</a>
                        <a id="pg_pos_5" class="page" onclick="queryWithNewPage(5,6)">5</a>
                        <a id="pg_pos_6" class="page" onclick="queryWithNewPage(6,6)">6</a>
                        <a id="pg_pos_n" class="page" onclick="queryWithNewPage('n',6)">下一页</a>
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
                                  <img width="110" height="50" alt="中国互联网协会" src="http://i1.sinaimg.cn/home/main/index2013/footerlogo/footer_logo01.gif" data-src="http://i1.sinaimg.cn/home/main/index2013/footerlogo/footer_logo01.gif"></a>
                          </li>                    
                         <li>
                              <a href="http://www.itrust.org.cn" target="_blank">
                                  <img width="110" height="50" alt="中国互联网协会" src="http://i1.sinaimg.cn/home/main/index2013/footerlogo/footer_logo01.gif" data-src="http://i1.sinaimg.cn/home/main/index2013/footerlogo/footer_logo01.gif"></a>
                          </li>
                          <li>
                              <a href="http://www.bj.cyberpolice.cn/index.htm" target="_blank">
                                  <img src="http://i1.sinaimg.cn/home/main/index2013/footerlogo/footer_logo05.gif" data-src="http://i1.sinaimg.cn/home/main/index2013/footerlogo/footer_logo05.gif" width="105" height="50" alt="网络110报警服务"></a>
                          </li>

                          <li>
                              <a href="https://ss.knet.cn/verifyseal.dll?sn=2010091500100002145&amp;ct=df&amp;a=1&amp;pa=0.14296675658609825" target="_blank">
                                  <img src="http://i1.sinaimg.cn/home/main/index2013/footerlogo/footer_logo10_1.gif" data-src="http://i1.sinaimg.cn/home/main/index2013/footerlogo/footer_logo10_1.gif" width="123" height="50" alt="可信网站"></a>
                          </li>
                      </ul>
            </div>        
        </div>                  
    </div>
</div>
<script src="js/jquery-1.4.4.min.js"></script>
<script src="ybjs/search.js"></script>
</body>
</html>
