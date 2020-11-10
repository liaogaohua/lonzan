<!--#include file="inc/Conn.asp"-->

<%
str="企业商务型|贸易型|企业定制型|综合门户|电子商务平台|政府门户网站|创业型套餐|标准型套餐|展示型套餐"
carry=split(str,"|")
carrycount=ubound(carry)
set rs=server.CreateObject("adodb.recordset")
for i=0 to carrycount
   classname=carry(i)
  
   sql="select * from web_class "
   rs.open sql,conn,1,3
   rs.addnew
   rs("title") = classname
   rs("class") =1  '专题1，新闻2，案例3
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