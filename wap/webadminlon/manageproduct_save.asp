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
if historyurl="" then historyurl="manageproduct.asp"


'Set html_fs=Server.CreateObject("Scripting.FileSystemObject")
'
'html_folder="/pro_htm/"'�洢��·��





if request("action")="add" then'========================���================================
   
   bid=checkisint(request("bid"),0)
   sid=checkisint(request("sid"),0)
   orders=checkisint(request("orders"),0)
   context= myrequest("content")
   
   addtime=replace(trim(request.Form("addtime")),"'","")
    if isdate(addtime)=false then 
       response.Write "<script language='javascript'>alert('ʱ���ʽ����ȷ��');history.back()</script>"
       response.End() 
   end if
  
   str="title,pid,tag,wordjj,pic,addtime"
   sql="select * from product"
   oRs.open sql,conn,3,3
   oRs.addnew
   oRs("bid")=bid
   oRs("sid")=sid
   oRs("orders")=orders
   
   oRs("context")=context
   call oRs_save(str)
   oRs.update
   oRs.movelast
   session("proid")=oRs("id")
   tempid=oRs("id")
   oRs.close
   set oRs=nothing
   call CloseConn()
'html_Url="http://"&request.ServerVariables("HTTP_HOST")&"/pro_htm/Proshow.asp?id="&tempid'Ҫ��ȡ��ҳ���ַ
'html_file="Proshow_"&tempid&".htm"'�ļ���
'call Asp_to_html(html_Url,html_folder,html_file)
'set html_fs=nothing
 
   %>
<SCRIPT LANGUAGE="JScript">
var truthBeTold = window.confirm("��ӳɹ�!\n�Ƿ�������?");
if (truthBeTold) {
window.location = ("manageproduct_add.asp");
}  else  window.location = ("<%=historyurl%>");
</SCRIPT>
   <%   

elseif request("action")="edit" then'========================�޸�================================
   
   bid=checkisint(request("bid"),0)
   sid=checkisint(request("sid"),0)
   orders=checkisint(request("orders"),0)
   context= myrequest("content")
   
    addtime=replace(trim(request.Form("addtime")),"'","")
    if isdate(addtime)=false then 
       response.Write "<script language='javascript'>alert('ʱ���ʽ����ȷ��');history.back()</script>"
       response.End() 
   end if
  
   str="title,pid,tag,wordjj,pic,addtime"
   sql="select * from product where id="&cint(request("proid"))
   oRs.open sql,conn,3,3
   oRs("bid")=bid
   oRs("sid")=sid
   oRs("orders")=orders
   oRs("context")=context
   call oRs_save(str)
   oRs.update
   oRs.movelast
   session("proid")=oRs("id")
   tempid=oRs("id")
   oRs.close
   set oRs=nothing
   call CloseConn()
   
'html_Url="http://"&request.ServerVariables("HTTP_HOST")&"/pro_htm/Proshow.asp?id="&tempid'Ҫ��ȡ��ҳ���ַ
'html_file="Proshow_"&tempid&".htm"'�ļ���
'call Asp_to_html(html_Url,html_folder,html_file)
'set html_fs=nothing

   response.write("<script>window.alert ('�޸ĳɹ�,����ȷ������!');window.location = ('"&historyurl&"');</script>")
elseif request("action")="del"  then'========================ɾ��================================
   conn.execute ("delete from [product] where id in ("&request("productid")&")")
   response.write("<script>window.alert ('ɾ���ɹ�,����ȷ������!');window.location = ('"&historyurl&"');</script>") 
end if

 %>
</body>
</html>
