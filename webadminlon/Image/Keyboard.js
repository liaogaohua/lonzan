//定义当前是否大写的状态
window.onload=
	function()
	{
		password1=null;		
		initCalc();
	}

var CapsLockValue=0;

var check;
function setVariables() {
tablewidth=630;  // logo width, in pixels
tableheight=20;  // logo height, in pixels
if (navigator.appName == "Netscape") {
horz=".left";
vert=".top";
docStyle="document.";
styleDoc="";
innerW="window.innerWidth";
innerH="window.innerHeight";
offsetX="window.pageXOffset";
offsetY="window.pageYOffset";
}
else {
horz=".pixelLeft";
vert=".pixelTop";
docStyle="";
styleDoc=".style";
innerW="document.body.clientWidth";
innerH="document.body.clientHeight";
offsetX="document.body.scrollLeft";
offsetY="document.body.scrollTop";
   }
}
function checkLocation() {
if (check) {
objectXY="softkeyboard";
var availableX=eval(innerW);
var availableY=eval(innerH);
var currentX=eval(offsetX);
var currentY=eval(offsetY);
x=availableX-tablewidth+currentX;
//y=availableY-tableheight+currentY;
y=currentY;

evalMove();
}
setTimeout("checkLocation()",0);
}
function evalMove() {
//eval(docStyle + objectXY + styleDoc + horz + "=" + x);
eval(docStyle + objectXY + styleDoc + vert + "=" + y);
}
	self.onError=null;
	currentX = currentY = 0;  
	whichIt = null;           
	lastScrollX = 0; lastScrollY = 0;
	NS = (document.layers) ? 1 : 0;
	IE = (document.all) ? 1: 0;
	function heartBeat() {
		if(IE) { diffY = document.body.scrollTop; diffX = document.body.scrollLeft; }
	    if(NS) { diffY = self.pageYOffset; diffX = self.pageXOffset; }
		if(diffY != lastScrollY) {
	                percent = .1 * (diffY - lastScrollY);
	                if(percent > 0) percent = Math.ceil(percent);
	                else percent = Math.floor(percent);
					if(IE) document.all.softkeyboard.style.pixelTop += percent;
					if(NS) document.softkeyboard.top += percent; 
	                lastScrollY = lastScrollY + percent;}
		if(diffX != lastScrollX) {
			percent = .1 * (diffX - lastScrollX);
			if(percent > 0) percent = Math.ceil(percent);
			else percent = Math.floor(percent);
			if(IE) document.all.softkeyboard.style.pixelLeft += percent;
			if(NS) document.softkeyboard.left += percent;
			lastScrollX = lastScrollX + percent;	}		}
	function checkFocus(x,y) { 
	        stalkerx = document.softkeyboard.pageX;
	        stalkery = document.softkeyboard.pageY;
	        stalkerwidth = document.softkeyboard.clip.width;
	        stalkerheight = document.softkeyboard.clip.height;
	        if( (x > stalkerx && x < (stalkerx+stalkerwidth)) && (y > stalkery && y < (stalkery+stalkerheight))) return true;
	        else return false;}
	function grabIt(e) {
	    check = false;
		if(IE) {
			whichIt = event.srcElement;
			while (whichIt.id.indexOf("softkeyboard") == -1) {
				whichIt = whichIt.parentElement;
				if (whichIt == null) { return true; } }
			whichIt.style.pixelLeft = whichIt.offsetLeft;
		    whichIt.style.pixelTop = whichIt.offsetTop;
			currentX = (event.clientX + document.body.scrollLeft);
	   		currentY = (event.clientY + document.body.scrollTop); 	
		} else { 
	        window.captureEvents(Event.MOUSEMOVE);
	        if(checkFocus (e.pageX,e.pageY)) { 
	                whichIt = document.softkeyboard;
	                StalkerTouchedX = e.pageX-document.softkeyboard.pageX;
	                StalkerTouchedY = e.pageY-document.softkeyboard.pageY;} }
	    return true;	}
	function moveIt(e) {
		if (whichIt == null) { return false; }
		if(IE) {
		    newX = (event.clientX + document.body.scrollLeft);
		    newY = (event.clientY + document.body.scrollTop);
		    distanceX = (newX - currentX);    distanceY = (newY - currentY);
		    currentX = newX;    currentY = newY;
		    whichIt.style.pixelLeft += distanceX;
		    whichIt.style.pixelTop += distanceY;
			if(whichIt.style.pixelTop < document.body.scrollTop) whichIt.style.pixelTop = document.body.scrollTop;
			if(whichIt.style.pixelLeft < document.body.scrollLeft) whichIt.style.pixelLeft = document.body.scrollLeft;
			if(whichIt.style.pixelLeft > document.body.offsetWidth - document.body.scrollLeft - whichIt.style.pixelWidth - 20) whichIt.style.pixelLeft = document.body.offsetWidth - whichIt.style.pixelWidth - 20;
			if(whichIt.style.pixelTop > document.body.offsetHeight + document.body.scrollTop - whichIt.style.pixelHeight - 5) whichIt.style.pixelTop = document.body.offsetHeight + document.body.scrollTop - whichIt.style.pixelHeight - 5;
			event.returnValue = false;
		} else { 
			whichIt.moveTo(e.pageX-StalkerTouchedX,e.pageY-StalkerTouchedY);
	        if(whichIt.left < 0+self.pageXOffset) whichIt.left = 0+self.pageXOffset;
	        if(whichIt.top < 0+self.pageYOffset) whichIt.top = 0+self.pageYOffset;
        if( (whichIt.left + whichIt.clip.width) >= (window.innerWidth+self.pageXOffset-17)) whichIt.left = ((window.innerWidth+self.pageXOffset)-whichIt.clip.width)-17;
	        if( (whichIt.top + whichIt.clip.height) >= (window.innerHeight+self.pageYOffset-17)) whichIt.top = ((window.innerHeight+self.pageYOffset)-whichIt.clip.height)-17;
	        return false;}
	    return false;	}
	function dropIt() {whichIt = null;
	    if(NS) window.releaseEvents (Event.MOUSEMOVE);
	    return true;	}
	if(NS) {window.captureEvents(Event.MOUSEUP|Event.MOUSEDOWN);
		window.onmousedown = grabIt;
	 	window.onmousemove = moveIt;
		window.onmouseup = dropIt;	}
	if(IE) {
		document.onmousedown = grabIt;
	 	document.onmousemove = moveIt;
		document.onmouseup = dropIt;	}
