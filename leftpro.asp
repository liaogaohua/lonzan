<div class="rightlist m10">
<ul>
 <%
bsql="select bigid,bigname from bigclass order by orders asc"
set brs=conn.execute(bsql)
brsi=1
do while not brs.eof
'////////////////////////////////
%>
      <li><A   href="Product.asp?bid=<%= brs("bigid") %>"  ><%= brs("bigname") %></a>
<%
if brs("bigid")=bid or 1=2 then 
	ssql="select smallid,smallname from smallclass where bigid="&brs("bigid")&" order by orders asc"
	set srs=conn.execute(ssql)
	srsi=1
	if not srs.eof then
	response.write "<ul>"

	do while not srs.eof
	
	%>
	 <LI><A  href="Product.asp?sid=<%= srs("smallid") %>">  <%= srs("smallname") %></a> </LI>
	<%
	
	srs.movenext
	srsi=srsi+1
	loop
    response.write "</ul>"
	end if
	response.write "</li>"

	srs.close
	set srs=nothing
end if

'////////////////////////////////

brsi=brsi+1
brs.movenext
loop
brs.close
set brs=nothing
%></ul>
</div>