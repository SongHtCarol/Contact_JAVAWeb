/**
 * 
 */

function goPage(pno,psize){
	var table = document.getElementById("my_table");
	var num = table.rows.length;
	console.log(num);
	var pageSize = psize;
	var totalPage = 0;
	
	if (num / pageSize > parseInt(num / pageSize)) {
        totalPage = parseInt(num / pageSize) + 1;
    } else {
        totalPage = parseInt(num / pageSize);
    }

	
	var currentPage = pno;//当前页数
    var startRow = (currentPage - 1) * pageSize + 2;//开始显示的行  1
    var endRow = currentPage * pageSize + 1;//结束显示的行   15
    endRow = (endRow > num) ? num : endRow;

  //遍历显示数据实现分页
    for (var i = 1; i < (num + 1); i++) {
        var irow = table.rows[i - 1];
        if(i==1)irow.style.display = "";
        else if (i >= startRow && i <= endRow) {
        	irow.style.display = "";
        } else {
            irow.style.display = "none";
        }
    }
    var tempStr = "";
    if(currentPage>1){
    	tempStr += "<li><a href=\"#\" onclick=\"goPage(" + (currentPage - 1) + "," + psize + ")\">&laquo;</a></li>";
    }else{
    	tempStr += "<li><a href=\"#\">&laquo;</a></li>";
    }
    console.log(totalPage);
    if (totalPage <= 4) {
        
        for (var j = 1; j <= totalPage; j++) {
        	if(j==currentPage)tempStr += "<li><a href=\"#\" style=\"color:black;\" onclick=\"goPage(" + j + "," + psize + ")\">" + j + "</a></li>";
        	else tempStr += "<li><a href=\"#\" onclick=\"goPage(" + j + "," + psize + ")\">" + j + "</a></li>";
        }
    } else {
    	
        if(currentPage>4){
        	for (var j = currentPage-3; j <= currentPage; j++) {
        		if(j==currentPage)tempStr += "<li><a href=\"#\" style=\"color:black;\" onclick=\"goPage(" + j + "," + psize + ")\">" + j + "</a></li>";
            	else tempStr += "<li><a href=\"#\" onclick=\"goPage(" + j + "," + psize + ")\">" + j + "</a></li>";
            }
        	
        }else{
        	for (var j = 1; j <= 4; j++) {
        		if(j==currentPage)tempStr += "<li><a href=\"#\" style=\"color:black;\" onclick=\"goPage(" + j + "," + psize + ")\">" + j + "</a></li>";
            	else tempStr += "<li><a href=\"#\" onclick=\"goPage(" + j + "," + psize + ")\">" + j + "</a></li>";
            }
        	
        }
    	
    }
    if (currentPage < totalPage) {
    	tempStr += "<li><a href=\"#\" onclick=\"goPage(" + (currentPage + 1) + "," + psize + ")\">&raquo;;</a></li>";
        
    } else {
        tempStr += "<li><a href=\"#\">&raquo;;</a></li>";
        
    }
    document.getElementById("myPage").innerHTML = tempStr;


	
}



function goLotPage(pno,psize){
	var myDiv = document.getElementById("s-draft-panel");
	var num = myDiv.children.length;
	console.log(num);
	var pageSize = psize;
	var totalPage = 0;
	
	if (num / pageSize > parseInt(num / pageSize)) {
        totalPage = parseInt(num / pageSize) + 1;
    } else {
        totalPage = parseInt(num / pageSize);
    }

	
	var currentPage = pno;//当前页数
    var startRow = (currentPage - 1) * pageSize + 1;//开始显示的行  1
    var endRow = currentPage * pageSize;//结束显示的行   15
    endRow = (endRow > num) ? num : endRow;

  //遍历显示数据实现分页
    for (var i = 1; i < (num + 1); i++) {
        var irow = myDiv.children[i - 1];
        
        if (i >= startRow && i <= endRow) {
        	irow.style.display = "";
        } else {
            irow.style.display = "none";
        }
    }
    var tempStr = "";
    if(currentPage>1){
    	tempStr += "<li><a href=\"#\" onclick=\"goLotPage(" + (currentPage - 1) + "," + psize + ")\">&laquo;</a></li>";
    }else{
    	tempStr += "<li><a href=\"#\">&laquo;</a></li>";
    }
    console.log(totalPage);
    if (totalPage <= 4) {
        
        for (var j = 1; j <= totalPage; j++) {
        	if(j==currentPage)tempStr += "<li><a href=\"#\" style=\"color:black;\" onclick=\"goLotPage(" + j + "," + psize + ")\">" + j + "</a></li>";
        	else tempStr += "<li><a href=\"#\" onclick=\"goLotPage(" + j + "," + psize + ")\">" + j + "</a></li>";
        }
    } else {
    	
        if(currentPage>4){
        	for (var j = currentPage-3; j <= currentPage; j++) {
        		if(j==currentPage)tempStr += "<li><a href=\"#\" style=\"color:black;\" onclick=\"goLotPage(" + j + "," + psize + ")\">" + j + "</a></li>";
            	else tempStr += "<li><a href=\"#\" onclick=\"goLotPage(" + j + "," + psize + ")\">" + j + "</a></li>";
            }
        	
        }else{
        	for (var j = 1; j <= 4; j++) {
        		if(j==currentPage)tempStr += "<li><a href=\"#\" style=\"color:black;\" onclick=\"goLotPage(" + j + "," + psize + ")\">" + j + "</a></li>";
            	else tempStr += "<li><a href=\"#\" onclick=\"goLotPage(" + j + "," + psize + ")\">" + j + "</a></li>";
            }
        	
        }
    	
    }
    if (currentPage < totalPage) {
    	tempStr += "<li><a href=\"#\" onclick=\"goLotPage(" + (currentPage + 1) + "," + psize + ")\">&raquo;;</a></li>";
        
    } else {
        tempStr += "<li><a href=\"#\">&raquo;;</a></li>";
        
    }
    document.getElementById("myPage").innerHTML = tempStr;


	
}