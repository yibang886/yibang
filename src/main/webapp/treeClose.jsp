<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>无标题文档</title>
<script type="text/javascript">
function changeLeft(){    frmElem=window.parent.document.getElementById("lmain");
if (frmElem.cols != "220,10,*") {	frmElem.cols = "220,10,*";
Elem=document.getElementById('menuSwitch')
Elem.innerHTML="<img src=\"/images/fclose.gif\">";
} else {	frmElem.cols = "0,10,*";
Elem=document.getElementById('menuSwitch')
Elem.innerHTML="<img src=\"/images/fopen.gif\">";
}}
</script>

</head>

<body background="resource/images/treebg.gif" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" id="midbar"  >
<table style="CURSOR: pointer" cellSpacing=0 cellPadding=0 border="0">
<tbody>
<tr>
      <td id="menuSwitch" onclick="changeLeft()"><IMG src="resource/images/fclose.gif" alt="点击展开维护菜单" width="10" height="42" > 
      </td>
    </tr></tbody></table>
</body>
</html>
