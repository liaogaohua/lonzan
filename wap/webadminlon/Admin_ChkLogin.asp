<!--#include file="inc/Conn.asp"-->
<!--#include file="../inc/myfunction.asp"-->
<!--#include file="../inc/md5.asp"-->
<%
dim sql,rs
dim username,password,CheckCode
username=replace(trim(request("username")),"'","")
password=replace(trim(Request("password")),"'","")
password=EnPas(md5(password))
CheckCode=replace(trim(Request("CheckCode")),"'","")

if CheckCode<>CStr(session("CheckCode")) then  
	ErrMsg="�������ȷ�����ϵͳ�����Ĳ�һ��"
	call Go_Error(ErrMsg)
end if
session("cloveradmin")=request("admin")
sql="select * from [web_admin] where it139username='"&username&"' and it139password='"&password&"'"
rscount=conn.execute(sql)(0)
if not isempty(rscount) then
   session("it139AdminName")=conn.execute(sql)(1)
   response.Redirect("index.htm")
   response.End()
else
   ErrMsg="��������û��������벻��ȷ!"
   call Go_Error(ErrMsg)
   response.End()
end if


%>