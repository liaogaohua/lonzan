    <% 
	if bid<>0 then '////////////////////////////
	ssql="select smallid,smallname from smallclass where bigid="&bid&" order by orders asc,smallid asc"
	set srs=conn.execute(ssql)
	srsi=1
	if not srs.eof then

	do while not srs.eof
	
	%>
	 <span><A  href="Product.asp?sid=<%= srs("smallid") %>"  id="pro_<%= srs("smallid") %>"><%= srs("smallname") %></a> </span>
	<%
	
	srs.movenext
	srsi=srsi+1
	loop

	end if
	srs.close
	set srs=nothing
	
	else'////////////////////////////
	
		ssql="select bigid,bigname from bigclass where orders<200  order by orders asc"
	set srs=conn.execute(ssql)
	srsi=1
	if not srs.eof then

	do while not srs.eof
	
	%>
	 <span><A  href="Product.asp?bid=<%= srs("bigid") %>"  id="pro_<%= srs("bigid") %>"><%= srs("bigname") %></a> </span>
	<%
	
	srs.movenext
	srsi=srsi+1
	loop

	end if
	srs.close
	set srs=nothing
	
	end if'////////////////////////////
	
	
	%> 
    
    
    
    <span><a href="index.asp">·µ»ØÊ×Ò³</a></span>