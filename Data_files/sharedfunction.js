function showNotification(mesg){$("span#Notification").addClass("notify");$("#Notification").html("<b><font color=black>"+mesg+"</font></b>").fadeOut(20000);}
function limitchar(){if(document.getElementById("suggestion").value.length>500){document.getElementById("suggestion").value=document.getElementById("suggestion").value.substring(0,500);}
else{document.getElementById("lengthoftext").innerHTML=500-parseInt(document.getElementById("suggestion").value.length);}}
function limitcharById(elementId,spanId,totallength){if(document.getElementById(elementId).value.length>totallength){document.getElementById(elementId).value=document.getElementById(elementId).value.substring(0,totallength);}
else{document.getElementById(spanId).innerHTML=totallength-parseInt(document.getElementById(elementId).value.length);}}
function filtercomments(textAreaId){Comments=$('#'+textAreaId).val();$('#'+textAreaId).val(Comments.replace(/(<([^>]+)>)/ig,""));}
function showUserMsg(usermsg){$('.showmessage').html('<b>'+usermsg+'</b>').addClass('ui-state-highlight');setTimeout(function(){$('.showmessage').html('&nbsp;');$('.showmessage').removeClass('ui-state-highlight');},5000);return false;}
function isUserIdExist(userid){if(userid!=""){var value=(function(){var responsetext=null;$.ajax({'async':false,'global':false,'url':'control/isuseridexist.asp','data':({userid:userid}),'success':function(data){responsetext=data;}});return responsetext;})();}
return value;}