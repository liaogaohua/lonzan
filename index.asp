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
	about_title="未知专题"
	about_context="&nbsp;==暂无专题信息=="
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
	<a href="aboutus.asp"><img src="syfl/fenlei_01.jpg" alt="公司简介" ></a>
    <div class="w945px center  c yahei" style="height:20px"></div>
    <b><p class="jianjie" style="font-size:30px;text-align: center;height: 50px;">公司简介</b>
    <p class="jianjie">上海龙漳工程机械有限公司是按照中华人民共和国公司法，在上海市工商局成立的公司。
      其性质为有限责任。注册资金为500万元。公司自主经营、独立核算、自负盈亏的经济实体，主要从事工程机械及配件的销售、维修、租赁的商贸企业，
      产品主要销是龙工（上海）叉车有限公司上海一级代理经销商。目前公司共划分为：行政部、财务部、营销部、售后服务四个部门，在册职工人数为50人。
      公司不断强化“质量、服务、性价比”这“三大优势”，逐步构建起遍布上海各区域的龙工叉车营销服务网络，
      打造“一小时销售服务圈”，加大专营店建设的力度，逐步缩小覆盖半径，提高整机销售和售后服务的水平，为龙工叉车用户提供销售及服务便利。
      您的满意是我们最大的追求！</p>
    <p class="jianjie">龙工系由第十一届全国人大代表、全国劳动模范、优秀中国特色社会主义事业建设者李新炎先生，于1993年在福建龙岩创立的一家
      大型工程机械企业。2005年率中国工程机械行业之先在香港主板上市（股票代码3339）。2011年尽管经受全球金融危机和国内宏观调控的双重考验，
      各项发展指数仍然稳中有进，全年销售总额达到127.21亿元，实现净利17.30亿元。</p>
    <p class="jianjie">自上市以来龙工叉车以其优良的品质和出众的性价比迅速占据了市场，营销网络和产品用户已遍布全国，现有各级代理商、服务商三百余家。
      公司现有蓄电池叉车、内燃中小吨位叉车、内燃大吨位叉车三条总装线,及结构件涂装线、平衡重涂装线、零部件喷粉线等三条涂装线，结构件与零部件全部采用先
      进的高效数控切割机、激光切割机、大型数控立式加工中心、数控五面体加工中心、焊接机器人等先进设备加工制造，是国内外同行中设备最为精良的企业之一。
      公司现有内燃叉车、蓄电池叉车、港口叉车、仓储叉车等四大系列近两百多个品种，产品技术含量高，性能稳定，性价比高。公司先后通过ISO9001质量管理体
      系认证及CE、GOST等产品认证。</p>
	</div>


<div style="width:945px;
            margin-left:auto;
            margin-right:auto;">
            <a href="product.asp?bid=42"><img src="syfl/fenlei_02.jpg"></a>
	          <a href="product.asp?bid=43"><img src="syfl/fenlei_03.jpg"></a>

            <img src="syfl/fenlei_04.jpg" width="945" height="771" usemap="#planetmap">
            <map name="planetmap">
              <area shape="rect" coords="0,148,472,440" target="_self" alt="N系列" href="/pic_show.asp?id=380">
              <area shape="rect" coords="473,148,945,440" target="_self" alt="FD系列" href="product.asp?sid=10">
              <area shape="rect" coords="0,440,945,770" target="_self" alt="LG系列" href="product.asp?sid=11">
            </map>

            <img src="syfl/fenlei_05_1.jpg" width="945" height="805" usemap="#planetmap1">
            <map name="planetmap1">
              <area shape="rect" coords="0,177,472,464" target="_self" alt="N系列铅酸" href="/pic_show.asp?id=145">
              <area shape="rect" coords="473,177,945,464" target="_self" alt="N系列锂电" href="/pic_show.asp?id=381">
              <area shape="rect" coords="0,515,472,805" target="_self" alt="E系列" href="/pic_show.asp?id=170">
              <area shape="rect" coords="473,515,945,805" target="_self" alt="LG系列三支点" href="product.asp?sid=30">
            </map>

	          <a href="product.asp?bid=33"><img src="syfl/fenlei_05.jpg"></a>
	          <a href="product.asp?bid=39"><img src="syfl/fenlei_06.jpg"></a>

  <img src="syfl/fenlei_07.jpg" width="945" height="320" usemap="#planetmap3">
  <map name="planetmap3">
    <area shape="rect" coords="0,320,323,0" target="_self" alt="二手叉车" href="product.asp?bid=40">
    <area shape="rect" coords="324,320,623,0" target="_self" alt="叉车租赁" href="aboutus.asp?id=124">
    <area shape="rect" coords="624,320,945,0" target="_self" alt="叉车上牌" href="http://lonzan.com/product_chacheshangpai.asp">
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
		   <a href="newscenter.asp"><img src="index_files/titlenew.png" height="29" float="left"; />最新动态</a>
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
