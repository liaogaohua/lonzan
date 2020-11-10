<!--#include file="conn.asp"-->
<!--#include file="admin.asp"-->
<%
set rs=server.createobject("adodb.recordset")
sqltext="select * from admin"
rs.open sqltext,conn,1,1
%>
<script language="javascript">
function confirmdel(id){
if (confirm("真的要删除此管理员帐号?"))
window.location.href="Delmanager.asp?id="+id+"  "   }
</script>
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
<!-- #include file="Inc/Head.asp" -->
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
  <tr> 
    <td align="center" valign="top"> <br> <strong><br>
        <br>
        <br>
        <br>
        <br>
        <br>
      <br>
      </strong> <table width="560" border="0" cellpadding="2" cellspacing="1" class="table_southidc">
        <tr> 
          <td class="back_southidc" width="598" height="25" > <div align="center"><strong>添加管理员</strong></div></td>
        </tr>
        <tr class="tr_southidc"> 
          <FORM language=javascript name=FORM1  onsubmit="return form1_onsubmit()"
action=addmanagerok.asp method=post>
            <td><table width="50%" border="0" align="center" >
                <tr> 
                  <td height="25" colspan="2">&nbsp;</td>
                </tr>
                <tr> 
                  <td width="29%" height="22"> <div align="right">管理员帐号：</div></td>
                  <td width="71%"><input type="text" name="uid" size="16" maxlength="20"></td>
                </tr>
                <tr> 
                  <td height="22"> <div align="right">管理员密码：</div></td>
                  <td><input type="text" name="pwd1" size="16"></td>
                </tr>
                <tr> 
                  <td height="22"> <div align="right">密码确认：</div></td>
                  <td><input type="text" name="pwd2" size="16"></td>
                </tr>
                <tr> 
                  <td height="22" colspan="2"><div align="center">
                      <INPUT type=submit value='确认添加' name=Submit2>
                    </div></td>
                </tr>
              </table></td>
          </form>
        </tr>
      </table>
      <strong> </strong></td>
  </tr>
</table>
<!-- #include file="Inc/Foot.asp" -->