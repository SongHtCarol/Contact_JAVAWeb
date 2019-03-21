/**
 * 
 */
$(document).ready(function(){
	$("#create_date").val($.datepicker.formatDate('dd  MM  yy', new Date()));
});


function search(event,callback){
	var x=event.target;
	x.value='1';
	//document.getElementById('search-lot').value='1';
	console.log(x.value);

}

var is_post ;

function check(){

	var myform = document.add_form;
	var x = document.getElementById("which_submit").value;
	var search = document.getElementById("search-lot").value;
	if((search!="1")&&(x!="2")&&(x!="3")){
		for(var i=0; i<myform.elements.length; i++ ){
			
			if((myform.elements[i].value == "")&&
				(myform.elements[i].name!="effective_date")&&
				(myform.elements[i].name!="search-lot-id")){
			alert(myform.elements[i].name + "不能为空");
				myform.elements[i].focus();
				return false;
			 }
		}
	}return true;    // 表单中最后input提交标签用的是button类型，首先不提交表单，在js判断表单项都不为空时 再提交表单。
}

$(document).ready(function(){
  $("#save-contact").click(function(){
	  if(is_post == true)
    		$("#effective_date").val($.datepicker.formatDate('dd  MM  yy', new Date()));
	 console.log(document.getElementById("save-contact").value);
  });
});
		