
/****** **************/
//document.oncontextmenu = function() 
//{ 

//	return false;
//}
document.onkeydown = function()
{
	if (event.keyCode==116 )
    {
           event.keyCode=0;
           window.event.returnValue=false;
           
    }
}

/*
	checkbox control
*/
function doBoxControl(controlbox, sequencebox)
{
	var isControlChecked = controlbox.checked;
	if(sequencebox == null || sequencebox == 'null' || sequencebox == 'undefined')
		return;
	if(isNaN(sequencebox.length))
	{
		if (sequencebox.disabled == false)
			sequencebox.checked = isControlChecked;
	}
	else
	{
		for(var i = 0; i < sequencebox.length; i++)
		{
			if (sequencebox[i].disabled == false)
				sequencebox[i].checked = isControlChecked;
		}
	}
}
function doBoxChange(controlbox, sequencebox)
{
	var isControlChecked = true;
	if(controlbox == null || controlbox == 'null' || controlbox == 'undefined')
		return;
	if(isNaN(sequencebox.length))
	{
		if (sequencebox.checked == false)
			isControlChecked = false;
	}
	else
	{
		for(var i = 0; i < sequencebox.length; i++)
		{
			if (sequencebox[i].disabled == false && sequencebox[i].checked == false)
			{
				isControlChecked = false;
				break;
			}
		}
	}
	controlbox.checked = isControlChecked;
}
function doBoxCheck(sequencebox,nIndex)
{
	if(sequencebox == null || sequencebox == 'null' || sequencebox == 'undefined')
		return;
	if(isNaN(sequencebox.length))
	{
		if (sequencebox.checked == false)
		{
			sequencebox.checked = true;
		}
		else if(sequencebox.checked == true)
		{
			sequencebox.checked = false;
		}
	}
	else
	{
		for(var i = 0; i < sequencebox.length; i++)
		{
			if (sequencebox[i].disabled == false)
				sequencebox[i].checked = true;
		}
		//if (sequencebox[nIndex].checked == false)
		//{
			//sequencebox[nIndex].checked = true;
		//}
		//else if(sequencebox[nIndex].checked == true)
		//{
			//sequencebox[nIndex].checked = false;
		//}
	}
}
//用于多选CheckBox的选择,controlbox为父控件,sequencebox为子控件
//父控件和子控件均可为数组，且子控件数组根据父控件分组
//如controlbox 1 控制 sequencebox 1，sequencebox 2
//controlbox 2 控制 sequencebox 3，sequencebox 4，sequencebox 5的选择
//同组的controlbox和sequencebox设置相同的ID属性checkBoxID，如物资编码
//使用时控件必须为input对象，不能为struts的multibox标签，因为必须给定
//相同的ID属性，struts标签无该属性
function doMultiBoxControl(controlbox,sequencebox,checkBoxID)
{
	var isControlSelected;
	if(sequencebox==null)return;
	if(isNaN(controlbox.length))
	{
		isControlSelected=controlbox.checked;
		if(isNaN(sequencebox.length))
		{
			if (sequencebox.disabled==false)
				sequencebox.checked = isControlSelected;
		}
		else
		{
			for(var i=0;i<sequencebox.length;i++)
			{
				if (sequencebox[i].id==checkBoxID)
					if (sequencebox[i].disabled==false)
						sequencebox[i].checked = isControlSelected;
			}
		}
	}
	else
	{
		for(var i=0;i<controlbox.length;i++)
		{
			if (controlbox[i].id==checkBoxID)
				isControlSelected=controlbox[i].checked;
		}
		for(var i=0;i<sequencebox.length;i++)
		{
			if (sequencebox[i].id==checkBoxID)
				if (sequencebox[i].disabled==false)
					sequencebox[i].checked = isControlSelected;
		}
	}
}
//用于多选CheckBox的选择,controlbox为父控件,sequencebox为子控件
//父控件和子控件均可为数组，且子控件数组根据父控件分组
//如controlbox 1 控制 sequencebox 1，sequencebox 2
//controlbox 2 控制 sequencebox 3，sequencebox 4，sequencebox 5的选择
//同组的controlbox和sequencebox设置相同的ID属性checkBoxID，如物资编码
//使用时控件必须为input对象，不能为struts的multibox标签，因为必须给定
//相同的ID属性，struts标签无该属性
function doMultiBoxChange(controlbox,sequencebox,checkBoxID)
{
	var isSelected = true;
	var isChecked = true;
	var isReturnChecked = true;
	if(isNaN(sequencebox.length))
	{
		isSelected = sequencebox.checked;
		controlbox.checked = isSelected;
	}
	else
	{
		for(var i=0;i<sequencebox.length;i++)
		{
			isSelected = sequencebox[i].checked;
			isChecked = sequencebox[i].disabled;
			if (sequencebox[i].id==checkBoxID)
				if (isSelected==false && isChecked==false)
				{
					isReturnChecked = false;
					break;
				}
		}
	}
	if(isNaN(controlbox.length))
		controlbox = isReturnChecked;
	else
	{
		for(var i=0;i<controlbox.length;i++)
		{
			if (controlbox[i].id==checkBoxID)
			{
				controlbox[i].checked = isReturnChecked;
				break;
			}
		}
	}
}

/**
 * 判断radio是否有选中,或判断checkbox是否选中一个
 * @param checkIdObj radio或checkbox对象
 */
function isRadioChecked(checkIdObj)
{
	//对象是否为空	
	if (checkIdObj == null) 
	{	
		return false;
	}
	//checkbox,并且列表对象有多个
	if(checkIdObj.length)
	{	
		var sum = 0;	
		for (i=0; i<checkIdObj.length; i++) 
		{	
			if(checkIdObj[i].checked  &&  checkIdObj[i].disabled==false)
			{	
				sum++;
			}	
		}	
		//checkbox中只有一个选中
		if (sum == 1)
		{
			return true;
		}		
	}	
	//radio,或checkbox列表对象只有一个	
	else if(checkIdObj.checked   &&  checkIdObj.disabled==false)
	{	
		return true;	
	}	
}
/**
 * 判断radio是否有选中,或判断checkbox是否选中一个
 * @param checkIdObj radio或checkbox对象
 */
