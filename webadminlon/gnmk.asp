<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!--#include file="it139web_inc.asp"-->
<%


	id=checkisint(request("id"),62)
	set aboutrs=conn.execute("select * from web_about where aboutid="&id)
	if aboutrs.eof then readvar("操作失败！！\n没有找到该条信息")
	about_title=aboutrs(2)
	about_context=aboutrs(3)
	
	call meta(about_title&"-卓越的网站建设服务提供商","","")
	if id=1 then  call meta("程序开发-卓越的网站建设服务提供商","","")
	
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link href="images/it139_css.css" rel="stylesheet" type="text/css" />
<link href="css/program.css" rel="stylesheet" type="text/css" />
<title><%=WebTitle%></title>
<meta name="keywords" content="<%= Webkeywords %>">
<meta name="description" content="<%= Webdescription%>">
</head>

<body>


<!--#include file="web_top.asp"-->

<%

      call web_dh(web_dhpic&dhlink("企业建站","website.asp")&web_dhpic&dhlink(about_title,"?id="&id))



%>

<table width="950" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="200" height="300" valign="top">
    
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td class="aboutus_left" style=""><table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-bottom:20px;">
      <tr>
        <td height="51" style="background:url(images/gnmk.gif) no-repeat;">&nbsp;</td>
      </tr>

     <%
	 str="background:url(images/left_menu_bg01.gif) center bottom no-repeat;font-weight:bold;"
	 sql="select * from web_class where class=1 and (orders  between 201 and 300 ) order by orders asc"
	 set menurs=conn.execute(sql)
	 do while not menurs.eof
	 style=""
	 if menurs("id")=id then style=str
	 %>
     <tr>
        <td valign="middle" class="extend_left_bline" style="<%=style%>">
          <a href="gnmk.asp?id=<%=menurs("id")%>"><%=left(menurs("title"),12)%></a></td>
     </tr>
     <%
	    menurs.movenext
	 loop
	 %>
    </table></td>
      </tr>
    </table>
    
    
    </td>
    <td valign="top" style=" padding-left:10px;">
    
    <!--右侧主要内容-->
    
	<%

	  response.Write "<div class=""web_right_table_001"" style=""height:606px;"">"
	  response.Write about_context
	  response.Write "</div>"

	%>

    
    
    <!--右侧主要内容-->
    
        </td>
  </tr>
</table>


<!--#include file="web_bottom.asp"-->

</body>
</html>
