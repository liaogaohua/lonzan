<!--#include file="webadmin_inc.asp"-->
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head><!-- #include file="Inc/Head.asp" -->
<body>
<!-- #include file="web_top.asp" -->
<div class="div_border" align="center">
<div class="table_width">
      <table width="98%" border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#FFFFFF" class="table_southidc" style="word-break:break-all;margin-top:10px;" >
		        <tr>
							  <td height="28" colspan="5" align="center" background="img/admin_bg_1.gif" class="back_southidc"><strong>产品大类管理</strong></td>
					     </tr>
                                <tr bgcolor="#A4B6D7"class="title" > 
                                  <td width="57%" height="25" align="center" bgcolor="<%=tr_color_title%>" ><span class="style2">大类名称</span></td>
                                  <td width="25%" align="center" bgcolor="<%=tr_color_title%>" ><span class="style2">分类排序</span></td>
                                  <td width="18%" align="center" bgcolor="<%=tr_color_title%>" ><span class="style2">确定操作</span></td>
                                </tr>
         <%set rs=server.CreateObject("adodb.recordset")
		  rs.Open "select * from bigclass order by orders ",conn,1,1
		  dim paixu
		  if rs.EOF and rs.BOF then
		  else
		  do while not rs.EOF
		  %>
                                <form name="myform" method="post" action="manage_class_bsave.asp?action=edit&id=<%=rs("bigid")%>">
                                  <tr class="tdbg" bgcolor="<%=tr_color_content%>" onMouseOver="mOvr(this,'<%=tr_color_title%>');"  onMouseOut="mOut(this,'<%=tr_color_content%>');"> 
                                    <td height="25" align="center" bgcolor="<%=tr_color_content%>"><input name="bigname" type="text" id="bigname" value="<%=trim(rs("bigname"))%>" size="30">                                    </td>
                                    <td align="center" bgcolor="<%=tr_color_content%>" ><input name="orders" type="text" id="orders" value="<%=rs("orders")%>" size="6">
                                    <td align="center" bgcolor="<%=tr_color_content%>"><span class="style3">
                                    <input type="submit" name="Submit" value="修 改">
                                    &nbsp;
                                    <a href="manage_class_bsave.asp?id=<%=rs("bigid")%>&action=del" onClick="return confirm('您确定要删除该分类吗？同时删除此类的产品!')"><font color=red>删除</font></a> </td>
                                  </tr>
                                </form>
						<%rs.MoveNext
								loop
								end if%>
</table>
<br>
<table width="98%" border="0" align="center" cellpadding="3" cellspacing="1"  class="table_southidc" style="word-break:break-all;margin-top:10px;">
<tr>
<td height="28" colspan="4" align="center" background="img/admin_bg_1.gif" class="back_southidc"><strong>添加大类</strong></td>
</tr>
<tr  align="center"> 
<td width="57%" height="25" align="center" bgcolor="<%=tr_color_title%>" ><span class="style2"> 大类名称</span></td>
<td width="25%" align="center" bgcolor="<%=tr_color_title%>" ><span class="style2"> 分类排序</span></td>
<td width="18%" align="center" bgcolor="<%=tr_color_title%>" ><span class="style2"> 确定操作</span></td>
</tr>
<form name="addform" method="post" action="manage_class_bsave.asp?action=add">
<tr  align="center"> 
<td height="25" bgcolor="<%=tr_color_content%>">
<input name="bigname" type="text" id="bigname" size="25"></td>
<td bgcolor="<%=tr_color_content%>">
<input name="orders" type="text" id="orders" value="100" size="6"></td>
<td bgcolor="<%=tr_color_content%>">
<input name="Submit3" type="submit" value="添 加"></td>
</tr>
</form>
</table>
</div></div>

<!-- #include file="web_bottom.asp" -->
</body>
</html>