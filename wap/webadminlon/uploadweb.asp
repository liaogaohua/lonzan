<%
uppath=request("uppath")&"/"			'文件上传路径
filelx=request("filelx")				'文件上传类型
formName=request("formName")			'回传到上页面编辑框所在Form的Name
EditName=request("EditName")			'回传到上页面编辑框的Name
%>
<html><head><title>文件上传</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<script language="javascript">
<!--
function mysub()
{
		esave.style.visibility="visible";
}
-->
</script>
<style type="text/css">
<!--
body,td,th {
	font-size: 12px;
}
.STYLE2 {color: #CC0000}
-->
</style>
</head>
<body>
<div id="esave" style="position:absolute; width:400px; top:15px; left:60px; z-index:1; visibility:hidden"> 
<TABLE WIDTH=100% height=110 BORDER=0 CELLPADDING=0 CELLSPACING=1 bgcolor="#FF0000">
<TR> 
<td bgcolor=#F6F6F6 align=center style="font-size:14px"><font color=red>正在上传文件，请稍候...</font><br><br><font color=red>注意: 文件上传中请勿刷新或关闭浏览器,请耐心等待!</font></td>
</tr>
</table>
</div>
<% if filelx="jpg" then%>
<form name="form1" method="post" action="upfileweb.asp" enctype="multipart/form-data" >
<input type="hidden" name="filepath" value="<%=uppath%>">
<input type="hidden" name="filelx" value="<%=filelx%>">
<input type="hidden" name="EditName" value="<%=EditName%>">
<input type="hidden" name="FormName" value="<%=formName%>">
<input type="hidden" name="act" value="uploadfile">
    <table width="421" border="0" align="center" cellpadding="5" cellspacing="0">
      <tr>
        <td align="center">请选择您要上传的文件</td>
      </tr>
      <tr>
        <td align="center"><span class="STYLE2">允许格式：JPG图片格式；请勿尝试上传其他文件格式，否则后果自付↗</span></td>
      </tr>
      <tr>
        <td align="center"><input type="file" name="file1" size="43" class="tx1" value=""></td>
      </tr>
      <tr>
        <td align="center"><input type="submit" value="现在开始上传" onClick="javascript:mysub()"></td>
      </tr>
  </table>
</form>
<% Elseif   filelx="rar" then%>
<form name="form1" method="post" action="upfileweb.asp" enctype="multipart/form-data" >
<input type="hidden" name="filepath" value="<%=uppath%>">
<input type="hidden" name="filelx" value="<%=filelx%>">
<input type="hidden" name="EditName" value="<%=EditName%>">
<input type="hidden" name="FormName" value="<%=formName%>">
<input type="hidden" name="act" value="uploadfile">
    <table width="421" border="0" align="center" cellpadding="5" cellspacing="0">
      <tr>
        <td align="center">请选择您要上传的文件</td>
      </tr>
      <tr>
        <td align="center"><span class="STYLE2">允许格式：rar|doc|xls格式；请勿尝试上传其他文件格式，否则后果自付↗</span></td>
      </tr>
      <tr>
        <td align="center"><input type="file" name="file1" size="43" class="tx1" value=""></td>
      </tr>
      <tr>
        <td align="center"><input type="submit" value="现在开始上传" onClick="javascript:mysub()"></td>
      </tr>
  </table>
</form>
<% Elseif   filelx="avi" then%>
<form name="form1" method="post" action="upfileweb.asp" enctype="multipart/form-data" >
<input type="hidden" name="filepath" value="<%=uppath%>">
<input type="hidden" name="filelx" value="<%=filelx%>">
<input type="hidden" name="EditName" value="<%=EditName%>">
<input type="hidden" name="FormName" value="<%=formName%>">
<input type="hidden" name="act" value="uploadfile">
    <table width="421" border="0" align="center" cellpadding="5" cellspacing="0">
      <tr>
        <td align="center">请选择您要上传的视频文件</td>
      </tr>
      <tr>
        <td align="center"><span class="STYLE2">允许格式：flv|swf|avi格式；请勿尝试上传其他文件格式，否则后果自付↗</span></td>
      </tr>
      <tr>
        <td align="center"><input type="file" name="file1" size="43" class="tx1" value=""></td>
      </tr>
      <tr>
        <td align="center"><input type="submit" value="现在开始上传" onClick="javascript:mysub()"></td>
      </tr>
  </table>
</form>
<% End If %>
</body>
</html>