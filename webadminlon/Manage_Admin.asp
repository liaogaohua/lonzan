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
'�������ݿ⣬���˹���Ա�Ƿ��Ѿ�����
if rs.recordcount <>0 then
   response.Write "<script language='javascript'>alert('��������ʺ��Ѵ��ڣ�');history.back();</script>"
   response.End() 
   rs.close
end if
rs.close
sqltext="select * from [web_admin]"
rs.open sqltext,conn,3,3

'���һ������Ա�ʺŵ����ݿ�
rs.addnew
rs("it139username")=uid
rs("it139password")=password
rs.update
response.Write "<script language='javascript'>alert('����Ա��ӳɹ���');window.location='Manage_Admin.asp'</script>"
response.end()

elseif request("action")="delete" then
  conn.execute("delete from web_admin where id="&request("id"))
end if


sqltext="select * from [web_admin]"
rs.open sqltext,conn,1,1
%>
<script language="javascript">
function confirmdel(id){
if (confirm("���Ҫɾ���˹���Ա�ʺ�?"))
window.location.href="?action=delete&id="+id+"  "   }
</script>
<SCRIPT language=javascript >
<!--
function form1_onsubmit()
{
if (document.FORM1.uid.value=='')
{
alert ("���������Ա�ʺš�");
document.FORM1.uid.focus();
return false;
}
if (document.FORM1.pwd1.value=='')
{
alert ("���������Ա���롣");
document.FORM1.pwd1.value='';
document.FORM1.pwd1.focus();
return false;
}
if (document.FORM1.pwd2.value=='')
{
alert ("����������ȷ�ϡ�");
document.FORM1.pwd2.value=='';
document.FORM1.pwd2.focus();
return false;
}
if (document.FORM1.pwd1.value!=document.FORM1.pwd2.value)
{
alert ("��������������벻һ�¡�");
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
          <td class="back_southidc" width="598" height="25" > <div align="center"><strong>��ӹ���Ա</strong></div></td>
        </tr>
        <tr class="tr_southidc"> 
          <FORM language=javascript name=FORM1  onsubmit="return form1_onsubmit()"
action="Manage_Admin.asp?action=add" method=post>
            <td><table width="50%" border="0" align="center" >
                <tr> 
                  <td height="25" colspan="2">&nbsp;</td>
                </tr>
                <tr> 
                  <td width="29%" height="22"> <div align="right">����Ա�ʺţ�</div></td>
                  <td width="71%"><input type="text" name="uid" size="16" maxlength="20"></td>
                </tr>
                <tr> 
                  <td height="22"> <div align="right">����Ա���룺</div></td>
                  <td><input type="password" name="pwd1" size="16"></td>
                </tr>
                <tr> 
                  <td height="22"> <div align="right">����ȷ�ϣ�</div></td>
                  <td><input type="password" name="pwd2" size="16"></td>
                </tr>
                <tr> 
                  <td height="22" colspan="2"><div align="center">
                      <INPUT type=submit value='ȷ�����' name=Submit2>
                  </div></td>
                </tr>
              </table></td>
          </form>
        </tr>
      </table>
      <br> 
      <table width="75%" border="0" cellpadding="2" cellspacing="1" class="table_southidc">
        <tr> 
          <td width="553" height="25" class="back_southidc"> <div align="center"><strong>����Ա�ʺŹ���</strong></div></td>
        </tr>
        <tr class="tr_southidc"> 
          <FORM language=javascript
action=addmanagerok.asp method=post>
            <td><br> 
              <table width="100%" border="0" align="center" cellpadding="0" cellspacing="2">
                <tr bgcolor="#A4B6D7"> 
                  <td width="28%" height="25"> 
                    <div align="center">����Ա�ʺ�</div></td>
                  <td width="28%"> 
                    <div align="center">���ʱ��</div></td>
                  <td width="24%"> 
                    <div align="center">����</div></td>
                  <td width="20%"> 
                    <div align="center">ɾ��</div></td>
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
                      <%response.write "<a href='Manage_Mainedit.asp?ID="&rs("Id")&"'  >�޸�����</a>"%>
                    </div></td>
                  <td> 
                    <div align="center">
                      <%response.write "<a href='javascript:confirmdel(" & rs("Id") & ")'>ɾ��</a>"%>
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