<!--#include file="inc/Conn.asp"-->

<%
str="��ҵ������|ó����|��ҵ������|�ۺ��Ż�|��������ƽ̨|�����Ż���վ|��ҵ���ײ�|��׼���ײ�|չʾ���ײ�"
carry=split(str,"|")
carrycount=ubound(carry)
set rs=server.CreateObject("adodb.recordset")
for i=0 to carrycount
   classname=carry(i)
  
   sql="select * from web_class "
   rs.open sql,conn,1,3
   rs.addnew
   rs("title") = classname
   rs("class") =1  'ר��1������2������3
   rs("orders")=5230 
   rs.update
   rs.close
   

next

set rs=nothing
'web_class:id,class_name,class_id,class,dateandtime
response.Redirect("class_web168.asp")
response.end()
%>
<body></body>