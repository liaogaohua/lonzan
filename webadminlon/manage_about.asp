<meta http=equiv="content=type" content="text/html; charset=gb2312">
<!--#include file="webadmin_inc.asp"-->
<script language = "JavaScript">
function CheckForm()
{

  if (document.myform.title.value=="")
  {
    alert("����д�������ƣ�");
	document.myform.title.focus();
	return false;
  }
   if (document.myform.content.value=="")
  {
    alert("����дר��������");
	document.myform.content.focus();
	return false;
  }

}
</script>
<style type="text/css">
<!--
.STYLE1 {	font-size: 14px;
	font-weight: bold;
}
-->
</style>
<!-- #include file="Inc/Head.asp" -->
<% 
dim aboutid,action
aboutid=checkisint(request("id"),0)
context=replace(trim(request.Form("content")),"'","")
title=replace(trim(request.Form("title")),"'","��")



countsql="select * from [web_class] where class=1 and id="&aboutid'�޸�ר�����
if readrscount(countsql)=0 then  go_error("�Ƿ�����!")

'======================================================���ݱ���
action=get_safestr(request("action"))
if action="add" then'���
    addsql="insert into [web_about] (aboutid,title,context) values("&aboutid&",'"&title&"','"&context&"')"
   conn.execute(addsql)
   response.Write("<script>alert('�޸ĳɹ�!');location.href('manage_about.asp?id="&aboutid&"');</script>")
elseif action="update" then'�޸�
   conn.execute("update [web_about] set context='"&context&"',title='"&title&"' where 1=1 and aboutid="&aboutid)
   response.Write("<script>alert('�޸ĳɹ�!');location.href('manage_about.asp?id="&aboutid&"');</script>")
end if
'========================================================���ݶ�ȡ
oRs.Open "Select * From web_about where 1=1 and aboutid="&aboutid, conn,3,3
if oRs.eof and oRs.bof then'===========���
   action="add"
   about_context="<BR>====������Ϣ====</br>"
   title=readlist_name(aboutid,"ר��")
   language=9
else'===========�޸�
   action="update"
   about_context=oRs("context")
   title=oRs("title")
end if   
oRs.close
set oRs=nothing  

 
%>
<body >



<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="100%" align="center" valign="top">
    <form method="POST" name="myform"   action="?action=<%= action %>" target="_self">
      <br>
      <table width="98%" border="0" align="center" cellpadding="5" cellspacing="1" class="table_southidc">
        <tr>
          <td height="28" colspan="2" align="right" bgcolor="#C0C0C0" class="back_southidc">
          <div  class="manage_title"><%="�༭"&readlist_name(aboutid,"ר��")%>
            <input name="id" type="hidden" id="id" value="<%=aboutid%>" />
          </div>
          </td>
        </tr>
        <tr>
          <td width="8%" align="right" bgcolor="#ECF5FF">
          ���⣺</td>
          <td width="92%" align="left" bgcolor="#ECF5FF"><div style="float:left;"><input name="title" type="text" id="title" value="<%=title%>" size="50"></div>
            <div style="float:right;"><input type="image" name="imageField" id="imageField" src="image/75.gif" onClick="return CheckForm();" title="û���޸��벻Ҫ���" /></div></td>
        </tr>
        <tr>
          <td align="right" bgcolor="#ECF5FF">���ݣ�</td>
          <td align="right" bgcolor="#ECF5FF">
          <textarea name="content" style="width:100%;height:370px;visibility:hidden;"><%=about_context%></textarea>
          </td>
        </tr>
      </table>
    </form></td>
  </tr>
</table>

</body>
<!-- #include file="Inc/Foot.asp" -->