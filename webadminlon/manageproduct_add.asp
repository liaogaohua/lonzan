<script language="JavaScript" type="text/javascript" src="/js/load.js"></script>
<meta http=equiv="content=type" content="text/html; charset=gb2312">
<% @language=vbscript codepage=936 %>
<!--#include file="webadmin_inc.asp"-->
<script language = "JavaScript">
function CheckForm()
{

  if (document.myform.bid.value==0)
  {
    alert("��ѡ����Ŀ���࣡");
	document.myform.bid.focus();
	return false;
  }
  if (document.myform.title.value=="")
  {
    alert("����д�������ƣ�");
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
<!-- #include file="web_top.asp" -->
<div class="div_border" align="center">
<div class="table_width">
<% If request.QueryString("action")<>"edit" Then

 %>

<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="100%" align="center" valign="top">
    <form method="POST" name="myform"   action="manageproduct_save.asp?action=add" target="_self">
      <br>
      <table width="98%" border="0" align="center" cellpadding="5" cellspacing="1" class="table_southidc">
        <tr>
          <td class="back_southidc" height="28" colspan="2" align="right" bgcolor="#C0C0C0"><div align="center" class="STYLE1">�� ��  �� Ʒ</div></td>
        </tr>
        <tr>
          <td height="22" align="right" bgcolor="<%=tr_color_content%>">������Ŀ��</td>
          <td bgcolor="<%=tr_color_content%>"><%call read_product_class(0,0,"myform")%></td>
        </tr>
        <tr>
          <td height="22" align="right" bgcolor="<%=tr_color_content%>">��Ʒ���ƣ�</td>
          <td bgcolor="<%=tr_color_content%>">
          <input name="title" type="text"    id="title" size="50" maxlength="80">
              <font color="#FF0000">*</font></td>
        </tr>
        
         <!--      <tr>
          <td height="22" align="right" bgcolor="<%=tr_color_content%>">����Ʒ�ƣ�</td>
          <td bgcolor="<%=tr_color_content%>">
          <input type="text" name="pid" id="pid">
    <select name="pid" id="pid">
          
          <%' call readpid_form("")%>
          </select>      </td>
        </tr>
         <tr>
          <td height="22" align="right" bgcolor="<%=tr_color_content%>">��Ʒ�۸�</td>
          <td bgcolor="<%=tr_color_content%>">
          <input name="tag" type="text"    id="tag" value="0" size="15" maxlength="80"></td>
        </tr>  -->   
        <tr>
          <td height="22" align="right" bgcolor="<%=tr_color_content%>">����˳��</td>
          <td bgcolor="<%=tr_color_content%>">
          <input name="orders" type="text"    id="orders" value="100" size="10" maxlength="80">
          <span style="color:#999999">(����ԽСԽ��ǰ)</span></td>
        </tr>  
        <tr>
          <td width="12%" height="22" align="right" bgcolor="<%=tr_color_content%>">չʾͼƬ��</td>
          <td bgcolor="<%=tr_color_content%>"><input name="pic" type="text" id="pic" size="35">
          <input name="Submit3" type="button" id="Submit3" onClick="window.open('uploadweb.asp?formname=myform&amp;editname=pic&amp;uppath=../UploadFiles&amp;filelx=jpg','','status=no,scrollbars=no,top=20,left=110,width=420,height=165')" value="�ϴ�ͼƬ" /></td>
        </tr>
        <tr>
          <td width="12%" height="22" align="right" bgcolor="<%=tr_color_content%>">��Ʒ�ص㣺</td>
          <td bgcolor="<%=tr_color_content%>">
          <textarea name="wordjj" id="wordjj" cols="60" rows="6"></textarea></td>
        </tr>
         <tr>
          <td width="12%" height="22" align="right" bgcolor="<%=tr_color_content%>">����������</td>
          <td bgcolor="<%=tr_color_content%>">
          
              
              <textarea name="content" style="width:100%;height:370px;visibility:hidden;"><%'=oRs("context")%></textarea>
              </td>
        </tr>
          <!-- <tr>
          <td height="22" align="right" bgcolor="#ECF5FF">�Ƿ���ˣ�</td>
          <td bgcolor="#ECF5FF"><input name="state" type="radio" id="state" value="1" checked  >
            ��
              &nbsp;
              <input name="state" type="radio" id="state" value="0"   >
            ��</td>
        </tr>-->
         <tr>
          <td height="22" align="right" bgcolor="#ECF5FF">����ʱ�䣺</td>
          <td colspan="5" bgcolor="#ECF5FF"><input name="addtime" type="text" id="addtime" value="<%= now() %>" maxlength="50">
            ��ǰʱ��Ϊ��<%= now() %> ע�ⲻҪ�ı��ʽ��</td>
        </tr>
      </table>
      <div align="center"><p> 
        <input name="Add" type="submit"  id="Add" value=" �� �� " onClick="return CheckForm();">
        &nbsp; 
      </p></div>
    </form></td>
  </tr>
</table>
<% 
Else
dim proid
proid=request.QueryString("id")

if proid="" or isnumeric(proid)=0 then 
   response.write("<script>window.alert ('�Ƿ�����,����ȷ������!');window.history.go(-1);</script>") 
   response.end()
end if


oRs.Open "Select * From [product] where id="&proid, conn,3,3
if oRs.eof and oRs.bof then
   oRs.close
   set oRs=nothing  
   call CloseConn()
   response.write("<script>window.alert ('û���ҵ���ؼ�¼,����ȷ������!');window.history.go(-1);</script>") 
   response.end()
end if
bid=checkisint(oRs("bid"),0)
sid=checkisint(oRs("sid"),0)
 %>
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="100%" align="center" valign="top">
    <form method="POST" name="myform"   action="manageproduct_save.asp?action=edit" target="_self">
      <br>
      <table width="98%" border="0" align="center" cellpadding="5" cellspacing="1" class="table_southidc">
        <tr>
          <td class="back_southidc" height="28" colspan="6" align="right" bgcolor="#C0C0C0"><div align="center" class="STYLE1">�� �� �� Ʒ</div></td>
        </tr>  
         <tr>
          <td height="22" align="right" bgcolor="<%=tr_color_content%>">������Ŀ��</td>
          <td bgcolor="<%=tr_color_content%>"><%call read_product_class(bid,sid,"myform")%></td>
        </tr>  
         <tr>
          <td height="22" align="right" bgcolor="<%=tr_color_content%>">��Ʒ���ƣ�</td>
          <td bgcolor="<%=tr_color_content%>">
          <input name="title" type="text"    id="title" value="<%=trim(oRs("title"))%>" size="50" maxlength="80">
              <font color="#FF0000">*              
              <input name="proid" type="hidden" id="proid" value="<%=proid%>">
              </font></td>
        </tr>
        <!--<tr>
          <td height="22" align="right" bgcolor="<%=tr_color_content%>">����Ʒ�ƣ�</td>
          <td bgcolor="<%=tr_color_content%>">
          <input type="text" name="pid" id="pid" value="<%=oRs("pid")%>">
          <select name="pid" id="pid">
          <% 'call readpid_form(oRs("pid"))%>
          </select>          </td>
        </tr> 
          <tr>
          <td height="22" align="right" bgcolor="<%=tr_color_content%>">��Ʒ�۸�</td>
          <td bgcolor="<%=tr_color_content%>">
          <input name="tag" type="text"    id="tag" size="25" maxlength="80"  value="<%=trim(oRs("tag"))%>"><span style="color:#999999">&nbsp;</span></td>
        </tr> -->
         <tr>
          <td height="22" align="right" bgcolor="<%=tr_color_content%>">����˳��</td>
          <td bgcolor="<%=tr_color_content%>">
          <input name="orders" type="text"    id="orders" size="25" maxlength="80"  value="<%=trim(oRs("orders"))%>"><span style="color:#999999">&nbsp;(����ԽСԽ��ǰ)</span></td>
        </tr>
        <tr>
          <td width="12%" height="22" align="right" bgcolor="<%=tr_color_content%>">չʾͼƬ��</td>
          <td bgcolor="<%=tr_color_content%>"><input name="pic" type="text" id="pic" value="<%=trim(oRs("pic"))%>" size="35">
          <input name="Submit3" type="button" id="Submit3" onClick="window.open('uploadweb.asp?formname=myform&amp;editname=pic&amp;uppath=../UploadFiles&amp;filelx=jpg','','status=no,scrollbars=no,top=20,left=110,width=420,height=165')" value="�ϴ�ͼƬ" /></td>
        </tr>
        <tr>
          <td width="12%" height="22" align="right" bgcolor="<%=tr_color_content%>">��Ʒ�ص㣺</td>
          <td bgcolor="<%=tr_color_content%>">
          <textarea name="wordjj" id="wordjj" cols="60" rows="6"><%=trim(oRs("wordjj"))%></textarea></td>
        </tr>
         <tr>
          <td width="12%" height="22" align="right" bgcolor="<%=tr_color_content%>">����������</td>
          <td bgcolor="<%=tr_color_content%>">
          
              
              <textarea name="content" style="width:100%;height:370px;visibility:hidden;"><%=oRs("context")%></textarea>
              </td>
        </tr>
        <!--   <tr>
          <td height="22" align="right" bgcolor="#ECF5FF">�Ƿ���ˣ�</td>
          <td bgcolor="#ECF5FF"><input name="state" type="radio" id="state" value="1"  <%if oRs("state")=1 then response.write "checked" %>>
            ��
              &nbsp;
              <input name="state" type="radio" id="state" value="0"   <%if oRs("state")=0 then response.write "checked" %>>
            ��</td>
        </tr>-->
         <tr>
          <td height="22" align="right" bgcolor="#ECF5FF">����ʱ�䣺</td>
          <td colspan="5" bgcolor="#ECF5FF"><input name="addtime" type="text" id="addtime" value="<%= oRs("addtime") %>" maxlength="50">
            ��ǰʱ��Ϊ��<%= now() %> ע�ⲻҪ�ı��ʽ��</td>
        </tr>
      </table>
      <div align="center"><p> 
        <input name="Add" type="submit"  id="Add" value=" �� �� " onClick="return CheckForm();">
        &nbsp; 
      </p></div>
    </form></td>
  </tr>
</table>
<%
oRs.close
set oRs=nothing  
call CloseConn()
end if

%>
</div></div>

<!-- #include file="web_bottom.asp" -->
</body>