//	if(NS || IE) action = window.setInterval("heartBeat()",1);

var style1="<style>";
style1+=".btn_letter {BORDER-RIGHT: 1px solid; PADDING-RIGHT: 1px; BORDER-TOP: 1px solid; PADDING-LEFT: 2px;FONT-SIZE: 14px; BORDER-LEFT: 1px solid; CURSOR: hand;PADDING-TOP: 1px; BORDER-BOTTOM: 1px solid; width:25px; height:20px;}";
style1+=".btn_num {width:25px;BORDER-RIGHT:1px solid; PADDING-RIGHT: 1px; BORDER-TOP: 1px solid; PADDING-LEFT: 2px; FONT-SIZE: 12px; BORDER-LEFT: 1px solid; CURSOR: hand; PADDING-TOP: 1px; BORDER-BOTTOM: 1px solid;height:20px;}";
style1+=".table_title {FILTER: progid:DXImageTransform.Microsoft.Gradient(GradientType=0,StartColorStr=#B2DEF7, EndColorStr=#7AB7DA); height:26px;padding-top: 3px;}";
style1+=".btn_input {BORDER-RIGHT: #2C59AA 1px solid; PADDING-RIGHT: 2px; BORDER-TOP: #2C59AA 1px solid; PADDING-LEFT: 2px; FONT-SIZE: 12px; FILTER: progid:DXImageTransform.Microsoft.Gradient(GradientType=0, StartColorStr=#ffffff, EndColorStr=#C3DAF5); BORDER-LEFT: #2C59AA 1px solid; CURSOR: hand; COLOR: black; PADDING-TOP: 2px; BORDER-BOTTOM: #2C59AA 1px solid}";
style1+="</style>";	
document.write(style1);																																																			
document.write("<DIV align=center id=\"softkeyboard\" name=\"softkeyboard\" style=\"position:absolute; left:0px; top:0px; width:400px; z-index:180;display:none\"><table id=\"CalcTable\" width=\"\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\" bgcolor=\"\"><FORM id=Calc name=Calc action=\"\" method=post autocomplete=\"off\"><tr><td class=\"table_title\" title=\"尊敬的客户：为了保证网上交易安全,建议使用密码输入器输入密码!\" align=\"right\" valign=\"middle\" bgcolor=\"\" style=\"cursor: default;height:30\"><INPUT type=hidden value=\"\" name=password><INPUT type=hidden value=ok name=action2>&nbsp<font style=\"font-weight:bold; font-size:13px; color:#075BC3\">创钢网络&nbsp;&nbsp;密码输入器</font>&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp&nbsp;&nbsp&nbsp;<INPUT id=useKey class=\"btn_input\" type=button value=\"使用键盘输入\" bgtype=\"1\" onclick=\"password1.readOnly=0;password1.focus();closekeyboard();password1.value='';\"><span style=\"width:2px;\"></span></td></tr><tr align=\"center\"><td align=\"center\" bgcolor=\"#FFFFFF\"><table align=\"center\" width=\"%\" border=\"0\" cellspacing=\"1\" cellpadding=\"0\">\n<tr align=\"left\" valign=\"middle\"> \n<td> <input type=button value=\" ~ \" class=\"input_logo_key\"></td>\n<td> <input type=button value=\" ! \" class=\"input_logo_key\"></td>\n<td> <input type=button value=\" @ \" class=\"input_logo_key\"></td>\n<td> <input type=button value=\" # \" class=\"input_logo_key\"></td>\n<td> <input type=button value=\" $ \" class=\"input_logo_key\"></td>\n<td><input type=button value=\" % \" class=\"input_logo_key\"></td>\n<td><input type=button value=\" ^ \" class=\"input_logo_key\"></td>\n<td> <input type=button value=\" & \" class=\"input_logo_key\"></td>\n<td><input type=button value=\" * \" class=\"input_logo_key\"></td>\n<td><input type=button value=\" ( \" class=\"input_logo_key\"></td>\n<td><input type=button value=\" ) \" class=\"input_logo_key\"></td>\n<td><input type=button value=\" _ \" class=\"input_logo_key\"></td>\n<td> <input type=button value=\" + \" class=\"input_logo_key\"></td>\n<td><input type=button value=\" | \" class=\"input_logo_key\"></td>\n<td colspan=\"1\" rowspan=\"2\" class=\"input_logo_key\"> <input name=\"button10\" type=button value=\" 退格\" onclick=\"setpassvalue();\"  onDblClick=\"setpassvalue();\" class=\"tuige\"> \n</td>\n</tr>\n<tr align=\"left\" valign=\"middle\"> \n<td><input type=button value=\" ` \" class=\"input_logo_key\"></td>\n<td><input type=button bgtype=\"2\" name=\"button_number1\" value=\" 1 \" class=\"input_logo_key\"></td>\n<td> <input type=button bgtype=\"2\" name=\"button_number2\" value=\" 2 \" class=\"input_logo_key\"></td>\n<td> <input type=button bgtype=\"2\" name=\"button_number3\" value=\" 3 \" class=\"input_logo_key\"></td>\n<td> <input type=button bgtype=\"2\" name=\"button_number4\" value=\" 4 \" class=\"input_logo_key\"></td>\n<td> <input type=button bgtype=\"2\" name=\"button_number5\" value=\" 5 \" class=\"input_logo_key\"></td>\n<td> <input type=button bgtype=\"2\" name=\"button_number6\" value=\" 6 \" class=\"input_logo_key\"></td>\n<td> <input type=button bgtype=\"2\" name=\"button_number7\" value=\" 7 \" class=\"input_logo_key\"></td>\n<td> <input type=button bgtype=\"2\" name=\"button_number8\" value=\" 8 \" class=\"input_logo_key\"></td>\n<td> <input type=button bgtype=\"2\" name=\"button_number9\" value=\" 9 \" class=\"input_logo_key\"></td>\n<td> <input bgtype=\"2\"  name=\"button_number0\" type=button value=\" 0 \" class=\"input_logo_key\"></td>\n<td> <input type=button value=\" - \" class=\"input_logo_key\"></td>\n<td> <input type=button value=\" = \" class=\"input_logo_key\"></td>\n<td> <input type=button value=\" \\ \" class=\"input_logo_key\"></td>\n<td> </td>\n</tr>\n<tr align=\"left\" valign=\"middle\"> \n<td> <input type=button value=\" q \" class=\"input_logo_key\"></td>\n<td> <input type=button value=\" w \" class=\"input_logo_key\"></td>\n<td> <input type=button value=\" e \" class=\"input_logo_key\"></td>\n<td> <input type=button value=\" r \" class=\"input_logo_key\"></td>\n<td> <input type=button value=\" t \" class=\"input_logo_key\"></td>\n<td> <input type=button value=\" y \" class=\"input_logo_key\"></td>\n<td> <input type=button value=\" u \" class=\"input_logo_key\"></td>\n<td> <input type=button value=\" i \" class=\"input_logo_key\"></td>\n<td> <input type=button value=\" o \" class=\"input_logo_key\"></td>\n<td> <input name=\"button8\" type=button value=\" p \" class=\"input_logo_key\"></td>\n<td> <Input name=\"button9\" type=button value=\" { \" class=\"input_logo_key\"></td>\n<td> <input type=button value=\" } \" class=\"input_logo_key\"></td>\n<td> <input type=button value=\" [ \" class=\"input_logo_key\"></td>\n<td> <input type=button value=\" ] \" class=\"input_logo_key\"></td>\n<td><input name=\"button9\" type=button onClick=\"capsLockText();setCapsLock();\"  onDblClick=\"capsLockText();setCapsLock();\" value=\"切换大/小写\" style=\"width:100px;\"></td>\n</tr>\n<tr align=\"left\" valign=\"middle\"> \n<td> <input type=button value=\" a \" class=\"input_logo_key\"></td>\n<td> <input type=button value=\" s \" class=\"input_logo_key\"></td>\n<td> <input type=button value=\" d \" class=\"input_logo_key\"></td>\n<td> <input type=button value=\" f \" class=\"input_logo_key\"></td>\n<td> <input type=button value=\" g \" class=\"input_logo_key\"></td>\n<td> <input type=button value=\" h \" class=\"input_logo_key\"></td>\n<td> <input type=button value=\" j \" class=\"input_logo_key\"></td>\n<td> <input name=\"button3\" type=button value=\" k \" class=\"input_logo_key\"></td>\n<td> <input name=\"button4\" type=button value=\" l \" class=\"input_logo_key\"></td>\n<td> <input name=\"button5\" type=button value=\" : \" class=\"input_logo_key\"></td>\n<td> <input name=\"button7\" type=button value=\" &quot; \" class=\"input_logo_key\"></td>\n<td> <input type=button value=\" ; \" class=\"input_logo_key\"></td>\n<td> <input type=button value=\" ' \" class=\"input_logo_key\"></td>\n<td rowspan=\"2\" colspan=\"2\"> <input name=\"button12\" type=button onclick=\"OverInput();\" value=\"   确定  \" class=\"queding\"></td>\n</tr>\n<tr align=\"left\" valign=\"middle\"> \n<td><input name=\"button2\" type=button value=\" z \" class=\"input_logo_key\"></td>\n<td> <input type=button value=\" x \" class=\"input_logo_key\"></td>\n<td> <input type=button value=\" c \" class=\"input_logo_key\"></td>\n<td> <input type=button value=\" v \" class=\"input_logo_key\"></td>\n<td> <input type=button value=\" b \" class=\"input_logo_key\"></td>\n<td> <input type=button value=\" n \" class=\"input_logo_key\"></td>\n<td> <input type=button value=\" m \" class=\"input_logo_key\"></td>\n<td> <input type=button value=\" &lt; \" class=\"input_logo_key\"></td>\n<td> <input type=button value=\" &gt; \" class=\"input_logo_key\"></td>\n<td> <input type=button value=\" ? \" class=\"input_logo_key\"></td>\n<td> <input type=button value=\" , \" class=\"input_logo_key\"></td>\n <td> <input type=button value=\" . \" class=\"input_logo_key\"></td>\n <td> <input type=button value=\" / \" class=\"input_logo_key\"></td>\n</tr>\n</table></td></FORM></table></DIV>")
//给输入的密码框添加新值
	function addValue(newValue)
	{
		if (CapsLockValue==0)
		{
			var str=Calc.password.value;
			if(str.length<password1.maxLength)
			{
				Calc.password.value += newValue;
			}			
			if(str.length<=password1.maxLength)
			{
				password1.value=Calc.password.value;
			}
		}
		else
		{
			var str=Calc.password.value;
			if(str.length<password1.maxLength)
			{
				Calc.password.value += newValue.toUpperCase();
			}
			if(str.length<=password1.maxLength)
			{
				password1.value=Calc.password.value;
			}
		}
	}