function getRadioValue(checkIdObj)
{
	//对象是否为空	
	if (checkIdObj == null) 
	{	
		return "";
	}
	//checkbox,并且列表对象有多个
	if(checkIdObj.length)
	{	
		for (i=0; i<checkIdObj.length; i++) 
		{	
			if(checkIdObj[i].checked  &&  checkIdObj[i].disabled==false)
			{	
				return checkIdObj[i].value;
			}	
		}	
		
	}
	else{
		return checkIdObj.value;
	}	
	return "";
}
function getRadioObj(checkIdObj)
{
	//对象是否为空	
	if (checkIdObj == null) 
	{	
		return null;
	}
	//checkbox,并且列表对象有多个
	if(checkIdObj.length)
	{	
		for (i=0; i<checkIdObj.length; i++) 
		{	
			if(checkIdObj[i].checked  &&  checkIdObj[i].disabled==false)
			{	
				return checkIdObj[i];
			}	
		}	
		
	}
	else{
		return checkIdObj;
	}	
	return null;
}

/**
 * 判断checkbox是否有选中
 * @param checkIdObj checkbox对象
 */
function isBoxChecked(checkIdObj)
{
	//对象是否为空
	if(checkIdObj == null)
	{
		return false;
	}
	//checkbox列表对象有多个
	if(checkIdObj.length)
	{
		for(i = 0;i < checkIdObj.length;i++)
		{
			//checkbox有选中项
			if(checkIdObj[i].checked  &&  checkIdObj[i].disabled == false)
			{
				return true;
			}
		}
	}
	//checkbox列表对象只有一个
	else if(checkIdObj.checked  &&  checkIdObj.disabled == false)
	{
		return true;
	}	
}

/**
 * 判断checkbox是否有选中且只能选中一个
 * @param checkIdObj checkbox对象
 */
function isBoxCheckedForOne(checkIdObj)
{
	var flag = 0;
	//对象是否为空
	if(checkIdObj == null)
	{
		return flag;
	}
	//checkbox列表对象有多个
	if(checkIdObj.length)
	{
		for(i = 0;i < checkIdObj.length;i++)
		{
			//checkbox有选中项
			if(checkIdObj[i].checked  &&  checkIdObj[i].disabled == false)
			{
				flag = flag + 1;
			}
		}
	}
	//checkbox列表对象只有一个
	else if(checkIdObj.checked  &&  checkIdObj.disabled == false)
	{
		flag = 1;
	}	
	return flag;
}
	 
/**
 *将str中的第一个非空格字符前空格删除
 */	 
function Trim(str){
 if(str.charAt(0) == ' '){
  str = str.slice(1);
  str = Trim(str); 
 }
 return str;
}

/**
*dateBegin 第一个需要比较的页面日期输入域
*dateEnd 第二个需要比较的页面日期输入域
*isFocus 在校验不通过的情况下是否需要设点焦点
*第一个参数不是日期类型时2000-01-01,提示信息
*第二个参数不是日期类型时2000-01-01,提示信息
*第二个日期大于第一个日期的时候提示信息
*/
function CompareDate(dateBegin,dateEnd,isFocus,str1,str2,str3)
{
	var tempBegin,sBegin;
	var tempEnd,sEnd
			tempBegin=eval("dateBegin.value");
			tempEnd=eval("dateEnd.value");
			sBegin=new String("");
			sEnd=new String("");
			for(var i=0;i<=tempBegin.length-1;i++)
			{
				if(tempBegin.charAt(i)=="-" || tempBegin.charAt(i)=="/")
					sBegin=sBegin+"/";
				else
				{
					if(isNaN(Number(tempBegin.charAt(i))))
					{
						alert(str1);
						if (isFocus)
							dateBegin.focus();
						return false;
					}				
					else
						sBegin=sBegin+tempBegin.charAt(i);
				}
			}
			for(var i=0;i<=tempEnd.length-1;i++)
			{
				if(tempEnd.charAt(i)=="-" || tempEnd.charAt(i)=="/")
					sEnd=sEnd+"/";
				else
				{
					if(isNaN(Number(tempEnd.charAt(i))))
					{
						alert(str2);
						if (isFocus)
							dateEnd.focus();
						return false;
					}				
					else
						sEnd=sEnd+tempEnd.charAt(i);
				}
			}
			dtOne=new Date(sBegin);
			dtTwo=new Date(sEnd);
			if(dtOne.toString()=="NaN")
			{
				dateBegin.focus();
				alert(str1);
				return false;
			}
			if(dtTwo.toString()=="NaN")
			{
				if (isFocus)
					dateEnd.focus();
				alert(str2);
				return false;
			}
			if(dtOne.valueOf()>dtTwo.valueOf())
			{
				if (isFocus)
					dateEnd.focus();
				alert(str3);
				return false;
			}
			else
			{
				return true;
			}
}

