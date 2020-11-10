<%
'session("it139AdminName")="admin" 
if request("flag")="index" then
  if session("it139AdminName") = "" then
    'response.write("alert('您还没有登录!');")
	response.Write("location.href='Login.asp'")
	response.End()
  end if
else
  if session("it139AdminName") = "" then

	response.Write("<script> top.location='Login.asp';</script>")
	response.End()
  end if
  sql="select * from [web_admin] where it139username='"&session("it139AdminName")&"' "
  set checkrs= conn.execute(sql)
  if not checkrs.eof then
  else
   ErrMsg="非法操作!"
   call Go_Error(ErrMsg)
   response.End()
  end if
end if
%>
