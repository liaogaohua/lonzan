<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta name="author" content="design by www.21-sun.com">
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7">
<script type="text/javascript">



      (function (a, b) { if (/mobile/i.test(a)||/(android|bb\d+|meego|adr).+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|iris|kindle|lge |maemo|midp|mmp|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|series(4|6)0|symbian|treo|up\.(browser|link)|vodafone|wap|windows (ce|phone)|xda|xiino/i.test(a) || /1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|yas\-|your|zeto|zte\-/i.test(a.substr(0, 4))) window.location = b })(navigator.userAgent || navigator.vendor || window.opera, 'http://www.lonzan.com/wap');



</script>



<!--#include file="myweb_inc.asp"-->
<%
	id=checkisint(request("id"),1)
	set aboutrs=conn.execute("select * from web_about where aboutid="&id)
	if aboutrs.eof then
	about_title="δ֪ר��"
	about_context="&nbsp;==����ר����Ϣ=="
	else
	about_title=aboutrs(2)
	about_context=aboutrs(3)
	end if
	nowdh=0
	if id=1 then nowdh=2
	if id=117 then nowdh=5
	if id=114 then nowdh=6
	if id=2 then nowdh=7


%>
<TITLE><%= web_name %> </TITLE>
<META NAME="Keywords" CONTENT="<%= web_KeyWords %>">
<META NAME="Description" CONTENT="<%= web_Description %>" />

<link href="index_files/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="index_files/jquery-1.7.min.js"></script>
<script type="text/javascript" src="index_files/scripts.js"></script>
<!--[if (IE 6)]>
<link href="index_files/pngfix.css" media="screen" rel="stylesheet" type="text/css" />
<![endif]-->
<style>
p.bj{
  width:945px;
  height:700px;
  margin-left:auto;
  background-color:#ffffff ;
  }

p.jianjie{
  margin-left:auto;
  margin-right:auto;
	width:800px;
	text-indent:24px;
	text-align:justify;
  }
</style>
</head>
<body class="yebg1">
<!--#include file="webtop.asp"-->
<iframe src="banner.htm" height="650" width="100%" frameborder="0" scrolling="no"></iframe>
<div class="w945px center  c yahei" style="height:10px"></div>
<div style="width:945px;
	    margin-left:auto;
			margin-right:auto;
			background: #ffffff">
	<a href="aboutus.asp"><img src="syfl/fenlei_01.jpg" alt="��˾���" ></a>
    <div class="w945px center  c yahei" style="height:20px"></div>
    <b><p class="jianjie" style="font-size:30px;text-align: center;height: 50px;">��˾���</b>
    <p class="jianjie">�Ϻ����Ĺ��̻�е���޹�˾�ǰ����л����񹲺͹���˾�������Ϻ��й��ֳ̾����Ĺ�˾��
      ������Ϊ�������Ρ�ע���ʽ�Ϊ500��Ԫ����˾������Ӫ���������㡢�Ը�ӯ���ľ���ʵ�壬��Ҫ���¹��̻�е����������ۡ�ά�ޡ����޵���ó��ҵ��
      ��Ʒ��Ҫ�����������Ϻ����泵���޹�˾�Ϻ�һ���������̡�Ŀǰ��˾������Ϊ�������������񲿡�Ӫ�������ۺ�����ĸ����ţ��ڲ�ְ������Ϊ50�ˡ�
      ��˾����ǿ���������������Լ۱ȡ��⡰�������ơ����𲽹�����鲼�Ϻ�������������泵Ӫ���������磬
      ���조һСʱ���۷���Ȧ�����Ӵ�רӪ�꽨������ȣ�����С���ǰ뾶������������ۺ��ۺ�����ˮƽ��Ϊ�����泵�û��ṩ���ۼ����������
      ������������������׷��</p>
    <p class="jianjie">����ϵ�ɵ�ʮһ��ȫ���˴����ȫ���Ͷ�ģ���������й���ɫ���������ҵ��������������������1993���ڸ������Ҵ�����һ��
      ���͹��̻�е��ҵ��2005�����й����̻�е��ҵ֮��������������У���Ʊ����3339����2011�꾡�ܾ���ȫ�����Σ���͹��ں�۵��ص�˫�ؿ��飬
      ���չָ����Ȼ�����н���ȫ�������ܶ�ﵽ127.21��Ԫ��ʵ�־���17.30��Ԫ��</p>
    <p class="jianjie">���������������泵����������Ʒ�ʺͳ��ڵ��Լ۱�Ѹ��ռ�����г���Ӫ������Ͳ�Ʒ�û��ѱ鲼ȫ�������и��������̡�������������ҡ�
      ��˾�������ز泵����ȼ��С��λ�泵����ȼ���λ�泵������װ��,���ṹ��Ϳװ�ߡ�ƽ����Ϳװ�ߡ��㲿������ߵ�����Ϳװ�ߣ��ṹ�����㲿��ȫ��������
      ���ĸ�Ч�����и���������и��������������ʽ�ӹ����ġ�����������ӹ����ġ����ӻ����˵��Ƚ��豸�ӹ����죬�ǹ�����ͬ�����豸��Ϊ��������ҵ֮һ��
      ��˾������ȼ�泵�����ز泵���ۿڲ泵���ִ��泵���Ĵ�ϵ�н����ٶ��Ʒ�֣���Ʒ���������ߣ������ȶ����Լ۱ȸߡ���˾�Ⱥ�ͨ��ISO9001����������
      ϵ��֤��CE��GOST�Ȳ�Ʒ��֤��</p>
	</div>


