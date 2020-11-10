<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0;" />

<!--#include file="myweb_inc.asp"-->
<%
id=checkisint(request("id"),0)
sql="select * from web_news where  id="&id
set nrs=conn.execute(sql)
if nrs.eof then readvar("操作失败！")
title=nrs("title")
context=nrs("context")
hits=nrs("hit")
wordjj=nrs("wordjj")
author=nrs("author")
addtime=nrs("addtime")
newtype=nrs("type")

type_name=readlist_name(newtype,"新闻中心")
conn.execute("update web_news set hit=hit+1 where id="&id)
	


if newtype=120 then nowdh=4

%>
<TITLE><%= title %>-<%= web_name %> </TITLE>
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
    <!--#include file="webtopmenunew.asp"-->
    </div>
</div>


<div class="nymain">
<div class="context">
 <div class="Titlenews" >
 	<%=title%>
 	<p>更新时间：
                    <span ><%=Format_Time(addtime,2)%></span>
                   </p>
 </div>
<%
call read_contextreplace(context)
 %>
 
</div>
</div>


<!--#include file="webbottom.asp"-->
<div id="foo_ks"><!--#include file="menu_foot.asp"--> </div>


</body>

</html>

