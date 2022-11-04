







 $(document).ready(function() {		
 
        $('#emailaddresses').hide();   
             
        $('#shareurlchkbox').click(function() {
            $('#emailadd').val('');
            $('#emailaddresses').toggle();
            $('#emailadd').focus();
            
            	if(document.querySelector('#shareurlchkbox').checked){                 	   
                	$(".done-shcrt").hide();
                	$(".share-shcrt").show('fast', function () {$(".share-shcrt").click(function () {sharingchart();});});    
                	$(".cancel-shcrt").show('fast', function () {                				
                    	$(".cancel-shcrt").click(function () {
                        	$('#emailaddresses').hide();
                       		$(".share-shcrt").hide();
                       		$(".cancel-shcrt").hide();
                       		$(".done-shcrt").show('fast', function () {$(".done-shcrt").click(function () {sharingchart();});});
 							$('#shareurlchkbox').prop('checked',false);     
                   		});                    
                	});              
                          
            }
            
            else
            {  
                 $(".share-shcrt").hide();
                 $(".cancel-shcrt").hide();
                 $(".done-shcrt").show('fast', function () {$(this).click(function() {sharingchart();});});
            }
            
        });
        
       
                 $('#shareurlchkbox').show();              
                 $(".share-shcrt").hide();
                 $(".cancel-shcrt").hide();                 
                 $(".done-shcrt").show('fast', function () {$(this).click(function() {sharingchart();});});    
            
    });
       
      function sharingchart(){     
      
        $('#pleasewait').html('<div class="progress"><div class="indeterminate"></div></div>');
                
        radiobtnlen = document.frmShareChart.radiobtn.length

        for (i = 0; i < radiobtnlen; i++) {
            if (document.frmShareChart.radiobtn[i].checked) {
                choose = document.frmShareChart.radiobtn[i].value;
            }
        }

        if (choose == "shared") {
        
            if ($('#chartNameshare').val() != "") {
                querystringurl = "chartName=" + $('#chartNameshare').val();
                var ChartNameAvailability = IschartNameExist();
                if (ChartNameAvailability) {
                
                    if (document.querySelector('#shareurlchkbox').checked) {
                        if (validateEmailAddresses()) {
                        
                            $(".done-shcrt").hide();
                            $(".cancel-shcrt").hide();
                            $(".share-shcrt").hide();
                            
                            $('#emailsharedurl').hide();
                            $.get('control/ajax-updatechartsharesettings.jsp', querystringurl, function(data) {
                            //alert(emailshareURL()+","+data);
                                if (data.trim() == "1" && emailshareURL()) {
                                    document.getElementById('chartNameAvailablitypublic').innerHTML = "";
                                    document.getElementById('chartNameAvailablitypublic').style.display = 'none';
                                    
                                    $(".done-shcrt").show();
                                $(".done-shcrt").click(function(){
                                	sharingchart();
                                	$("#dialog-form-share").modal('close');
                                });
                                
                                    $('#emailsharedurl').show();
                                    $('#shareurlchkbox').prop('checked',false);
                                    $('#emailaddresses').hide();
                                    showSuccessMessage('ஜாதக வரைபடம் வெற்றிகரமாக பகிர்ந்துகொள்ளபட்டது', 'confirmmsg');
                                   
                                }
                                else {
                                    if (data.trim() == "0") {
                                        showWarningMessage('அறியப்படாத பிழை. தயவு செய்து மீண்டும் முயற்சிக்கவும். ', 'confirmmsg');
                                    }
                                    else {
                                        if (data.trim() == "2") {
                                            showWarningMessage('ஜாதக வரைபடம் பகிர்ந்துகொள்ளப்பட வில்லை. தயவு செய்து மீண்டும் முயற்சிக்கவும்', 'confirmmsg');
                                        }
                                        else {
                                            showWarningMessage('உங்கள் கால அளவு முடிந்துவிட்டது. தயவு செய்து மீண்டும் உள்நுழைக (லாகின்) ', 'confirmmsg');
                                        }
                                    }
                                }
                            });
                        }
                    }
                    else {
                        $(".done-shcrt").hide();
                        
                        $('#emailsharedurl').hide();
                        $.get('control/ajax-updatechartsharesettings.jsp', querystringurl, function(data) {
                            if (data.trim() == "1") {
                                $(".done-shcrt").show();
                                $(".done-shcrt").click(function(){
                                	sharingchart();
                                });
                                $('#emailsharedurl').show();
                                $('#shareurlchkbox').prop('checked',false);
                                $('#emailaddresses').hide();
                                showSuccessMessage('ஜாதக வரைபடம் வெற்றிகரமாக பகிர்ந்துகொள்ளபட்டது', 'confirmmsg');
                                $("#dialog-form-share").modal('close');
                            }
                            else {
                                if (data.trim() == "0") {
                                    showWarningMessage('அறியப்படாத பிழை. தயவு செய்து மீண்டும் முயற்சிக்கவும். ', 'confirmmsg');
                                }
                                else {
                                    if (data.trim() == "2") {
                                        showWarningMessage('ஜாதக வரைபடம் பகிர்ந்துகொள்ளப்பட வில்லை. தயவு செய்து மீண்டும் முயற்சிக்கவும்', 'confirmmsg');
                                    }
                                    else {
                                        showWarningMessage('உங்கள் கால அளவு முடிந்துவிட்டது. தயவு செய்து மீண்டும் உள்நுழைக (லாகின்) ', 'confirmmsg');
                                    }
                                }
                            }
                        });
                        document.getElementById('chartNameAvailablitypublic').innerHTML = "";
                        document.getElementById('chartNameAvailablitypublic').style.display = 'none';
                    }                                    
                }
            }
            else {
                showWarningMessage('தயவு செய்து முதலில்  ஜாதகவரைபடத்தின் பெயரை உள்ளிடவும்.  <!-- js-> sharechartpublicly-js.asp -->', 'confirmmsg');
            }
        }
        if (choose == "private") {          
            $('#chartNameshare').val('');
            $(".done-shcrt").show();
            $(".cancel-shcrt").hide();
            $(".share-shcrt").hide();
                            
            querystringurl = "chartName=" + $('#chartNameshare').val();
            $.get('control/ajax-updatechartsharesettings.jsp', function(data) {
                if (data == 1) {
                    $('#emailsharedurl').show();
                    $('#shareurlchkbox').prop('checked',false);
                    $('#emailaddresses').hide();
                    showSuccessMessage('null', 'confirmmsg');
                    $("#dialog-form-share").modal('close');
                }
                else {
                    if (data == 0) {
                        showWarningMessage('அறியப்படாத பிழை. தயவு செய்து மீண்டும் முயற்சிக்கவும். ', 'confirmmsg');
                    }
                    else {
                        if (data == 2) {
                            showWarningMessage('null', 'confirmmsg');
                        }
                        else {
                            showWarningMessage('உங்கள் கால அளவு முடிந்துவிட்டது. தயவு செய்து மீண்டும் உள்நுழைக (லாகின்) ', 'confirmmsg');
                        }
                    }
                }
            });
            }
            }
            
 function openShareChart() {
            $('#shareurlchkbox').attr('checked', false);
            $('#emailaddresses').hide();
            getreval = getSessionData();
            //alert(getreval)
            if (getreval=="false") {
                openLoginForm();
            }
            else {                
                fillSharedChartName();
                $('#pleasewait').html('');
                $("#dialog-form-share").modal('open');
            }
        }




 function showUrlDiv(status){ 
 	document.getElementById("ChartNamePublic").style.visibility = status;
 } 
   function updateUrlPath() {
            if (document.getElementById("chartNameshare").value == "") {
                document.getElementById('chartNameAvailablitypublic').style.display = 'none';
            }

            var pathvalpublic = document.getElementById("chartNameshare").value;
            pathvalpublic = pathvalpublic.toLowerCase();
            document.getElementById("lblPathpublictext").value = "http://k.astrosage.com/" + pathvalpublic;
        }
        

 function IschartNameExist(){  	
if ($("#chartNameshare").val() == "") { 
	showWarningMessage('தயவு செய்து முதலில்  ஜாதகவரைபடத்தின் பெயரை உள்ளிடவும்.  <!-- js-> sharechartpublicly-js.asp -->', 'confirmmsg');

} 
else { 
if (checkForValidChartName()) { 
var value = (function() { 
var val = null; $.ajax( { 
'async': false, 
'global': false, 
'url': 'control/ajax-getchartname.jsp', 
'data': ({ chartname: $("#chartNameshare").val(), chartid: '94840963'}), 
'success': function(data) { val = data.trim(); } }); 
return val;
})(); 

if (value == "1") { $('#confirmmsg').html('');
document.getElementById('chartNameAvailablitypublic').style.color ="#5A7B20";
document.getElementById('chartNameAvailablitypublic').style.fontWeight ="bold";
document.getElementById('chartNameAvailablitypublic').style.fontSize ="12"; 
document.getElementById('chartNameAvailablitypublic').innerHTML = 'ஜாதகவரைபடத்தின் பெயர் கிடைக்கும்.  <!-- js-> sharechartpublicly-js.asp -->',
document.getElementById('chartNameAvailablitypublic').style.display ='block'; return true; 
} 
else { 
$('#pleasewait').html('');
$('#confirmmsg').html('');
document.getElementById('chartNameAvailablitypublic').style.color = "#CC0000";
document.getElementById('chartNameAvailablitypublic').style.fontWeight = "bold";
document.getElementById('chartNameAvailablitypublic').style.fontSize = "12"; 
document.getElementById('chartNameAvailablitypublic').innerHTML = 'ஜாதகவரைபடத்தின் பெயர் இல்லை.   <!-- js-> sharechartpublicly-js.asp -->',
document.getElementById('chartNameAvailablitypublic').style.display = 'block'; return false; 
} 
} 
} 
}

        

 function checkForValidChartName() {

        var currchartname = $("#chartNameshare").val();
       
        var firstcharcurrchartname = currchartname.substr(0, 1);
        var lastcharcurrchartname = currchartname.substr((currchartname.length)-1, 1);

        if ((firstcharcurrchartname.charCodeAt() >= 48 && firstcharcurrchartname.charCodeAt() <= 57) || (firstcharcurrchartname.charCodeAt() == 45)) { 
            $('#chartNameAvailablitypublic').html('');
            showWarningMessage('ஜாதகவரைபடத்தின் பெயரை இலக்கம் அல்லது சிறுகோட்டுடன் (“-“ ஹைபன்) தொடங்க முடியாது', 'confirmmsg');
        }
        else {
            if (lastcharcurrchartname.charCodeAt() == 45) {
                $('#chartNameAvailablitypublic').html('');
                showWarningMessage('ஜாதகவரைபடத்தின் பெயரை சிறுகோட்டுடன் (- ஹைபன்) முடிக்க முடியாது', 'confirmmsg');
            }
            else {
                var rexp = /^[A-Za-z0-9-]*$/;
                if (currchartname.search(rexp) == 0) {              
                    return true;
                }
                else {
                    $('#chartNameAvailablitypublic').html('');
                    
                    showWarningMessage('தயவு செய்து சரியான ஜாதகவரைபடத்தின் பெயரை உள்ளிடவும்', 'confirmmsg');
                   
                    return false;
                }
            }
        }
    }
    