<div style="width:945px;
            margin-left:auto;
            margin-right:auto;">
            <a href="product.asp?bid=42"><img src="syfl/fenlei_02.jpg"></a>
	          <a href="product.asp?bid=43"><img src="syfl/fenlei_03.jpg"></a>

            <img src="syfl/fenlei_04.jpg" width="945" height="771" usemap="#planetmap">
            <map name="planetmap">
              <area shape="rect" coords="0,148,472,440" target="_self" alt="Nϵ��" href="/pic_show.asp?id=380">
              <area shape="rect" coords="473,148,945,440" target="_self" alt="FDϵ��" href="product.asp?sid=10">
              <area shape="rect" coords="0,440,945,770" target="_self" alt="LGϵ��" href="product.asp?sid=11">
            </map>

            <img src="syfl/fenlei_05_1.jpg" width="945" height="805" usemap="#planetmap1">
            <map name="planetmap1">
              <area shape="rect" coords="0,177,472,464" target="_self" alt="Nϵ��Ǧ��" href="/pic_show.asp?id=145">
              <area shape="rect" coords="473,177,945,464" target="_self" alt="Nϵ��﮵�" href="/pic_show.asp?id=381">
              <area shape="rect" coords="0,515,472,805" target="_self" alt="Eϵ��" href="/pic_show.asp?id=170">
              <area shape="rect" coords="473,515,945,805" target="_self" alt="LGϵ����֧��" href="product.asp?sid=30">
            </map>

	          <a href="product.asp?bid=33"><img src="syfl/fenlei_05.jpg"></a>
	          <a href="product.asp?bid=39"><img src="syfl/fenlei_06.jpg"></a>

  <img src="syfl/fenlei_07.jpg" width="945" height="320" usemap="#planetmap3">
  <map name="planetmap3">
    <area shape="rect" coords="0,320,323,0" target="_self" alt="���ֲ泵" href="product.asp?bid=40">
    <area shape="rect" coords="324,320,623,0" target="_self" alt="�泵����" href="aboutus.asp?id=124">
    <area shape="rect" coords="624,320,945,0" target="_self" alt="�泵����" href="http://lonzan.com/product_chacheshangpai.asp">
  </map>

	</div>

<div>
<table
  style="width:945px;
  margin-left:auto;
  margin-right:auto;"
  border="0"
  cellspacing="0"
  cellpadding="0">
    <tr>
       <td>
		   <span style="border-bottom:2px #a9a9a9 solid">
		   <a href="newscenter.asp"><img src="index_files/titlenew.png" height="29" float="left"; />���¶�̬</a>
		   </span>
		</td>
       </tr>
    <tr>
       <td><%call Newslist(0,4,56,0,2)%></td>
       </tr>
    </table>
</div>

</script>
<!--#include file="webbottom.asp"-->
</body></html>
