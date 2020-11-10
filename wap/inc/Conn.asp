<%
dim conn,db
dim connstr
db="webaccess/webaccess.mdb" '数据库文件位置
'on error resume next
connstr="DBQ="+server.mappath(""&db&"")+";DefaultDir=;DRIVER={Microsoft Access Driver (*.mdb)};"
set conn=server.createobject("ADODB.CONNECTION")
if err then
err.clear
else
conn.open connstr
end if
sub CloseConn()
	'oRs.close
	set oRs=nothing
	conn.close
	set conn=nothing
	
end sub
Set oRs = Server.CreateObject( "ADODB.Recordset" )

%>