// JavaScript Document
function showArea(obj,areaTarget){
	var allTabTitle = obj.parentNode.getElementsByTagName("LI");
	var allArea = obj.parentNode.parentNode.parentNode.getElementsByTagName("DIV");
	var timeout = setTimeout(function(){
		try{
			clearTimeout(switchToTodayInfo);
		}catch(exp){}
		i=0;
		while(i<=allTabTitle.length-1){
				allTabTitle[i].className="on2";
				i++;
		}
		obj.className="on";
		j=0;
		while(j<=allArea.length-1){
			if (allArea[j].id!=areaTarget){
				allArea[j].style.display="none";
			}else{
				allArea[j].style.display="block";
			}
			j++;
		}
	},200)
	obj.onmouseout = function(){
		clearTimeout(timeout);
		obj.onmouseout = null;
	}
}
function toggleMenu(b,obj){
	$(obj).toggle();
	var icon = b.parentNode.getElementsByTagName("b");
	if($(obj).visible()){
		$(icon[0]).className="h4b1";
	} else {
		$(icon[0]).className="h4b2";
	}
	return false;
}
/*���б�table����Ч����غ���*/
function observeTableTrOver(event){
	//caution:ʹ��$���Է�ֹĳЩ������л�ȡ�Ķ���û�б���װ
	$(Event.element(event).parentNode).addClassName('onclick');
}
function observeTableTrOut(event){
	$(Event.element(event).parentNode).removeClassName('onclick');
}
function isAllSelect(tableId){
	all_s = true;
	trs = $A($(tableId).childNodes[0].getElementsByTagName('TR'));
	trs.each(
	function(tr){
		if(!$(tr).hasClassName('no_sel') && !$(tr).hasClassName('collapse')){
			input = tr.getElementsByTagName('TD')[0].getElementsByTagName('INPUT')[0];
			if(!input.checked && input.checked != 'checked') {
				all_s = false;
			}
		}
	});
	//ȫѡ����ȫδѡʱ�����仯
	return all_s;
}
function bindTableBehavior(tableId, selectAllId){
	//���е���
	trs = $A($(tableId).childNodes[0].getElementsByTagName('TR'));
	//ȫѡ
	$(selectAllId).observe('click',
		function(event){
			button = Event.element(event);
			trs.each(function(tr){
				try{
					tr.getElementsByTagName('TD')[0].getElementsByTagName('INPUT')[0].checked = button.checked;
					subTds = $A(tr.getElementsByTagName('TD'));
					if(button.checked){
						tr.addClassName('onselect');
						subTds.each(function(td){
							td = $(td);
							td.stopObserving('mouseover', observeTableTrOver);
							td.stopObserving('mouseout', observeTableTrOut);
						});
						tr.removeClassName('onclick');
					} else {
						tr.removeClassName('onselect');
						subTds.each(function(td){
							td = $(td);
							td.observe('mouseover', observeTableTrOver);
							td.observe('mouseout', observeTableTrOut);
						});
					}
				}catch (e){}
			});
		}
	);
	//ҳ���ʼ����԰���ѡ�У����������ͣ����Ч
	trs.each(
		function(tr){
			if(!$(tr).hasClassName('no_sel') && !$(tr).hasClassName('collapse')){
				tds = $A(tr.getElementsByTagName('TD'));
				//��ʼ��ʱ���input�Ƿ�ѡ��
				input = tr.getElementsByTagName('TD')[0].getElementsByTagName('INPUT')[0];
				if(input.checked){
					tr.addClassName('onselect');
				}
				tds.each(function(td){
					//caution:ʹ��$���Է�ֹĳЩ������л�ȡ�Ķ���û�б���װ
					td = $(td)
					td.observe('click', function(event){
						td = Event.element(event);
						tr = $(td.parentNode);
						if(td.tagName == "INPUT"){
							tr = tr.parentNode;
						}
						if(tr.tagName == "TR"){
							tr.toggleClassName('onselect');
							input = tr.getElementsByTagName('TD')[0].getElementsByTagName('INPUT')[0];
							input.checked = tr.hasClassName('onselect') ? "checked" : "";
							subTds = $A(tr.getElementsByTagName('TD'));
							if(tr.hasClassName('onselect')){
								subTds.each(function(td){
									td = $(td);
									td.stopObserving('mouseover', observeTableTrOver);
									td.stopObserving('mouseout', observeTableTrOut);
								});
								tr.removeClassName('onclick');
							} else {
								subTds.each(function(td){
									td = $(td);
									td.observe('mouseover', observeTableTrOver);
									td.observe('mouseout', observeTableTrOut);
								});
							}
						}
						$(selectAllId).checked = isAllSelect(tableId) ? "checked" : "";
					});
					td.observe('mouseover', observeTableTrOver);
					td.observe('mouseout', observeTableTrOut);
				});
			}
		}
	);
}
var BrowserEnv = new Object();
(function(){
	var dua = navigator.userAgent;
	var dav = navigator.appVersion;

	BrowserEnv.ver = parseFloat(dav);
	
	BrowserEnv.os = {}
	BrowserEnv.os.mac = dav.indexOf("Macintosh") >= 0;
	BrowserEnv.os.win = dav.indexOf("Windows") >= 0;
		// could also be Solaris or something, but it's the same browser
	BrowserEnv.os.linux = dav.indexOf("X11") >= 0;

	BrowserEnv.opera = dua.indexOf("Opera") >= 0;
	BrowserEnv.khtml = (dav.indexOf("Konqueror") >= 0)||(dav.indexOf("Safari") >= 0);
	BrowserEnv.safari = dav.indexOf("Safari") >= 0;
	var geckoPos = dua.indexOf("Gecko");
	BrowserEnv.mozilla = moz = (geckoPos >= 0)&&(!BrowserEnv.khtml);
	BrowserEnv.ie = (document.all)&&(!BrowserEnv.opera);
	BrowserEnv.ie50 = BrowserEnv.ie && dav.indexOf("MSIE 5.0")>=0;
	BrowserEnv.ie55 = BrowserEnv.ie && dav.indexOf("MSIE 5.5")>=0;
	BrowserEnv.ie60 = BrowserEnv.ie && dav.indexOf("MSIE 6.0")>=0;
	BrowserEnv.ie70 = BrowserEnv.ie && dav.indexOf("MSIE 7.0")>=0;
})();
