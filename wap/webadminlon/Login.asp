<%@language=vbscript codepage=936 %>
<%
option explicit
'ǿ����������·��ʷ���������ҳ�棬�����Ǵӻ����ȡҳ��
Response.Buffer = True 
Response.Expires = -1
Response.ExpiresAbsolute = Now() - 1 
Response.Expires = 0 
Response.CacheControl = "no-cache" 
'��Ҫ��ʹ������ֵ�ͼƬ�������
%>
<html>
<head>
<title>��ӭʹ���Ϻ���վ�����Һ�̨����ϵͳ����������Ա��¼</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="image/BasicLayout.css" type=text/css rel=stylesheet>
<SCRIPT language=JavaScript src="image/Keyboard.js"></SCRIPT>
<script language=javascript>
<!--
function SetFocus()
{
if (document.Login.UserName.value=="")
	document.Login.UserName.focus();
else
	document.Login.UserName.select();
}
function CheckForm()
{
	if(document.Login.UserName.value=="")
	{
		alert("�������û�����");
		document.Login.UserName.focus();
		return false;
	}
	if(document.Login.Password.value == "")
	{
		alert("���������룡");
		document.Login.Password.focus();
		return false;
	}
	if (document.Login.CheckCode.value==""){
       alert ("������������֤�룡");
       document.Login.CheckCode.focus();
       return(false);
    }
}

function CheckBrowser() 
{
  var app=navigator.appName;
  var verStr=navigator.appVersion;
  if (app.indexOf('Netscape') != -1) {
   // alert("������ʾ��\n    ��ʹ�õķ�IE����������ܻᵼ���޷�ʹ�ú�̨�Ĳ��ֹ��ܡ�������ʹ�� IE6.0 �����ϰ汾��");
  } 
  else if (app.indexOf('Microsoft') != -1) {
    if (verStr.indexOf("MSIE 3.0")!=-1 || verStr.indexOf("MSIE 4.0") != -1 || verStr.indexOf("MSIE 5.0") != -1 || verStr.indexOf("MSIE 5.1") != -1)
      //alert("������ʾ��\n    ����������汾̫�ͣ����ܻᵼ���޷�ʹ�ú�̨�Ĳ��ֹ��ܡ�������ʹ�� IE6.0 �����ϰ汾��");
  }
}
//-->
</script>
</head>
<BODY bgProperties=fixed leftMargin=0 background=image/bg.jpg topMargin=0 
marginheight="0" marginwidth="0">
<p>&nbsp;</p>
  
  <TABLE width=614 border=0 align="center" cellPadding=0 cellSpacing=0>
    <TBODY>
      <TR>
        <TD height=71></TD>
      </TR>
    </TBODY>
  </TABLE>
  <TABLE cellSpacing=0 cellPadding=0 width=614 align=center border=0>
    <TBODY>
      <TR>
        <TD><IMG height=103 src="image/banner.jpg" width=614></TD>
      </TR>
      <TR>
        <TD><IMG height=62 src="image/l-3.jpg" 
      width=614></TD>
      </TR>
    </TBODY>
  </TABLE>
  <table width=614 border=0 align="center" cellpadding=0 cellspacing=0>
    <tbody>
      <tr>
        <td width=264><img height=125 src="image/l-5.jpg" 
width=264></td>
        <td background=image/l-bg.jpg><table cellspacing=0 cellpadding=0 width="100%" border=0>
            <form name="Login" action="Admin_ChkLogin.asp" method="post" target="_parent" onSubmit="return CheckForm();">
              <tbody>
                <tr>
                  <td align=right width="34%" 
height=25><strong>�û����ƣ�</strong></td>
                  <td width="66%"><input id=UserName size=26 
              name=UserName></td>
                </tr>
                <tr>
                  <td align=right height=25><strong>�û����룺</strong></td>
                  <td><input name=Password type=password id="Password" size=26 >
                  <input name="admin" type="hidden" id="admin" value="<%=request("admin")%>"></td>
                </tr>
                <tr>
                  <td align=right height=25><strong>�� ֤ �룺</strong></td>
                  <td><input name=CheckCode id="CheckCode" size=4 maxlength=4>
                    ����������� <img src="inc/checkcode.asp"></td>
                </tr>
                <tr>
                  <td align=middle colspan=2 height=5>&nbsp;</td>
                </tr>
                <tr>
                  <td align=middle colspan=2 height=25><input type=image alt="" 
                  src="image/TJ6.gif" border=0 name=Submit2>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type=image height=25 
                  width=71 src="image/CZ.gif" name=reset2></td>
                </tr>
          </form>
          <script language=JavaScript type=text/JavaScript>
CheckBrowser();
SetFocus(); 
          </script>
        </table></td>
        <td width=32><img height=125 src="image/l-6.jpg" 
        width=32></td>
      </tr>
</table>
  <TABLE width=614 border=0 align="center" cellPadding=0 cellSpacing=0>
    <TBODY>
      <TR>
        <TD><IMG height=21 src="image/l-4.jpg" 
      width=614></TD>
      </TR>
    </TBODY>
  </TABLE>
  <TABLE width=614 border=0 align="center" cellPadding=0 cellSpacing=0>
    <TBODY>
      <TR>
        <TD width=12><IMG height=46 src="image/j-1.gif" width=12></TD>
        <TD align=middle 
          background=image/j-bfg.jpg>������1024*768�ֱ�������� &nbsp;&nbsp;&nbsp;����֧�֣�<a href="http://www.449cg.com" target="_blank">ҼǪ����</a> </TD>
        <TD width=13><IMG height=46 src="image/j-2.gif" 
        width=13></TD>
      </TR>
    </TBODY>
  </TABLE>
  <TABLE width=614 border=0 align="center" cellPadding=0 cellSpacing=0>
    <TBODY>
      <TR>
        <TD height=94 background="image/foot.jpg"></TD>
      </TR>
    </TBODY>
  </TABLE>
  <br>
<script language="JavaScript" type="text/JavaScript">
CheckBrowser();
SetFocus(); 
</script>
</body>
</html>
