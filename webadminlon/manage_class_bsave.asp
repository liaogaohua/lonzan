<!--#include file="webadmin_inc.asp"-->
<%dim action,bigid
bigid=request.QueryString("id")
action=request.querystring("action")
select case action
'//���������
case "add" 
set rs=server.CreateObject("adodb.recordset")
rs.open "select * from bigclass",conn,1,3
rs.AddNew
rs("bigname")=trim(request("bigname"))
rs("orders")=int(request("orders"))
rs.Update
rs.Close
set rs=nothing
response.Redirect "manage_class_b.asp"
'//�޸�����
case "edit"
set rs=server.CreateObject("adodb.recordset")
rs.open "select * from bigclass where bigid="&bigid,conn,1,3
rs("bigname")=trim(request("bigname"))
rs("orders")=int(request("orders"))
rs.Update
rs.Close
set rs=nothing
response.Redirect "manage_class_b.asp"
'//ɾ������
case "del"
conn.execute ("delete from bigclass where bigid="&bigid)
conn.execute ("delete from smallclass where bigid="&bigid)
'conn.execute ("delete from product where bigid="&bigid)
response.Redirect "manage_class_b.asp"
end select
%>