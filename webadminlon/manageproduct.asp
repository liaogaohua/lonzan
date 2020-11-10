
<meta http=equiv="content=type" content="text/html; charset=gb2312">
<% @language=vbscript codepage=936 %>
<!--#include file="webadmin_inc.asp"-->
<!--#include file="../inc/urlsession.asp"-->
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

dim so_type,so_keyword
bid=checkisint(request("bid"),0)
sid=checkisint(request("sid"),0)
tj=checkisint(request("tj"),999)
zd=checkisint(request("zd"),999)
pstate=checkisint(request("state"),999)
so_keyword=replace(trim(request("so_keyword")),"'","")

%><!-- #include file="Inc/Head.asp" -->
<!-- #include file="web_top.asp" -->
<div class="div_border" align="center">
<div class="table_width">
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
  <tr> 
    <td align="center" valign="top"><br>

      <table width="98%" border="0" align="center" cellpadding="5" cellspacing="1" class="table_southidc">
        <form name="myform" method="get" action="?action=so"><tr class="title"> 
          <td height="25" bgcolor="<%=tr_color_title%>">&nbsp;<b>搜索：</b>
          <%call read_product_class(bid,sid,"myform")%>
          标题名称:   
          <input name="so_keyword" type="text" class=smallInput id="so_keyword" value="<% If  so_keyword<>"" Then response.write(so_keyword)    end if%>" size="23" maxlength="50">
                    <input name="Query2" type="submit" id="Query2" value="查 询">          </td>
          </tr>
        </form>
      </table>

      <form name="del" method="Post" action="manageproduct_save.asp?action=del" onSubmit="return ConfirmDel();">
       
      <table width="98%" border="0" cellpadding="3" cellspacing="1" class="table_southidc" style="word-break:break-all">
         
          <tr bgcolor="#A4B6D7" class="title"> 
            <td width="54" height="25" align="center" bgcolor="<%=tr_color_title%>"><strong>选中</strong></td>
            <td width="56"  height="25" align="center" bgcolor="<%=tr_color_title%>"><strong>ID</strong></td>
            <td width="340" align="center" bgcolor="<%=tr_color_title%>" ><strong>标题名称</strong></td>
            <td width="120" align="center" bgcolor="<%=tr_color_title%>" ><strong>大栏目</strong></td>
            <td width="135" align="center" bgcolor="<%=tr_color_title%>" ><strong>小栏目</strong></td>
            <td width="100" align="center" bgcolor="<%=tr_color_title%>" ><strong>添加时间</strong></td>
            <td width="103" align="center" bgcolor="<%=tr_color_title%>" ><strong>操作</strong></td>
          </tr>
<%
Sql=""
Sql="Select * From [product] where 2=2 "
if bid<>0 then Sql=Sql&" and bid="& bid
if sid<>0 then Sql=Sql&" and sid="& sid

if tj<>999 then Sql=Sql&" and tj="& tj
if zd<>999 then Sql=Sql&" and zd="& zd
if pstate<>999 then Sql=Sql&" and state="& pstate

if request("so_keyword")<>"" then  Sql=Sql&" and ( title like '%"& trim(so_keyword)&"%' )"
if Sql="" then Sql="Select * From [product] where 1=1"
Sql=Sql&" order by id desc"


oRs.PageSize = 15
oRs.CursorLocation = 3
oRs.open Sql,conn,1,1
call page1()
for i=1 to oRs.PageSize
if oRs.Eof then exit for
%>
          <tr class="tdbg" bgcolor="<%=tr_color_content%>" onMouseOver="mOvr(this,'<%=tr_color_title%>');"  onMouseOut="mOut(this,'<%=tr_color_content%>');"> 
            <td height="22" align="center"> <input name='productid' type='checkbox' onClick="unselectall()" id="productid" value='<%=oRs("id")%>'>            </td>
            <td align="center"><%=oRs("id")%></td>
            <td align="left" ><a href='/pic_show.asp?id=<%=oRs("id")%>.htm' target=_blank><%=left(oRs("title"),29)%></a></td>
            <td align="center"><%=readuserinf(oRs("bid"),"bigclass",1)%></td>
            <td align="center"><%=readuserinf(oRs("sid"),"smallclass",1)%></td>
            <td align="center"><%=Format_Time(oRs("addtime"),2)%></td>
            <td align="center"><a href="manageproduct_add.asp?id=<%=oRs("id")%>&action=edit">修改</a> 
            <a href="manageproduct_save.asp?action=del&productid=<%=oRs("id")%>" onclick="return window.confirm('确定删除该条信息')">删除</a>            </td>
          </tr>
<%

oRs.movenext
next
%>
      </table>
      <table><tr><td height="1"></td></tr></table>
        <table width="98%" border="0" align="center" cellpadding="5" cellspacing="1" class="table_southidc">
          <tr class="title">
            <td width="448" height="25" bgcolor="<%=tr_color_title%>" style="padding-left:13px;"><input name="chkAll" type="checkbox" id="chkAll" onClick=CheckAll(this.form) value="checkbox">
选中本页显示的所有信息
  <input name="submit" type='submit' value='删除选定的信息'  >
  <input name="Action" type="hidden" id="Action" value="Del"></td>
            <td width="736" align="left" bgcolor="<%=tr_color_title%>"><%Call  Page_nobg()%></td>
          </tr>
        </table>
        <br>
      </form>
      </td>
  </tr>
</table>
</div></div>
<% 
oRs.close
set oRs=nothing  
call CloseConn()
 %>
<!-- #include file="web_bottom.asp" -->
