
<!--#include file="webadmin_inc.asp"-->
<%
id=request("id")
set rs=server.createobject("adodb.recordset")

if request("action")="edit" then
  password=replace(trim(Request("pwd1")),"'","")
  password=EnPas(md5(password))
  conn.execute("update web_admin set it139password='"&password&"' where id="&request("id"))
  response.Write "<script language='javascript'>alert('管理员密码修改成功！');window.location='Manage_Admin.asp'</script>"
  response.end()
end if

sqltext="select * from [web_admin] where Id=" & id&" "
rs.open sqltext,conn,1,1
%>
<!-- #include file="Inc/Head.asp" -->
<SCRIPT language=javascript id=clientEventHandlersJS>
<!--
function form1_onsubmit()
{
if (document.FORM1.pwd1.value=='')
{
alert ("请输入管理员密码。");
document.FORM1.pwd1.value='';
document.FORM1.pwd1.focus();
return false;
}
if (document.FORM1.pwd2.value=='')
{
alert ("请输入密码确认。");
document.FORM1.pwd2.value=='';
document.FORM1.pwd2.focus();
return false;
}
if (document.FORM1.pwd1.value!=document.FORM1.pwd2.value)
{
alert ("您输入的两次密码不一致。");
document.FORM1.pwd1.value='';
document.FORM1.pwd2.value='';
document.FORM1.pwd1.focus();
return false;
}
}
//-->
</SCRIPT>
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
  <tr> 
    <td align="center" valign="top"> <br> <strong><br>
      </strong> <table width="75%" border="0" cellpadding="2" cellspacing="1" class="table_southidc">
        <tr> 
          <td class="back_southidc" height="25"> <div align="center"><strong>管理员密码修改</strong></div></td>
        </tr>
        <tr class="tr_southidc"> 
          <FORM language=javascript name=FORM1  onsubmit="return form1_onsubmit()"
action=?action=edit&id=<%=rs("Id")%> method=post>

            <td><table width="50%" border="0" align="center" cellpadding="0" cellspacing="2">
                <tr> 
                  <td height="25" colspan="2">&nbsp;</td>
                </tr>
                <tr> 
                  <td width="29%" height="22"> <div align="right">管理员帐号：</div></td>
                  <td width="71%">
                  <input name="uid" type="text" value="<%=rs("it139username")%>" size="16" maxlength="20" style="background-color:#E0E0E0;"></td>
                </tr>
                <tr> 
                  <td height="22"> <div align="right">新密码：</div></td>
                  <td><input name="pwd1" type="password" size="16" maxlength="20"></td>
                </tr>
                <tr> 
                  <td height="22"> <div align="right">密码确认：</div></td>
                  <td><input name="pwd2" type="password" size="16" maxlength="20"></td>
                </tr>
                <tr> 
                  <td height="22" colspan="2"><div align="center">
                      <INPUT  type=submit value='确认修改' name=Submit2>
                    </div></td>
                </tr>
              </table></td>
          </form>
        </tr>
      </table>
      <br> <strong> </strong></td>
  </tr>
</table>
<!-- #include file="Inc/Foot.asp" -->