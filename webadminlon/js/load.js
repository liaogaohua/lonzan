var s1 = setInterval("loading.innerText+=''", 500);    
var s2 = setInterval("loading.innerText = ''", 8000);    
   
    function window.onload()    
    {    
      //show();
      clearInterval(s1);    
      clearInterval(s2);    
      loadingDiv.removeNode(true);    
   
    } 
document.writeln("<div id=\"loadingDiv\" style=\"z-index:50000;position:absolute;left:expression((this.parentElement.offsetWidth-this.offsetWidth)\/2);top:expression((document.body.clientHeight-this.style.pixelHeight)\/3+document.body.scrollTop);\">"); 

document.writeln('<div style="border:1px #e6e8e8 solid; background-color:#fafbee; height:20px; width:200;font-size:12px;padding:5px;">');    
document.writeln('<div style="padding-top:5px;padding-left:12px;color:#666666">数据正在加载中...</div><div style="padding-top:3px;padding-bottom:3px;padding-left:11px;padding-right:5px;"><img src=\"js\/loadding.gif\"  align="absmiddle" ></div> <span id=\"loading\"><\/span>');    
document.writeln("<\/div>") 
 
document.writeln("<\/div>")    
document.writeln("<SCRIPT LANGUAGE=\"javascript\"> ");    
document.writeln("<!-- Hide ");    
document.writeln("function killErrors() { ");    
document.writeln("return true; ");    
document.writeln("} ");    
document.writeln("window.onerror = killErrors; ");    
document.writeln("\/\/ --> ");    
document.writeln("<\/SCRIPT>");  


  