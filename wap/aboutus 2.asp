<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0;" />

<!--#include file="myweb_inc.asp"-->
<%
	id=checkisint(request("id"),1)
	set aboutrs=conn.execute("select id,title,context from web_about where aboutid="&id)
	if aboutrs.eof then 'readvar("操作失败！！\n没有找到该条信息")
	about_title="未知专题"
	about_context="==暂无相关建站专题=="
	else
	about_title=aboutrs(1)
	about_context=aboutrs(2)
	end if
	
	aboutrs.close
	set aboutrs=nothing
	


%>
<TITLE><%= about_title %>-<%= web_name %> </TITLE>
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
    <!--#include file="webtopmenu.asp"-->
    </div>
</div>


<div class="nymain">
<div class="context">
<%
call read_contextreplace(about_context)
 %>
 
</div>
</div>


<!--#include file="webbottom.asp"-->
<div id="foo_ks"><!--#include file="menu_foot.asp"--> </div>


</body>

</html>

