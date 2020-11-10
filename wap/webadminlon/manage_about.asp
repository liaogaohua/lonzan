<meta http=equiv="content=type" content="text/html; charset=gb2312">
<!--#include file="webadmin_inc.asp"-->
<script language = "JavaScript">
function CheckForm()
{

  if (document.myform.title.value=="")
  {
    alert("请填写标题名称！");
	document.myform.title.focus();
	return false;
  }
   if (document.myform.content.value=="")
  {
    alert("请填写专题正方！");
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
title=replace(trim(request.Form("title")),"'","’")



countsql="select * from [web_class] where class=1 and id="&aboutid'无该专题类别
if readrscount(countsql)=0 then  go_error("非法操作!")

'======================================================数据保存
action=get_safestr(request("action"))
if action="add" then'添加
    addsql="insert into [web_about] (aboutid,title,context) values("&aboutid&",'"&title&"','"&context&"')"
   conn.execute(addsql)
   response.Write("<script>alert('修改成功!');location.href('manage_about.asp?id="&aboutid&"');</script>")
elseif action="update" then'修改
   conn.execute("update [web_about] set context='"&context&"',title='"&title&"' where 1=1 and aboutid="&aboutid)
   response.Write("<script>alert('修改成功!');location.href('manage_about.asp?id="&aboutid&"');</script>")
end if
'========================================================数据读取
oRs.Open "Select * From web_about where 1=1 and aboutid="&aboutid, conn,3,3
if oRs.eof and oRs.bof then'===========添加
   action="add"
   about_context="<BR>====暂无信息====</br>"
   title=readlist_name(aboutid,"专题")
   language=9
else'===========修改
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
          <div  class="manage_title"><%="编辑"&readlist_name(aboutid,"专题")%>
            <input name="id" type="hidden" id="id" value="<%=aboutid%>" />
          </div>
          </td>
        </tr>
        <tr>
          <td width="8%" align="right" bgcolor="#ECF5FF">
          标题：</td>
          <td width="92%" align="left" bgcolor="#ECF5FF"><div style="float:left;"><input name="title" type="text" id="title" value="<%=title%>" size="50"></div>
            <div style="float:right;"><input type="image" name="imageField" id="imageField" src="image/75.gif" onClick="return CheckForm();" title="没有修改请不要点击" /></div></td>
        </tr>
        <tr>
          <td align="right" bgcolor="#ECF5FF">内容：</td>
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