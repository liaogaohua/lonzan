// JavaScript Document
var flag=false;
function DrawImage(ImgD,int_width,int_height){
	var image=new Image();
//	var int_width=166;
//	var int_height=92;
	image.src=ImgD.src;
	if(image.width>0 && image.height>0){
		flag=true;
		if(image.width/image.height>= int_width/int_height){
			if(image.width>int_width){ 
				ImgD.width=int_width;
				ImgD.height=(image.height*int_width)/image.width;
			}else{
				ImgD.width=image.width; 
				ImgD.height=image.height;
			}
			//ImgD.alt=image.width+"×"+image.height;
		}
		else{
			if(image.height>int_height){ 
				ImgD.height=int_height;
				ImgD.width=(image.width*int_height)/image.height; 
			}else{
				ImgD.width=image.width; 
				ImgD.height=image.height;
			}
			//ImgD.alt=image.width+"×"+image.height;
		}
	}
} 

function MM_showHideLayers() {
  var i,p,v,obj,args=MM_showHideLayers.arguments;
  for (i=0; i<(args.length-2); i+=3) if ((obj=MM_findObj(args[i]))!=null) { v=args[i+2];
    if (obj.style) { obj=obj.style; v=(v=='show')?'visible':(v=='hide')?'hidden':v; }
    obj.visibility=v; }
}
function MM_reloadPage(init) {  
  if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
    document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
}
MM_reloadPage(true);

