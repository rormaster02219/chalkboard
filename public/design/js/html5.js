// JavaScript Document

var e = ("abbr,article,aside,audio,canvas,datalist,details,figure,footer,header,hgroup,mark,menu,meter,nav,output,progress,section,time,video,figcaption,summary").split(',');

for (var i = 0; i < e.length; i++){
    document.createElement(e[i]);
}