/**
 * 反向格式化金额,去掉逗号
 * 自动设置焦点
 * @param strData 需要格式化的数据
 * @return 返回反格式化的金额
 */
 function reverseFormatAmount(thisPoint,lIsMin)
 {
		var i,strTemp;
		var strData = thisPoint.value;
		//去掉所有的","
		strData = reverseFormatAmountString(strData);
		thisPoint.value=strData;
		thisPoint.select();
 }
 /**
 *strAmount 需要反向格式化的金额字符串
 *return 反向格式化好的金额字符串
 */
 function reverseFormatAmountString(strAmount)
 {
 		//去掉所有的","
		strTemp=new String(strAmount);
		strAmount="";
		for(var i=0;i<strTemp.length;i++)
		{
			var cData;
			cData=strTemp.charAt(i);
			if (cData!=",")
			{
				strAmount=strAmount+cData;
			}
		}
		return strAmount;
 }
 
 /**
  * 焦点离开输入框时根据参数校验用户输入的数字
  * @param thisPoint 要校验的对象
  * @param lMaxLen 数字字符串的最长长度，跟Oracle数据库中的字段属性一致，不含小数点
  * @param lScale 小数点后保留的小数位数
  * @param lIsMin 是否允许输负数/正数 -1 都是负数 0 正负均可 1 都是正数
  */
 function validateAmount(thisPoint, lMaxLen, lScale, lIsMin)
 {
 	var strData = thisPoint.value;
	var strReturn = "";
	var strPrefix = "";
	var hasPoint = false;
	if (strData!="")
	{
		//过滤非数字字符
		for(i=0;i<strData.length;i++)
		{
			var cData;
			cData=strData.charAt(i);
			//若字符为0~9或第一个小数点则加到返回的字符串中
			if ((cData>='0' && cData<='9') || (cData == '.' && !hasPoint))
			{
				strReturn += cData;
				//若是第一个小数点 标志置为true
				if (cData == '.')
					hasPoint = true;
			}
			//若是第一个'-'负号 则置为前缀
			else if (strReturn == "" && strPrefix == "" && cData == '-')
				strPrefix += cData;
		}
		//截断前置的0
		var nBegin = 0,nEnd = 0;
		for (nEnd=nBegin; nEnd<strReturn.length && strReturn.charAt(nEnd)=='0'; nEnd++);
		if (nBegin != nEnd)
		{
			//若所有前置0后紧跟着'.' 则删去前置0后再在小数点前添加一个0
			if (strReturn.charAt(nEnd)!='.')
				strReturn = strReturn.substring(0,nBegin)+strReturn.substring(nEnd);
			else
				strReturn = strReturn.substring(0,nBegin)+'0'+strReturn.substring(nEnd);
		}
		var nIndex1 = strReturn.indexOf('.');
		//若整数位长度大于允许的范围，则截断后面的数据
		if (nIndex1>lMaxLen-lScale || (nIndex1==-1 && strReturn.length>lMaxLen-lScale))
			strReturn = strReturn.substring(0,lMaxLen-lScale);
		//格式化小数
		nIndex1 = strReturn.indexOf('.');
		if (nIndex1!=-1)
		{
			var strPoint = strReturn.substring(nIndex1,strReturn.length);
			var strFront = strReturn.substring(0,nIndex1);
			if (nIndex1 == 0)
				strFront = "0";
			strPoint = "" + getRoundAmount(strPoint,lScale);
			strReturn = strFront + strPoint.substring(1);
		}
		//根据lIsMin处理正负数
		if (lIsMin != null && lIsMin == -1)
		{
			if (strPrefix != "-")
				strReturn = "";
		}
		else if (lIsMin != null && lIsMin == 1)
		{
			if (strPrefix != "")
			{
				strPrefix = "";
				strReturn = "";
			}
		}
		//输入框value值为经过处理的数据串
		thisPoint.value = strPrefix + strReturn;
	}
 }
 
  /**
  * 焦点离开输入框时根据参数校验用户输入的金额
  * @param thisPoint 要校验的对象
  * @param lMaxLen 数字字符串的最长长度，跟Oracle数据库中的字段属性一致，不含小数点
  * @param lScale 小数点后保留的小数位数
  * @param lIsMin 是否允许输负数/正数 -1 都是负数 0 正负均可 1 都是正数
  */
 function validateMoney(thisPoint, lMaxLen, lScale, lIsMin)
 {
 	var strData = thisPoint.value;
	var strReturn = "";
	var strPrefix = "";
	var hasPoint = false;
	if (strData!="")
	{
		//过滤非数字字符
		for(i=0;i<strData.length;i++)
		{
			var cData;
			cData=strData.charAt(i);
			//若字符为0~9或第一个小数点则加到返回的字符串中
			if ((cData>='0' && cData<='9') || (cData == '.' && !hasPoint))
			{
				strReturn += cData;
				//若是第一个小数点 标志置为true
				if (cData == '.')
					hasPoint = true;
			}
			//若是第一个'-'负号 则置为前缀
			else if (strReturn == "" && strPrefix == "" && cData == '-')
				strPrefix += cData;
		}
		//截断前置的0
		var nBegin = 0,nEnd = 0;
		for (nEnd=nBegin; nEnd<strReturn.length && strReturn.charAt(nEnd)=='0'; nEnd++);
		if (nBegin != nEnd)
		{
			//若所有前置0后紧跟着'.' 则删去前置0后再在小数点前添加一个0
			if (strReturn.charAt(nEnd)!='.')
				strReturn = strReturn.substring(0,nBegin)+strReturn.substring(nEnd);
			else
				strReturn = strReturn.substring(0,nBegin)+'0'+strReturn.substring(nEnd);
		}
		var nIndex1 = strReturn.indexOf('.');
		//若整数位长度大于允许的范围，则截断后面的数据
		if (nIndex1>lMaxLen-lScale || (nIndex1==-1 && strReturn.length>lMaxLen-lScale))
			strReturn = strReturn.substring(0,lMaxLen-lScale);
		//格式化小数
		nIndex1 = strReturn.indexOf('.');
		if (nIndex1!=-1)
		{
			var strPoint = strReturn.substring(nIndex1,strReturn.length)+"00";
			var strFront = strReturn.substring(0,nIndex1);
			if (nIndex1 == 0)
				strFront = "0";
			strPoint = "" + getRoundAmount(strPoint,lScale);
			strReturn = strFront + strPoint.substring(1);
			if (strPoint.indexOf('.') == -1) //如 1.
				strReturn += ".00";
			if (strPoint.length == 3)		//如 5.2
				strReturn += "0";
		}
		else strReturn += ".00";			//如 2
		if (getRoundAmount(strReturn,2) == 0)
				strReturn = "0.00";			//如 0
		//根据lIsMin处理正负数
		if (lIsMin != null && lIsMin == -1)
		{
			if (strPrefix != "-")
				strReturn = "";
		}
		else if (lIsMin != null && lIsMin == 1)
		{
			if (strPrefix != "")
			{
				strPrefix = "";
				strReturn = "";
			}
		}
		//输入框value值为经过处理的数据串
		thisPoint.value = strPrefix + strReturn;
	}
 }

 /**
  * 格式化金额，自动设置焦点
  * @param strData 需要格式化的数据控件指针
  * @param lIsMin 是否可以为负数，1表示为正，-1表示为负，0表示可以为正可以为负
  * @return 设置数据控件的值为格式化后的金额字符串
  */
 function formatAmount(thisPoint,lScale,lIsMin)
 {
 	var strData = thisPoint.value;
	strData = reverseFormatAmountString(strData);
	strData = parseFloat(strData);
	if (strData>999999999999.99)
		strData = 0.00;
	strData = formatAmountString(strData,lScale,lIsMin);
	thisPoint.value=strData;
 }
 /*
 *
 */
 function getRoundAmount(strData,lScale)
 {
 	var lRectify = 1;
	if (lScale==1)
		lRectify = 10;
	else if (lScale==2)
		lRectify = 100;
	else if (lScale==3)
		lRectify = 1000;
	else if (lScale==4)
		lRectify = 10000;
	else if (lScale==5)
		lRectify = 100000;
	return Math.round(parseFloat(strData)*lRectify)/lRectify;
	/*var strDataCopy = strData;
	strDataCopy = Math.abs(strData);
	var add = 0;
    var s,temp;
    var s1 = strDataCopy + "";
    var start = s1.indexOf(".");
    if(start > 0 && s1.substr(start+lScale+1,1)>=5)add=1;
    var temp = Math.pow(10,lScale);
    s = Math.floor(strDataCopy * temp) + add;
	if (strData >= 0)
    	return s/temp;
	else
		return -1 * s/temp;*/
 }
 /*
 *strData 
 * * @param lIsMin 是否可以为负数，1表示为正，-1表示为负，0表示可以为正可以为负
 */
 function formatAmountString(strData,lScale,lIsMin)
 {
	if(!isNaN(parseFloat(strData)))
 	{
		if(strData!=null)
 		{
			var i,strTemp;

			//去掉所有的","
			strTemp=new String(strData);
			strData="";
			var isValidZero = true;
			var isValidComma = true;
			for(i=0;i<strTemp.length;i++)
			{
				var cData;
				cData=strTemp.charAt(i);
				if(cData=="-" && i==0 && (lIsMin==null || lIsMin=="undefined" || lIsMin == 0 || lIsMin == -1))
				{
					strData = "-";
				}
				else 
				if (cData=="0")
				{
					if (isValidZero)
						strData = strData + cData;
				}
				else
				if (cData==".")
				{
					if (strData!="" && isValidComma)
					{
						strData = strData + cData; 
						isValidComma=true;
					}
				} 
				else
				if (cData!="," && cData!=" ")
				{
					if (!isNaN(cData) || cData==".")
					{
						strData=strData+cData;
						isValidZero = true;
					}
					else
					{
						strData="";
						i=10000;
					}
				}
			}
		}
		if(strData!="")
 		{
			var strRoundAmunt ;
			strRoundAmunt = getRoundAmount(strData,lScale);
			strData = "" + strRoundAmunt;
			//将小数点前和后的数据分别取出来
	 		var nPoint;
	 		nPoint=strData.indexOf(".");
	 		var strFront=strData,strEnd="";
	 		if(nPoint!=-1)
	 		{
	 			strFront=strData.substring(0,nPoint);
	 			strEnd=strData.substring(nPoint+1,strData.length);
	 		}

			//小数点前面的数据加","
			strTemp=new String(strFront);
			var bHaveMinus=false;
			if(strFront.substring(0,1)=="-")
			{
				bHaveMinus=true;
				strTemp=strTemp.substring(1,strTemp.length);
			}
			strFront="";
			var nNum;
			nNum=0;
			for(i=strTemp.length-1;i>=0;i--)
			{
				if(nNum==3)
				{
					strFront=","+strFront ;
					nNum=0;
				}
				nNum++;
				var cData;
				cData=strTemp.charAt(i);
				strFront=cData+strFront;
			}
			if(bHaveMinus)
			{
				strFront="-" + strFront;
			}

			//补或者截小数点后面的值，保持两位
	 		if(strEnd.length>lScale)
	 		{
	 			strEnd=strEnd.substring(0,lScale);
	 		}
	 		else
	 		{
	 			for (i=strEnd.length;i<lScale;i++)
					strEnd = strEnd + "0";
	 		}
			//如果需要小数位
			if (parseInt(lScale,10)> 0)
				{
			 		strData=strFront+"." + strEnd;
				}
			else
				{
					strData=strFront;
				}

 		}
		else
		{
			strData="";
		}
	}
	else
	{
		strData = "";
	}

	if (strData=="")
	{
		if (parseInt(lScale,10)> 0)
			{
				strData="0.";
				for (i=0;i<lScale;i++)
					{
						strData=strData+"0";
					}
			}
		else
			{
				strData="0";
			}
	}
	return strData;
 }

