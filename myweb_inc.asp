<!--#include file="inc/Conn.asp"-->
<!--#include file="inc/config.asp"-->
<!--#include file="inc/myfunction.asp"-->
<!--#include file="inc/page.asp"-->
<!--#include file="seo.asp"-->
<%
web_name=Sitetitle
web_KeyWords=SKeywords
web_Description=SDescription
%>
<script>
<!-------------ͼƬ�ȱ������Ŷ�--------->
function resizeimg2(ImgD,iwidth,iheight) {
     var image=new Image();
     image.src=ImgD.src;
     if(image.width>0 && image.height>0){
        if(image.width/image.height>= iwidth/iheight){
           if(image.width>iwidth){
               ImgD.width=iwidth;
               ImgD.height=(image.height*iwidth)/image.width;
           }else{
                  ImgD.width=image.width;
                  ImgD.height=image.height;
                }
               ImgD.alt=image.width+"��"+image.height;
        }
        else{
                if(image.height>iheight){
                       ImgD.height=iheight;
                       ImgD.width=(image.width*iheight)/image.height;
                }else{
                        ImgD.width=image.width;
                        ImgD.height=image.height;
                     }
                ImgD.alt=image.width+"��"+image.height;
            }
����������ImgD.style.cursor= "pointer"; //�ı����ָ��
����������//ImgD.onclick = function() { window.open(this.src);} //����򿪴�ͼƬ
��������if (navigator.userAgent.toLowerCase().indexOf("ie") > -1) { //�ж�������������IE
������������//ImgD.title = "��ʹ������������ͼƬ�����ͼƬ�����´��ڴ�";
����������//��ImgD.onmousewheel = function img_zoom() //��������
���������� {
��������������������//var zoom = parseInt(this.style.zoom, 10) || 100;
��������������������//zoom += event.wheelDelta / 12;
��������������������//if (zoom> 0)��this.style.zoom = zoom + "%";
������������������//��return false;
���������� }
������  } else { //�������IE
��������������     ImgD.title = "���ͼƬ�����´��ڴ�";
������������   }
    }
}
<!-------------ͼƬ�ȱ������Ŷ�--------->
//document.oncontextmenu=new Function("return false");
//document.onselectstart=function(){return false;};
</script>