//实现BackSpace键的功能
	function setpassvalue()
	{
		var longnum=Calc.password.value.length;
		var num
		num=Calc.password.value.substr(0,longnum-1);
		Calc.password.value=num;
		var str=Calc.password.value;
			password1.value=Calc.password.value;
	}
//输入完毕
	function OverInput()
	{
		//m_pass.mempass.value=Calc.password.value;
		var str=Calc.password.value;
			password1.value=Calc.password.value;
			//alert(theForm.value);
		//theForm.value=m_pass.mempass.value;
		softkeyboard.style.display="none";
		Calc.password.value="";
		password1.readOnly=1;
		//password1.value=Calc.password.value;
	}
//关闭软键盘
	function closekeyboard(theForm)
	{
		//eval("var theForm="+theForm+";");
		//theForm.value="";
		softkeyboard.style.display="none";
		//Calc.password.value="";

	}
//显示软键盘
	function showkeyboard()
	{
		if(event.y+140)
		softkeyboard.style.top=event.y+document.body.scrollTop+15;
		if((event.x-250)>0)
		{
			softkeyboard.style.left=event.x-250;
		}
		else
		{
			softkeyboard.style.left=0;
		}
		
		softkeyboard.style.display="block";
		password1.readOnly=1;
		password1.blur();
		//password1.value="";
	}