/**
 * 分配权限页面，选中checkbox后触发
 */
function rightBoxChange(thisObj, formName, checkboxName, propertyName)
{
	//form, checkbox, rightNo
	var formCtrl = eval("document." + formName);
	var checkboxCtrl = eval("document." + formName + ".elements['" + checkboxName + "']");
	var propertyCtrl = eval("document." + formName + ".elements['" + propertyName + "']");
	
	if (isNaN(checkboxCtrl.length))
		return;
	
	//nIndex
	var nIndex = 0;
	for (var i = 0; i < checkboxCtrl.length; i++)
	{
		if (checkboxCtrl[i] == thisObj)
		{
			nIndex = i;
			break;
		}
	}
	
	var isChecked = checkboxCtrl[nIndex].checked;
	var nLength = propertyCtrl[nIndex].value.length;
	var strFirst, strSecond, strThird, strFourth, strFifth;
	if (nLength == 2)
	{
		strFirst = propertyCtrl[nIndex].value;
		
		for (var i = 0; i < propertyCtrl.length; i++)
		{
			if (propertyCtrl[i].value.substring(0,2) == strFirst)
				checkboxCtrl[i].checked = isChecked;
		}
	}
	else if (nLength == 4)
	{
		strFirst = propertyCtrl[nIndex].value.substring(0,2);
		strSecond = propertyCtrl[nIndex].value;
		
		var bFlag = false;
		var nUpperIndex = 0;
		for (var i = 0; i < propertyCtrl.length; i++)
		{
			if (propertyCtrl[i].value.substring(0,4) == strSecond)
				checkboxCtrl[i].checked = isChecked;
				
			if (propertyCtrl[i].value == strFirst)
				nUpperIndex = i;
				
			if (propertyCtrl[i].value.length == 4
				&& propertyCtrl[i].value.substring(0,2) == strFirst
				&& checkboxCtrl[i].checked)
				bFlag = true;
		}
		checkboxCtrl[nUpperIndex].checked = bFlag;
	}
	else if (nLength == 6)
	{
		strFirst = propertyCtrl[nIndex].value.substring(0,2);
		strSecond = propertyCtrl[nIndex].value.substring(0,4);
		strThird = propertyCtrl[nIndex].value;
		
		var bFlag = false;
		var nUpperIndex = 0;
		for (var i = 0; i < propertyCtrl.length; i++)
		{
			if (propertyCtrl[i].value.substring(0,6) == strThird)
				checkboxCtrl[i].checked = isChecked;
				
			if (propertyCtrl[i].value == strSecond)
				nUpperIndex = i;
				
			if (propertyCtrl[i].value.length == 6
				&& propertyCtrl[i].value.substring(0,4) == strSecond
				&& checkboxCtrl[i].checked)
				bFlag = true;
		}
		checkboxCtrl[nUpperIndex].checked = bFlag;
		
		var bFlag2 = false;
		var nUpperIndex2 = 0;
		for (var i = 0; i < propertyCtrl.length; i++)
		{
			if (propertyCtrl[i].value == strFirst)
				nUpperIndex2 = i;
				
			if (propertyCtrl[i].value.length == 4
				&& propertyCtrl[i].value.substring(0,2) == strFirst
				&& checkboxCtrl[i].checked)
				bFlag2 = true;
		}
		checkboxCtrl[nUpperIndex2].checked = bFlag2;
	}
	else if (nLength == 8)
	{
		strFirst = propertyCtrl[nIndex].value.substring(0,2);
		strSecond = propertyCtrl[nIndex].value.substring(0,4);
		strThird = propertyCtrl[nIndex].value.substring(0,6);
		strFourth = propertyCtrl[nIndex].value;
		
		var bFlag = false;
		var nUpperIndex = 0;
		for (var i = 0; i < propertyCtrl.length; i++)
		{
			if (propertyCtrl[i].value.substring(0,8) == strFourth)
				checkboxCtrl[i].checked = isChecked;
				
			if (propertyCtrl[i].value == strThird)
				nUpperIndex = i;
				
			if (propertyCtrl[i].value.length == 8
				&& propertyCtrl[i].value.substring(0,6) == strThird
				&& checkboxCtrl[i].checked)
				bFlag = true;
		}
		checkboxCtrl[nUpperIndex].checked = bFlag;
		
		var bFlag2 = false;
		var nUpperIndex2 = 0;
		for (var i = 0; i < propertyCtrl.length; i++)
		{
			if (propertyCtrl[i].value == strSecond)
				nUpperIndex2 = i;
				
			if (propertyCtrl[i].value.length == 6
				&& propertyCtrl[i].value.substring(0,4) == strSecond
				&& checkboxCtrl[i].checked)
				bFlag2 = true;
		}
		checkboxCtrl[nUpperIndex2].checked = bFlag2;
		
		var bFlag3 = false;
		var nUpperIndex3 = 0;
		for (var i = 0; i < propertyCtrl.length; i++)
		{
			if (propertyCtrl[i].value == strFirst)
				nUpperIndex3 = i;
				
			if (propertyCtrl[i].value.length == 4
				&& propertyCtrl[i].value.substring(0,2) == strFirst
				&& checkboxCtrl[i].checked)
				bFlag3 = true;
		}
		checkboxCtrl[nUpperIndex3].checked = bFlag3;
	}
	else if (nLength == 10)
	{
		strFirst = propertyCtrl[nIndex].value.substring(0,2);
		strSecond = propertyCtrl[nIndex].value.substring(0,4);
		strThird = propertyCtrl[nIndex].value.substring(0,6);
		strFourth = propertyCtrl[nIndex].value.substring(0,8);
		strFifth = propertyCtrl[nIndex].value;
		
		var bFlag = false;
		var nUpperIndex = 0;
		for (var i = 0; i < propertyCtrl.length; i++)
		{/*
			if (propertyCtrl[i].value.substring(0,8) == strFourth)
				checkboxCtrl[i].checked = isChecked;
			*/
			if (propertyCtrl[i].value == strFourth)
				nUpperIndex = i;
				
			if (propertyCtrl[i].value.length == 10
				&& propertyCtrl[i].value.substring(0,8) == strFourth
				&& checkboxCtrl[i].checked)
				bFlag = true;
		}
		checkboxCtrl[nUpperIndex].checked = bFlag;
		
		var bFlag2 = false;
		var nUpperIndex2 = 0;
		for (var i = 0; i < propertyCtrl.length; i++)
		{
			if (propertyCtrl[i].value == strThird)
				nUpperIndex2 = i;
				
			if (propertyCtrl[i].value.length == 8
				&& propertyCtrl[i].value.substring(0,6) == strThird
				&& checkboxCtrl[i].checked)
				bFlag2 = true;
		}
		checkboxCtrl[nUpperIndex2].checked = bFlag2;
		
		var bFlag3 = false;
		var nUpperIndex3 = 0;
		for (var i = 0; i < propertyCtrl.length; i++)
		{
			if (propertyCtrl[i].value == strSecond)
				nUpperIndex3 = i;
				
			if (propertyCtrl[i].value.length == 6
				&& propertyCtrl[i].value.substring(0,4) == strSecond
				&& checkboxCtrl[i].checked)
				bFlag3 = true;
		}
		checkboxCtrl[nUpperIndex3].checked = bFlag3;
		
		var bFlag4 = false;
		var nUpperIndex4 = 0;
		for (var i = 0; i < propertyCtrl.length; i++)
		{
			if (propertyCtrl[i].value == strFirst)
				nUpperIndex4 = i;
				
			if (propertyCtrl[i].value.length == 4
				&& propertyCtrl[i].value.substring(0,2) == strFirst
				&& checkboxCtrl[i].checked)
				bFlag4 = true;
		}
		checkboxCtrl[nUpperIndex4].checked = bFlag4;
	}
}

