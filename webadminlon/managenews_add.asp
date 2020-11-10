<script language="JavaScript" type="text/javascript" src="/js/load.js"></script>
<meta http=equiv="content=type" content="text/html; charset=gb2312">
<% @language=vbscript codepage=936 %>
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

<body >
<% 

newtype=checkisint(request("newtype"),0)

If request.QueryString("action")<>"edit" Then %>
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="100%" align="center" valign="middle">
    <form method="POST" name="myform"   action="managenews_save.asp?action=add" target="_self">
      <br>
      <table width="98%" border="0" align="center" cellpadding="5" cellspacing="1" class="table_southidc">
        <tr>
          <td class="back_southidc" height="28" colspan="2" align="right" bgcolor="#C0C0C0">
          <div  class="manage_title">新闻添加          </div>
          </td>
        </tr>
        <tr>
          <td height="22" align="right" bgcolor="#ECF5FF">标题名称：</td>
          <td bgcolor="#ECF5FF">
          <input name="title" type="text"    id="title" size="50" maxlength="150">
              <font color="#FF0000">*</font></td>
        </tr> 
             <tr>
          <td width="12%" height="22" align="right" bgcolor="#ECF5FF">文章来源：</td>
          <td bgcolor="#ECF5FF"><input name="author" type="text" id="author" value="<%= news_author %>"></td>
          </tr>
            <tr>
          <td width="12%" height="22" align="right" bgcolor="#ECF5FF">所属栏目：</td>
          <td bgcolor="#ECF5FF">
            <select name="type" size="1" id="type" valign="middle">
            <%=readlist(2,newtype,"所属栏目") %>
            </select></td>
          </tr>  
          <!--     <tr>
          <td width="12%" height="22" align="right" bgcolor="#ECF5FF">简要介绍：</td>
          <td bgcolor="#ECF5FF"><textarea name="wordjj" id="wordjj" cols="60" rows="5"></textarea></td>
          </tr>  -->
        <tr>
          <td height="22" align="right" valign="middle" bgcolor="#ECF5FF">文章详情：</td>
          <td bgcolor="#ECF5FF">
              
              <textarea name="content" style="width:100%;height:370px;visibility:hidden;"><%'=oRs("context")%></textarea>
              </td>
        </tr>
<!-- <tr>
          <td height="22" align="right" bgcolor="#ECF5FF">首页显示：</td>
          <td bgcolor="#ECF5FF"><input name="state" type="radio" id="state" value="1">
            是
              &nbsp;
              <input name="state" type="radio" id="state" value="0"  checked >
            否</td>
        </tr>-->
        <tr>
          <td height="22" align="right" bgcolor="#ECF5FF">录入时间：</td>
          <td bgcolor="#ECF5FF"><input name="addtime" type="text" id="UpdateTime" value="<%= now() %>" maxlength="50">
            当前时间为：<%= now() %> 注意不要改变格式。</td>
        </tr>
      </table>
      <div align="center"><p> 
        <input name="Add" type="submit"  id="Add" value=" 添 加 " onClick="return CheckForm();">
        &nbsp; 
      </p></div>
    </form></td>
  </tr>
</table>
<% 
Else
dim newsid
newsid=request.QueryString("id")
if newsid="" or isnumeric(newsid)=0 then 
   response.write("<script>window.alert ('非法操作,单击确定返回!');window.history.go(-1);</script>") 
   response.end()
end if
oRs.Open "Select * From web_news where id="&newsid, conn,3,3
if oRs.eof and oRs.bof then
   oRs.close
   set oRs=nothing  
   call CloseConn()
   response.write("<script>window.alert ('没有找到相关记录,单击确定返回!');window.history.go(-1);</script>") 
   response.end()
end if
 %>
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="100%" align="center" valign="middle">
    <form method="POST" name="myform"   action="managenews_save.asp?action=edit" target="_self">
      <br>
      <table width="98%" border="0" align="center" cellpadding="5" cellspacing="1" class="table_southidc">
        <tr>
          <td class="back_southidc" height="28" colspan="6" align="right" bgcolor="#C0C0C0">
           <div  class="manage_title">新闻修改          </div>
           
          </td>
        </tr>
        <tr>
          <td width="12%" height="22" align="right" bgcolor="#ECF5FF">标题名称：</td>
          <td  colspan="5" bgcolor="#ECF5FF">
            <input name="title" type="text" id="title" value="<%=trim(oRs("title"))%>" size="50" maxlength="150"> <font color="#FF0000">*</font></td>
        </tr> 
            <tr>
          <td width="12%" height="22" align="right" bgcolor="#ECF5FF">文章来源：</td>
          <td bgcolor="#ECF5FF"><input name="author" type="text" id="author" value="<%= oRs("author") %>">
            <font color="#FF0000">
            <input name="newsid" type="hidden" id="newsid" value="<%=newsid%>">
            </font></td>
          </tr>
           <tr>
          <td width="12%" height="22" align="right" bgcolor="#ECF5FF">所属栏目：</td>
          <td bgcolor="#ECF5FF">
            <select name="type" size="1" id="type" valign="middle">
            <%=readlist(2,oRs("type"),"所属栏目") %>
            </select></td>
          </tr> 
           <!--   <tr>
          <td width="12%" height="22" align="right" bgcolor="#ECF5FF">简要介绍：</td>
          <td bgcolor="#ECF5FF"><textarea name="wordjj" id="wordjj" cols="60" rows="5"><%= oRs("wordjj") %></textarea></td>
          </tr>      -->   
        <tr>
          <td height="22" align="right" valign="middle" bgcolor="#ECF5FF">文章详情：</td>
          <td colspan="5" bgcolor="#ECF5FF">
              <textarea name="content" style="width:100%;height:370px;visibility:hidden;"><%=oRs("context")%></textarea>
              </td>
        </tr>
     <!--        <tr>
          <td height="22" align="right" bgcolor="#ECF5FF">首页显示：</td>
          <td bgcolor="#ECF5FF"><input name="state" type="radio" id="state" value="1"  <%if oRs("state")=1 then response.write "checked" %>>
            是
              &nbsp;
              <input name="state" type="radio" id="state" value="0"   <%if oRs("state")=0 then response.write "checked" %>>
            否</td>
        </tr>-->
        <tr>
          <td height="22" align="right" bgcolor="#ECF5FF">录入时间：</td>
          <td colspan="5" bgcolor="#ECF5FF"><input name="addtime" type="text" id="addtime" value="<%= oRs("addtime") %>" maxlength="50">
            当前时间为：<%= now() %> 注意不要改变格式。</td>
        </tr>
      </table>
      <div align="center"><p> 
        <input name="Add" type="submit"  id="Add" value=" 修 改 " onClick="return CheckForm();">
        &nbsp; 
      </p></div>
    </form></td>
  </tr>
</table>
<% 
oRs.close
set oRs=nothing  
call CloseConn()
End If 
%>
</body>
<!-- #include file="Inc/Foot.asp" -->