//设置是否大写的值
function setCapsLock()
{
	if (CapsLockValue==0)
	{
		CapsLockValue=1
//		Calc.showCapsLockValue.value="当前是大写 ";
	}
	else 
	{
		CapsLockValue=0
//		Calc.showCapsLockValue.value="当前是小写 ";
	}
}


function setCalcborder()
{
	CalcTable.style.border="1px solid #0090FD"
}

function setHead()
{
	CalcTable.cells[0].style.background=""
}

function setCalcButtonBg()
{
	for(var i=0;i<Calc.elements.length;i++)
	{
		if(Calc.elements[i].type=="button"&&Calc.elements[i].bgtype!="1")
		{
	//		if(i==10)
//	alert(123);
			Calc.elements[i].style.borderTopWidth= 1
			Calc.elements[i].style.borderRightWidth= 1
			Calc.elements[i].style.borderBottomWidth= 1
			Calc.elements[i].style.borderLeftWidth= 1
			Calc.elements[i].style.borderTopStyle= "solid";
			Calc.elements[i].style.borderRightStyle= "solid";
			Calc.elements[i].style.borderBottomStyle= "solid";
			Calc.elements[i].style.borderLeftStyle= "solid";
			//#46AC17
			Calc.elements[i].style.borderTopColor= "#118ACC";
			Calc.elements[i].style.borderRightColor= "#118ACC";
			Calc.elements[i].style.borderBottomColor= "#118ACC";
			Calc.elements[i].style.borderLeftColor= "#118ACC";
			//#CBF3B2
			Calc.elements[i].style.backgroundColor="#ADDEF8";
			//      backgroundColor=""  这是键盘的按钮背景值 
			// Calc.elements[i].style.width= "22px";
			
			
			var str1=Calc.elements[i].value;
			str1=str1.trim();
			/*
			if(str1=="`") 
			{
				Calc.elements[i].style.fontSize=14;
			}
			*/

			if(str1.length==1)
			{
				//Calc.elements[i].style.fontSize=16;
				//Calc.elements[i].style.fontWeight='bold';
			}
			
			var thisButtonValue=Calc.elements[i].value;
			thisButtonValue=thisButtonValue.trim();
			if(thisButtonValue.length==1)
			{
				Calc.elements[i].onclick=
					function ()
					{
						var thisButtonValue=this.value;
						thisButtonValue=thisButtonValue.trim();
						addValue(thisButtonValue);
						//alert(234)
					}
				Calc.elements[i].ondblclick=
					function ()
					{
						var thisButtonValue=this.value;
						thisButtonValue=thisButtonValue.trim();
						addValue(thisButtonValue);
						//alert(234)
					}
			}
			
		}
	}
}

function initCalc()
{
	setCalcborder();
	setHead();
	setCalcButtonBg();
}

String.prototype.trim = function()
{
    // 用正则表达式将前后空格
    // 用空字符串替代。
    return this.replace(/(^\s*)|(\s*$)/g, "");
}

var capsLockFlag;
capsLockFlag=true;

function capsLockText()
{
if(capsLockFlag)//改成大写
{
	for(var i=0;i<Calc.elements.length;i++)
	{
			var char=Calc.elements[i].value;
			var char=char.trim()
		if(Calc.elements[i].type=="button"&&char>="a"&&char<="z"&&char.length==1)
		{
		
			Calc.elements[i].value=" "+String.fromCharCode(char.charCodeAt(0)-32)+" "
		}
	}
}
else
{
	for(var i=0;i<Calc.elements.length;i++)
	{
			var char=Calc.elements[i].value;
			var char=char.trim()
		if(Calc.elements[i].type=="button"&&char>="A"&&char<="Z"&&char.length==1)
		{
		
			Calc.elements[i].value=" "+String.fromCharCode(char.charCodeAt(0)+32)+" "
		}
	}
}
capsLockFlag=!capsLockFlag;
}