<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#include file="webadmin_inc.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>公司企业网站系统后台</title>
</head>
<body>
<% 
historyurl=""
historyurl=session("usrsession")
if historyurl="" then historyurl="Right_Master.htm"

language=checkisint(request("language"),0)
if language<>0 then session("language")=language'获取版本信息
if session("language")="" then session("language")=9'获取版本信息


if request("action")="add" then'========================添加================================
   dim new_title,new_type,new_state,new_context,new_author,new_addtime
   new_title=replace(trim(request.Form("title")),"'","")
   new_type=replace(trim(request.Form("type")),"'","")
   new_state=replace(trim(request.Form("state")),"'","")
   new_context=replace(trim(request.Form("content")),"'","")
   new_author=replace(trim(request.Form("author")),"'","")
   new_addtime=replace(trim(request.Form("addtime")),"'","")
   new_wordjj=replace(trim(request.Form("wordjj")),"'","")
   if new_state="" then new_state=1
   if isdate(new_addtime)=false then 
       response.Write "<script language='javascript'>alert('时间格式不正确！');history.back()</script>"
       response.End() 
   end if
   new_sql="insert into web_news (title,type,author,context,state,addtime,language,wordjj) values('" & new_title & "'," & new_type & ",'" & new_author & "','" & new_context & "','" & new_state & "','" & new_addtime & "',"&session("language")&",'"&new_wordjj&"')"
   'response.Write new_sql
  ' response.End()
   conn.execute(new_sql)
   call CloseConn()
   'response.write("<script>window.alert ('添加成功,单击确定继续!');window.location = ('managedown_add.asp');/script>")  
   %>
<SCRIPT LANGUAGE="JScript">
var truthBeTold = window.confirm("添加成功!\n是否继续添加?");
if (truthBeTold) {
window.location = ("managenews_add.asp");
}  else  window.location = ("<%=historyurl%>");
</SCRIPT>
   <%   
elseif request("action")="edit" then'========================修改================================
  
   new_title=replace(trim(request.Form("title")),"'","")
   new_type=replace(trim(request.Form("type")),"'","")
   new_state=replace(trim(request.Form("state")),"'","")
   new_context=replace(trim(request.Form("content")),"'","")
   new_author=replace(trim(request.Form("author")),"'","")
   new_addtime=replace(trim(request.Form("addtime")),"'","")
   new_wordjj=replace(trim(request.Form("wordjj")),"'","")
   if new_state="" then new_state=1
   if isdate(new_addtime)=false then 
       response.Write "<script language='javascript'>alert('时间格式不正确！');history.back()</script>"
       response.End() 
   end if
   new_sql="update web_news set title='"&new_title&"',type="&new_type&",state="&new_state&",context='"&new_context&"',author='"&new_author&"',addtime='"&new_addtime&"',wordjj='"&new_wordjj&"' where id="&cint(request("newsid"))
   conn.execute(new_sql)
   call CloseConn()
   response.write("<script>window.alert ('修改成功,单击确定继续!');window.location = ('"&historyurl&"');</script>")
elseif request("action")="del"  then'========================删除================================
   conn.execute ("delete from web_news where id in ("&Request("newsid")&")")
   response.write("<script>window.alert ('删除成功,单击确定返回!');window.location = ('"&historyurl&"');</script>") 
end if

 %>
</body>
</html>
