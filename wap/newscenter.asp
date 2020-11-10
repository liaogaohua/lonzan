<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0;" />

<!--#include file="myweb_inc.asp"-->
<%
newtype=checkisint(request("type"),0)
type_name=readlist_name(newtype,"最新资讯")
	
about_title=type_name


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
    <!--#include file="webtopmenunew.asp"-->
    </div>
</div>


<div class="nymain">
<div class="context">
  <%
   call Newslist(newtype,10,16,1,2)
  %>
 
</div>
</div>


<!--#include file="webbottom.asp"-->
<div id="foo_ks"><!--#include file="menu_foot.asp"--> </div>


</body>

</html>

