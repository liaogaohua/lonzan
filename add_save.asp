<!--#include file="myweb_inc.asp"-->
<%
 
   
   
   Function Send_Email(smtpHost,smtpUser,smtpPass,mailTo,FromName,subject,content)
Set jmail = Server.CreateObject("JMAIL.Message")
jmail.silent = true
jmail.logging = true
jmail.Charset = "gb2312"
jmail.ContentType = "text/html"
jmail.AddRecipient mailTo
jmail.From = smtpUser
jmail.FromName = FromName
jmail.Subject = subject
jmail.Body = content
jmail.Priority = 1
jmail.MailServerUserName = smtpUser
jmail.MailServerPassword = smtpPass
isgo=jmail.Send(smtpHost)
if isgo then
  msg="���������Ѿ������������䣬��ע����ա���"
else
  msg="���뷢��ʧ�ܣ����������ʼ���ַ�Ƿ���д��ȷ��"
end if
'Response.Write   msg&isgo
jmail.Close()
End Function





Activatedstr="��վ�������ԣ�<BR>"
Activatedstr=Activatedstr&"��˾���ƣ�&nbsp;&nbsp;"&request.Form("t1")&"<BR>"
Activatedstr=Activatedstr&"��ϵ�ˣ�&nbsp;&nbsp;"&request.Form("uname")&"<BR>"
Activatedstr=Activatedstr&"��ϵ�绰��&nbsp;&nbsp;"&request.Form("t2")&"<BR>"
Activatedstr=Activatedstr&"���棺&nbsp;&nbsp;"&request.Form("t3")&"<BR>"
Activatedstr=Activatedstr&"E-mail��&nbsp;&nbsp;"&request.Form("email")&"<BR>"
Activatedstr=Activatedstr&"��ϸ���ݣ�&nbsp;&nbsp;"&request.Form("t4")&"<BR>"





toemail="324018152@qq.com"

Call Send_EMail("smtp.163.com","webemial@163.com","webe9mial",toemail,"�Ϻ����Ĺ��̻�е���޹�˾","��վ��������",Activatedstr)

 response.write("<script>window.alert ('�����ύ�ɹ������ǻᾡ������ظ���лл!');window.location = ('index.asp');</script>")
 



%>