<!--#include file="inc/Conn.asp"-->
<!--#include file="../Inc/myfunction.asp"-->
<style type="text/css">
<!--
.style3 {font-size: 12}
-->
</style>

<script language="javascript1.2">
function checkdo(thisf,id) 
 {

	var classtype=thisf.classtype.value;
	var classname=thisf.classname.value;
	var classorder=thisf.classorder.value;
	if (classname=="")
	{
	    alert('������Ʋ���Ϊ��');
		          
	 }
	else
	{
		location.href='?action=edite&id='+id+'&classname='+classname+'&classorder='+classorder+'&classtype='+classtype+'';
	 }
 }
function checkdel(id) 
 {
  if (confirm('ȷ��ɾ��Ӧ�������?'))
   {
      location.href='?action=del&id='+id+'';
    }
		 
  }
</script>

<%
'====�����ݵ�ֵ===
classid=checkisint(request("id"),0)
classtype=3
classname=replace(trim(request("classname")),"'","")
classorder=cint(checkisint(request("classorder"),20))
action=replace(trim(request("action")),"'","")
'=======����
if action="add" then
  conn.execute("insert into web_class(class,title,orders) values("&classtype&",'"&classname&"',"&classorder&")")
  session("nowtype")=classtype
  response.Redirect("class_web1120.asp")
  response.end()
elseif  action="edite" then
   if classid then 
      sql="update web_class set class="&classtype&",title='"&classname&"',orders="&classorder&" where id="&classid
	  conn.execute(sql)
	  'response.Redirect("class_web1120.asp")
	  response.write("<script >window.location='class_web1120.asp'</script>")
     response.end()
   end if
   readvar("�Ƿ�����!")
elseif  action="del" then
   if classid then 
      sql="delete from web_class where id="&classid
      conn.execute(sql)
	  'response.Redirect("class_web1120.asp")
	  response.write("<script >window.location='class_web1120.asp'</script>")
      response.end()
	  
   end if
   readvar("�Ƿ�����!")
end if

'=============== ��ǰ����
nowtype=request("nowtype")
if nowtype<>"" then    session("nowtype")=nowtype
nowtype=session("nowtype")
if nowtype="" or isnull(nowtype) or isnumeric(nowtype)=0 then nowtype=0
%>
<body>
<table width="50%" border="0" align="center" cellpadding="5" cellspacing="10">
 <form id="formnow" name="formnow" method="post" action="class_web1120.asp">
  <tr>
    <td align="center" valign="middle"><strong>ѡ���������:
    
        <select name="nowtype" id="nowtype">

          <option value="3" <%if nowtype=3 then %>selected="selected"<% End If %>>Ʒ������</option>


 
        </select>
        &nbsp;
        <input type="submit" name="button" id="button" value="�� ��" />
    </strong></td>
  </tr>
  </form>
</table>

<table width="90%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#cfcfcf">
 
  <tr>
    <td width="7%" height="25" align="center" bgcolor="#fcfcfc"><strong>ID</strong></td>
    <td width="18%" height="25" align="center" bgcolor="#fcfcfc"><strong>��������</strong></td>
    <td width="29%" align="center" bgcolor="#fcfcfc"><strong>�������</strong></td>
    <td width="20%" align="center" bgcolor="#fcfcfc"><strong>����</strong></td>
    <td width="26%" align="center" bgcolor="#fcfcfc"><strong>����</strong></td>
  </tr>
 <% 
   if nowtype=0 then 
       Sql="Select * From [web_class] where 2=2 order by class desc ,orders asc,id asc"
   else
       Sql="Select * From [web_class] where 2=2 and class="&nowtype&" order by class desc ,orders asc,id asc"
   end if
   oRs.open Sql,conn,1,1
   for i=1 to oRs.recordcount
   if oRs.Eof then exit for
   rsid=oRs("id")
   rsclass=oRs("class")
   rsname=oRs("title")
   rsorder=oRs("orders")
  %>
  <form id="myform<%=i%>" name="myform<%=i%>" method="post" action="class_web1120.asp" onSubmit="checkdo(this,<%= rsid %>);return false;">

  <tr>
    <td height="20" align="center" bgcolor="#FFFFFF"><%= rsid %></td>
    <td align="center" bgcolor="#FFFFFF"><select name="classtype" id="classtype">


          <option value="3" <%if rsclass=3 then %>selected="selected"<% End If %>>Ʒ������</option>


    </select></td>
    <td align="center" bgcolor="#FFFFFF"><input name="classname" type="text" id="classname" value="<%= rsname %>" size="20" /></td>
    <td align="center" bgcolor="#FFFFFF"><input name="classorder" type="text" id="classorder" value="<%= rsorder %>" size="6" /></td>
    <td align="center" bgcolor="#FFFFFF">
      <input type="submit" name="Submit" value="�� ��"   />
&nbsp;    
    <input type="submit" name="Submit2" value="ɾ ��" onClick="checkdel(<%= rsid %>);return false;"/>    </td>
  </tr>
</form> 
  <%
    oRs.movenext
	next
	oRs.close
	set oRs=nothing
	conn.close
	set conn=nothing
	%>
</table>
<Br>


<table width="90%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#cfcfcf">
  <tr>
    <td width="25%" height="25" align="center" bgcolor="#fcfcfc"><strong>��������</strong></td>
    <td width="29%" align="center" bgcolor="#fcfcfc"><strong>�������</strong></td>
    <td width="20%" align="center" bgcolor="#fcfcfc"><strong>����</strong></td>
    <td width="26%" align="center" bgcolor="#fcfcfc"><strong>����</strong></td>
  </tr>

  <form id="formadd" name="formadd" method="post" action="?action=add">
    <tr>
      <td height="20" align="center" bgcolor="#FFFFFF"><select name="classtype" id="classtype">

          <option value="3" <%if nowtype=3 then %>selected="selected"<% End If %>>Ʒ������</option>


      </select></td>
      <td align="center" bgcolor="#FFFFFF"><input name="classname" type="text" id="classname" size="20" /></td>
      <td align="center" bgcolor="#FFFFFF"><input name="classorder" type="text" id="textfield4" value="20" size="6" /></td>
      <td align="center" bgcolor="#FFFFFF"><span class="style3">
        <input type="submit" name="Submit3" value="��ӷ���" />
        &nbsp; </span></td>
    </tr>
  </form>
</table>
</body>