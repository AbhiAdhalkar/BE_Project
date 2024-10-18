/**
 * 
 */

/*Helper function to extract the URL between the last / and before ? 
  If url is www.example.com/file.php?f_id=55 this function will return file.php 
 pseudo code: edit to match your url settings  
*/ 
function refineUrl()
{
    //get full url
    var url = window.location.href;
    //get url after/  
    var value = url;
    //get the part after before ?
    value  = value.split("?")[0];   
    return value;     
}

function showMsg(msg){
	
	var newUrl = refineUrl();
	window.history.pushState("object or string", "Title", newUrl );
	swal("Good Job..!", msg, "success");
}
function showMsgType(msg,type){
	
	var newUrl = refineUrl();
	window.history.pushState("object or string", "Title", newUrl );
	if(type==='success')
		swal("Good Job..!", msg, type);
	if(type==='error' )
		swal("Oops Something Goes Wrong", msg, type);
	if(type==='warning' )
		swal("Oops Something Goes Wrong", msg, type);
}
function isNumberKey(evt){
    var charCode = (evt.which) ? evt.which : event.keyCode
    if (charCode > 31 && (charCode < 48 || charCode > 57))
        return false;
    return true;
}