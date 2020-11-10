<div class="rightlist m10">
<ul>
 <%
set inrs=conn.execute("select top 20 * from web_class  where class=2  and orders<50   order by orders asc,id asc")
if inrs.eof then response.Write("数据信息添加中。。")
do while not inrs.eof


%>
  <LI ><A   href="newscenter.asp?type=<%=inrs("id")%>" id="about_<%=inrs("id")%>"><%=left(inrs("title"),15)%></A></LI>
 <%
inrs.movenext
loop
set inrs=nothing
%></ul>

</div>