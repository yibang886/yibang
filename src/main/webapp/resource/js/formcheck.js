/* 通用前端校验函数（请不断扩充）,主要提供对于要提交的表单内容的检查，检查内容主要包括：必输项、
 * 数据类型、数据长度、文件大小等
 * 使用方法：
 *   1. 需要校验的页面通过<script src="formcheck.js">包含本文件，具体路径各项目制订。
 *   2. 校验规则的运用，举例说明：
        <input id="Y_str" name="address" type="text" size="15" title="地址" maxlength="100">
        以上例子是对一个地址输入框的校验，详细说明如下：
        id - 放置了必输项和数据类型的校验规则，Y表示必输，N表示不必输;str表示是字符串类型，
             更多的校验规则如下（按必输举例，不必输就是将Y换成N）：
              Y_enn ---- 必输、英文和数字
              Y_str ---- 必输、字符串
              Y_int ---- 必输、数字格式
              Y_fla ---- 必输、浮点格式
              Y_flo ---- 必输、浮点格式
              Y_cod ---- 必输、邮编格式
              Y_dat ---- 必输、日期格式(YYYY-MM-dd)
              Y_mal ---- 必输、email格式(xxx@xxx.com)
              Y_fil ---- 必输、文件格式（针对input type=file的输入框）
              Y_pho ---- 必输、电话或是手机格式
              Y_ph1 ---- 必输、电话或是手机格式
              Y_ph2 ---- 必输、电话或是手机格式,第一位必须是0
              Y_ph3 ---- 必输、电话
              Y_ph4 ---- 必输、电话(01088888888(-1702))
              Y_mob ---- 必输、手机格式
              Y_url ---- 必输、URL地址格式
              Y_pap ---- 必输、身份证号码格式
              Y_pop ---- 必输、身份证或是护照格式（中航信）
              Y_chi ---- 必输、验证是否为中文
              Y_eng ---- 必输、验证是否为非中文
              Y_USN ---- 必输、验证是否为中文姓名
              Y_car ---- 必输、验证是否为车牌
              Y_IPS ---- 必输、验证是否为合法IP地址
              Y_PSS ---- 必输、验证是否符合密码规则 
              Y_PS2 ---- 必输、验证是否符合密码规则，并且第一次输入的相等,自定义属性passwordName="第一次输入的密码name"
        title - 放置了本输入框的友好名称，报警时使用。
        maxlength - 放置了输入框的最大长度，本formcheck已经考虑了中文问题，所以比如:maxlength=50
                    的情况，则纯英文字符能最多输入50个，而中文最多输入25个。

 *   3. 激活校验机制，有两种方法：
        1)如果你的form是通过submit类型的按钮触发提交，你可以如此激活：
            在form标签中加入： onsubmit="return checkSubmit(this)"
        2)如果你的form是通过javascript代码触发提交，则你必须使用类似如下语句激活：
            if checkSubmit(表单名) 表单名.submit();
 */

function Trim() {
return this.replace(/\s+$|^\s+/g,"");
}


var hasclick=false;
//var oPopup = window.createPopup();

