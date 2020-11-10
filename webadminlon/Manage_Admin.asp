<!--#include file="webadmin_inc.asp"-->
<!-- #include file="Inc/Head.asp" -->

<%
set rs=server.createobject("adodb.recordset")

if request("action")="add" then
password=replace(trim(Request("pwd1")),"'","")
uid=replace(trim(Request("uid")),"'","")
password=EnPas(md5(password))

sqltext="select * from [web_admin] where it139username='" & uid & "'"
rs.open sqltext,conn,1,1
'查找数据库，检查此管理员是否已经存在
if rs.recordcount <>0 then
   response.Write "<script language='javascript'>alert('您输入的帐号已存在！');history.back();</script>"
   response.End() 
   rs.close
end if
rs.close
sqltext="select * from [web_admin]"
rs.open sqltext,conn,3,3

'添加一个管理员帐号到数据库
rs.addnew
rs("it139username")=uid
rs("it139password")=password
rs.update
response.Write "<script language='javascript'>alert('管理员添加成功！');window.location='Manage_Admin.asp'</script>"
response.end()

elseif request("action")="delete" then
  conn.execute("delete from web_admin where id="&request("id"))
end if


sqltext="select * from [web_admin]"
rs.open sqltext,conn,1,1
%>
<script language="javascript">
function confirmdel(id){
if (confirm("真的要删除此管理员帐号?"))
window.location.href="?action=delete&id="+id+"  "   }
</script>
<SCRIPT language=javascript >
<!--
function form1_onsubmit()
{
if (document.FORM1.uid.value=='')
{
alert ("请输入管理员帐号。");
document.FORM1.uid.focus();
return false;
}
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
          <td class="back_southidc" width="598" height="25" > <div align="center"><strong>添加管理员</strong></div></td>
        </tr>
        <tr class="tr_southidc"> 
          <FORM language=javascript name=FORM1  onsubmit="return form1_onsubmit()"
action="Manage_Admin.asp?action=add" method=post>
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
                  <td><input type="password" name="pwd1" size="16"></td>
                </tr>
                <tr> 
                  <td height="22"> <div align="right">密码确认：</div></td>
                  <td><input type="password" name="pwd2" size="16"></td>
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
      <br> 
      <table width="75%" border="0" cellpadding="2" cellspacing="1" class="table_southidc">
        <tr> 
          <td width="553" height="25" class="back_southidc"> <div align="center"><strong>管理员帐号管理</strong></div></td>
        </tr>
        <tr class="tr_southidc"> 
          <FORM language=javascript
action=addmanagerok.asp method=post>
            <td><br> 
              <table width="100%" border="0" align="center" cellpadding="0" cellspacing="2">
                <tr bgcolor="#A4B6D7"> 
                  <td width="28%" height="25"> 
                    <div align="center">管理员帐号</div></td>
                  <td width="28%"> 
                    <div align="center">添加时间</div></td>
                  <td width="24%"> 
                    <div align="center">操作</div></td>
                  <td width="20%"> 
                    <div align="center">删除</div></td>
                </tr>
                <%
if not rs.eof then
do while not rs.eof
%>
                <tr bgcolor="#DFEBF2"> 
                  <td height="22"> 
                    <div align="center"><%=rs("it139username")%></div></td>
                  <td> 
                    <div align="center"><%=FormatDateTime(rs("addtime"),2) %></div></td>
                  <td> 
                    <div align="center">
                      <%response.write "<a href='Manage_Mainedit.asp?ID="&rs("Id")&"'  >修改密码</a>"%>
                    </div></td>
                  <td> 
                    <div align="center">
                      <%response.write "<a href='javascript:confirmdel(" & rs("Id") & ")'>删除</a>"%>
                    </div></td>
                </tr>
<%
rs.movenext
loop
end if
%>
<%
rs.close
conn.close
%>
              </table></td>
          </form>
        </tr>
      </table>
      <strong> </strong></td>
  </tr>
</table>
<!-- #include file="Inc/Foot.asp" -->