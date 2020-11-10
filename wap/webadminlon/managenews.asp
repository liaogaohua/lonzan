
<meta http=equiv="content=type" content="text/html; charset=gb2312">
<% @language=vbscript codepage=936 %>
<!--#include file="webadmin_inc.asp"-->
<!--#include file="urlsession.asp"-->
<SCRIPT language=javascript>
function unselectall()
{
    if(document.del.chkAll.checked){
	document.del.chkAll.checked = document.del.chkAll.checked&0;
    } 	
}

function CheckAll(form)
  {
  for (var i=0;i<form.elements.length;i++)
    {
    var e = form.elements[i];
    if (e.Name != "chkAll")
       e.checked = form.chkAll.checked;
    }
  }
function ConfirmDel()
{
   if(confirm("确定要删除选中的信息吗？一旦删除将不能恢复！"))
     return true;
   else
     return false;
	 
}
</SCRIPT>
<%
language=checkisint(request("language"),0)
if language<>0 then session("language")=language'获取版本信息
if session("language")="" then session("language")=9'获取版本信息


dim inf_type
inf_type=request.QueryString(("type"))
if inf_type="" or isnumeric(inf_type)=0 or isempty(inf_type) then inf_type=2008

dim so_type,so_keyword
so_type=request.Form(("so_type"))
so_keyword=replace(trim(request.Form("so_keyword")),"'","")
if so_type="" or isnumeric(so_type)=0 or isempty(so_type) then so_type=0
%>
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
-->
</style>
<!-- #include file="Inc/Head.asp" -->
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
  <tr> 
    <td align="center" valign="top"><br>
      <table width="98%" border="0" align="center" cellpadding="5" cellspacing="1" class="table_southidc">
        <form name="search" method="post" action="?action=so"><tr class="title"> 
          <td height="25" bgcolor="#DFEEFF">&nbsp;<b>搜索：</b> 
          栏目分类:<select name="so_type" size="1" id="so_type" valign="middle">
            <%=readlist(2,cint(so_type),"选择分类") %>
            </select>&nbsp;            &nbsp;标题:   
       <input name="so_keyword" type="text" class=smallInput id="so_keyword" value="<% If  so_keyword<>"" Then response.write(so_keyword)    end if%>" size="23" maxlength="50">
                    <input name="Query2" type="submit" id="Query2" value="查 询">          </td>
          </tr>
        </form>
      </table>
      <table><tr><td height="1"></td></tr></table><form name="del" method="Post" action="managenews_save.asp?action=del" onSubmit="return ConfirmDel();">      
        <table width="98%" border="0" cellpadding="0" cellspacing="1" class="table_southidc">
          <tr> 
            <td height="25" bgcolor="#DFEEFF">&nbsp;分类 
              &gt;&gt; <%= readlist_row(2,cint(inf_type))%></td>
          </tr>
        </table>
        <table><tr><td height="1"></td></tr></table>
       
      <table width="98%" border="0" cellpadding="3" cellspacing="1" class="table_southidc" style="word-break:break-all">
         
          <tr bgcolor="#A4B6D7" class="title"> 
            <td width="44" height="25" align="center" bgcolor="#DFEEFF"><strong>选中</strong></td>
            <td width="48"  height="25" align="center" bgcolor="#DFEEFF"><strong>ID</strong></td>
            <td width="481" align="center" bgcolor="#DFEEFF" ><strong>标题名称</strong></td>
            <td width="109" align="center" bgcolor="#DFEEFF" ><strong>所属栏目</strong></td>
            <td width="105" align="center" bgcolor="#DFEEFF" ><strong>更新时间</strong></td>
            <td width="128" align="center" bgcolor="#DFEEFF" ><strong>操作</strong></td>
          </tr>
<%
Sql=""
if request("action")="so" then
  Sql="Select * From web_news where 1=1 "
  if cint(so_type)<>0 then  Sql=Sql&" and type="& cint(so_type)
  if request.Form("so_keyword")<>"" then  Sql=Sql&" and title like '%"& trim(so_keyword)&"%'"
else
   if inf_type<>2008 then Sql="Select * From web_news where  1=1  and type= "&inf_type
end if
if Sql="" then Sql="Select * From web_news where 1=1 "
Sql=Sql&" order by id desc"

oRs.PageSize = 15
oRs.CursorLocation = 3
oRs.open Sql,conn,1,1
call page1()
for i=1 to oRs.PageSize
if oRs.Eof then exit for
%>
          <tr class="tdbg" bgcolor="#ECF5FF" onMouseOver="mOvr(this,'#cae1fb');"  onMouseOut="mOut(this,'#ECF5FF');"> 
            <td width="44" height="22" align="center"> <input name='newsid' type='checkbox' onClick="unselectall()" id="newsid" value='<%=oRs("id")%>'>            </td>
            <td width="48" align="center"><%=oRs("id")%></td>
            <td><%=left(oRs("title"),35)%></td>
            <td width="109" align="center">[<%=readlist_name(oRs("type"),"未知")%>]</td>
            <td width="105" align="center"><%=Format_Time(oRs("addtime"),2)%></td>
            <td width="128" align="center"> 
              <a href="../News_show.asp?id=<%=oRs("id")%>" target="_blank" >查看</a> <a href="managenews_add.asp?id=<%=oRs("id")%>&action=edit">修改</a> <a href="managenews_save.asp?action=del&newsid=<%=oRs("id")%>">删除</a></td>
          </tr>
<%

oRs.movenext
next
%>
      </table>
      <table><tr><td height="1"></td></tr></table>
        <table width="98%" border="0" align="center" cellpadding="5" cellspacing="1" class="table_southidc">
          <tr class="title">
            <td width="448" height="25" bgcolor="#DFEEFF" style="padding-left:13px;"><input name="chkAll" type="checkbox" id="chkAll" onClick=CheckAll(this.form) value="checkbox">
选中本页显示的所有信息
  <input name="submit" type='submit' value='删除选定的信息'  >
  <input name="Action" type="hidden" id="Action" value="Del"></td>
            <td width="736" align="left" bgcolor="#DFEEFF"><%Call  Page_nobg()%></td>
          </tr>
        </table>
        <br>
      </form>
      </td>
  </tr>
</table>
<% 
oRs.close
set oRs=nothing  
call CloseConn()
 %>
<!-- #include file="Inc/Foot.asp" -->
