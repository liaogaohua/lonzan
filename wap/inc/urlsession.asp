<% 
'======== 保存当前网址===到session("usrsession")
Dim ScriptAddress,M_ItemUrl,M_item,GetUrl
ScriptAddress = CStr(Request.ServerVariables("SCRIPT_NAME"))
M_ItemUrl = ""
If (Request.QueryString <> "") Then
ScriptAddress = ScriptAddress & "?"
For Each M_item In Request.QueryString
M_ItemUrl = M_ItemUrl & M_Item &"="& Server.URLEncode(Request.QueryString(""&M_Item&"")) & "&"
Next
end if
GetUrl = ScriptAddress & M_ItemUrl
if right(GetUrl,3)<>"asp" then
GetUrl=left(GetUrl,len(GetUrl)-1)
end if
fileName = GetUrl
session("usrsession")=fileName

'-----结束

 %>