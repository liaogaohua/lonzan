
<!--#include file="uploadweb.inc"-->
<%
set upload=new upload_file
if upload.form("act")="uploadfile" then
	filepath=trim(upload.form("filepath"))
	filelx=trim(upload.form("filelx"))
	
	i=0
	for each formName in upload.File
		set file=upload.File(formName)
 
 fileExt=lcase(file.FileExt)	'得到的文件扩展名不含有.
 if file.filesize<100 then
	response.write "<script language=javascript>alert('请先选择你要上传的文件！');history.go(-1);</script>"
	response.end
 end if

 if filelx="jpg" then
	if fileext<>"gif" and fileext<>"jpg"  then
		response.write "<script language=javascript>alert('只能上传jpg或gif格式的图片！');history.go(-1);</script>"
		response.end
     	end if
 end if
 if filelx="jpg" then
	if file.filesize>(1000*1024) then
		response.write "<script language=javascript>alert('图片文件大小不能超过1m！');history.go(-1);</script>"
		response.end
	end if
 end if



 randomize
 ranNum=int(90000*rnd)+10000
 filename=filepath&year(now)&month(now)&day(now)&hour(now)&minute(now)&second(now)&ranNum&"."&fileExt
%>
<%
 if file.FileSize>0 then         ''如果 FileSize > 0 说明有文件数据
  'file.SaveAs Server.mappath(filename)   ''保存文件
  file.SaveToFile Server.mappath(FileName)
  'response.write file.FileName&"　　上传成功!　　<br>"
  'response.write "新文件名："&FileName&"<br>"
  'response.write "新文件名已复制到所需的位置，可关闭窗口！"
  if filelx="swf" then
  response.write "<script>window.opener.document."&upload.form("FormName")&".size.value='"&int(file.FileSize/1024)&" K'</script>"
  end if
  response.write "<script>window.opener.document."&upload.form("FormName")&"."&upload.form("EditName")&".value='"&replace(FileName,"../","")&"'</script>"
%>
<%
end if
set file=nothing
next
set upload=nothing
end if
%>
<script language="javascript">
window.alert("文件上传成功!请不要修改生成的链接地址！");
window.close();
</script>