$(function(){$('.modal').modal();$('select').material_select();$('select').not('.disabled').material_select();});$(function(){"use strict";$('.dropdown-button, .translation-button, .dropdown-menu').dropdown({inDuration:300,outDuration:225,constrainWidth:false,hover:false,gutter:0,belowOrigin:false,alignment:'right',stopPropagation:true});$('.notification-button, .profile-button, .dropdown-settings').dropdown({inDuration:300,outDuration:225,constrainWidth:false,hover:true,gutter:0,belowOrigin:true,alignment:'right',stopPropagation:false});if(is_touch_device()){$('.sidebar-collapse').sideNav({menuWidth:280,edge:'left',closeOnClick:true,menuOut:false});$(".sidebar-collapse i.material-icons").html("menu");}
else{$(".sidebar-collapse").click(function(){if($('.side-nav').hasClass("active")){$('.side-nav').removeClass("active");$('.side-nav').addClass("inactive");$('#main').css({"padding-left":"0px"},'slow');$('footer').css({"padding-left":"0px"},'slow');$(".sidebar-collapse i.material-icons").html("menu");$(".brand-logo").hide(500);$(".icon-formate").animate({"margin-left":"20px"},500);}
else{$('.side-nav').removeClass("inactive");$('.side-nav').addClass("active");$('#main').css({"padding-left":"280px"},'slow');$('footer').css({"padding-left":"280px"},'slow');$(".sidebar-collapse i.material-icons").html("close");$(".brand-logo").show(500);$(".icon-formate").animate({"margin-left":"280px"},500);}});}
var leftnav=$(".page-topbar").height();var leftnavHeight=window.innerHeight-leftnav;if(!$('#slide-out.leftside-navigation').hasClass('native-scroll')){$('.leftside-navigation').perfectScrollbar({suppressScrollX:true});}
function is_touch_device(){try{document.createEvent("TouchEvent");return true;}catch(e){return false;}}
if(is_touch_device()){$('#nav-mobile').css({overflow:'auto'})}});var count=0;var interval=setInterval(function(){count++;$('input:-webkit-autofill').siblings('label').addClass('active');if(count>500){clearInterval(interval);}},10);function eqHeightCol(eqhDiv){var highestBox=0;$(eqhDiv).each(function(){if($(this).height()>highestBox){highestBox=$(this).height();}});$(eqhDiv).height(highestBox);}
function openToast(getIds){$(getIds).animate({top:"0"});setTimeout(function(){$(getIds).animate({top:"-600px"});},5000);}
function closeToast(getIds){$(getIds).animate({top:"-600px"});}
var _gaq=_gaq||[];_gaq.push(['_setAccount','UA-245702-1']);_gaq.push(['_setDomainName','astrosage.com']);_gaq.push(['_trackPageview']);(function(){var ga=document.createElement('script');ga.type='text/javascript';ga.async=true;ga.src=('https:'==document.location.protocol?'https://':'http://')+'stats.g.doubleclick.net/dc.js';var s=document.getElementsByTagName('script')[0];s.parentNode.insertBefore(ga,s);})();function getEvents(tagvalue,tag){_gaq.push(['_trackEvent',tagvalue,tag]);}
$(document).ready(function(){$(".modules").click(function(){$(".open-divs").slideToggle();});});function AddReadMore(){var carLmt=160;var readMoreTxt=" ... Read More";var readLessTxt=" Read Less";$(".addReadMore").each(function(){if($(this).find(".firstSec").length)
return;var allstr=$(this).text();if(allstr.length>carLmt){var firstSet=allstr.substring(0,carLmt);var secdHalf=allstr.substring(carLmt,allstr.length);var strtoadd=firstSet+"<span class='SecSec'>"+secdHalf+"</span><span class='readMore'  title='Click to Show More'>"+readMoreTxt+"</span><span class='readLess' title='Click to Show Less'>"+readLessTxt+"</span>";$(this).html(strtoadd);}});}
function showLessMoreText(){var showChar=194;var ellipsestext="...";var moretext="Read More >";var lesstext="Read less";$('.as-ul').each(function(){var content=$(this).html();if(content.length>showChar){var c=content.substr(0,showChar);var h=content.substr(showChar,content.length-showChar);var html=c+'<span class="moreellipses">'+ellipsestext+'</span><span class="morecontent"><span>'+h+'</span>&nbsp;<a href="" class="read-more-link">'+moretext+'</a></span>';$(this).html(html);}});$(".read-more-link").click(function(){if($(this).hasClass("less")){$(this).removeClass("less");$(this).html(moretext);}else{$(this).addClass("less");$(this).html(lesstext);}
$(this).parent().prev().toggle();$(this).prev().toggle();return false;});}
function closeOpenSerPopup(b,a){setCookiesOpenServicePopup()}
function setCookiesOpenServicePopup(){document.cookie="clopenservice-popup=1"}
function getCookiesOpenServicePopup(){flag=0;findcookies="clopenservice-popup=1";var a=document.cookie.split(";");for(var b=0;b<a.length;b++){var d=a[b];if(d.indexOf(findcookies)!=-1){flag=1;break}}if(flag==1){return true}else{return false}}