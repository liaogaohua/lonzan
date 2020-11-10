<!--#include file="inc/Conn.asp"-->
<!--#include file="../inc/myfunction.asp"-->
<!--#include file="../inc/page.asp"-->
<!--#include file="../inc/config.asp"-->
<!--#include file="../inc/md5.asp"-->
<!--#include file="admin.asp"-->

<link rel="stylesheet" href="91021editor/themes/default/default.css" />
<script charset="utf-8" src="91021editor/kindeditor.js"></script>
<script charset="utf-8" src="91021editor/lang/zh_CN.js"></script>

<script>
KindEditor.ready(function(K) {
	K.create('textarea[name="content"]', {
		allowFileManager : true
	});
});

</script>
