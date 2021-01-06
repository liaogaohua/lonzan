<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta name="author" content="design by www.21-sun.com">
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7">
<!--#include file="myweb_inc.asp"-->
<%
id=checkisint(request("id"),0)
sql="select * from web_news where  id="&id
set nrs=conn.execute(sql)
if nrs.eof then readvar("操作失败！")
title=nrs("title")
context=nrs("context")
hits=nrs("hit")
wordjj=nrs("wordjj")
author=nrs("author")
addtime=nrs("addtime")
newtype=nrs("type")

type_name=readlist_name(newtype,"新闻中心")
conn.execute("update web_news set hit=hit+1 where id="&id)
	
about_title=type_name

if newtype=120 then nowdh=4

%>
<TITLE> <%= about_title %>－<%= web_name %> </TITLE>
<META NAME="Keywords" CONTENT="<%= web_KeyWords %>">
<META NAME="Description" CONTENT="<%= web_Description %>" />

<link href="index_files/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="index_files/jquery-1.7.min.js"></script>
<script type="text/javascript" src="index_files/scripts.js"></script>
<!--[if (IE 6)]>
<link href="index_files/pngfix.css" media="screen" rel="stylesheet" type="text/css" />
<![endif]-->

</head>
<body class="yebg1">
<!--#include file="webtop.asp"-->
<!--#include file="webbanner.asp"-->


<!--main-->
<div class="w100 h95px yebg5" style="height:50px;">
  <div class="w960px center c">

    <div class="l h55px yebg8 w380px">
      <div class="pt20">您的位置：<a href="index.asp">首页</a> &gt;&nbsp;&nbsp;<a href="newscenter.asp">新闻媒体</a> &gt;&nbsp;&nbsp;<%= about_title %>
</div>
    </div>
  </div>
</div>
<div class="w100 yebg4 bb1sc"> 
 
  <div class="w960px center c">
    <div class="w960px center pt20">
      <div class="w680px r">
      <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td align="center" valign="bottom" style="border-bottom: dashed #999999 1px; padding-top:5px;"><h2> 
                    <span id="Title" style="line-height:30px; font-size:16px; font-weight:bold;"><%=title%></span>
                </h2></td>
              </tr>
            </table>
              <table width="98%" height="33" border="0" align="center" cellpadding="5" cellspacing="0">
                <tr>
                  <td align="center" valign="bottom">来源：
                      <span id="AddUser">
					  <%
					  author=author&"、"
					  arrytag=split(author,"、")
					  for ti=0 to ubound(arrytag)
				        if arrytag(ti)<>"" then 
						   response.Write("")
						   response.Write(arrytag(ti)&"&nbsp;")
					    end if
					  next
					  
					  %>
					</span>
                    &nbsp;&nbsp;&nbsp;&nbsp;更新时间：
                    <span id="UpDateTime"><%=Format_Time(addtime,2)%></span>
                    &nbsp;&nbsp;&nbsp;&nbsp;点击次数：<font color="#FF0000">
                      <span id="Hit"><%=hits%></span>
                    </font></td>
                </tr>
              </table>
            <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                  <td headers="10"></td>
                </tr>
                <style>
                .ncontext p{ margin:5px 0px; line-height:20px;}
                </style>
                <tr>
                  <td  class="ncontext" style="font-size: 12px; line-height: 25px; font-size:12px;"><%=context%></td>
                </tr>
            </table>
            
            <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin:15px auto; border-top: dashed #999999 1px;">
          
              <tr>
                <td height="25" style=" padding-top:10px;">当前网址：<a href="news_show.asp?id=<%=id%>"><%="http://"&request.ServerVariables("HTTP_HOST")&request.ServerVariables("URL")&"?id="&id%></a></td>
              </tr>
              <tr>
                <td height="25">上篇文章： 
                  <%

	  sql="select top 1 * from web_news where  id<"&id&" and type="&newtype&"  order by id desc"
	  set rs=conn.execute(sql)
	  if rs.eof then
	  	response.write "没有了"
	  else
	  	response.write "<a href='news_show.asp?id="&rs("id")&"'>"&rs("title") & "</a>"
	  end if
	  %></td>
              </tr>
              <tr>
                <td height="25">下篇文章：<%

	  sql="select top 1  * from web_news where type="&newtype&" and  id>"&id&" order by id asc"
	  set rs=conn.execute(sql)
	  if rs.eof then
	  	response.write "没有了"
	  else
	  	response.write "<a href='news_show.asp?id="&rs("id")&"'>"&rs("title") & "</a>"
	  end if
	  %></td>
              </tr>
            </table>
      </div>
<div class="w240px l">
		    <div class="w240px r mlbg22 h10px"><!---->
            </div><div class="w238px hauto r yahei lineheight20px brl1sc pb10 pt10"><div class="linetop"><span class="c333333">快速链接：</span> </div>
            
             <!--#include file="leftnews.asp"-->
                <div class="b2sc"></div>
                  <!--#include file="leftbottom.asp"-->
                  
                  </div><div class="w240px r mlbg23 h10px"><!----></div>
	  </div> 
    </div>
  </div>
  <div class="pt30 w100 clearfix"></div>
</div>
<!--end of main--> 
<!--#include file="webbottom.asp"-->

</body></html>
