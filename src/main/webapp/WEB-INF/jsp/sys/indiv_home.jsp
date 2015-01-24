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
                            <a href="">主页</a> &gt; <a href="">发布翻译任务</a>
                        </div>
                        <div class="back-index">
                            <a href="">返回主页</a>
                        </div>
                    </div>

                    <div class="common-info clearfix">
                        
                        <div class="c-info-sidebar">
                            <ul class="side-nav-lst">
                                <li><a class="nav-info" href="">我的状态</a></li>
                                <li><a class="nav-info-modify" href="">修改基本信息</a></li>
                                <li class="current"><a class="nav-publish" href="">发布翻译任务</a></li>
                            </ul>
                        </div>

                        <div class="c-info-mcnt">
                            <div class="c-info-wrap">
                                <div class="common-info-mod2">
                                    <div class="cinfo-hd">
                                        <h2>发布翻译任务</h2>
                                    </div>
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
</body>
</html>