function checkSubmit(form){

if (hasclick){
	return false;
}else{
	hasclick=true;

}
		//首先判断，然后改名字

 var p1=/(^\s*)|(\s*$)/g
 var p2=/(^[ 　]*)|([ 　]*$)/g

 var fso;
 var file;
 checkactivex=true;
 var totalcheckfilesize=0;
 var strtitle="";
 var strrule="";
 var str_warn="";

    for(i=0;i<form.length;i++)
    {
       if((form[i].tagName.toUpperCase()=="INPUT" && form[i].type.toUpperCase()!="BUTTON")||(form[i].tagName.toUpperCase()=="TEXTAREA")||(form[i].tagName.toUpperCase()=="SELECT")){
    	 if(form[i].type=="file")
    		 continue;
		form[i].value=form[i].value.replace(p1,"");
		form[i].value=form[i].value.replace(p2,"");
	}
	str_warn="";
	//检测判断条件，根据类型不同可以修改---如果是input类型,textArea类型
	//使用方法：
	//在需要校验的form中对象名，采用规范的对象命名
	//例如：Y_int_mustint   ---->   代表 此处校验：Y代表不能为空，int 代表必须是int类型
	//     N_fla_mustfla   ---->   代表 此处校验：N代表可以为空，fla 如果不为空必须是 float类型
	//     N_dat_mustdate  ---->   代表 此处校验：N代表可以为空，dat 如果不为空必须是 日期类型（格式采用统一格式：YYYY-MM-DD）
	//     Y_mal_sdfsdfsd  ---->   代表 此处校验：Y代表不能为空，mal 代表必须是email类型
	//     Y_fil_sdfsdfsd  ---->   代表 此处校验：Y代表不能为空，fil 代表必须是file“上传”类型
	//     Y_str_xxxxxxx   ---->   代表 此处校验：Y代表不能为空，str 代表必须是String类型
	//     Y_net_sdfsdfsd  ---->   代表 此处校验：Y代表不能为空，net 代表必须是输入的网络连接类型
	//     Y_pho_mustfla   ---->   代表 此处校验：Y代表不能为空，pho 如果不为空必须是 电话或是手机类型
    if((((form[i].tagName.toUpperCase()=="INPUT") && (form[i].type.toUpperCase()=="TEXT" || form[i].type.toUpperCase()=="PASSWORD" || form[i].type.toUpperCase()=="FILE")) || (form[i].tagName.toUpperCase()=="TEXTAREA")||(form[i].tagName.toUpperCase()=="SELECT")) && (form[i].title!=""))
    {
		//alert(form[i].title+form[i].value.length+form[i].value.indexOf("Y"));


	   //取得判断类型和提示
	   strtitle="";
	   strrule="";
	   if(form[i].title.indexOf("Y_")==0 || form[i].title.indexOf("N_")==0){
	   	strtitle= form[i].title.substring(6,form[i].title.length);
	   	strrule= form[i].title.substring(2,5).toUpperCase();
	   }else{
	   	strtitle= form[i].title;
	   }
	   if(form[i].name.indexOf("Y_")==0 || form[i].name.indexOf("N_")==0){
	   	strrule= form[i].name.substring(2,5).toUpperCase();
	   }
	   if(form[i].id.indexOf("Y_")==0 || form[i].id.indexOf("N_")==0){
	   	strrule= form[i].id.substring(2,5).toUpperCase();
	   	
	   }
	   //alert(strrule);
	   //取得结束

	   //首先判断所有元素有Y的不能为空
	   if(form[i].name.indexOf("Y_")==0 || form[i].title.indexOf("Y_")==0 || form[i].id.indexOf("Y_")==0)
	   {

                      if(form[i].value.length<1){
                      		str_warn=strtitle+"不能为空!";
                      		alert(str_warn);
                      		form[i].focus();
                      		return checkreturn(false);
                      }
	   }
	   //然后填写数据的判断类型匹配
	   if(form[i].value.length>0)
		 {

				//输入只能是英文和数字
				if (strrule=="ENN"){
					if((/[^0-9a-zA-Z]/g).test(form[i].value)){
						str_warn=strtitle+"格式不对,必须是英文和数字！";
	                    alert(str_warn);
	                    form[i].select();
						form[i].focus();
					    return checkreturn(false);
					}
				}
				//判断3－5位的格式
				if(strrule=="INT")//int数字校验
				{
					if(!isInt(form[i].value))
					{
						str_warn=strtitle+"格式不对,必须是整形数值！";
	                     				alert(str_warn);
	                     	form[i].select();
						form[i].focus();
					        return checkreturn(false);
					}
				}
				
				if(strrule=="FLT")//float数字校验
				 {
					if(!isFloatAnthoer(form[i].value))
					{
						str_warn=strtitle+"浮点格式错误，正确的格式是整数位9位以下，小数点后2位以内！";
                      	alert(str_warn);
                      	form[i].select();
						form[i].focus();
					    return checkreturn(false);
					}
				}
				
				if(strrule=="FLA")//float数字校验
				 {
					if(!isFloat(form[i].value))
					{
						str_warn=strtitle+"浮点格式错误，正确的格式是整数位7位以下，小数点后2位以内！";
                      				alert(str_warn);
                      	form[i].select();
						form[i].focus();
					        return checkreturn(false);
					}
				}
				if(strrule=="FLO")//float数字校验
				 {
				    if(form[i].floattype)
				    {
				    	var floattype = form[i].floattype;
				    	var dec = floattype.split(",");
				    	if(!isFloatValue(form[i].value,dec))
				    	{
				    		str_warn=strtitle+"浮点格式错误，正确的格式是整数位"+(parseInt(dec[0]) - parseInt(dec[1]))+"位以下，小数点后"+dec[1]+"位以内！";
                      		alert(str_warn);
                      		form[i].select();
							form[i].focus();
					        return checkreturn(false);
				    	}
				    }
					else if(!isFloat(form[i].value))
					{
						str_warn=strtitle+"浮点格式错误，正确的格式是整数位7位以下，小数点后2位以内！";
                      				alert(str_warn);
                      	form[i].select();
						form[i].focus();
					        return checkreturn(false);
					}
				}
				if(strrule=="DAT")//date校验
				 {
					if(!isDate(form[i].value))
					{
						str_warn=strtitle+"格式不对,必须是日期型数据！\n格式为：YYYY-MM-DD";
                      				alert(str_warn);
                      	form[i].select();
						form[i].focus();
					        return checkreturn(false);
					}
				}
				if(strrule=="IPS")//IP校验
				 {
				 	//alert("form["+i+"].name : " + form[i].name);
				 	//alert("form["+i+"].value : " + form[i].value);
					if(!verifyIps(form[i].value))
					{
						str_warn=strtitle+"格式不对,必须是IP类型！\n格式为：202.122.3.90或202.122.3.90,202.122.3.91";
                     				alert(str_warn);
                     	form[i].select();//alert("form["+i+"].select()");
						form[i].focus();//alert("form["+i+"].focus()");
					        return checkreturn(false);
					}
				}
				if(strrule == "PSS")
				{
					if(!verifyPassword(form[i].value))
					{
						str_warn=strtitle+"格式不对,必须符合密码规则！\n格式为：密码必须包含字母、数字、特殊符号，并且长度大于等于8位！";
         				alert(str_warn);
         				form[i].select();
         				form[i].focus();
         				return checkreturn(false);
					}
				}
				if(strrule == "PS2")
				{
					//var pass1 = document.all[form[i].passwordName].value;
					//var pass1Title = document.all[form[i].passwordName].title;;
					var pass1 = document.getElementById("Y_PS2_password").value;
					var pass2 =  document.getElementById("N_str_password").value;
					if(pass2 != pass1)
					{
						str_warn=strtitle+"必须与"+ pass1Title+ "相同";
         				alert(str_warn);
         				form[i].select();
         				form[i].focus();
         				return checkreturn(false);
					}
				}
				if(strrule=="COD")//code校验
				 {
					if(!isCode(form[i].value))
					{
						str_warn=strtitle+"格式不对,必须是邮政编码！\n格式为：100000";
                      				alert(str_warn);
                      	form[i].select();
						form[i].focus();
					        return checkreturn(false);
					}
				}
				
				if(strrule=="PAP")//身份校验
				 {
				 	var a = "验证通过!";
				 	form[i].value = form[i].value.toUpperCase();
				 	str_warn = checkPaperCode(form[i]);
				 	if(a != str_warn)
				 	{
				 		alert(str_warn);
				 		form[i].select();
						form[i].focus();
				 		return checkreturn(false);
				 	}
					
				}

				if(strrule=="POP")//身份证或是护照校验
				{
					var a = "验证通过!";
				 	form[i].value = form[i].value.toUpperCase();
				 	//15或是18位为身份证
				 	if(form[i].value.length==15 || form[i].value.length==18){
					 		str_warn = checkPaperCode(form[i]);					 	
						 	if(a != str_warn)
						 	{
						 		alert(str_warn);
						 		form[i].select();
								form[i].focus();
						 		return checkreturn(false);
						 	}
				 	}
				}
				if(strrule=="MAL")//mail校验
				 {
					if(!isMailAddress(form[i].value))
					{
						str_warn=strtitle+"格式不对,必须是正确的邮件地址！\n格式为：sina@sina.com";
                      				alert(str_warn);
                      	form[i].select();
						form[i].focus();
					        return checkreturn(false);
					}
				}
				if(strrule=="MOB")//mail校验
				 {
					if(!isMobile(form[i].value))
					{
						str_warn=strtitle+"格式不对,必须是正确的手机号码！\n格式为：13901234567";
                      				alert(str_warn);
                      	form[i].select();
						form[i].focus();
					        return checkreturn(false);
					}
				}
				if(strrule=="URL")//URL校验
				 {
					if(!isUrl(form[i].value))
					{
						str_warn=strtitle+"格式不对,必须是正确的URL地址！\n格式为：http://www.sohu.com";
                      				alert(str_warn);
                      	form[i].select();
						form[i].focus();
					        return checkreturn(false);
					}
				}
				if(strrule=="PHO")//电话校验
				 {
				 	if(form[i].value.length <8)
				 	{
				 		str_warn=strtitle+"格式不对,必须是正确的电话(传真)长度(不能小于八位)！";
                      				alert(str_warn);
                      	form[i].select();
						form[i].focus();
					        return checkreturn(false);
				 	}
					else if(!ValidPhone(form[i]))
					{
						str_warn=strtitle+"格式不对,必须是正确的电话！\n格式为：010-88888888";
                      				alert(str_warn);
                      	form[i].select();
						form[i].focus();
					        return checkreturn(false);
					}
				}
				if(strrule=="PH1")//电话校验
				 {
				 	if(form[i].value.length <8)
				 	{
				 		str_warn=strtitle+"格式不对,必须是正确的电话(传真)长度(不能小于八位)！";
                      				alert(str_warn);
                      	form[i].select();
						form[i].focus();
					        return checkreturn(false);
				 	}
					else if(!ValidPhone1(form[i]))
					{
						str_warn=strtitle+"格式不对,必须是正确的电话！\n格式为：01088888888";
                      				alert(str_warn);
                      	form[i].select();
						form[i].focus();
					        return checkreturn(false);
					}
				}
				if(strrule=="PH2")//电话校验
				 {
				 	if(form[i].value.length <8)
				 	{
				 		str_warn=strtitle+"格式不对,必须是正确的电话(传真)长度(不能小于八位)！";
                      				alert(str_warn);
                      	form[i].select();
						form[i].focus();
					        return checkreturn(false);
				 	}
					else if(!ValidPhone2(form[i]))
					{
						str_warn=strtitle+"格式不对,必须是正确的电话！\n格式为：01088888888";
                      				alert(str_warn);
                      	form[i].select();
						form[i].focus();
					        return checkreturn(false);
					}
				}
				if(strrule=="PH3")//电话校验
				 {
				 	if(form[i].value.length <7)
				 	{
				 		str_warn=strtitle+"格式不对,必须是正确的电话(传真)长度(不能小于七位)！";
                      				alert(str_warn);
                      	form[i].select();
						form[i].focus();
					        return checkreturn(false);
				 	}
					else if(!ValidPhone3(form[i]))
					{
						str_warn=strtitle+"格式不对,必须是正确的电话！\n格式为：88888888";
                      				alert(str_warn);
                      	form[i].select();
						form[i].focus();
					        return checkreturn(false);
					}
				}
				if(strrule=="PH4")//电话校验
				 {
				 	if(form[i].value.length <8)
				 	{
				 		str_warn=strtitle+"格式不对,必须是正确的电话(传真)长度(不能小于八位)！";
                     				alert(str_warn);
                     	form[i].select();
						form[i].focus();
					        return checkreturn(false);
				 	}
					else if(!ValidPhone4(form[i]))
					{
						str_warn=strtitle+"格式不对,必须是正确的电话！\n格式为：01088888888(-1702)";
                     				alert(str_warn);
                     	form[i].select();
						form[i].focus();
					        return checkreturn(false);
					}
				}
				if(strrule=="CHI")//验证中文 
				 {
				 	if(!checkChinese(form[i]))
					{
						str_warn=strtitle+"格式不对,必须是中文！";
                      				alert(str_warn);
                      	form[i].select();
						form[i].focus();
					        return checkreturn(false);
					}
				}
				if(strrule=="ENG")//验证英文 
				 {
				 	if(!checkEnglish(form[i]))
					{
						str_warn=strtitle+"格式不对,只支持英文、数字、下划线等字符\n并且第一位不能为下划线！";
                     				alert(str_warn);
                     	form[i].select();
						form[i].focus();
					        return checkreturn(false);
					}
				}
				if(strrule=="USN")//验证姓名
				 {
				 	if(!checkChinese1(form[i]))
					{
						str_warn="格式不对,必须是中文姓名！";
                     				alert(str_warn);
                     	form[i].select();
						form[i].focus();
					        return checkreturn(false);
					}
				}
				if(strrule=="UEN") //验证中文和英文姓名
				{
					if(/[A-Za-z]/.test(form[i].value.substring(0,1)))//包含英文
					{
						if(!checkEnName(form[i]))
						{
							str_warn="英文姓名格式不对！";
             				alert(str_warn);
			             	form[i].select();
							form[i].focus();
							return checkreturn(false);
						}
					} else {
						if(!checkChinese1(form[i]))
						{
							str_warn=strtitle+"中文姓名格式不对！";
	                     	alert(str_warn);
	                     	form[i].select();
							form[i].focus();
						    return checkreturn(false);
						}
					}
				}
				if(strrule=="CAR")//验证车牌
				 {
				 	if(!checkAutoNo(form[i]))
					{
						str_warn=strtitle+"格式不对,必须是正确的车牌（京A1234(5)）！";
                     				alert(str_warn);
                     	form[i].select();
						form[i].focus();
					        return checkreturn(false);
					}
				}
				if(strrule=="FIL")//文件校验，包括大小和路径的正确性
				 {

					try{
						//将全部文件大小和与form里的totalsize属性提供的大小比较
						//if ((navigator.appName == "Microsoft Internet Explorer") && (parseInt(navigator.appVersion) >= 6 )){

							if (form[i].filetype!=null){
								if (checkfiletype(form[i].value,form[i].filetype)!=true){
									str_warn=strtitle+"选择的文件类型不正确，请重新选择。";
                      							alert(str_warn);
									form[i].focus();
									return checkreturn(false);
								}
							}

							if (form[i].totalsize!=null && isInt(form[i].totalsize)){
								returnsize = getfilesize(form[i].value);
								if (returnsize<0)
								{
									form[i].focus();
									return checkreturn(false);
								}else{
									totalcheckfilesize=totalcheckfilesize+returnsize;
								}
								if (totalcheckfilesize>form[i].totalsize){
									alert("上传文件不允许超过"+form[i].totalsize/1048576+"M。");
									return checkreturn(false);
								}
							}
						//}else{
						//	alert(navigator.appName);
						//	alert(navigator.appVersion);
						//}
					}catch(e){
						alert(e.message);
						continue;
					}
				}
				if(strrule=="NET")//文件校验，包括大小和路径的正确性
				 {

					if (form[i].filetype!=null){
						if (checkfiletype(form[i].value,form[i].filetype)!=true){
							alert(strtitle+"选择的文件类型不正确，请重新选择。");
							form[i].focus();
							return checkreturn(false);
						}
					}
				}

                                //判断最大录入长度限制
                                var maxLength =null;
                                maxLength = form[i].maxLength;
                                if (maxLength==null) maxLength = form[i].maxlength;
                                if (maxLength!=null && StrLen(form[i].value)>maxLength) {
                                        str_warn=strtitle+"录入的字数不能超过"+maxLength/2+"个汉字("+maxLength+"个字符)";
                                        alert(str_warn);
                                        form[i].focus();
	                        	return checkreturn(false);
                                }

                                if (ilegalChar(form[i].value)) {
                                         str_warn = strtitle+"包含有非法字符，例如 "+ilegalChars;
                                         alert(str_warn);
                                         form[i].select();
                                         form[i].focus();
                                         return checkreturn(false);
                                }
		 }

	}
	

  }//end for



	//改名字
	for(i=0;i<form.length;i++){
		//凡是这种类型的
		if((((form[i].tagName.toUpperCase()=="INPUT") && (form[i].type.toUpperCase()=="TEXT" || form[i].type.toUpperCase()=="PASSWORD" || form[i].type.toUpperCase()=="FILE")) || (form[i].tagName.toUpperCase()=="TEXTAREA")||(form[i].tagName.toUpperCase()=="SELECT")) && (form[i].title!=""))
                {
                         if (form[i].name.indexOf("Y_")==0 || form[i].name.indexOf("N_")==0)
                         //把Y_str_sdfsdf 转换成 sdfsdf

	                 form[i].name=form[i].name.substring(6,form[i].name.length);
                }
	}
	return checkreturn(true);
}
function checkreturn(checkvalue){
	if (checkvalue==true){
	    document.xwaitting = 100;
		//window.open("/js/waitting.htm","wait","toolbar=no,status=no,menubar=no,scrollbars=no,width=250,height=165,top=330,left=400");
		//setTimeout("hasclick=false",10000);
		//var oPopupBody = oPopup.document.body;
		var height=50;var width=240;
		var x=screen.width/2-135;var y=screen.height/2-55;
		//oPopupBody.style.background  = "running.gif";
		//oPopupBody.style.border = "solid blue 3px";
		//oPopupBody.innerHTML="<img src='/js/running.gif' border=0>";
		//oPopup.show(x, y, width, height);
		//setTimeOut这句话是为了防止popUp出来的窗口不能自动消失
		setTimeout("oPopup.hide()",1000);
		hasclick=false;
		return true;

	}else{
		hasclick=false;
		return false;
	}
}
//检查整形数值的函数
function isInt(inputVal) {
   inputStr = inputVal.toString()
   for (var i = 0; i < inputStr.length; i++) {
          var oneChar = inputStr.charAt(i)
         if (oneChar < "0" || oneChar > "9") {
              if(i ==0 && oneChar == "-" )
              {
              	if(inputStr.length == 1){
              		return false;
              	}
              	for(var j = 1;j<inputStr.length;j++){
              		var onlyChar = inputStr.charAt(j)
              		if (onlyChar < "0" || onlyChar > "9" ) {
              			return false;
              		}
              	}
              	
              	return true;
              		
              }
              else
              {
              	 return false;
              }
          
        }
   }
return true;
}
//检查浮点型数值的函数
function isFloat(inputVal) {
  inputStr = inputVal.toString()
   for (var i = 0; i < inputStr.length; i++) {
         var oneChar = inputStr.charAt(i)
         var aa = "0123456789.";
         if (aa.indexOf(oneChar) == -1) {
              return false;
        }
   }
   var numberArray = new Array();
   var intLength = 0;
   var decLength = 0;
   numberArray = inputStr.split(".");
   if (numberArray.length<=2) {
     if (numberArray[0]!=null) {
       intLength = numberArray[0].length;
       if (numberArray[1]!=null) {
         decLength = numberArray[1].length;
       }
       if (intLength>7) return false
       else if ((numberArray[0] - 8359999)>0) return false;
       if (decLength>2) return false;
     } else return false;

   } else return false;

  return true;
}

