<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#include file="webadmin_inc.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>��˾��ҵ��վϵͳ��̨</title>
</head>
<body>
<% 
historyurl=""
historyurl=session("usrsession")
if historyurl="" then historyurl="Right_Master.htm"

language=checkisint(request("language"),0)
if language<>0 then session("language")=language'��ȡ�汾��Ϣ
if session("language")="" then session("language")=9'��ȡ�汾��Ϣ


if request("action")="add" then'========================���================================
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
       response.Write "<script language='javascript'>alert('ʱ���ʽ����ȷ��');history.back()</script>"
       response.End() 
   end if
   new_sql="insert into web_news (title,type,author,context,state,addtime,language,wordjj) values('" & new_title & "'," & new_type & ",'" & new_author & "','" & new_context & "','" & new_state & "','" & new_addtime & "',"&session("language")&",'"&new_wordjj&"')"
   'response.Write new_sql
  ' response.End()
   conn.execute(new_sql)
   call CloseConn()
   'response.write("<script>window.alert ('��ӳɹ�,����ȷ������!');window.location = ('managedown_add.asp');/script>")  
   %>
<SCRIPT LANGUAGE="JScript">
var truthBeTold = window.confirm("��ӳɹ�!\n�Ƿ�������?");
if (truthBeTold) {
window.location = ("managenews_add.asp");
}  else  window.location = ("<%=historyurl%>");
</SCRIPT>
   <%   
elseif request("action")="edit" then'========================�޸�================================
  
   new_title=replace(trim(request.Form("title")),"'","")
   new_type=replace(trim(request.Form("type")),"'","")
   new_state=replace(trim(request.Form("state")),"'","")
   new_context=replace(trim(request.Form("content")),"'","")
   new_author=replace(trim(request.Form("author")),"'","")
   new_addtime=replace(trim(request.Form("addtime")),"'","")
   new_wordjj=replace(trim(request.Form("wordjj")),"'","")
   if new_state="" then new_state=1
   if isdate(new_addtime)=false then 
       response.Write "<script language='javascript'>alert('ʱ���ʽ����ȷ��');history.back()</script>"
       response.End() 
   end if
   new_sql="update web_news set title='"&new_title&"',type="&new_type&",state="&new_state&",context='"&new_context&"',author='"&new_author&"',addtime='"&new_addtime&"',wordjj='"&new_wordjj&"' where id="&cint(request("newsid"))
   conn.execute(new_sql)
   call CloseConn()
   response.write("<script>window.alert ('�޸ĳɹ�,����ȷ������!');window.location = ('"&historyurl&"');</script>")
elseif request("action")="del"  then'========================ɾ��================================
   conn.execute ("delete from web_news where id in ("&Request("newsid")&")")
   response.write("<script>window.alert ('ɾ���ɹ�,����ȷ������!');window.location = ('"&historyurl&"');</script>") 
end if

 %>
</body>
</html>
