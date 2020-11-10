    <%
	ssql="select top 20 * from web_class  where class=1 and orders<100   order by orders asc,id asc"
	set srs=conn.execute(ssql)
	srsi=1
	if not srs.eof then

	do while not srs.eof
	
	%>
	 <span><A  href="aboutus.asp?id=<%= srs("id") %>"  id="pro_<%= srs("id") %>"><%= srs("title") %></a> </span>
     	<%
	
	srs.movenext
	srsi=srsi+1
	loop

	end if
	srs.close
	set srs=nothing
	%> <span><a href="index.asp">·µ»ØÊ×Ò³</a></span>