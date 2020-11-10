<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
</head>

<body>

<%
dim conn,db
dim connstr
db="webaccess/webaccess.mdb"
'on error resume next
connstr="DBQ="+server.mappath(""&db&"")+";DefaultDir=;DRIVER={Microsoft Access Driver (*.mdb)};"
response.write Server.MapPath(""&db&"")
connstr="Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" & Server.MapPath(""&db&"")
set conn=server.createobject("ADODB.CONNECTION")
if err then
err.clear
else
conn.open connstr
end if
sub CloseConn()
	conn.close
	set conn=nothing
	
	'oRs.close
	set oRs=nothing
	
end sub
Set oRs = Server.CreateObject( "ADODB.Recordset" )
%>


</body>
</html>
