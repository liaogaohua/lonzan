<%


Const news_author=""
const tr_color_title="#cae1fb"
const tr_color_content="#ECF5FF"


'//======================================================================================================//
'//===========联动菜单函数,nowbigid当前大类，nowsmallid当前小类，mowform当前表单，==========//
'//======================================================================================================//
function read_product_class(nowbigid,nowsmallid,mowform)

nowbigid=checkisint(nowbigid,0)
nowsmallid=checkisint(nowsmallid,0)
if nowform="" then nowform="myform"

set rs=server.createobject("adodb.recordset")
rs.open "select * from smallclass order by orders ",conn,1,1
'==========javascript===============
%>
<script language = "JavaScript">
var onecount;
onecount=0;
subcat = new Array();
<%
   count = 0
   do while not rs.eof 
%>
subcat[<%=count%>] = new Array("<%= trim(rs("smallname"))%>","<%= rs("bigid")%>","<%= rs("smallid")%>");
<%
        count = count + 1
        rs.movenext
        loop
        rs.close
%>
		
onecount=<%=count%>;

function changelocation(locationid)
    {
	 document.<%=nowform%>.sid.options[0] = new Option('请选择小类', 0);
    document.myform.sid.length = 1; 

    var locationid=locationid;
    var i;
    for (i=0;i < onecount; i++)
        {
            if (subcat[i][1] == locationid)
            { //这句不是很理解
             document.<%=nowform%>.sid.options[document.<%=nowform%>.sid.length] = new Option(subcat[i][0], subcat[i][2]);
            }        
        }
        
    }    
</script>

<%
'==========javascript===============

'========================联动菜单
'///大类下拉菜单
response.Write("大类：")

rs.open "select * from bigclass order by orders",conn,1,1
if rs.eof and rs.bof then
   readvar("请先添加栏目!")
else
   response.Write("<select name=bid size=1 id=bid onChange=""changelocation(document."&nowform&".bid.options[document."&nowform&".bid.selectedIndex].value)"">")
   response.Write("<option value=0 >请选择大类</option>")
   do while not rs.eof
      response.Write("<option value="&rs("bigid")&" ")
      if nowbigid=rs("bigid") then response.Write("selected")
      response.Write(" >"&trim(rs("bigname"))&"</option>")
      rs.movenext
  loop
end if
rs.close
response.write " </select>&nbsp;"

'///小类下拉菜单
response.write "小类："
response.write "<select name=sid id=sid>"
rs.open "select * from smallclass where bigid="&nowbigid&" order by orders asc " ,conn,1,1
response.Write("<option value=0>请选择小类</option>")
do while not rs.eof
    response.Write("<option value="&rs("smallid")&" ")
    if nowsmallid=rs("smallid") then response.Write("selected")
    response.Write(" >"&trim(rs("smallname"))&"</option>")
    rs.movenext
loop
rs.close
set rs = nothing
response.write " </select> "
'========================联动菜单
end function  
'//======================================================================================================//
'//===========联动菜单函数,nowbigid当前大类，nowsmallid当前小类，mowform当前表单，==========//
'//======================================================================================================// 





function readpid_form(nowpid)
   pidsql="select title from web_class where class=3  order by orders asc"
   set pidrs=conn.execute(pidsql)
   do while not pidrs.eof
      selectedstr=""
      if nowpid=pidrs("title") then selectedstr="selected"
      response.Write "<option value='"&pidrs("title")&"' "&selectedstr&">"&pidrs("title")&"</option>"&chr(10)
      pidrs.movenext
   loop
end function 
%>
