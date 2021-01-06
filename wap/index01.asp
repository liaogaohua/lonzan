<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0;" />
<!--#include file="myweb_inc.asp"-->
<TITLE><%= web_name %> </TITLE>
<META NAME="Keywords" CONTENT="<%= web_KeyWords %>">
<META NAME="Description" CONTENT="<%= web_Description %>" />
<link href="images/css.css" rel=stylesheet type="text/css">
<script src="js/jquery.min.js"></script>
<script src="js/myjs.js"></script>

<link href="css/lanrenzhijia.css" type="text/css" rel="stylesheet" />

</head>
<body>

<div class="hometop">
	<div class="logo"><span>上海龙漳工程机械有限公司</span></div>
    <div class="toptel"></div>
</div>

<div class="homemain" >

	<div class="topmenu">
    	<p>网站菜单</p>
    	<div><!--#include file="menu_foot.asp"--></div>
    </div>
    <div class="banner">
    <div class="slide_container">
      <ul class="rslides" id="slider">
        <li>
          <img src="banner/1.jpg" alt="">
        </li>
        <li>
          <img src="banner/2.jpg" alt="">

        </li>
        <li>
          <img src="banner/3.jpg" alt="">

        </li>
         <li>
          <img src="banner/4.jpg" alt="">

        </li>
      </ul>
    </div>
<script src="js/responsiveslides.min.js"></script>
<script>
$(function () {
    $("#slider").responsiveSlides({
    auto: true,
    pager: false,
    nav: true,
    speed: 500,
    // 对应外层div的class : slide_container
    namespace: "slide"
    });
});
</script>
<!-- 代码 end -->
    </div>


    <div class="hometitle"><span>产品体验快速导航</span></div>
    <div class="proclass">



<%
bsql="select bigid,bigname from bigclass where orders<200  order by orders asc"
set brs=conn.execute(bsql)
do while not brs.eof
'////////////////////////////////
%><div class="BigClass" ><a href="Product.asp?bid=<%=brs("bigid")%>" style="color:#FFFFFF; display:block; width:150px; margin:0px auto;"><%= brs("bigname") %></a></div>
<!--<div class="smallclass" >-->
<%

	ssql="select smallid,smallname from smallclass where bigid="&brs("bigid")&" order by orders asc,smallid asc"
	set srs=conn.execute(ssql)
	srsi=1
	if not srs.eof and 1=2 then

	do while not srs.eof

	%>
	 <span><A  href="Product.asp?sid=<%= srs("smallid") %>"  id="pro_<%= srs("smallid") %>"> <%= srs("smallname") %></a> </span>
	<%

	srs.movenext
	srsi=srsi+1
	loop

	end if
	srs.close
	set srs=nothing
'response.write "</div>"


'////////////////////////////////

brsi=brsi+1
brs.movenext
loop
brs.close
set brs=nothing
%>

<div class="BigClass" ><a href="aboutus.asp?id=124" style="color:#FFFFFF; display:block; width:150px; margin:0px auto;">叉车租赁</a></div>

    </div>

    <div class="clear">&nbsp;</div>

</div>


</div>
<!--#include file="webbottom.asp"-->

<div id="foo_ks"><!--#include file="menu_foot.asp"--> </div>



</body>

</html>