/**
 *校验字符串是否为日期  即满足  yyyy-MM-DD 格式
 *是：返回 true
 *否：返回 false
 */
function checkDate(strDate)
{
	var strCheckDate = "";
	if(strDate.length != 10)
	{
		return false;
	}
	for(var i=0;i<=strDate.length-1;i++)
		{
			if(strDate.charAt(i)=="-" || strDate.charAt(i)=="/")
			{
				strCheckDate=strCheckDate+"/";
			}
			else
			{
				if(isNaN(Number(strDate.charAt(i))))
				{
					return false;
				}				
				else
				{
					strCheckDate=strCheckDate+strDate.charAt(i);
				}
			}
		}
	dtOne=new Date(strCheckDate);
	if(dtOne.toString()=="NaN")
	{
		return false;
	}
	var y=dtOne.getFullYear();
    var m=dtOne.getMonth()+1;
    var d=dtOne.getDate();
	if (m<10) m="0"+m;
	if (d<10) d="0"+d;
	var myday=y + "-" + m + "-" + d;
	if (myday!=strDate)
	{
		return false;
	}
	return true;
}

/**
 *校验字符串是否为日期  即满足  yyyy-MM-DD HH:MM:SS 格式
 *是：返回 true
 *否：返回 false
 */
function checkDateHHMMSS(strDate)
{
	var strCheckDate = "";
	if(strDate.length != 19)
	{
		return false;
	}	
	for(var i=0;i<=strDate.length-1;i++)
		{
			if(strDate.charAt(i)=="-" || strDate.charAt(i)=="/")
			{
				strCheckDate=strCheckDate+"/";
			}
			else
			{
					strCheckDate=strCheckDate+strDate.charAt(i);	
			}
		}		
	dtOne=new Date(strCheckDate);
	if(dtOne.toString()=="NaN")
	{
		return false;
	}
	var y=dtOne.getFullYear();
    var m=dtOne.getMonth()+1;
    var d=dtOne.getDate();
    var h=dtOne.getHours();
    var mi=dtOne.getMinutes();
    var s=dtOne.getSeconds();		
	if (m<10) m="0"+m;
	if (d<10) d="0"+d;
	if(h<10) h ="0"+h;
	if(mi<10) mi="0"+mi;
	if(s<10) s="0"+s;
	var myday=y + "-" + m + "-" + d +" "+h+":"+mi+":"+s;
	if (myday!=strDate)
	{
		return false;
	}
	return true;
}

