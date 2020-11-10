<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta name="author" content="design by www.21-sun.com">
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7">
<!--#include file="myweb_inc.asp"-->
<%
sid=checkisint(request("sid"),0)
bid=checkisint(request("bid"),0)
if sid<>0 then
	bid=readuserinf(sid,"smallclass",2)
	sclass=readuserinf(sid,"smallclass",1)
end if
if bid<>0 then bclass=readuserinf(bid,"bigclass",1)
keyword=myrequest("keyword")
pid=myrequest("pid")

about_title=bclass
if sclass<>"" then about_title=sclass
if about_title="" then about_title="产品展示"

nowdh=3

%>
<TITLE> <%
if sclass<>"" then response.write sclass&"-"
if bclass<>"" then response.write bclass&"-"

%>－<%= web_name %> </TITLE>
<META NAME="Keywords" CONTENT="<%= web_KeyWords %>">
<META NAME="Description" CONTENT="<%= web_Description %>" />

<link href="index_files/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="index_files/jquery-1.7.min.js"></script>
<script type="text/javascript" src="index_files/scripts.js"></script>
<!--[if (IE 6)]>
<link href="index_files/pngfix.css" media="screen" rel="stylesheet" type="text/css" />
<![endif]-->
<style>

p.jianjie{
  margin-left:auto;
  margin-right:auto;
	width:680px;
	text-indent:24px;
	text-align:justify;
  }
</style>
</head>
<body class="yebg1">
<!--#include file="webtop.asp"-->
<!--#include file="webbanner.asp"-->


<!--main-->
<div class="w100 h95px yebg5" style="height:50px;">
  <div class="w960px center c">

    <div class="l h55px yebg8 w380px">
      <div class="pt20">您的位置：<a href="index.asp">首页</a><%
dhpic="&nbsp;&gt;&nbsp;"
if bid<>0 then response.Write(dhpic&"<a href='product.asp?bid="&bid&"'>"&bclass&"</a>")
if sid<>0 then response.Write(dhpic&"<a href='product.asp?sid="&sid&"'>"&sclass&"</a>")
if sid=0 and bid=0 then response.Write dhpic&"产品展示"

%>
</div>
    </div>
  </div>
</div>
<div class="w100 yebg4 bb1sc">

  <div class="w960px center c">
    <div class="w960px center pt20">
      <div class="w680px r">
			<b><p class="jianjie" style="font-size:24px;text-align: center;height: 40px;">叉车上牌</b>
			<p class="jianjie">上海叉车上牌-叉车上牌你必须高度重视叉车是特种生产设备，上海叉车上牌举升货物后若操作不当，极易发生翻车事故，诱发人员伤亡。国家相关法律规定，叉车必须上牌及每年一审，车辆操作员必须持证上岗及定期审验。如果叉车未有依法上牌，企业将在后续工伤处理过程中依法负担比例更大的责任。
		质监部门查处到未上牌或未年审叉车，将依法对企业罚款3万元至30万元上海叉车上牌</p>

<div style="f">
		<table border="1"
					 width="680px">
		<tr>
		  <th colspan="2">送检需要资料</th>
		</tr>
		<tr>
		  <td>1、承诺书</td>
		  <td>一份</td>
		</tr>
		<tr>
			<td>2、叉车产品数据表</td>
			<td>一份</td>
		</tr>
		<tr>
			<td>3、叉车合格证</td>
			<td>一份</td>
		</tr>
		<tr>
			<td>4、特种设备制造许可证</td>
			<td>一份</td>
		</tr>
		<tr>
			<td>5、出厂检验报告</td>
			<td>一份</td>
		</tr>
		<tr>
			<td>6、主要受力构件材质证明</td>
			<td>一份</td>
		</tr>
		<tr>
			<td>7、型式试验合格证</td>
			<td>一份</td>
		</tr>
		<tr>
			<td>8、拥有权单位营业执照</td>
			<td>复印件一份</td>
		</tr>
		</table>
<div style="height:10px"></div>

		<table border="1"
					 width="680px">
		<tr>
		  <th colspan="2">申请叉车使用许可证</th>
		</tr>
		<tr>
			<td>1、特种设备使用登记表</td>
			<td>两份</td>
		</tr>
		<tr>
		  <td>2、叉车检验报告</td>
		  <td>原件、复印件各一份</td>
		</tr>
		<tr>
			<td>3、叉车操作证</td>
			<td>复印件一份</td>
		</tr>
		<tr>
			<td>4、拥有权单位营业执照</td>
			<td>复印件一份</td>
		</tr>
		<tr>
			<td>6、不是法人直接办理的</td>
			<td>委托书一份</td>
		</tr>
		</table>
		<div><b>注：以上资料全部加盖公章。</b></div>
		<div style="height:10px"></div>
		</div>
     	</div>
<div class="w240px l">
		    <div class="w240px r mlbg22 h10px"><!---->
            </div><div class="w238px hauto r yahei lineheight20px brl1sc pb10 pt10"><div class="linetop"><span class="c333333">快速链接：</span> </div>

             <!--#include file="leftpro.asp"-->
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
