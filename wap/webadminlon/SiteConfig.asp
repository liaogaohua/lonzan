<%@language=VBScript codepage=936 %>
<!--#include file="inc/Conn.asp"-->
<!--#include file="../Inc/myfunction.asp"-->
<!--#include file="admin.asp"-->
<!--#include file="../seo.asp"-->
<%
dim ObjInstalled,Action,FoundErr,ErrMsg
ObjInstalled=IsObjInstalled("Scripting.FileSystemObject")
Action=trim(request("Action"))
if Action="" then
	Action="ShowInfo"
end if
Function IsObjInstalled(strClassString)
	On Error Resume Next
	IsObjInstalled = False
	Err = 0
	Dim xTestObj
	Set xTestObj = Server.CreateObject(strClassString)
	If 0 = Err Then IsObjInstalled = True
	Set xTestObj = Nothing
	Err = 0
End Function

%>
<html>
<head>
<!-- #include file="Inc/Head.asp" -->
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<body leftmargin="2" topmargin="0" marginwidth="0" marginheight="0"> 
<%
if Action="SaveConfig" then
	call SaveConfig()
	Response.Redirect "SiteConfig.asp" 
else
	call ShowConfig()
end if
if FoundErr=True then
	call WriteErrMsg()
end if
call CloseConn()

sub ShowConfig()
%>
<form method="POST" action="SiteConfig.asp" id="form" name="form">
  <table width="98%" border="0" align="center" cellpadding="2" cellspacing="1" >
    <tr> 
      <td height="24" colspan="4" class="table_southidc"> <div align="center"><strong>网站优化信息配置</strong></div></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td colspan="4" class="topbg">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="145" class="tdbg"><strong>网站标题：</strong></td>
      <td width="1154" colspan="3" class="tdbg"> <input name="Sitetitle" type="text" id="Sitetitle" value="<%=Sitetitle%>" size="60" maxlength="600">      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td class="tdbg"><strong>网站关键字：</strong></td>
      <td colspan="3" class="tdbg"><input name="SKeywords" type="text" id="SKeywords" value="<%=SKeywords%>" size="60" maxlength="600"></td>
    </tr>

    <tr bgcolor="#FFFFFF"> 
      <td width="145" class="tdbg"><strong>网站概况：</strong></td>
      <td colspan="3" class="tdbg"> <textarea name="SDescription" cols="60" rows="6" id="SDescription"><%=SDescription%></textarea>      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td colspan="4" align="center" class="tdbg"> <input name="Action" type="hidden" id="Action" value="SaveConfig"> 
        <input name="cmdSave" type="submit" id="cmdSave" value=" 保存设置 " <% If ObjInstalled=false Then response.write "disabled" %>>      </td>
    </tr>
    <%
If ObjInstalled=false Then
	Response.Write "<tr class='tdbg'><td height='40' colspan='3'><b><font color=red>你的服务器不支持 FSO(Scripting.FileSystemObject)! 不能使用本功能。<br>请直接修改“seo.asp”文件中的内容。</font></b></td></tr>"
End If
%>
  </table>
<%
end sub
%>
</form>
</body>
</html>
<%
 Function InPutStr(Input)'向数据库中保存字符串时用 
     IF IsEmpty(Input) Then Input="" 
     IF IsNull(Input) Then Input="" 
     IF instr(input,chr(34))>0 Then input=replace(input,chr(34),chr(39))'将"替换成',以便在向数据库里存放 
     InPutStr=input 
End function 
sub SaveConfig()
	If ObjInstalled=false Then
		FoundErr=True
		ErrMsg=ErrMsg & "<br><li>你的服务器不支持 FSO(Scripting.FileSystemObject)! </li>"
		exit sub
	end if
	dim fso,hf
	set fso=Server.CreateObject("Scripting.FileSystemObject")
	set hf=fso.CreateTextFile(Server.mappath("../seo.asp"),true)
	hf.write "<" & "%" & vbcrlf
	hf.write "Const Sitetitle=" & chr(34) & trim(request("Sitetitle")) & chr(34) & "        '标题" & vbcrlf
	hf.write "Const SKeywords=" & chr(34) & trim(request("SKeywords")) & chr(34) & "        '关键字" & vbcrlf
	hf.write "Const SDescription=" & chr(34) & trim(request("SDescription")) & chr(34) & "        '介绍" & vbcrlf


	hf.write "%" & ">"
	hf.close
	set hf=nothing
	set fso=nothing	
end sub
%>