/**
 *比较日期 ，返回 。。。天。。。小时。。。分。。。秒
 *asStartDate：起始日期
 *asEndDate：结束日期
 *diffDate: 预设施检差
 */
function DateCompare(asStartDate,asEndDate,diffDate){
  	var miStart=Date.parse(asStartDate.replace(/\-/g,'/'));
  	var miEnd=Date.parse(asEndDate.replace(/\-/g,'/'));
	if(miEnd-miStart-diffDate < 0)
	{
		return "已过结束时间";
	}
	var day = parseInt((miEnd-miStart-diffDate)/(1000*24*3600));
	var ho = parseInt((miEnd-miStart-diffDate - (1000*24*3600*day))/(1000*3600));
	var mi = parseInt((miEnd-miStart-diffDate - (1000*24*3600*day)-(1000*3600*ho))/(1000*60));	
	var se = parseInt((miEnd-miStart-diffDate - (1000*24*3600*day)-(1000*3600*ho)-(1000*60*mi))/(1000));		
  	return parseInt((miEnd-miStart-diffDate)/(1000*24*3600))+"天"+ho+"小时"+mi+"分"+se+"秒";
}

/**
 *比较日期 ，返回毫秒数
 *asStartDate：起始日期
 *asEndDate：结束日期
 */
function DateDiff(asStartDate,asEndDate){
  	var miStart=Date.parse(asStartDate.replace(/\-/g,'/'));
  	var miEnd=Date.parse(asEndDate.replace(/\-/g,'/'));
  	return (miEnd-miStart);
}

/**
 *将日期类型格式化为yyyy-mm-dd hh:mm:ss
 */
function formatDateHHMMSS(dtDate)
{
	var y=dtDate.getFullYear();
    var m=dtDate.getMonth()+1;
    var d=dtDate.getDate();
    var h=dtDate.getHours();
    var mi=dtDate.getMinutes();
    var s=dtDate.getSeconds();		
	if (m<10) m="0"+m;
	if (d<10) d="0"+d;
	if(h<10) h ="0"+h;
	if(mi<10) mi="0"+mi;
	if(s<10) s="0"+s;
	var myday=y + "-" + m + "-" + d +" "+h+":"+mi+":"+s;
	return myday;
}
/**
 *功能：校验表单日期数组
 *使用范围：表单中有批量录入、修改数据，并且通过选择每条数
 *	  据前的checkbox或者radio来进行操作的，ehckbox和radio
 *	  的值为数组下标
 * 参数：1、selectedObj    checkbox 或者 raido 的对象，如nameForm.checkBoxName
 *  	 2、checkObj  要校验的日期数组的对象   如 nameForm.amountName
 *		 3、focusObj  校验如果没有通过焦点的位置，如果focusObj没有定义或者为""，
 *		 则焦点被设置到checkObj的相应位置上
 * return：通过校验返回  true ;否则返回false
 */		
function checkMutiDate(selectedObj,checkObj,focusObj)
{
	var returnCehckResult = true;
	if (selectedObj=="")
	{
		if (isNaN(checkObj.length))
		{
			if (checkObj.value!="" && !checkDate(checkObj.value))
			{
				if (focusObj==null || focusObj=="")
				{
					checkObj.focus();
					checkObj.select();
				}
				else
				{
					focusObj.focus();
					focusObj.select();
				}
				returnCehckResult = false;
			}	
		}
		else
		{
			for (var i=0;i<checkObj.length;i++)
			{
				if (checkObj[i].value!="" && !checkDate(checkObj[i].value))
				{
					if (focusObj==null || focusObj=="")
					{
						checkObj[i].focus();
						checkObj[i].select();
					}
					else
					{
						focusObj[i].focus();
						focusObj[i].select();
					}
					returnCehckResult = false;
				}
			}
		}
	}
	else if (isNaN(selectedObj.length))
	 {
	 	if (checkObj.value!="" && !checkDate(checkObj.value))
		{
			checkObj.value="";
			if (focusObj==null || focusObj=="")
			{
				checkObj.focus();
				checkObj.select();
			}
			else
			{
				focusObj.focus();
				focusObj.select();
			}
			returnCehckResult = false;
		}
		else
		{
			return true;
		}
	 }
	 else
	 {
	 	for (var i=0;i<selectedObj.length;i++)
		{
			if (selectedObj[i].checked)
			{
				if (checkObj[i].value!="" &&  !checkDate(checkObj[i].value))
				{
					if (focusObj==null || focusObj=="")
					{
						checkObj[i].focus();
						checkObj[i].select();
					}
					else
					{
						if (isNaN(focusObj.length))
						{
							focusObj.focus();
							focusObj.select();
						}
						else
						{
							focusObj.focus();
							focusObj.select();
						}
					}
					returnCehckResult = false;
				}
			}
		}
	 }
	 return returnCehckResult;
}

