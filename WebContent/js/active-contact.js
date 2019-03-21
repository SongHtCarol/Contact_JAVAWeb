/**
 * 
 */
function viewDetail(event){
	var x = event.target;
	window.location.href="detail-contact.jsp";
}
function updateContact(event){
	var x = event.target;
	//alert(x.id);
}
function cancelBtn(event){
	var x = event.target;
	x.className = x.className+' disabled';// Disables visually
	console.log(x.className);
	x.setAttribute('disabled', true); // Disables visually + functionally

}
function viewVIP(event,cus_id){
	var x = event.target;

	$.post("getVIPInfo",{cusId:cus_id})
	console.log(cus_id);
	return true;
}
function cancelVIP(event){
	var x = event.target;
	x.className = x.className+' disabled';// Disables visually
	console.log(x.className);
	x.setAttribute('disabled', true); // Disables visually + functionally
}
function deleteContact(){
	var x = event.target;
}