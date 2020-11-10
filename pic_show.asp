<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta name="author" content="design by www.21-sun.com">
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7">
<!--#include file="myweb_inc.asp"-->
<%
	id=checkisint(request("id"),1)
	set aboutrs=conn.execute("select id,title,bid,sid,wordjj,context,pid,tag,pic from product where id="&id)
	if aboutrs.eof then readvar("操作失败！！\n没有找到该条信息")
	
	about_title=aboutrs("title")
	about_context=aboutrs("context")
	about_pid=aboutrs("pid")
	wordjj=codetoHTML(aboutrs("wordjj"))
	tag=aboutrs("tag")
	pic=aboutrs("pic")
	if pic="" then pic="/index.files/nopic.jpg"
	sid=aboutrs("sid")
	bid=aboutrs("bid")
	pid=aboutrs("pid")
	
	
	pic=replace(pic,"#","")
	pic=replace(pic,"+","")
pic=replace(pic,"＃","")

	aboutrs.close
	set aboutrs=nothing
	
sid=checkisint(sid,0)
bid=checkisint(bid,0)
if sid<>0 then 
	bid=readuserinf(sid,"smallclass",2)
	sclass=readuserinf(sid,"smallclass",1)
end if
if bid*1<>0 then bclass=readuserinf(bid,"bigclass",1)
nowdh=3
%>
<TITLE> <%
if sclass<>"" then response.write sclass&"-"
if bclass<>"" then response.write bclass&"-"

%>－<%= web_name %> </TITLE>
<META NAME="Keywords" CONTENT="<%= web_KeyWords %>">
<META NAME="Description" CONTENT="<%= web_Description %>" />

<link href="index_files/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="index_files/jquery-1.7.min.js"></script>
<script type="text/javascript" src="index_files/scripts.js"></script>
<!--[if (IE 6)]>
<link href="index_files/pngfix.css" media="screen" rel="stylesheet" type="text/css" />
<![endif]-->
<script>
function pic_max(theobj)
{
    if (theobj.width>350){theobj.width=350}
}
</script>
</head>
<body class="yebg1">
<!--#include file="webtop.asp"-->
<!--#include file="webbanner.asp"-->


<!--main-->
<div class="w100 h95px yebg5" style="height:50px;">
  <div class="w960px center c">

    <div class="l h55px yebg8 w380px">
      <div class="pt20">您的位置：<a href="index.asp">首页</a><%
dhpic="&nbsp;&gt;&nbsp;"
if bid<>0 then response.Write(dhpic&"<a href='product.asp?bid="&bid&"'>"&bclass&"</a>")
if sid<>0 then response.Write(dhpic&"<a href='product.asp?sid="&sid&"'>"&sclass&"</a>")
if sid=0 and bid=0 then response.Write dhpic&"产品展示"

%>
</div>
    </div>
  </div>
</div>
<div class="w100 yebg4 bb1sc"> 
 
  <div class="w960px center c">
    <div class="w960px center pt20">
      <div class="w680px r">
       
     <table width="100%" border="0" align="center" cellpadding="5" cellspacing="2">
  <tr>
    <td width="359" align="center"><img src="<%=pic%>" onload="pic_max(this)"  style="padding:5px; border:1px #CCCCCC solid; margin: 5px auto;"/><br />
      <%= about_title %></td>
    <td width="391" valign="top" style="line-height:22px;">
    <!--<span  style="font-size:14px; color:#003c81; font-weight:bold;"><%=about_title%></span><BR>-->
   
    <div style="margin-top:5px;font-size:14px;font-weight:bold; border-bottom:1px solid #f26f00; color:#f26f00">
    <%= about_title %></div>
    <%=wordjj%>    </td>
  </tr>
</table>



<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:20px;">
  
  <tr>
    <td class="pcontext"><%=about_context%></td>
  </tr>
</table>
      </div>
<div class="w240px l">
		    <div class="w240px r mlbg22 h10px"><!---->
            </div><div class="w238px hauto r yahei lineheight20px brl1sc pb10 pt10"><div class="linetop"><span class="c333333">快速链接：</span> </div>
            
             <!--#include file="leftpro.asp"-->
                <div class="b2sc"></div>
                  <!--#include file="leftbottom.asp"-->
                  
                  </div><div class="w240px r mlbg23 h10px"><!----></div>
	  </div> 
    </div>
  </div>
  <div class="pt30 w100 clearfix"></div>
</div>
<!--end of main--> 
<!--#include file="webbottom.asp"-->

</body></html>
