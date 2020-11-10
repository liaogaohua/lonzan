<%
Dim fileName,postion,i
Dim pre,last,intpage,pageNo
Sub Page1()
'-------获取带参数的地址
Dim ScriptAddress,M_ItemUrl,M_item,GetUrl
ScriptAddress = CStr(Request.ServerVariables("SCRIPT_NAME"))
M_ItemUrl = ""
If (Request.QueryString <> "") Then
ScriptAddress = ScriptAddress & "?"
For Each M_item In Request.QueryString
If M_Item<>"page" then
M_ItemUrl = M_ItemUrl & M_Item &"="& Server.URLEncode(Request.QueryString(""&M_Item&"")) & "&"
End If
Next
end if
GetUrl = ScriptAddress & M_ItemUrl
if right(GetUrl,3)<>"asp" then
GetUrl=left(GetUrl,len(GetUrl)-1)
end if
fileName = GetUrl
if Instr(fileName,"?")>0 then
fileName=fileName&"&"
Else
fileNAme=fileName&"?"
end if
'-----结束

pre = true
last = true
'page = trim(Request.QueryString("page"))
pageNo = Request("page")
if len(pageNo) = 0 then
intpage = 1
pre = false
else
if cint(pageNo) =< 1 then
intpage = 1
pre = false
else
if cint(pageNo) >= oRs.PageCount then
intpage = oRs.PageCount
last = false
else
intpage = cint(pageNo)
end if
end if
end if
if not oRs.eof then
oRs.AbsolutePage = intpage
end if

End sub



Sub Page_nobg()
if nowlanguage=10 then
   pagestr_001=""
   pagestr_001=""
   pagestr_001=""
   pagestr_001=""
   pagestr_001=""
elseif  nowlanguage=19 then
else
   pagestr_001="当前页"
   pagestr_002="首页"
   pagestr_003="上页"
   pagestr_004="下页"
   pagestr_005="尾页"
   pagestr_006="转到"
   pagestr_007="页"
end if
%>
<table width="100%" height="24" align="left" cellpadding="0" cellspacing="0">
<tr>
<%if oRs.pagecount > 0 then%>
<td width="13%" align="left" border="1" height="24">当前页<%=intpage%>/<%=oRs.PageCount%></td>
<%else%>
<td width="41%" align="left" height="24">当前页0/0</td>
<%end if%>
<td width="46%" align="right" height="24"> <a href="<%=fileName%>page=1" class="gray_l">首页</a>| 
<%if pre then%>
<a href="<%=fileName%>page=<%=intpage -1%>"class="gray_l">上页</a>| <%end if%>
<%if last then%>
<a href="<%=fileName%>page=<%=intpage +1%>"class="gray_l">下页</a> |<%end if%>
<a href="<%=fileName%>page=<%=oRs.PageCount%>"class="gray_l">尾页</a>|转到第
<select name="sel_page" onchange="javascript:location=this.options[this.selectedIndex].value;">
<%
for i = 1 to oRs.PageCount
if i = intpage then%>
<option value="<%=fileName%>page=<%=i%>" selected><%=i%></option>
<%else%>
<option value="<%=fileName%>page=<%=i%>"><%=i%></option>
<%
end if
next
%>
</select>页</font> 
</td>
</tr>
</table>
<%
End Sub





Sub Page_2009_bak()
   pagestr_001="当前页"
   pagestr_002="首页"
   pagestr_003="上页"
   pagestr_004="下页"
   pagestr_005="尾页"
   pagestr_006="转到"
   pagestr_007="页"

%>
<table width="100%" height="24" align="left" cellpadding="0" cellspacing="0">
<tr>
<%if oRs.pagecount > 0 then%>
<td width="13%" align="left"  bordercolor="#999999" border="1" height="24"><%= pagestr_001 %><%=intpage%>/<%=oRs.PageCount%></td>
<%else%>
<td width="41%" align="left" height="24"><%= pagestr_001 %>0/0</td>
<%end if%>
<td width="46%" align="right" height="24"> <a href="<%=fileName%>page=1" class="gray_l"><%= pagestr_002 %></a>| 
<%if pre then%>
<a href="<%=fileName%>page=<%=intpage -1%>"class="gray_l"><%= pagestr_003 %></a>| <%end if%>
<%if last then%>
<a href="<%=fileName%>page=<%=intpage +1%>"class="gray_l"><%= pagestr_004 %></a> |<%end if%>
<a href="<%=fileName%>page=<%=oRs.PageCount%>"class="gray_l"><%= pagestr_005 %></a>|<%= pagestr_006 %>
<select name="sel_page" onchange="javascript:location=this.options[this.selectedIndex].value;">
<%
for i = 1 to oRs.PageCount
if i = intpage then%>
<option value="<%=fileName%>page=<%=i%>" selected><%=i%></option>
<%else%>
<option value="<%=fileName%>page=<%=i%>"><%=i%></option>
<%
end if
next
%>
</select><%= pagestr_007 %></font> 
</td>
</tr>
</table>
<%
End Sub


Sub Page()
     if oRs.PageCount<2 then exit sub
     response.Write("<div style=""clear:both; height:2px; line-height:3px;""></div>")
	 response.Write("<div class=""page_div""   style="" text-align:left;padding-left:30px;"" >")
	 
	totalpage=oRs.PageCount
	testclass=0
	page__=intpage
		 
	p=10 '每列10个页码
	tp=int((page__-1)/p)
	endp=(tp*p)+p
	if endp>totalpage then
	endp=totalpage
	end if

	if page__>p then  response.Write(" <a href="&fileName&"page="&p&" title=上"&p&"页 class=pagea>&laquo;</a>")
	if page__>1 then  response.Write("<a href="&filename&"page="&page__-1&" title=上一页 class=pagea>&#8249;</a>")
	for j=(tp*p)+1 to endp
		if request("page")=""&j&"" then
		   response.Write("<span class=pagea>"&j&"</span>")
		else
		  response.Write("<a href="&filename&"page="&j&" class=pagea>"&j&"</a>")
		end if
	next
	if page__<totalpage then response.Write("<a href="&filename&"page="&page__+1&" title=下一页 class=pagea>&#8250;</a>")
	if endp<totalpage then  response.Write("<a href="&filename&"page="&(tp*p)+p+1&" title=下"&p&"页 class=pagea>&raquo;</a>")
		
		%> <div class="pageb">               
<!--<select onchange="viewpage(this.value,<%=testclass%>);" size="1" name="view">
<%for j=(tp*p)+1 to endp%>
<option value="<%=j%>" <%if request("page")=""&j&"" then%>selected="selected"<%end if%>><%=j%></option>
<%next%>
</select>-->
</div>
 <script language="JavaScript" type="text/javascript">     

function viewpage(val,testclass)
{

location="<%=filename%>page="+val

}
</script>   
<%
response.Write("</div")
response.Write("<div style=""clear:both; height:2px; line-height:3px;""></div>")

End Sub
%>