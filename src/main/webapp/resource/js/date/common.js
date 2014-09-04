  //var g_bIsIE = (navigator.appVersion.indexOf("MSIE") > -1) ? true : false;
var g_ctrlSelected;
var g_myObject=new Object();
function Container_onclick( objMe,bTimeAvailable,root_path)
{
	var hidHeight;
	g_ctrlSelected=objMe;
	g_myObject.WindowRef=window;
	g_myObject.TimeAvailable=bTimeAvailable;
	if(bTimeAvailable == true)
	{
		hidHeight = 300;
	}
	else
	{
		hidHeight = 250;
	}
//window.alert(bTimeAvailable);
	var strFeatures = " center: Yes; help: No; resizable: No; status: No;dialogWidth=202px;dialogHeight="+hidHeight+"px" ;
	//注意修改文件路径
	window.showModalDialog( root_path+"/js/date/DateTimeDialog.htm", g_myObject,strFeatures);
}

function setDateFieldValue( NewValue )
{
	g_ctrlSelected.value = NewValue;
}

function getDateFieldValue( )
{
	return g_ctrlSelected.value;
}
function dateCompare(startDate,endDate)
{
 var startStr = startDate.value;
 var endStr = endDate.value;
 if(startStr == "" || endStr == "")return true;
 var d1, d2, s, arr, arr1, arr2;
 if(startStr.length > 10)
 {
    arr = startStr.split(" ");
    arr1 = arr[0].split("-");
    arr2 = arr[1].split(":");
    d1 = new Date(arr1[0], arr1[1] - 1, arr1[2], arr2[0], arr2[1], arr2[2]);
 }
 else
 {
    arr = startStr.split("-");
    d1 = new Date(arr[0], arr[1], arr[2]);
 }
 if(endStr.length > 10)
 {
    arr = endStr.split(" ");
    arr1 = arr[0].split("-");
    arr2 = arr[1].split(":");
    d2 = new Date(arr1[0], arr1[1] - 1, arr1[2], arr2[0], arr2[1], arr2[2]);
 }
 else
 {
    arr = endStr.split("-");
    d2 = new Date(arr[0], arr[1], arr[2]);
 }
 
 s = d2 - d1 ;
 if(s < 0)
 {
 	alert("请重新输入开始日期和结束日期!");
 	startDate.value = "";
 	endDate.value = "";
    return false;
 }
 return true;
}