<%
uppath=request("uppath")&"/"			'�ļ��ϴ�·��
filelx=request("filelx")				'�ļ��ϴ�����
formName=request("formName")			'�ش�����ҳ��༭������Form��Name
EditName=request("EditName")			'�ش�����ҳ��༭���Name
%>
<html><head><title>�ļ��ϴ�</title>
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
<td bgcolor=#F6F6F6 align=center style="font-size:14px"><font color=red>�����ϴ��ļ������Ժ�...</font><br><br><font color=red>ע��: �ļ��ϴ�������ˢ�»�ر������,�����ĵȴ�!</font></td>
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
        <td align="center">��ѡ����Ҫ�ϴ����ļ�</td>
      </tr>
      <tr>
        <td align="center"><span class="STYLE2">�����ʽ��JPGͼƬ��ʽ���������ϴ������ļ���ʽ���������Ը��J</span></td>
      </tr>
      <tr>
        <td align="center"><input type="file" name="file1" size="43" class="tx1" value=""></td>
      </tr>
      <tr>
        <td align="center"><input type="submit" value="���ڿ�ʼ�ϴ�" onClick="javascript:mysub()"></td>
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
        <td align="center">��ѡ����Ҫ�ϴ����ļ�</td>
      </tr>
      <tr>
        <td align="center"><span class="STYLE2">�����ʽ��rar|doc|xls��ʽ���������ϴ������ļ���ʽ���������Ը��J</span></td>
      </tr>
      <tr>
        <td align="center"><input type="file" name="file1" size="43" class="tx1" value=""></td>
      </tr>
      <tr>
        <td align="center"><input type="submit" value="���ڿ�ʼ�ϴ�" onClick="javascript:mysub()"></td>
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
        <td align="center">��ѡ����Ҫ�ϴ�����Ƶ�ļ�</td>
      </tr>
      <tr>
        <td align="center"><span class="STYLE2">�����ʽ��flv|swf|avi��ʽ���������ϴ������ļ���ʽ���������Ը��J</span></td>
      </tr>
      <tr>
        <td align="center"><input type="file" name="file1" size="43" class="tx1" value=""></td>
      </tr>
      <tr>
        <td align="center"><input type="submit" value="���ڿ�ʼ�ϴ�" onClick="javascript:mysub()"></td>
      </tr>
  </table>
</form>
<% End If %>
</body>
</html>