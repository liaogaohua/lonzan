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
if about_title="" then about_title="��Ʒչʾ"

nowdh=3

%>
<TITLE> <%
if sclass<>"" then response.write sclass&"-"
if bclass<>"" then response.write bclass&"-"

%>��<%= web_name %> </TITLE>
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
      <div class="pt20">����λ�ã�<a href="index.asp">��ҳ</a><%
dhpic="&nbsp;&gt;&nbsp;"
if bid<>0 then response.Write(dhpic&"<a href='product.asp?bid="&bid&"'>"&bclass&"</a>")
if sid<>0 then response.Write(dhpic&"<a href='product.asp?sid="&sid&"'>"&sclass&"</a>")
if sid=0 and bid=0 then response.Write dhpic&"��Ʒչʾ"

%>
</div>
    </div>
  </div>
</div>
<div class="w100 yebg4 bb1sc">

  <div class="w960px center c">
    <div class="w960px center pt20">
      <div class="w680px r">
			<b><p class="jianjie" style="font-size:24px;text-align: center;height: 40px;">�泵����</b>
			<p class="jianjie">�Ϻ��泵����-�泵���������߶����Ӳ泵�����������豸���Ϻ��泵���ƾ�����������������������׷��������¹ʣ��շ���Ա������������ط��ɹ涨���泵�������Ƽ�ÿ��һ�󣬳�������Ա�����֤�ϸڼ��������顣����泵δ���������ƣ���ҵ���ں������˴����������������������������Ρ�
		�ʼಿ�Ų鴦��δ���ƻ�δ����泵������������ҵ����3��Ԫ��30��Ԫ�Ϻ��泵����</p>

<div style="f">
		<table border="1"
					 width="680px">
		<tr>
		  <th colspan="2">�ͼ���Ҫ����</th>
		</tr>
		<tr>
		  <td>1����ŵ��</td>
		  <td>һ��</td>
		</tr>
		<tr>
			<td>2���泵��Ʒ���ݱ�</td>
			<td>һ��</td>
		</tr>
		<tr>
			<td>3���泵�ϸ�֤</td>
			<td>һ��</td>
		</tr>
		<tr>
			<td>4�������豸�������֤</td>
			<td>һ��</td>
		</tr>
		<tr>
			<td>5���������鱨��</td>
			<td>һ��</td>
		</tr>
		<tr>
			<td>6����Ҫ������������֤��</td>
			<td>һ��</td>
		</tr>
		<tr>
			<td>7����ʽ����ϸ�֤</td>
			<td>һ��</td>
		</tr>
		<tr>
			<td>8��ӵ��Ȩ��λӪҵִ��</td>
			<td>��ӡ��һ��</td>
		</tr>
		</table>
<div style="height:10px"></div>

		<table border="1"
					 width="680px">
		<tr>
		  <th colspan="2">����泵ʹ�����֤</th>
		</tr>
		<tr>
			<td>1�������豸ʹ�õǼǱ�</td>
			<td>����</td>
		</tr>
		<tr>
		  <td>2���泵���鱨��</td>
		  <td>ԭ������ӡ����һ��</td>
		</tr>
		<tr>
			<td>3���泵����֤</td>
			<td>��ӡ��һ��</td>
		</tr>
		<tr>
			<td>4��ӵ��Ȩ��λӪҵִ��</td>
			<td>��ӡ��һ��</td>
		</tr>
		<tr>
			<td>6�����Ƿ���ֱ�Ӱ����</td>
			<td>ί����һ��</td>
		</tr>
		</table>
		<div><b>ע����������ȫ���Ӹǹ��¡�</b></div>
		<div style="height:10px"></div>
		</div>
     	</div>
<div class="w240px l">
		    <div class="w240px r mlbg22 h10px"><!---->
            </div><div class="w238px hauto r yahei lineheight20px brl1sc pb10 pt10"><div class="linetop"><span class="c333333">�������ӣ�</span> </div>

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
