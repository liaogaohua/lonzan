<!--#include file="webadmin_inc.asp"-->

<%

bigid=request("bigid")
bigname=request.QueryString("bigname")
if bigid="" or bigname="" then readvar("请选择大类！！") 
url="http://" & Request.ServerVariables("http_host") & finddir(Request.ServerVariables("url"))
action=request.QueryString("action")
'//添加新数据
select case action
case "add"
set rs=server.CreateObject("adodb.recordset")
rs.open "select * from smallclass",conn,1,3
rs.AddNew
rs("smallname")=trim(request("smallname"))
rs("orders")=request("orders")
rs("bigid")=request("bigid")
rs.Update
rs.Close
set rs=nothing
response.redirect url&"manage_class_s.asp?id="&bigid&"&bigname="&bigname
'//修改数据
case "edit"
set rs=server.CreateObject("adodb.recordset")
rs.open "select * from smallclass where smallid="&request.QueryString("id"),conn,1,3
rs("smallname")=trim(request("smallname"))
rs("orders")=request("orders")
rs.update
rs.close
set rs=nothing
response.redirect url&"manage_class_s.asp?id="&bigid&"&bigname="&bigname
'//删除数据
case "del"
bigid=request.QueryString("bigid")
conn.execute ("delete from smallclass where smallid="&request.QueryString("id"))
'conn.execute ("delete from product where nclassid="&request.QueryString("id"))
response.redirect url&"manage_class_s.asp?id="&bigid&"&bigname="&bigname
end select
%>
<%
Function finddir(filepath)
	finddir=""
	for i=1 to len(filepath)
	if left(right(filepath,i),1)="/" or left(right(filepath,i),1)="\" then
	  abc=i
	  exit for
	end if
	next
	if abc <> 1 then
	finddir=left(filepath,len(filepath)-abc+1)
	end if
end Function
%>