function MM_findObj(n, d) {
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function SameH(leftDiv,rightDiv)
{
var a=document.getElementById(leftDiv);
var b=document.getElementById(rightDiv);

if (a.scrollHeight < b.scrollHeight)
{
a.style.height= b.scrollHeight+"px";
}
}

function SameH_1(leftDiv,midDiv,rightDiv)
{
var a=document.getElementById(leftDiv);
var b=document.getElementById(rightDiv);
var c=document.getElementById(midDiv);
a.style.height= c.scrollHeight+b.scrollHeight+"px";
}

function SameH2(leftDiv,rightDiv)
{
var a=document.getElementById(leftDiv);
var b=document.getElementById(rightDiv);
if (a.style.height<b.style.height){
 a.style.height= b.style.height;
}
}

function SameH3(leftDiv,rightDiv)
{
var a=document.getElementById(leftDiv);
var b=document.getElementById(rightDiv);

if (a.clientHeight < b.clientHeight)
{
a.style.height= b.offsetHeight+"px";
}
else
{
b.style.height= a.offsetHeight+"px";
}
}

function menuFix() {
var sfEls = document.getElementById("nav").getElementsByTagName("li");
for (var i=0; i<sfEls.length; i++) {
sfEls[i].onmouseover=function() {
this.className+=(this.className.length>0? " ": "") + "sfhover";
}
sfEls[i].onMouseDown=function() {
this.className+=(this.className.length>0? " ": "") + "sfhover";
}
sfEls[i].onMouseUp=function() {
this.className+=(this.className.length>0? " ": "") + "sfhover";
}
sfEls[i].onmouseout=function() {
this.className=this.className.replace(new RegExp("( ?|^)sfhover\\b"),

"");
}
}
}

//左边动态展开开始
var curStatus = true;
var curFolder =0;
function GetObj(objName){
	if(document.getElementById){
		return eval('document.getElementById("' + objName + '")');
	}else{
		return eval('document.all.' + objName);
	}
}
function folder(obj)
{
	for(var i=1;i<=99;i++){
		//alert(i);
		if(!GetObj(i.toString())) break;
		GetObj(i.toString()).style.display='none'
	}
	if (curStatus&&(curFolder==obj)){
		curStatus = false;
		GetObj(obj.toString()).style.display='none'
	}else{
		GetObj(obj.toString()).style.display='block'
		curStatus = true;
	}
	curFolder = obj;
}
function folder_p(obj)
{
	for(var i=1;i<=99;i++){
		//alert(i);
		if(!GetObj(i.toString())) break;
		GetObj(i.toString()).style.display='none'
	}
	if (curStatus&&(curFolder==obj)){
		curStatus = false;
		GetObj(obj.toString()).style.display='none'
		switch (obj){
		case 1:{document.getElementById("tjcp").className="dtai2";break;}
		case 2:{document.getElementById("ggp").className="dtai2";break;}
		case 3:{document.getElementById("zlp").className="dtai2";break;}
		case 4:{document.getElementById("gsp").className="dtai2";break;}
		case 5:{document.getElementById("dsp").className="dtai2";break;}
		case 6:{document.getElementById("kzxt").className="dtai2";break;}
		case 7:{document.getElementById("zmxl").className="dtai2";break;}
		}
	}else{
		GetObj(obj.toString()).style.display='block';
		curStatus = true;
		if (obj==1){
			document.getElementById("tjcp").className="fix";
		}
		else
		{
			document.getElementById("tjcp").className="dtai2";
		}
		if (obj==2){
			document.getElementById("ggp").className="fix";
		}
		else
		{
			document.getElementById("ggp").className="dtai2";
		}
		if (obj==3){
			document.getElementById("zlp").className="fix";
		}
		else
		{
			document.getElementById("zlp").className="dtai2";
		}
		if (obj==4){
			document.getElementById("gsp").className="fix";
		}
		else
		{
			document.getElementById("gsp").className="dtai2";
		}
		if (obj==5){
			document.getElementById("dsp").className="fix";
		}
		else
		{
			document.getElementById("dsp").className="dtai2";
		}
		if (obj==6){
			document.getElementById("kzxt").className="fix";
		}
		else
		{
			document.getElementById("kzxt").className="dtai2";
		}
		if (obj==7){
			document.getElementById("zmxl").className="fix";
		}
		else
		{
			document.getElementById("zmxl").className="dtai2";
		}
	}
	curFolder = obj;
}
function foldercase(obj)
{
	for(var i=1;i<=99;i++){
		//alert(i);
		if(!GetObj(i.toString())) break;
		GetObj(i.toString()).style.display='none'
	}
	if (curStatus&&(curFolder==obj)){
		curStatus = false;
		GetObj(obj.toString()).style.display='none'
		document.getElementById("gaoji").className="menu14"
		document.getElementById("about_left").style.height=document.getElementById("about_mid1").scrollHeight+"px";
	}else{
		GetObj(obj.toString()).style.display='block'
		curStatus = true;
		document.getElementById("gaoji").className="menu14_1"
		SameH("about_left","about_mid1");
	}
	curFolder = obj;
}
function foldercase1(obj)
{
	for(var i=1;i<=99;i++){
		//alert(i);
		if(!GetObj(i.toString())) break;
		GetObj(i.toString()).style.display='none'
	}
	if (curStatus&&(curFolder==obj)){
		curStatus = false;
		GetObj(obj.toString()).style.display='none'
		document.getElementById("about_left").style.height=document.getElementById("about_mid1").scrollHeight+"px";
		//SameH("about_left","about_mid");
		document.getElementById("hangye").className="dtai2"
	}else{
		GetObj(obj.toString()).style.display='block'
		curStatus = true;
		//document.getElementById("about_mid1").style.height=document.getElementById("about_left").scrollHeight+"px";
		//SameH("about_left","about_mid1");
		document.getElementById("about_mid1").style.height=document.getElementById("about_left").scrollHeight+"px";
		document.getElementById("hangye").className="fix"
	}
	curFolder = obj;
}
function foldercase2(obj)
{
	for(var i=1;i<=99;i++){
		//alert(i);
		if(!GetObj(i.toString())) break;
		GetObj(i.toString()).style.display='none'
	}
	if (curStatus&&(curFolder==obj)){
		curStatus = false;
		GetObj(obj.toString()).style.display='none'
		document.getElementById("about_left").style.height=document.getElementById("about_mid").scrollHeight+"px";
		//SameH("about_left","about_mid");
		document.getElementById("hangye").className="dtai2"
	}else{
		GetObj(obj.toString()).style.display='block'
		curStatus = true;
		//document.getElementById("about_mid1").style.height=document.getElementById("about_left").scrollHeight+"px";
		//SameH("about_left","about_mid1");
		document.getElementById("about_mid").style.height=document.getElementById("about_left").scrollHeight+"px";
		document.getElementById("hangye").className="fix"
	}
	curFolder = obj;
}
function folder1(obj)
{
	for(var i=1;i<=99;i++){
		//alert(i);
		if(!GetObj(i.toString())) break;
		GetObj(i.toString()).style.display='none'
	}
	if (curStatus&&(curFolder==obj)){
		curStatus = false;
		GetObj(obj.toString()).style.display='none'
		document.getElementById("redian").className="dtai2";
		
		
	}else{
		GetObj(obj.toString()).style.display='block'
		curStatus = true;
		document.getElementById("redian").className="fix";
		SameH("about_mid1","about_left");
		document.getElementById("about_left").style.height=document.getElementById("about_mid1").clientHeight+"px";
	}
	curFolder = obj;
}

function FolderClose()
{
	for(var i=1;i<=99;i++){
		if(!GetObj(i.toString())) break;
		GetObj(i.toString()).style.display='none'
	}	
}

function showbigimg(str)
{
  document.getElementById("bigimg").src=str;
  
}   
//左边动态展开结束

function menuFix() {
var sfEls = document.getElementById("menu").getElementsByTagName("li");
for (var i=0; i<sfEls.length; i++) {
sfEls[i].onmouseover=function() {
this.className+=(this.className.length>0? " ": "") + "sfhover";
}
sfEls[i].onMouseDown=function() {
this.className+=(this.className.length>0? " ": "") + "sfhover";
}
sfEls[i].onMouseUp=function() {
this.className+=(this.className.length>0? " ": "") + "sfhover";
}
sfEls[i].onmouseout=function() {
this.className=this.className.replace(new RegExp("( ?|^)sfhover\\b"),

"");
}
}
}
window.onload=menuFix;

//滑动导航菜单函数
var DDSPEED = 8;
var DDTIMER = 15;
function ddMenu(id,d){
  var h = document.getElementById(id + '-ddheader');
  var c = document.getElementById(id + '-ddcontent');
  clearInterval(c.timer);
  if(d == 1){
    clearTimeout(h.timer);
    if(c.maxh && c.maxh <= c.offsetHeight){return}
    else if(!c.maxh){
      c.style.display = 'block';
      c.style.height = 'auto';
      c.maxh = c.offsetHeight;
      c.style.height = '0px';
    }
    c.timer = setInterval(function(){ddSlide(c,1)},DDTIMER);
  }else{
    h.timer = setTimeout(function(){ddCollapse(c)},50);
  }
}

function ddCollapse(c){
  c.timer = setInterval(function(){ddSlide(c,-1)},DDTIMER);
}

function cancelHide(id){
  var h = document.getElementById(id + '-ddheader');
  var c = document.getElementById(id + '-ddcontent');
  clearTimeout(h.timer);
  clearInterval(c.timer);
  if(c.offsetHeight < c.maxh){
    c.timer = setInterval(function(){ddSlide(c,1)},DDTIMER);
  }
}

function ddSlide(c,d){
  var currh = c.offsetHeight;
  var dist;
  if(d == 1){
    dist = (Math.round((c.maxh - currh) / DDSPEED));
  }else{
    dist = (Math.round(currh / DDSPEED));
  }
  if(dist <= 1 && d == 1){
    dist = 1;
  }
  c.style.height = currh + (dist * d) + 'px';
  c.style.opacity = currh / c.maxh;
  c.style.filter = 'alpha(opacity=' + (currh * 100 / c.maxh) + ')';
  if((currh < 2 && d != 1) || (currh > (c.maxh - 2) && d == 1)){
    clearInterval(c.timer);
  }
}
function zxzx(){
	document.getElementById('zx').href="http://vipwebchat.tq.cn/sendmain.jsp?admiuin=8504149&uin=8504149&tag=&ltype=1&rand=77405964750818310&iscallback=1&agentid=0&comtimes=6356&page_templete_id=21329&style=4&page=http://localhost/Products/led-curtain-screen.html&localurl=http%3A//localhost/Products/rental-led-display.html&spage=&nocache=0.11395358573409281";
	document.getElementById('zx').target="_blank";
}
function valignImg(){
	/*var top1,top2;
	var h1=document.getElementById(Div1).clientHeight;
	var h2=document.getElementById(Div2).clientHeight;
	top1=(300-h1)/2;top2=(300-h2)/2;
	alert(h1)
	 var  userAgent = navigator.userAgent.toLowerCase(); 
	 if (userAgent.indexOf("chrome")>-1)
	 {
		 document.getElementById(Div1).style.marginTop="2px";document.getElementById(Div2).style.marginTop="2px";
	 }
	 else
	 {
		 document.getElementById(Div1).style.marginTop=top1+"px";document.getElementById(Div2).style.marginTop=top2+"px";
	 }
	 */
	var top1,top2;
	var h1=document.getElementById('smallImg').clientHeight;
	var h2=document.getElementById('rightImg').clientHeight;
	top1=(300-h1)/2;top2=(300-h2)/2;
	//alert(top1)
	document.getElementById('smallImg').style.marginTop=top1+"px";document.getElementById('rightImg').style.marginTop=top2+"px";
	 
}
function openwin(n){
	switch(n)
   {
   case 'tz':
     window.open ('http://www.cninfo.com.cn/information/fulltext/szcn300269.html','newwindow','height=700,width=1000,resizable=yes,toolbar=yes,menubar=yes,scrollbars=yes,location=yes, status=yes');
     break
   case 'en':
     window.open ('http://www.liantronics.com/','newwindow','height=700,width=1000,resizable=yes,toolbar=yes,menubar=yes,scrollbars=yes,location=yes, status=yes');
	 break
   case 'sp':
     window.open ('http://es.liantronics.com/','newwindow','height=700,width=1000,resizable=yes,toolbar=yes,menubar=yes,scrollbars=yes,location=yes, status=yes');
	 break
   case 'ru':
     window.open ('http://ru.liantronics.com/','newwindow','height=700,width=1000,resizable=yes,toolbar=yes,menubar=yes,scrollbars=yes,location=yes, status=yes');
         break
   case 'yejibang':
     window.open ('http://www.yejibang.com/','newwindow','height=700,width=1000,resizable=yes,toolbar=yes,menubar=yes,scrollbars=yes,location=yes, status=yes');
	 break
   default:
     window.open ('http://www.lcjh.com/','newwindow','height=700,width=1000,resizable=yes,toolbar=yes,menubar=yes,scrollbars=yes,location=yes, status=yes');
     break
   }
}

