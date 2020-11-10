
$(document).ready(function(){

/////////////底部菜单////////////
  var div1=$("#foo_ks");
  $(".showmenu").click( function(){
		div1.toggle();
	 });
  
  ////////////首页菜单////////////
  $(".topmenu").click( function(){
		 $(this).find("div").toggle();
	 });
  
  /////////////首页栏目菜单////////////////
 $('.BigClass').click(
 	 function(){
		// $('.smallclass').hide()
		
		 $('.smallclass').hide();
		 $(this).next().show();
		 }

  );


   /////////////内页顶部分类////////////////
 $('.topcd').click(
 	 function(){
		// $('.smallclass').hide()
		  $('.nytopzcd').toggle()
		 }

  );
 
 /////////////返回顶部//////////////////////
$(window).scroll(function(){
		if($(window).scrollTop()>30){
			$(".gotop").show();
			$(".wapfoot").hide();
			}
		else{
			$(".gotop").hide();	
			$(".wapfoot").show();
			}	
		
		});



});

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

               ImgD.alt=image.width+"×"+image.height;

        }

        else{

                if(image.height>iheight){

                       ImgD.height=iheight;

                       ImgD.width=(image.width*iheight)/image.height;

                }else{

                        ImgD.width=image.width;

                        ImgD.height=image.height;

                     }

                ImgD.alt=image.width+"×"+image.height;

            }

　　　　　ImgD.style.cursor= "pointer"; //改变鼠标指针

　　　　　//ImgD.onclick = function() { window.open(this.src);} //点击打开大图片

　　　　if (navigator.userAgent.toLowerCase().indexOf("ie") > -1) { //判断浏览器，如果是IE

　　　　　　//ImgD.title = "请使用鼠标滚轮缩放图片，点击图片可在新窗口打开";

　　　　　//　ImgD.onmousewheel = function img_zoom() //滚轮缩放

　　　　　 {

　　　　　　　　　　//var zoom = parseInt(this.style.zoom, 10) || 100;

　　　　　　　　　　//zoom += event.wheelDelta / 12;

　　　　　　　　　　//if (zoom> 0)　this.style.zoom = zoom + "%";

　　　　　　　　　//　return false;

　　　　　 }

　　　  } else { //如果不是IE

　　　　　　　     ImgD.title = "点击图片可在新窗口打开";

　　　　　　   }

    }

}
