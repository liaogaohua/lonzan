<!--#include file="../Inc/alimaomao_sqlconn.asp"-->
<!--#include file="../Inc/myfunction.asp"-->
<%

conn.execute("update [web_class] set orders = 300 where class=3 and title like '%¼Ò³¤-%'")
response.write("<script >window.location='class_web168.asp'</script>")
      response.end()
%>
<body>
</body>