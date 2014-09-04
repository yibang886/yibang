// JavaScript Document
//middle_part
function switchSysBar(){ 
var locate=location.href.replace('middel.html','');
var ssrc=document.all("img1").src.replace(locate,'');
if (ssrc=="images/main_30.gif")
{ 
document.all("img1").src="images/main_30_1.gif";
document.all("frmTitle").style.display="none" 
} 
else
{ 
document.all("img1").src="images/main_30.gif";
document.all("frmTitle").style.display="" 
} 
} 

//top_port
function back(){
	window.parent.history.back();
}	
function refresh(){
	window.history.go();
}
function forward(){
	window.parent.history.go(1);
}
function exit(){
	window.parent.close();
}

var checkflag = "false";
function check(checkbox_Name) {
alert(checkbox_Name);
checkbox=document.getElementsByName(checkbox_Name);
if (checkflag == "false") {
 alert("checkflag");
 for (i = 0; i < checkbox.length; i++) {
 alert(checkbox[i].checked);
 checkbox[i].checked = true;}
 checkflag = "true";
}
else {
 alert("checkflag");
 for (i = 0; i < checkbox.length; i++) {
 checkbox[i].checked = false; }
 checkflag = "false";
}
}

function selectAllChkboxs(chkboxs,ChkAll){
      var getChkboxs=document.getElementsByName(chkboxs);
      var getchkbox=document.getElementById(ChkAll);
      for(var i=0;i<getChkboxs.length;i++){
      getChkboxs[i].checked=getchkbox.checked;
      }
}
//  End -->


// ������Ϊtable��js
//<!--
//���ǰѡ���е�ʱ�����õ�ǰ�е���ɫ��ͬʱ�ָ���ǰ������е���ɫ������¼�   
var preColor= "#ffffff";
var onMouseOverColor="#f0f4f7";
var onChickColor="#e1ecf3";
function selectRow(target)   
{   
var sTable = document.getElementById("ServiceListTable"); 
for(var i=1;i<sTable.rows.length;i++) //������һ�����������   
{   
if (sTable.rows[i] != target) //�ж��Ƿ�ǰѡ����   
{   
sTable.rows[i].bgColor = preColor; //���ñ���ɫ   
sTable.rows[i].onmouseover = resumeRowOver; //���onmouseover �¼�   
sTable.rows[i].onmouseout = resumeRowOut;//���onmouseout �¼�   
}   
else  
{   
sTable.rows[i].bgColor = onChickColor;   
sTable.rows[i].onmouseover = ""; //ȥ������¼�   
sTable.rows[i].onmouseout = ""; //ȥ������¼�   
}   
}   
}   
//�ƹ�ʱtr�ı���ɫ   
function rowOver(target)   
{  
target.bgColor=onMouseOverColor;
}   
//�Ƴ�ʱtr�ı���ɫ   
function rowOut(target)   
{   
 target.bgColor=preColor;   
}   
//�ָ�tr�ĵ�onmouseover�¼����׵��ú���   
function resumeRowOver()   
{   
 rowOver(this);   
}   
//�ָ�tr�ĵ�onmouseout�¼����׵��ú���   
function resumeRowOut()   
{   
 rowOut(this);   
 }  
//-->

// ������Ϊ��ʾdiv�Ĺ���Ĵ��롣
//<!--
function showdivscroll(){
 var divheight_init=document.body.offsetHeight;
 divheight_show=parseInt(divheight_init)-52;
 //alert(divheight);
 var showscrolldiv=document.getElementById("showscrolldiv");
 //alert(showscrolldiv.style.height);
 showscrolldiv.style.height=divheight_show;
 //alert(showscrolldiv.style.height);
 }
 
 //-->