function fillSharedChartName() {
var value = (function() { 
	var val = null; 
	$.ajax({ 
	'async': false,
	'global': false, 
	'url': 'control/ajax-publicchartname.jsp', 
	'data': ({ chartid: '94840963' }), 
	'success': function(data) { 
	//alert(data+"neha"); 
	val = data.trim(); 
	if((data.trim() != "") && (data!="You are not authorized to view this page.")) { 
		document.getElementById('chartNameshare').value = data;
		document.getElementById('radioShared').checked = true;
		document.getElementById('ChartNamePublic').style.visibility = 'visible';
	} 
	else { 
	// alert("getrandomchartname");
	document.getElementById('radioPrivate').checked = true;
	document.getElementById('ChartNamePublic').style.visibility = 'hidden';
	$.get('control/getrandomchartname.jsp', function(data) { 
	//alert(data);
	if (data == "0") { 
	window.location.href = "basicdetails.jsp" 
	} 
	else if(data == "1") { 
	} 
	else { 
	document.getElementById('chartNameshare').value = data; 
	} 
	}); 
	} 
	} 
	}); 
	return val; 
	})
	(); 
	} 


 function getSessionData() {
            var sessionval;
            var useridsession;
            var chartidsession;
            var planid;
            var horoscopesession;
            var returnvalue = (function() {
                var reval = null;
                $.ajax({
                    'async': false,
                    'global': false,
                    'url': 'control/getsession.jsp',
                    'success': function(data) {
                    //alert(data);
                        sessionval = data.split("|");
                        useridsession = sessionval[0];
                        chartidsession = sessionval[1];
                        planid = sessionval[2];
                        horoscopesession = sessionval[3];
                        reval = chartidsession;
                    }
                });
                return reval;
            })();            
            return returnvalue;
        }




 function validateEmailAddresses(){ 
 
 	if ($('#emailadd').val() == "") {
		showWarningMessage('தயவு செய்து மின்னஞ்சல் முகவரிகளைச் சேர்க்கவும்  ', 'confirmmsgsecond'); 
		return false; 
		}
	else { 
		emailval = $('#emailadd').val(); 
		if((emailval.indexOf("<")>-1) || (emailval.indexOf(">")>-1)) { 
			showWarningMessage('Please remove "<" or ">" from email addresses', 'confirmmsgsecond'); 
			return false; 
		} 
		else{
		emailaddress = $('#emailadd').val(); emailaddressarr = emailaddress.split(","); var sendemailto = ''; 
		for (var i = 0; i < emailaddressarr.length; i++) { 
			if(emailcheck($.trim(emailaddressarr[i])) == false) {
				$('#emailadd').focus(); 
				return false; 
				} 
			} 
		return true; 
		} 
	} 
} 

