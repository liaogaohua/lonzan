// JavaScript Document
$(function() {
	//轮播图片地址 链接地址 停留时间
	var adlink = [
		{
			_src:"b_files/banner1.jpg",
			_link:"#"
		},
		{
			_src:"b_files/banner2.jpg",
			_link:"#"
		},
		{
			_src:"b_files/banner3.jpg",
			_link:"#"
		}
		,
		{
			_src:"b_files/banner4.jpg",
			_link:"#"
		}
	]
	
	var _li = $(".ad_num li");
	var _href = $(".ad_pic a");
	var _img = $(".ad_pic img");
	var _time = 4000;
	var _time1 = 4000;
	var result=0;
	
	var i = 0
	slide();
	function slide(){
	    if(i==0&&result==1)
		{
		    clearInterval(auto);
		    auto = setInterval(slide, _time1);
		    result=0
		}
		else if(i==1&&result==0)
		{
		    clearInterval(auto);
		    auto = setInterval(slide, _time);
		    result=1
		}
		
		_li.eq(i).addClass("on").siblings("li").removeClass("on");
		_href.attr("href",adlink[i]._link);
		_img.attr("src",adlink[i]._src);
		i++;
		
		if(i==8){i=0}
	}
	function slide_a(_num){
		_li.eq(_num).addClass("on").siblings("li").removeClass("on");
		_href.attr("href",adlink[_num]._link);
		_img.attr("src",adlink[_num]._src);
		i = _num;
	}
	_li.click(function(){
		var _num = $(this).index();
		slide_a(_num);
	});

	_img.hover(function(){
		if(auto){clearInterval(auto);}
	},function(){
		var i = _li.index();
		auto = setInterval(slide, _time);
	});
	
	var auto = setInterval(slide, _time1);

	
});
