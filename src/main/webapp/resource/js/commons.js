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
function $message(id) {
	return document.getElementById(id);
}
function setHidden() {
	$message("title_message").style.display = "none";
}

function setDivPosition() {
	var curHeight = $message("title_message").style.top;
	var cHeight = handlePx(curHeight);
	if(cHeight >= 0){
		if(timer)
			clearInterval (timer);
		setTimeout(hiddenTitleDiv,1000);
	}
	else{
		$message("title_message").style.top = ( cHeight + 1) + 'px';
	}
}

function setNavDivPosition() {
	var curHeight = $message("title_message").style.top;
	var cHeight = handlePx(curHeight);
	if(cHeight < -51){
		if(timer)
			clearInterval (timer);
	}
	else{
		$("title_message").style.top = ( cHeight - 1 ) + 'px';
	}
}

function handlePx(widthPx) {
	if(widthPx.indexOf("px") != -1)
		widthPx = widthPx.substring(0,widthPx.indexOf("px"));
	return parseInt(widthPx);
}

function initTitleMessage() {
	var bodyWidth = document.body.clientWidth;
	
	$("title_message").style.top = '-50px';
	$("title_message").style.left = (bodyWidth - 220)/2 + 'px'
}
var timer = null;
function showTitleDiv () {
	$("title_message").style.display = "block";
	timer = setInterval(setDivPosition,10);
}

function hiddenTitleDiv() {
	/*var bodyWidth = document.body.clientWidth;
	$("title").style.top = '-50px';
	$("title").style.left = (bodyWidth - 100)/2 + 'px'
	*/
	timer = setInterval(setNavDivPosition,50);
}
function getElementPos(element) {
	var el = typeof(element)=='object' ? element : document.getElementById(element);
	if(el.parentNode === null || el.style.display == 'none') return false;
	var parent = null;
	var pos = [];
	var box;
	if(el.getBoundingClientRect) //IE
	{
		box = el.getBoundingClientRect();
		var scrollTop = Math.max(document.documentElement.scrollTop, document.body.scrollTop);  
		var scrollLeft = Math.max(document.documentElement.scrollLeft, document.body.scrollLeft);  
		return {x:box.left + scrollLeft, y:box.top + scrollTop};
	}
	else if(document.getBoxObjectFor) // gecko 
	{
		box = document.getBoxObjectFor(el);   
		var borderLeft = (el.style.borderLeftWidth)?parseInt(el.style.borderLeftWidth):0;  
		var borderTop = (el.style.borderTopWidth)?parseInt(el.style.borderTopWidth):0;    
		pos = [box.x - borderLeft, box.y - borderTop];
	}  
	else // safari & opera
	{       
		pos = [el.offsetLeft, el.offsetTop];
		parent = el.offsetParent;
		if (parent != el) {
			while (parent) {
			pos[0] += parent.offsetLeft;
			pos[1] += parent.offsetTop;
			parent = parent.offsetParent;
			}
		}

		if (ua.indexOf('opera') != -1|| (ua.indexOf('safari') != -1 && el.style.position == 'absolute' ))
		{
			pos[0] -= document.body.offsetLeft;
			pos[1] -= document.body.offsetTop;
		}
	}
	if (el.parentNode) parent = el.parentNode;
	else parent = null;
	
	while (parent && parent.tagName != 'BODY' && parent.tagName != 'HTML'){
		pos[0] -= parent.scrollLeft;
		pos[1] -= parent.scrollTop;
		if (parent.parentNode) parent = parent.parentNode;
		else parent = null;
	}
	return {x:pos[0], y:pos[1]}; 
}

function showPopLayer(id, eventTag, blurout, offsetx, offsety) {
	var popLayer = document.getElementById(id);
	if (popLayer == null || typeof (popLayer) == 'undefined') return;

	var o = eventTag || window.event.srcElement;
	var pos = getElementPos(o);

	popLayer.style.left = (pos.x + (offsetx ? offsetx : 0)) + 'px';
	popLayer.style.top = (pos.y + (offsety ? offsety : 0)) + 'px';
	popLayer.style.display = 'block';
	if (!blurout) popLayer.onmouseout = eventTag.onmouseout = function(e) {
		var e = e || window.event, relatedTarget = e.toElement || e.relatedTarget;
		while ((relatedTarget && relatedTarget != this) && (relatedTarget && relatedTarget != popLayer)) relatedTarget = relatedTarget.parentNode;
		if (relatedTarget) return;
		popLayer.style.display = 'none';
	}
}

