
//通过类名，获取所有元素
function getElementsByClassName(n) {
    var classElements = [],allElements = document.getElementsByTagName('*');
    for (var i=0; i< allElements.length; i++ )
   {
       if (allElements[i].className == n ) {
           classElements[classElements.length] = allElements[i];
        }
   }
   return classElements;
}

//通过类名设置所有元素的innerHTML
function setOnClickByClass(name){
	
	var btnClassNameArr = document.getElementsByClassName(name);
	for(var i=0;i<btnClassNameArr.length;i++){
		vipbtnSpanChild=btnClassNameArr[i].querySelectorAll('span');
		vipBtnText=vipbtnSpanChild[0];
		vipBtnText.innerText=" 设为"+name;
		btnClassNameArr[i].onclick=function(){
			changeVIP(btnClassNameArr[i],vipBtnText,name);
		};
	}
	
	
}

//通过类名设置所有元素的innerHTML
function setInnerHTMLByClass(name){
	
	var btnClassNameArr = document.getElementsByClassName(name);
	for(var i=0;i<btnClassNameArr.length;i++){
		vipbtnSpanChild=btnClassNameArr[i].querySelectorAll('span');
		vipBtnText=vipbtnSpanChild[0];
		vipBtnText.innerText=" 设为"+name;
	}
	
}

//customer.jsp V
var changeStar=function(event,name){
	
	 var x=event.target; 
	 var i = x.value;
	 /*
	 alert("The id of the triggered element: "
			  + x.childNodes[1].nodeName+i);*/

	vipbtnSpanChild=x.querySelectorAll('span');
	spanObj=vipbtnSpanChild[0];  //!!!!不能用this
	
	if (i>0){
		spanObj.className = 'glyphicon glyphicon-star-empty';
		spanObj.innerHTML=" 设为"+name;
		x.value=0;
		document.getElementById("input-star").value = "0";
	}else{
		spanObj.className = 'glyphicon glyphicon-star';
		spanObj.innerHTML=" 取消"+name;
		x.value=1;
		document.getElementById("input-star").value = "1";
	}
	
}

//customer.jsp V
var changeVIP=function(event,name){
	
	 var x=event.target; 
	 var i = x.value;
	 /*
	 alert("The id of the triggered element: "
			  + x.childNodes[1].nodeName+i);*/

	vipbtnSpanChild=x.querySelectorAll('span');
	spanObj=vipbtnSpanChild[0];  //!!!!不能用this
	
	if (i>0){
		spanObj.className = 'glyphicon glyphicon-heart-empty';
		spanObj.innerHTML=" 设为"+name;
		x.value=0;
	}else{
		spanObj.className = 'glyphicon glyphicon-heart';
		spanObj.innerHTML=" 取消"+name;
		x.value=1;
	}
	
}

