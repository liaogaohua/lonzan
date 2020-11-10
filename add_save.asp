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
  msg="您的密码已经发往您的邮箱，请注意查收。。"
else
  msg="密码发送失败！请检查您的邮件地址是否填写正确。"
end if
'Response.Write   msg&isgo
jmail.Close()
End Function





Activatedstr="网站访问留言：<BR>"
Activatedstr=Activatedstr&"公司名称：&nbsp;&nbsp;"&request.Form("t1")&"<BR>"
Activatedstr=Activatedstr&"联系人：&nbsp;&nbsp;"&request.Form("uname")&"<BR>"
Activatedstr=Activatedstr&"联系电话：&nbsp;&nbsp;"&request.Form("t2")&"<BR>"
Activatedstr=Activatedstr&"传真：&nbsp;&nbsp;"&request.Form("t3")&"<BR>"
Activatedstr=Activatedstr&"E-mail：&nbsp;&nbsp;"&request.Form("email")&"<BR>"
Activatedstr=Activatedstr&"详细内容：&nbsp;&nbsp;"&request.Form("t4")&"<BR>"





toemail="324018152@qq.com"

Call Send_EMail("smtp.163.com","webemial@163.com","webe9mial",toemail,"上海龙漳工程机械有限公司","网站访问留言",Activatedstr)

 response.write("<script>window.alert ('留言提交成功，我们会尽快给您回复，谢谢!');window.location = ('index.asp');</script>")
 



%>