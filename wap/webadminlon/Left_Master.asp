<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<!-- saved from url=(0056)/User_Master.asp?action=admin_left -->
<!--#include file="inc/Conn.asp"-->
<!--#include file="admin.asp"-->
<HTML><HEAD><TITLE>加盟网</TITLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312"><LINK 
href="image/Css_Master.css" type=text/css rel=stylesheet>
<SCRIPT language=javascript src="image/utils.js" 
type=text/javascript></SCRIPT>

<SCRIPT src="image/prototype.js" type=text/javascript></SCRIPT>

<META content="MSHTML 6.00.2900.5626" name=GENERATOR></HEAD>
<BODY style="OVERFLOW-X: hidden; OVERFLOW: scroll">
<DIV style="CLEAR: both"></DIV>
<DIV class=biao>
<TABLE id=all>
  <TBODY>
  <TR>
    <TD width=186>
      <DIV id=sidebar>
      <DIV id=dropmenu>
      <DIV id=search><A href="/" 
      target=_blank><IMG src="image/left_title.gif" 
border=0></A></DIV>
<!--  /////////////////////////////////    -->
     <DIV id=maildir>
       <!--   <DIV class=h4 id=maildir4><B class=h4b2></B><A  onclick="toggleMenu(this,'dirlist');blur();" href="javascript:;">常用管理</A></b></b></div>
   <DIV id=dirlist>
     
      <DIV class=dir id=noread><B></B><A 
      href="manageproduct_add.asp" 
      target=main>添加信息 </A></DIV>
       <DIV class=dir id=noread><B></B><A 
      href="manageproduct.asp" 
      target=main>信息管理</A> </DIV>
       </DIV>
      </DIV>-->
      
<!--  /////////////////////////////////    -->
      <DIV id=msn>
      <DIV class=h4 id=addressh4><B class=h4b2></B><A 
      onclick="toggleMenu(this,'msnlist');blur();" href="javascript:;">常用管理</A> 
      </DIV>
      <DIV class=leftcd id=msnlist style="DISPLAY: none1">
    
      <%
	  '//////首页模块///////
	  Sql="Select * From [web_class] where class =1  order by orders asc,id asc "
	  set ars=conn.execute(Sql)
	  do while not ars.eof  
	  %>
      <DIV class=c_d id=msn1><B></B><A 
      href="manage_about.asp?id=<%=ars("id")%>" 
      target=main>编辑<%=ars("title")%></A> </DIV>
      <%
	   ars.movenext
      loop
	  ars.close
	  set ars=nothing
	   '//////首页模块///////
	  %>

      </DIV></DIV>
      
      
      
<!--  /////////////////////////////////    -->     

      <DIV id=address>
      <DIV class=h4 id=addressh4><B class=h4b2></B><A 
      onclick="toggleMenu(this,'addresslist');blur();" 
      href="javascript:;">产品管理</A> </DIV>
      <DIV class=leftcd id=addresslist style="DISPLAY: none1">
      
       <DIV class=c_d id=contactsgroupico><B></B><A 
      href="manageproduct_add.asp" 
      target=main>添加最新产品 </A></DIV>
       <DIV class=c_d id=contactsgroupico><B></B><A 
      href="manageproduct.asp" 
      target=main>最新产品管理</A> </DIV>

      
      <DIV class=c_d id=contactsgroupico><B></B><A 
      href="manage_class_b.asp" 
      target=main>大栏目管理</A> </DIV>
  <DIV class=c_d id=contactsgroupico><B></B><A 
      href="manage_class_s.asp" 
      target=main>小栏目管理</A> </DIV>
      
      </DIV></DIV>
      


<!--  /////////////////////////////////    -->  
  
  <DIV id=message>    
<DIV class=h4 id=messageh4><B class=h4b2></B><A 
      onclick="toggleMenu(this,'messagelist');blur();" 
      href="javascript:;">文章管理</A> </DIV>
      <DIV class=leftcd id=messagelist style="DISPLAY: none1">
     
       <DIV class=c_d id=listico6><B></B><A 
      href="managenews_add.asp" 
      target=main>添加新闻文章 </A></DIV>
    <DIV class=c_d id=listico6><B></B><A 
      href="managenews.asp" 
      target=main>新闻管理中心</A> </DIV>
      </DIV></DIV>
      


      

<!--  /////////////////////////////////    -->
      <DIV id=mailsms>
      <DIV class=h4 id=mailsmsh4><B class=h4b2></B><A 
      onclick="toggleMenu(this,'mailsmslist');blur();" 
      href="javascript:;">其它管理</A> </DIV>
      <DIV class=leftcd id=mailsmslist style="DISPLAY: none1">
      <DIV class=c_d id=listico1><B></B><A 
      href="Manage_Admin.asp" 
      target=main>帐户管理</A> </DIV>
<!--<DIV class=c_d id=listico1><B></B><A 
      href="manageintention.asp" 
      target=main>在线留言</A> </DIV>-->
  
      
   
     
      
      </DIV></DIV>
<!--  /////////////////////////////////    -->
      <DIV id=account>

      <DIV id=customer>
</DIV></DIV></DIV></TD></TR></TBODY></TABLE></DIV></BODY></HTML>
