<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta name="author" content="design by www.21-sun.com">
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7">
<!--#include file="myweb_inc.asp"-->
<%
about_title="�ͻ�����"
nowdh=2



%>
<TITLE> <%= about_title %>��<%= web_name %> </TITLE>
<META NAME="Keywords" CONTENT="<%= web_KeyWords %>">
<META NAME="Description" CONTENT="<%= web_Description %>" />

<link href="index_files/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="index_files/jquery-1.7.min.js"></script>
<script type="text/javascript" src="index_files/scripts.js"></script>
<!--[if (IE 6)]>
<link href="index_files/pngfix.css" media="screen" rel="stylesheet" type="text/css" />
<![endif]--><script>
function checkbook()
{

  if (!checkmyform("t1","����д����˾���ƣ�")) return false;

  if (!checkmyform("uname","����д��ϵ��������")) return false;
 if (!checkmyform("t2","����д���ĵ绰���룡")) return false;
  
  

  
    if(document.myform.email.value.length!=0)
  {
    if (document.myform.email.value.charAt(0)=="." ||        
         document.myform.email.value.charAt(0)=="@"||       
         document.myform.email.value.indexOf('@', 0) == -1 || 
         document.myform.email.value.indexOf('.', 0) == -1 || 
         document.myform.email.value.lastIndexOf("@")==document.myform.email.value.length-1 || 
         document.myform.email.value.lastIndexOf(".")==document.myform.email.value.length-1)
     {
	  alert("�����ʽ����ȷ��");
      document.myform.email.focus();
      return (false);
      }
   }
 else
  {
   alert("���䲻��Ϊ�գ�");
   document.myform.email.focus();
      return (false);
   } 
   
  
  
  if (!checkmyform("t4","����д�������ݣ�")) return false;

    
}

function checkmyform(nameid,tsstr)
{
     var thisobj=eval('document.myform.'+nameid+'')
     if (thisobj.value==""){alert(tsstr);thisobj.focus();return false;}
	 return true;
}

</script>
</head>
<body class="yebg1">
<!--#include file="webtop.asp"-->
<!--#include file="webbanner.asp"-->


<!--main-->
<div class="w100 h95px yebg5" style="height:50px;">
  <div class="w960px center c">

    <div class="l h55px yebg8 w380px">
      <div class="pt20">����λ�ã�<a href="index.asp">��ҳ</a> &gt;&nbsp;&nbsp;<%= about_title %>
</div>
    </div>
  </div>
</div>
<div class="w100 yebg4 bb1sc"> 
 
  <div class="w960px center c">
    <div class="w960px center pt20">
      <div class="w680px r">
       
       <form action="add_save.asp"  id="myform" name="myform" onSubmit="return checkbook()" method=post>
     <div class="onlineBox">

    	<span class="font14"><strong>��������</strong></span><br />
    	<br />
    	�ǳ���л�������Ϻ����Ĺ��̻�е��վ�����������ı����飬���ǽ��ڵ�һʱ��������ϵ��<br />
    	<table border="0" cellspacing="3" cellpadding="0" class="formBody consultForm mt20">

            <tr>

                <th>

                    ��˾���ƣ�                </th>

                <td>

                    <input name="t1" type="text" id="t1" size="30" />
                    <span class="red">*</span>                </td>
            </tr>

            <tr>

                <th>

                    �� ϵ �ˣ�                </th>

                <td>

                    <input name="uname" type="text" id="uname" size="30" />
                    <span class="red">*</span>                </td>
            </tr>
            
           

            <tr>

                <th>

                    ��&nbsp;&nbsp;����                </th>

                <td>

                    <input name="t2" type="text" id="t2" size="30" />
                    <span class="red">*</span>                </td>
            </tr>

            <tr>

                <th>

                    FAX��                </th>

                <td>

                    <input name="t3" type="text" id="t3" size="30" /></td>
            </tr>

          <tr>

                <th>

                    E-mail��                </th>

                <td>

                    <input name="email" type="text" id="email" size="30" />
                    <span class="red">*</span>                </td>
            </tr>

            <tr>

                <th>

                    ��ѯ���ݣ�                </th>

                <td><textarea name="t4" cols="60" rows="6" id="t4"></textarea></td>
            </tr>
             <tr>

                <th>&nbsp;</th>

                <td><input type="submit" name="button" id="button" value=" �� �� " />
&nbsp;
<input type="reset" name="button2" id="button2" value=" �� �� " /></td>
             </tr>
        </table>

        <div class="onlineText">

        	<p>&nbsp;</p>
        	</div>

    </div>
    </form>
      </div>
<div class="w240px l">
		    <div class="w240px r mlbg22 h10px"><!---->
            </div><div class="w238px hauto r yahei lineheight20px brl1sc pb10 pt10"><div class="linetop"><span class="c333333">�������ӣ�</span> </div>
            
             <!--#include file="leftabout.asp"-->
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