function emailshareURL() { 
	var sendemailaddto = ''; 
	emailaddress = $('#emailadd').val(); emailaddress = emailaddress + ","; emailaddressarr = emailaddress.split(","); 
	for (var i = 0; i < emailaddressarr.length; i++) { 
		sendemailaddto = sendemailaddto + $.trim(emailaddressarr[i]) + ','; 
	} 
		sendemailaddto = sendemailaddto.substr(0, (sendemailaddto.length - 1)) 
	
	sendingurl = "emailadd=" + sendemailaddto + "&sharedurl=" +$('#lblPathpublictext').val() + "&sendername=" + 'Karthick' +"&isuseridsessionexist=" + 'null'+"&loginname="+'';
	var reval = null; 
	$.ajax({ 
		'async': false, 
		'global': false, 
		'url': 'control/shareurlemailsend.jsp', 
		'data': sendingurl, 
		'success': function(data) { 
				 reval = data.trim(); 
		} 
	}); 
if (reval == '1') 
	return true; 
else 
	return false; 
} 


 function emailcheck(str) {
            var at = "@"
            var dot = "."
            var lat = str.indexOf(at)
            var lstr = str.length
            var ldot = str.indexOf(dot)

            if (str.indexOf(at) == -1) {
                showWarningMessage('செல்லுபடியாகும் மின்னஞ்சல் முகவரியை உள்ளிடவும். ', 'confirmmsgsecond');
                return (false);
            }

            if (str.indexOf(at) == -1 || str.indexOf(at) == 0 || str.indexOf(at) == lstr) {
                showWarningMessage('செல்லுபடியாகும் மின்னஞ்சல் முகவரியை உள்ளிடவும். ', 'confirmmsgsecond');
                return (false);
            }

            if (str.indexOf(dot) == -1 || str.indexOf(dot) == 0 || str.indexOf(dot) == lstr) {
                showWarningMessage('செல்லுபடியாகும் மின்னஞ்சல் முகவரியை உள்ளிடவும். ', 'confirmmsgsecond');
                return (false);
            }

            if (str.indexOf(at, (lat + 1)) != -1) {
                showWarningMessage('செல்லுபடியாகும் மின்னஞ்சல் முகவரியை உள்ளிடவும். ', 'confirmmsgsecond');
                return (false);
            }

            if (str.substring(lat - 1, lat) == dot || str.substring(lat + 1, lat + 2) == dot) {
                showWarningMessage('செல்லுபடியாகும் மின்னஞ்சல் முகவரியை உள்ளிடவும். ', 'confirmmsgsecond');
                return (false);
            }

            if (str.indexOf(dot, (lat + 2)) == -1) {
                showWarningMessage('செல்லுபடியாகும் மின்னஞ்சல் முகவரியை உள்ளிடவும். ', 'confirmmsgsecond');
                return (false);
            }

            if (str.indexOf(" ") != -1) {
                showWarningMessage('செல்லுபடியாகும் மின்னஞ்சல் முகவரியை உள்ளிடவும். ', 'confirmmsgsecond');
                return (false);
            }

            return true
        }
        

function showSuccessMessage(msg, divid) {
            $('#pleasewait').html('');
            $('#' + divid).show();
            $('#' + divid).html('<div class="center-align alert alert-success">' + msg + '</div>');
            $('#' + divid).addClass('dialog-msg');
            setTimeout(function() { $('#' + divid).hide(); }, 5000);
        }
function showWarningMessage(msg, divid) {
            $('#pleasewait').html('');
            $('#' + divid).show();
            $('#' + divid).html('<div class="center-align alert alert-danger">' + msg + '</div>');
            $('#' + divid).addClass('dialog-msg');
            setTimeout(function() { $('#' + divid).hide(); }, 5000);
        }


    




