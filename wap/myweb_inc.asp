<!--#include file="inc/Conn.asp"-->
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