window.lisArray = new Array();
window.addListener = function(listener){
	window.lisArray[window.lisArray.length] = listener;
}
window.notify = function(e){
	window.setStyle();
	if(document.getElementById("title_message"))
	{
		initTitleMessage();
		showTitleDiv();
	}
	//window.addListener(window.setStyle);
	//if(window.loadHiddenPage){
	//	window.addListener(window.loadHiddenPage);
	//}
	
	//for(i = 0; i < window.lisArray.length; i ++){
	//	window.lisArray[i].call(e);
	//}
}
window.onload = window.notify;
window.setStyle = function(){
	setTextAreaStyle();
	var inputObjs = document.getElementsByTagName("input");
	if(inputObjs){
		for(var i = 0; i < inputObjs.length; i ++){
			if(inputObjs[i].type == "button"){
				inputObjs[i].className = "btnInput";
				inputObjs[i].onmouseover = function(){
					this.className = "btnOverInput";
				}
				inputObjs[i].onmouseout = function(){
					this.className = "btnInput";
				}
			}
			else if(inputObjs[i].type == "text" || inputObjs[i].type == "password"){

				inputObjs[i].className = "textInput";
				inputObjs[i].onmouseover = function(){
					this.className = "textOverInput";
				}
				inputObjs[i].onmouseout = function(){
					this.className = "textInput";
				}
			}
			else if(inputObjs[i].type == "submit" || inputObjs[i].type == "reset"){

				inputObjs[i].className = "btnInput";
				inputObjs[i].onmouseover = function(){
					this.className = "btnOverInput";
				}
				inputObjs[i].onmouseout = function(){
					this.className = "btnInput";
				}
			}
		}
	}
	
}

function setTextAreaStyle(){
	var textAreaObjs = document.getElementsByTagName("textarea");
	if(textAreaObjs){
		for(var i = 0; i < textAreaObjs.length; i ++){
			textAreaObjs[i].className = "textareaInput";
			textAreaObjs[i].onmouseover = function(){
				this.className = "textareaOverInput";
			}
			textAreaObjs[i].onmouseout = function(){
				this.className = "textareaInput";
			}
		}
	}
}

function $(d){return document.getElementById(d);}
function gs(d){var t=$(d);if (t){return t.style;}else{return null;}}
function gs2(d,a) {
	if (d.currentStyle){ 
		var curVal = d.currentStyle[a];
	} else {
		var curVal=document.defaultView.getComputedStyle(d, null)[a];
	}
	return curVal;
}
	
function ChatHidden(){gs("MoveBody").display = "none";}
function ChatShow(){gs("MoveBody").display = "";}
	
function ChatClose(){
	gs("move").display = "none";
}
	
function ChatSend(obj){
	var o = obj.ChatValue;
	if (o.value.length>0){
		$("MoveContent").innerHTML += o.value+"<br/>";
		o.value='';
	}
}
	
if(document.getElementById){(
	function(){
		if (window.opera){ 
			document.write("<input type='hidden' id='Q' value=' '>");
		}
		var n = 500;
		var dragok = false;
		var y,x,d,dy,dx;
		
		function move(e) {
			if (!e) e = window.event;
			if (dragok){
				d.style.left = dx + e.clientX - x + "px";
				d.style.top  = dy + e.clientY - y + "px";
				return false;
			}
		}
		
		function down(e){
			if (!e) e = window.event;
				var temp = (typeof e.target != "undefined")?e.target:e.srcElement;
				
				if (temp.tagName != "HTML"|"BODY" && temp.className != "dragclass"){
					temp = (typeof temp.parentNode != "undefined")?temp.parentNode:temp.parentElement;
				}
				
				if(temp && temp.tagName && 'TR'==temp.tagName){
					temp = (typeof temp.parentNode != "undefined")?temp.parentNode:temp.parentElement;
					temp = (typeof temp.parentNode != "undefined")?temp.parentNode:temp.parentElement;
					temp = (typeof temp.parentNode != "undefined")?temp.parentNode:temp.parentElement;
				}
				
				if (temp && temp.className && temp.className == "dragclass"){
					if (window.opera){
						document.getElementById("Q").focus();
					}
					dragok = true;
					temp.style.zIndex = n++;
					d = temp;
					dx = parseInt(gs2(temp,"left"))|0;
					dy = parseInt(gs2(temp,"top"))|0;
					x = e.clientX;
					y = e.clientY;
					document.onmousemove = move;
					return false;
				}
			}
			
			function up(){
				dragok = false;
				document.onmousemove = null;
			}
			
			document.onmousedown = down;
			document.onmouseup = up;
		}
	)();
}
/*
window.onload = function(){
	var inputObjs = document.getElementsByTagName("input");
	if(inputObjs){
		for(var i = 0; i < inputObjs.length; i ++){
			if(inputObjs[i].type == "button"){
				inputObjs[i].className = "btnInput";
				inputObjs[i].onmouseover = function(){
					this.className = "btnOverInput";
				}
				inputObjs[i].onmouseout = function(){
					this.className = "btnInput";
				}
			}
			else if(inputObjs[i].type == "text"){

				inputObjs[i].className = "textInput";
				inputObjs[i].onmouseover = function(){
					this.className = "textOverInput";
				}
				inputObjs[i].onmouseout = function(){
					this.className = "textInput";
				}
			}
		}
	}
}*/

/**
 *  2010-07-26 start
 *  刘春毄1�7 为设置页面中扄1�7有按钮禁用�1�7�加
 *  
 */
    
    // 设置按钮 disabled 属�1�7�1�7
    function setBtnDisabled(btns, boolDisabled){
    	for(var i=0; i<btns.length; i++){
    		btns[i].disabled = boolDisabled;
    	}
    }
    
    // 工具方法，获得全郄1�7 inputButton对象
	function getInputButtons(){
		var retVar = [];
		var text = document.getElementsByTagName('input');
		if(text){
			for(var i=0;i<text.length;i++){
				if(text[i].type=='button'){
					retVar[retVar.length] = text[i];
				}
			}
		}
		return retVar;
	}
// 2010-07-26 end