/**
功能：校验表单字符串数组不能为空
使用范围：表单中有批量录入、修改数据，并且通过选择每条数
		  据前的checkbox或者radio来进行操作的，ehckbox和radio
		  的值为数组下标
参数：1、selectedObj    checkbox 或者 raido 的对象，如nameForm.checkBoxName
	  2、checkObj  要校验的字符串数组的对象   如 nameForm.amountName
	  3、focusObj  校验如果没有通过焦点的位置，如果focusObj没有定义或者为""，
	  则焦点被设置到checkObj的相应位置上
return：通过校验返回  true ;否则返回false
*/		
function checkMutiRequire(selectedObj,checkObj,focusObj)
{
	var returnCehckResult = true;
		if (selectedObj=="")
	{
		if (isNaN(checkObj.length))
		{
			if (Trim(checkObj.value)=="")
			{
				if (focusObj==null || focusObj=="")
				{
					checkObj.focus();
					checkObj.select();
				}
				else
				{
					focusObj.focus();
					focusObj.select();
				}
				returnCehckResult = false;
			}	
		}
		else
		{
			for (var i=0;i<checkObj.length;i++)
			{
				if (Trim(checkObj[i].value)=="")
				{
					if (focusObj==null || focusObj=="")
					{
						checkObj[i].focus();
						checkObj[i].select();
					}
					else
					{
						focusObj[i].focus();
						focusObj[i].select();
					}
					returnCehckResult = false;
				}
			}
		}
	}
	else if (isNaN(selectedObj.length))
	 {
	 	if (Trim(checkObj.value)=="")
		{
			if (focusObj==null || focusObj=="")
			{
				checkObj.focus();
				checkObj.select();
			}
			else
			{
						if (isNaN(focusObj.length))
						{
							focusObj.focus();
							focusObj.select();
						}
						else
						{
							focusObj.focus();
							focusObj.select();
						}
			}
			returnCehckResult = false;
		}
		else
		{
			return true;
		}
	 }
	 else
	 {
	 	for (var i=0;i<selectedObj.length;i++)
		{
			if (selectedObj[i].checked)
			{
				if (Trim(checkObj[i].value)=="")
				{
					if (focusObj==null || focusObj=="")
					{
						checkObj[i].focus();
						checkObj[i].select();
					}
					else
					{
						if (isNaN(focusObj.length))
						{
							focusObj.focus();
							focusObj.select();
						}
						else
						{
							focusObj.focus();
							focusObj.select();
						}
					}
					returnCehckResult = false;
				}
			}
		}
	 }
	 return returnCehckResult;
}

/**返回文本字符长度
  *@param checkObj 页面上的元素
  *@param lLength 能输入文本的最大长度
  *@param promptInfo 要显示的提示信息
  */
  function checkTextLength(checkObj,lLength,promptInfo)
  	{
		if (checkObj.value.length> parseInt(lLength,10))
			{
				alert(" \""+promptInfo+"\" " + "只能输入 " + lLength + " 个字符,你现在已经输入" + checkObj.value.length + " 个字符! ");
				checkObj.focus();
				return false;
			}
		else
			return true;
	}
/*
*设置Form中checkBox或者radio被选中
*用于页面中明细信息发生变化时自动选中当前记录
*用法：在input 的 onChange事件中调用此方法
*@param thisObj 当前input的指针，固定传入 this
*@param thisObjs 当前 input 的名称，如：form.userName
*@param checkBoxOjb heckBox或者radio对象，如：form.selectNo
*/
function returnSelectedRowNumber(thisObj,thisObjs,checkBoxObjs)
{
	if (isNaN(thisObjs.length))
	{
        return 0;
    }
	else
	{
    	for (var i=0;i<thisObjs.length;i++)
		{
			if (thisObj==thisObjs[i])
			{
                return i;
			}
		}
	}
}
	
/*
*设置Form中checkBox或者radio被选中
*用于页面中明细信息发生变化时自动选中当前记录
*用法：在input 的 onChange事件中调用此方法
*@param thisObj 当前input的指针，固定传入 this
*@param thisObjs 当前 input 的名称，如：form.userName
*@param checkBoxOjb heckBox或者radio对象，如：form.selectNo
*/
function autoSelectChecked(thisObj,thisObjs,checkBoxObjs)
{
	if (isNaN(checkBoxObjs.length))
	{
		if (checkBoxObjs!=null && checkBoxObjs!="")
			if(checkBoxObjs.disabled != true)
				checkBoxObjs.checked = true;
	}
	else
	{
		for (var i=0;i<thisObjs.length;i++)
		{
			if (thisObj==thisObjs[i])
			{
				if (checkBoxObjs!=null && checkBoxObjs!="")
                {
					if(checkBoxObjs[i].disabled != true)
        	            checkBoxObjs[i].checked = true;
                    break;
                }
			}
		}
	}
}

/**
 * 设置 Select 的缺省值
 * @param selectObj     Select控件
 * @param strValue      缺省值
 */
function selectOption(selectObj, strValue)
{
    if(selectObj != null && selectObj != 'undefined')
    {
        if(isNaN(selectObj.length))
        {
            if(selectObj.value == strValue)
            {
                selectObj.selected = true;
            }
        }
        else
        {
        	for (i = 0; i < selectObj.length; i++)
        	{
                if(selectObj[i].value == strValue)
                {
                    selectObj[i].selected = true;
                    break;
                }
        	}
        }
    }
}

