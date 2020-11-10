<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0;" />


<!--#include file="../inc/Conn.asp"-->
<!--#include file="inc/config.asp"-->
<!--#include file="inc/myfunction.asp"-->
<!--#include file="inc/page.asp"-->
<!--#include file="seo.asp"-->
<%
web_name=Sitetitle
web_KeyWords=SKeywords
web_Description=SDescription

function read_contextreplace(str)
	str=replace(str,"width","width1")
	str=replace(str,"height","height1")
	str=replace(str,"height","height1")
	str=replace(str,"white-space:nowrap","")
	response.write str
end function
  
  %>
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
	

	if instr(pic,"http")>0 then
			Pic=pic
			else
			Pic="/"&pic
			end if
			
	
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
if bid<>0 then bclass=readuserinf(bid,"bigclass",1)


%>
<TITLE><%= about_title %>-<%= web_name %></TITLE>
<META NAME="Keywords" CONTENT="<%= web_KeyWords %>">
<META NAME="Description" CONTENT="<%= web_Description %>" />
<link href="images/css.css" rel=stylesheet type="text/css">
<script src="js/jquery.min.js"></script>
<script src="js/myjs.js"></script>

</head>
<body>

<!--#include file="webtop.asp"-->
<div class="nytopzcd">
	<div>
    <!--#include file="webtopmenu2.asp"-->
    </div>
</div>


<div class="nymain">
<div class="context">
<em style="display:block; text-align:center">
<img src="<%=pic%>" style=" max-width:100%;" />
<span style=" display:block; line-height:24px; font-style:normal; font-size:14px; font-weight:bold; padding-bottom:20px;"><%=about_title%></span>
</em>
<%
response.write wordjj&"<BR>"
call read_contextreplace(about_context)
 %>
 
</div>
</div>


<!--#include file="webbottom.asp"-->
<div id="foo_ks"><!--#include file="menu_foot.asp"--> </div>


</body>

</html>