//检查浮点型数值的函数,浮点数证书长度最长为8位，小数点后位数不能超过2位
function isFloatAnthoer(inputVal) {
  inputStr = inputVal.toString()
   for (var i = 0; i < inputStr.length; i++) {
         var oneChar = inputStr.charAt(i)
         var aa = "0123456789.-";
         if (aa.indexOf(oneChar) == -1) {
              return false;
        }
   }
   var numberArray = new Array();
   var intLength = 0;
   var decLength = 0;
   numberArray = inputStr.split(".");
   if (numberArray.length<=2) {
     if (numberArray[0]!=null) {
       intLength = numberArray[0].length;
       if (numberArray[1]!=null) {
         decLength = numberArray[1].length;
       }
       if (intLength>9) return false
       else if ((numberArray[0] - 99999999)>0) return false;
       if (decLength>2) return false;
     } else return false;

   } else return false;

  return true;
}
/**
*
*/
function isFloatValue(inputVal,dec)
{
	
   var inputStr = inputVal.toString();
   for (var i = 0; i < inputStr.length; i++) {
         var oneChar = inputStr.charAt(i)
         var aa = "0123456789.";
         if (aa.indexOf(oneChar) == -1) {
              return false;
        }
   }
   var numberArray = new Array();
   var intLength = 0;
   var decLength = 0;
   numberArray = inputStr.split(".");
   if (numberArray.length<=2) {
     if (numberArray[0]!=null) {
       intLength = numberArray[0].length;
       if (numberArray[1]!=null) {
         decLength = numberArray[1].length;
       }
       if (intLength > (parseInt(dec[0]) - parseInt(dec[1]))) return false;
       if (decLength > parseInt(dec[1])) return false;
     } else return false;

   } else return false;

  return true;
}
function isCode(inputValue)
{
	if(!isInt(inputValue))
	{
		return false;
	}
	if(inputValue.length != 6)
	{
		return false;
	}
	return true;
}
//检查日期型数据
function isDate(sDate)
{
	var iaMonthDays = [31,28,31,30,31,30,31,31,30,31,30,31]
	var iaDate = new Array(3)
	var year, month, day
	if (arguments.length != 1) return false
	iaDate = sDate.toString().split("-")
	if (iaDate.length != 3) return false
	if (iaDate[1].length <1 || iaDate[1].length>2 || iaDate[2].length < 1 || iaDate[2].length > 2) return false
	year = parseFloat(iaDate[0])
	month = parseFloat(iaDate[1])
	day=parseFloat(iaDate[2])
	if (!isInt(year) || !isInt(month) || !isInt(day)) return false;

	if (year < 1900 || year > 2100) return false
	if (((year % 4 == 0) && (year % 100 != 0)) || (year % 400 == 0)) iaMonthDays[1]=29;
	if (month < 1 || month > 12) return false
	if (day < 1 || day > iaMonthDays[month - 1]) return false
	return true
}
//校验邮件
function isMailAddress(strMail){
   if(/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(strMail)){
   return true;
   }
   
   return false;
}
function isMobile(strMobile)
{
	if(/^((\(\d{2,3}\))|(\d{3}\-))?1[358]\d{9}$/.test(strMobile)){
   return true;
   }
   
   return false;
}
function isUrl(strUrl)
{
	if(/^http:\/\/[A-Za-z0-9]+\.[A-Za-z0-9]+[\/=\?%\-&_~`@[\]\':+!]*([^<>\"\"])*$/.test(strUrl)){
   return true;
   }
   
   return false;
}
//检查指定名称的所有的RadioButton中是否有一个被选中
//参数是radiobutton的name
//如果有一个被选中返回true,如果没有一个被选中的返回false
function isRadioChecked(radioname) {
	//判断是否存在指定名称的radiobutton
	if(radioname==null){
		return false;
	}
	//如果只有一个radiobutton，则直接判断是否被选中
    if(radioname.checked){
	    return true;
	}
	//如果有一组的radiobutton，则循环判断
	if (radioname.length>0) {
		for(var i=0;i<radioname.length;i++){
		  if(radioname[i].checked){
			 return true;
		  }
		}
	}
	return false;
}

//判断字符串的长度，可以处理汉字
/*
function StrLen(sString)
{
  var sStr,iCount,i,strTemp ;

  iCount = 0 ;
  sStr = sString.split("");
  for (i = 0 ; i < sStr.length ; i ++)
  {
  strTemp = escape(sStr[i]);
  if (strTemp.indexOf("%u",0) == -1) // 表示是汉字
  {
  iCount = iCount + 1 ;
  }
  else
  {
  iCount = iCount + 2 ;
  }
  }
  return iCount ;
}*/
function StrLen(sString) {
    var j = 0;
    var s = sString;
    if (s=="") return j;
    for (var i=0; i<s.length; i++)
    {
      if (s.substr(i,1).charCodeAt(0)>255) j = j + 2;
      else j++
    }

    return j;
}

var ilegalChars = "' , \", %";

function ilegalChar(value) {
  if (value.indexOf("'")>-1) return true;
  if (value.indexOf("\"")>-1) return true;
  if (value.indexOf("%")>-1) return true;
  return false;
}

//检测文件大小
function getfilesize(formobject)
{
	if (document.all)
	{
		if (checkactivex)
		{
			try{
				fso = new ActiveXObject('Scripting.FileSystemObject');
			}catch(ex){
				alert("您的浏览器设置不支持ActiveX,请启用浏览器的ActiveX支持。");
				checkactivex=false;
				return 0;
			}
		}
		if (checkactivex)
		{

			try{
				file = fso.GetFile(formobject);
				return file.Size;
			}catch(e){
				alert(e.message);
     				if(e.message=="文件未找到"){
     					return -1;
     				}else{
     					return 0;
     				}
			}
		}else{
			return 0;
		}
	}else{
		return 0;
	}
}
//检测文件类型
function checkfiletype(formobject,filetypestr)
{
	//filetypestr=filetypestr.toLowerCase();
	
	if (formobject.indexOf(".")<0){
		if (filetypestr==null){
			return true;
		}else if (filetypestr.substring(0,1)=="-"){
			return true;
		}else{
			return false;
		}
	}else{
		extname=formobject.substring(formobject.lastIndexOf(".")+1,formobject.length).toLowerCase();
		//alert(extname);
		if (filetypestr!=null){
			if (filetypestr.substring(0,1)=="+"){
				if(filetypestr.indexOf(extname)>0){
					
					return true;
				}else{
					
					return false;
				}
			}
			if (filetypestr.substring(0,1)=="-"){
				if(filetypestr.indexOf(extname)>0){
					return false;
				}else{
					return true;
				}
			}
		}else{
			return true;
		}
	}
}

function drawschedule(useday){
	var daywidth=10;
	var dayheight=20;
	var maxwidth=100
	var usecolor;
	var printword;
	var usewidth;
	if (useday>0){
		usecolor="#00FF00";
		if (useday==1){
			usecolor="#FFFF00";
		}
		printword="还剩"+useday+"天";
		usewidth=useday*daywidth;
		if (useday*daywidth>maxwidth){
			usewidth=maxwidth;
		}
	}
	if (useday==0){
		usecolor="#FFFF00";
		printword="没有剩余时间";
		usewidth=maxwidth;
	}
	if (useday<0){
		useday=0-useday;
		usecolor="#FF0000";
		printword="超时"+useday+"天";
		usewidth=useday*daywidth;
		if (useday*daywidth>maxwidth){
			usewidth=maxwidth;
		}
	}
	document.write("<div style=\"position:absolute;padding-left: 15px;padding-top: 3px;\" align=center width=100>"+printword+"</div>");
	document.write("<table border=\"1\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse: collapse\" width=\""+usewidth+"\" bordercolorlight=\"#808080\" bordercolordark=\"#C0C0C0\" height=\""+dayheight+"\">");
	document.write("  <tr>                                                                                                                                                                                               ");
	document.write("    <td width=\""+usewidth+"\"  height=\""+dayheight+"\" bgcolor=\""+usecolor+"\" valign=top></td>                                                                                                                     ");
	document.write("  </tr>                                                                                                                                                                                              ");
	document.write("</table>                                                                                                                                                                                             ");
}
function ValidPhone(obj){
  var checkStr = obj.value;


  if(/^0\d{2,3}-\d{7,8}$/.test(checkStr)){ 
         return true;   
  }   
  else{   
          return false;
  } 
 
}
function ValidPhone1(obj){
  var checkStr = obj.value;


  if(/^0\d{2,3}\d{7,8}$/.test(checkStr)){ 
         return true;   
  }   
  else{   
          return false;
  } 
 
}
function ValidPhone2(obj){
  var checkStr = obj.value;


  if(/^0[1-9]\d{9,10}$/.test(checkStr)){ 
         return true;   
  }
  else if(/^0[1-9]\d{6,7}$/.test(checkStr)){ 
  	return true;
  }
  else{   
          return false;
  } 
 
}
function ValidPhone3(obj){
  var checkStr = obj.value;

  if(/^\d{7,8}$/.test(checkStr)){ 
  	return true;
  }
  else{   
          return false;
  } 
 
}
function ValidPhone4(obj){
	  var checkStrs = obj.value;
	  var checkStr = "";
	  var checkStr2 = "";
	  var index = checkStrs.indexOf("-");
	  if(index > -1)
	  {
		  var checkStrss = checkStrs.split("-");
		  if(checkStrss.length && checkStrss.length >=1)
		  {
			  checkStr = checkStrss[0];
		  }
		  if(checkStrss.length && checkStrss.length ==2)
		  {
			  checkStr2 = checkStrss[1];
		  }
	  }
	  else
	  {
		  checkStr = checkStrs;
	  }

	  if(/^0\d{2,3}\d{7,8}$/.test(checkStr)){ 
		 if(checkStr2 != "" && /^\d{1,6}$/.test(checkStr2))
		 {
			 return true;  
		 }else if(checkStr2 == "" && index > -1)
		 {
		 	return false;
		 }
		 else if(checkStr2 == "")
		 {
		 	return true;
		 }
		 else {
			 return false;
		 }
	  }   
	  else{   
	          return false;
	  } 
	 
	}
function checkChinese(obj){
 var checkStr = obj.value;
	if(/^[\u4e00-\u9fa5]{1,}$/.test(checkStr))
	{
		return true;
	}
	else
	{
		return false;
	}
}
function checkEnglish(obj){
	 var checkStr = obj.value;
		if(/^\w+$/.test(checkStr))
		{
			if(checkStr.indexOf("_") == 0)
			{
				return false;
			}
			return true;
		}
		else
		{
			return false;
		}
	}
function checkChinese1(obj){
	 var checkStr = obj.value;
		if(/^[\u4e00-\u9fa5]{1,}[·|.|•|•|•]?[\u4e00-\u9fa5]{1,}$/.test(checkStr))
		{
			return true;
		}
		else
		{
			return false;
		}
	}
	
	/*
	*1.只能输入中文或英文 2.中文：2-5个汉字，3.英文：不限大小写，可以空格或“.“间隔，间隔号不超过5次、不能连续，首尾必须是字母。
	*/
function checkEnName(obj){
	var checkStr = obj.value;

	if(/[\u4e00-\u9fa5]{2,5}|(^[a-zA-Z]+[\s.']?([a-zA-Z]+[\s.']?){0,4}[a-zA-Z]$)/.test(checkStr))
	{
		return true;
	}
	else
	{
		return false;
	}
}
function checkAutoNo(obj)
{
	var checkStr = obj.value;
	if(/^[\u4E00-\u9FA5]{1}?[a-zA-Z](\w{4}|\w{5})$/.test(checkStr))
	{
		return true;
	}
	else
	{
		return false;
	}
}
function checkPaperCode(obj){ 
var idcard = obj.value;
var Errors=new Array( 
"验证通过!", 
"身份证号码位数不对!", 
"身份证号码出生日期超出范围或含有非法字符!", 
"身份证号码校验错误!", 
"身份证地区非法!" 
); 
var area={11:"北京",12:"天津",13:"河北",14:"山西",15:"内蒙古",21:"辽宁",22:"吉林",23:"黑龙江",31:"上海",32:"江苏",33:"浙江",34:"安徽",35:"福建",36:"江西",37:"山东",41:"河南",42:"湖北",43:"湖南",44:"广东",45:"广西",46:"海南",50:"重庆",51:"四川",52:"贵州",53:"云南",54:"西藏",61:"陕西",62:"甘肃",63:"青海",64:"宁夏",65:"新疆",71:"台湾",81:"香港",82:"澳门",91:"国外"} 
var idcard,Y,JYM; 
var S,M; 
var idcard_array = new Array(); 
idcard_array = idcard.split(""); 
if(area[parseInt(idcard.substr(0,2))]==null) return Errors[4]; 
switch(idcard.length){ 
case 15: 
if ( (parseInt(idcard.substr(6,2))+1900) % 4 == 0 || ((parseInt(idcard.substr(6,2))+1900) % 100 == 0 && (parseInt(idcard.substr(6,2))+1900) % 4 == 0 )){ 
ereg=/^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}$/; 
} else { 
ereg=/^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}$/; 
} 
if(ereg.test(idcard)) return Errors[0]; 
else return Errors[2]; 
break; 
case 18: 
if ( parseInt(idcard.substr(6,4)) % 4 == 0 || (parseInt(idcard.substr(6,4)) % 100 == 0 && parseInt(idcard.substr(6,4))%4 == 0 )){ 
ereg=/^[1-9][0-9]{5}(19|20)[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}[0-9Xx]$/;//闰年出生日期的合法性正则表达式 
} else { 
ereg=/^[1-9][0-9]{5}(19|20)[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}[0-9Xx]$/;//平年出生日期的合法性正则表达式 
} 
if(ereg.test(idcard)){ 
S = (parseInt(idcard_array[0]) + parseInt(idcard_array[10])) * 7 
+ (parseInt(idcard_array[1]) + parseInt(idcard_array[11])) * 9 
+ (parseInt(idcard_array[2]) + parseInt(idcard_array[12])) * 10 
+ (parseInt(idcard_array[3]) + parseInt(idcard_array[13])) * 5 
+ (parseInt(idcard_array[4]) + parseInt(idcard_array[14])) * 8 
+ (parseInt(idcard_array[5]) + parseInt(idcard_array[15])) * 4 
+ (parseInt(idcard_array[6]) + parseInt(idcard_array[16])) * 2 
+ parseInt(idcard_array[7]) * 1 
+ parseInt(idcard_array[8]) * 6 
+ parseInt(idcard_array[9]) * 3 ; 
Y = S % 11; 
M = "F"; 
JYM = "10X98765432"; 
M = JYM.substr(Y,1); 
if(M == idcard_array[17]) return Errors[0]; 
else return Errors[3]; 
} 
else return Errors[2]; 
break; 
default: 
return Errors[1]; 
break; 
} 
function checkPassCode(obj)
{
	var result = "验证通过!";
	var checkStr = obj.value;
	var Expression = /(P\d{7})|(G\d{8})/;
	var objExp = new RegExp(Expression);
	if(objExp.test(checkStr)==true){
		return result;
	} else{
		return "";
	}
}
} 


/**
 * 验证数据唯一性
 * @param url
 * @param obj
 * @return
 */
function checkUnique(url,obj,message)
{
	var title = obj.title;
	var ajax = new AJAX();
	ajax.post(url);
	var val = ajax.getValue();
	var flag = parseInt(val);
	var flag1 = true;
	if (flag == 1) {
	
		if(title != '' && title != null && obj.value != '')
		{
			//obj.focus();
			if(message != '' && message != null)
			{
				alert(title + message);
			}
			else{
				alert(title + "已经存在,请重新输入！");
			}
		}
		flag1 = false; 
	} else {
		flag1 = true;
	}
	return flag1;
}

/**
 * 验证IP信息
 * @param ip
 * @return
 */
function verifyIp(ip) 
{
   // 如IP:A.B.C.D , A可以取任意一至两位数字，三位则有1和2开头的，分别为1加 任意两位，或2加00-55
   var re = /^(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])(\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])){3}$/;
   // 说明：(\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])){3}，在如上IP，A后面，接一个. 再接B 重复3次 即.B,.C,.D,可以用同样的模式来匹配
   if(ip.match(re))
   {
    return true;
   }else
   {
    return false;
   }
}
/**
 * 验证IP是否为合法IP地址
 * @param obj
 * @return
 */
function verifyIps(ips) 
{
	var flag = true;
	var checkStrs = ips;
	//alert(ips);
	var checkStr = checkStrs.split(",");
    for(var j = 0 ; j < checkStr.length ; j ++)
    {
    	if(!verifyIp(checkStr[j]))
    	{
    		flag = false;
    		break;
    	}
    }
    return flag;
}
function verifyPassword(password)
{
	var mimazimu = "[A-Za-z]";
	var mimashuzi = "[0-9]";
	var mimateshu = "[!~@#$%^&*()_+=-]";
	if(!password.match(mimazimu) )
	{
		return false;
	}
	else if(!password.match(mimashuzi))
	{
		return false;
	}
	else if(!password.match(mimateshu))
	{
		return false;
	}
	else if(password.length < 8 )
	{
		return false;
	}
	return true;
}