/**
 * 设置 Radio 的缺省值
 * @param radioObj      Radio控件
 * @param strValue      缺省值
 *
 * 设置 Checkbox 的缺省值时，可以通过多次调用 radioOption() 来实现：
 * radioOption(document.formName.elements['selectIndex'],"0");
 * radioOption(document.formName.elements['selectIndex'],"1");
 * radioOption(document.formName.elements['selectIndex'],"2");
 */
function radioOption(radioObj, strValue)
{
    if(radioObj != null && radioObj != 'undefined')
    {
        if(isNaN(radioObj.length))
        {
            if(radioObj.value == strValue)
            {
                radioObj.checked = true;
            }
        }
        else
        {
        	for (i = 0; i < radioObj.length; i++)
        	{
                if(radioObj[i].value == strValue)
                {
                    radioObj[i].checked = true;
                    //break;
                }
        	}
        }
    }
}
	
/**
* Reference: Sandeep V. Tamhankar (stamhankar@hotmail.com),
* http://javascript.internet.com
*/
	function checkEmail(emailStr) 
	{
		if (emailStr.length == 0) 
		{
			return true;
		}
		var emailPat=/^(.+)@(.+)$/;
		var specialChars="\\(\\)<>@,;:\\\\\\\"\\.\\[\\]";
		var validChars="\[^\\s" + specialChars + "\]";
		var quotedUser="(\"[^\"]*\")";
		var ipDomainPat=/^(\d{1,3})[.](\d{1,3})[.](\d{1,3})[.](\d{1,3})$/;
		var atom=validChars + '+';
		var word="(" + atom + "|" + quotedUser + ")";
		var userPat=new RegExp("^" + word + "(\\." + word + ")*$");
		var domainPat=new RegExp("^" + atom + "(\\." + atom + ")*$");
		var matchArray=emailStr.match(emailPat);
		if (matchArray == null) 
		{
			return false;
		}
		var user=matchArray[1];
		var domain=matchArray[2];
		if (user.match(userPat) == null)
		{
			return false;
		}
		var IPArray = domain.match(ipDomainPat);
		if (IPArray != null) 
		{
			for (var i = 1; i <= 4; i++) 
			{
				if (IPArray[i] > 255) 
				{
					return false;
				}
			}
			return true;
		}
		var domainArray=domain.match(domainPat);
		if (domainArray == null) 
		{
			return false;
		}
		var atomPat=new RegExp(atom,"g");
		var domArr=domain.match(atomPat);
		var len=domArr.length;
		if ((domArr[domArr.length-1].length < 2) ||(domArr[domArr.length-1].length > 3)) 
		{
			return false;
		}
		if (len < 2) 
		{
			return false;
		}
		return true;
	}
//trim	
String.prototype.trim = function()
{
    return this.replace(/(^[\s]*)|([\s]*$)/g, "");
}	

//对字符串进行处理
//oralString 传入的字符串
var objForOrder;
function dealString(oralString)
{
	return oralString.replace("\"","\\\"");
}

//对字符串进行处理
//oralString 传入的字符串
function chgOrder(strOrderKey,ascOrDesc)
{
	if(strOrderKey==null||strOrderKey==''||strOrderKey=='undefined')
	{	
		return false;
	}
	var imgstyle = eval('document.images.'+strOrderKey);
	if(ascOrDesc.toUpperCase() == "ASC")
	{
		imgstyle.src="../images/paixu.gif";	
	}
	else
	{
		imgstyle.src="../images/paixuUp.gif";	
	}
}
//checkbox验证，验证是否重复添加
//res 源checkbox  
//dex 目标checkbox
function checkRepeat(res,des){
	if (des==null){
		return true;
	}
	if (res.value==null){
		for (var i= 0;i<res.length;i++){
			if (res[i].checked==true){
				if (des.value!=null){
					if (res[i].value==des.value){
						alert("重复选定，请重新选择");
						return false;
					}
				}
				for (var j = 0;j<des.length;j++){
					if (res[i].value==des[j].value){
						alert("重复选定，请重新选择");
						return false;
					}
				}
			}
		}
	}else{
		if (des.value!=null){
			if (res.value==des.value){
				alert("重复选定，请重新选择");
				return false;
			}
		}
		for (var j = 0;j<des.length;j++){
			if (res.value==des[j].value){
				alert("重复选定，请重新选择");
				return false;
			}
		}
	}
	return true;
}
var load_display = false;
function loadHiddenPage(path){
	var searchBtn = document.getElementById("controlSearchBtn");
	var searchTable = document.getElementById("adSearch");
	if(!load_display){
		searchTable.style.display = "none";
		searchBtn.src = path + "/images/button_minus1.gif";
		
		load_display = true;
	}else{
		searchTable.style.display = "";
		searchBtn.src = path + "/images/button_minus.gif";
		load_display = false;
	}
	setTableStyle();
}
function setTableStyle(){

		var tableObj = document.getElementById("dataTable");
		var trObjs = null;
		if(tableObj) {
			trObjs = tableObj.getElementsByTagName("tr");
		}
		
		for(var i = 0;i < trObjs.length; i++) {
			//if(tabObj.className != "thStyle"){
				trObjs[i].onmouseout = outHandler;
				trObjs[i].onmouseover = overHandler;
			//}
		}
	}
	var currentObj;

	function showInfo(showId,obj) {
		if(document.getElementById("radioId"+showId).type =="radio")
		{
			document.getElementById("radioId"+showId).checked=true;
		}
		else if(document.getElementById("radioId"+showId).type.indexOf("check") > -1)
		{
			if(document.getElementById("radioId"+showId).checked)
				document.getElementById("radioId"+showId).checked=true;
			else
				document.getElementById("radioId"+showId).checked=false;
		}
		
		obj.onmouseover = empty;
		obj.onmouseout = empty;
		obj.className = 'green';
		if(currentObj){			
			currentObj.className = 'out';
			currentObj.onmouseover = overHandler;
			currentObj.onmouseout = outHandler;
		}
		currentObj = obj;
	}
	function empty() {
	}
	function outHandler() {
		this.className = 'out';
	}
	function overHandler() {
		this.className = "over";
	}

