<!--#include file="webadmin_inc.asp"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head><!-- #include file="Inc/Head.asp" -->
<body>
<!-- #include file="web_top.asp" -->
<div class="div_border" align="center">
<div class="table_width">
<Br>
<table  width="98%" border="0" align="center" cellpadding="3" cellspacing="1" class="table_southidc" style="word-break:break-all">
<tr > 
<td height="28" colspan="4" align="center" background="img/admin_bg_1.gif" class="back_southidc"><strong>管理小类</strong></td>
</tr>
<tr> 
<td width="20%" height="82" align="center" valign="top" bgcolor="#E8F1FF"><span class="style3">
  <br>
  <select name="select" onChange="var jmpURL=this.options[this.selectedIndex].value ; if(jmpURL!='') {window.location=jmpURL;} else {this.selectedIndex=0 ;}" >
         <option selected >选择产品大类</option>
         <%set rs=server.createobject("adodb.recordset")
		rs.Open "select * from bigclass order by orders",conn,1,1
		do while not rs.eof %>
           <option value="manage_class_s.asp?id=<%=rs("bigid")%>&bigname=<%=rs("bigname")%>" <%if rs("bigid")=cint(request("id")) then %>selected<%end if%>><%=rs("bigname")%></option>
 <%rs.movenext
		loop
		rs.close
		set rs=nothing
	%>
      </select>
    <br><br>
   <%if request.QueryString("id")<>"" then  response.Write "当前类别："&request.QueryString("bigname") %>
</span></td>
<td width="80%" valign="top" bgcolor="#E8F1FF"> 
  <table width="98%" align="center" border="0" cellpadding="1" cellspacing="2">
<tr> 
<td width="42%" height="25" align="center" class="style4">小类名称</td>
<td width="28%" align="center"><!--名称图标背景图片--><span class="style4">分类排序</span></td>
<td width="30%" align="center"><span class="style4">确定操作</span></td>
</tr>
                                <%
		bigid=request("id")
        if bigid="" then
        response.Write "<div align=center><font color=red><span class='style4'>请选择左测的分类</span></font></div>"
        else
        set rs=server.CreateObject("adodb.recordset")
        rs.Open "select * from smallclass where bigid="&bigid&" order by orders",conn,1,1
         if rs.EOF and rs.BOF then
		  response.Write "<div align=center><font color=red>还没有分类</font></center>"
		  else
         do while not rs.EOF
         %>
<form name="form1" method="post" action="manage_class_ssave.asp?action=edit&id=<%=rs("smallid")%>&bigname=<%=request.QueryString("bigname")%>">
<tr> 
<td height="25" align="center">
  <span class="style3">
<input name="smallname" type="text" id="smallname" size="20" value="<%=trim(rs("smallname"))%>">
<input name="bigid" type="hidden" value="<%=request.QueryString("id")%>" id="Hidden1">
  </span></td>
<td align="center"><!--<input name="titlepic" type="text" id="titlepic" size="15">
  <input name="Submit3" type="button" id="Submit3" onClick="window.open('uploadweb.asp?formname=form2&amp;editname=titlepic&amp;uppath=/UploadFiles/Small_upload&amp;filelx=jpg','','status=no,scrollbars=no,top=20,left=110,width=420,height=165')" value="上传" />
  <input name="bgpic" type="text" id="bgpic" size="15">
  <input name="Submit3" type="button" id="Submit3" onClick="window.open('uploadweb.asp?formname=form2&amp;editname=bgpic&amp;uppath=/UploadFiles&amp;filelx=jpg','','status=no,scrollbars=no,top=20,left=110,width=420,height=165')" value="上传" />-->
  <input name="orders" type="text" id="orders" value="<%=rs("orders")%>" size="6"></td>
<td align="center">
  <span class="style3">
  <input type="submit" name="Submit" value="修改">
  &nbsp;
  <a href="manage_class_ssave.asp?id=<%=rs("smallid")%>&action=del&bigid=<%=request.QueryString("id")%>&bigname=<%=request.QueryString("bigname")%>" onClick="return confirm('您确定要删除该分类吗？同时删除产品中此类的产品!')"><font color=red>删除</font></a>  </span></td>
</tr>
</form>
		<%rs.movenext
        loop
        rs.close
        set rs=nothing
        end if
        end if
		%>
</table>
</td>
</tr>
</table>
<br>
<table width="98%" border="0" align="center" cellpadding="3" cellspacing="1" class="table_southidc" style="word-break:break-all">
<tr> 
<td height="28" colspan="2"  align="center"  class="back_southidc"  bgcolor="<%=tr_color_title%>"><strong>添加小类</strong></td>
</tr>
<tr> 
<td width="20%" align="center"  valign="middle" bgcolor="#E8F1FF">
当前分类：<%=request.QueryString("bigname")%></td>
<td width="80%" bgcolor="#E8F1FF"><table width="98%" align="center" border="0" cellpadding="1" cellspacing="2">
<form name="form2" method="post" action="manage_class_ssave.asp?action=add&bigname=<%=request.QueryString("bigname")%>">
<tr> 
<td width="42%" height="25" align="center" ><span class="style4">小类名称</span></td>
<td width="30%" align="center"><!--名称图标背景图片-->分类排序</td>
<td width="28%" align="center">确定操作</td>
</tr>

<tr> 
<td align="center"> 
<input name="smallname" type="text" id="smallname" size="20">
<input name="bigid" type="hidden" value="<%=request.QueryString("id")%>"></td>
<td align="center"><!--<input name="titlepic" type="text" id="titlepic" size="15">
  <input name="Submit3" type="button" id="Submit3" onClick="window.open('uploadweb.asp?formname=form2&amp;editname=titlepic&amp;uppath=/UploadFiles/Small_upload&amp;filelx=jpg','','status=no,scrollbars=no,top=20,left=110,width=420,height=165')" value="上传" />          <input name="bgpic" type="text" id="bgpic" size="15">
  <input name="Submit3" type="button" id="Submit3" onClick="window.open('uploadweb.asp?formname=form2&amp;editname=bgpic&amp;uppath=/UploadFiles&amp;filelx=jpg','','status=no,scrollbars=no,top=20,left=110,width=420,height=165')" value="上传" />--> 
  <input name="orders" type="text" id="orders" size="6" value="100"></td>
<td align="center"> 
<input type="submit" name="Submit2" value="添加小类"></td>
</tr>
</form>
</table></td>
</tr>
</table>
</div></div>

<!-- #include file="web_bottom.asp" -->
</body>
</html>