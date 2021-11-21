<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>세부사항 팀원리스트</title>
<!-- base:css -->
<link rel="stylesheet"
	href="vendors/mdi/css/materialdesignicons.min.css">
<link rel="stylesheet" href="vendors/feather/feather.css">
<link rel="stylesheet" href="vendors/base/vendor.bundle.base.css">
<!-- endinject -->
<!-- plugin css for this page -->
<link rel="stylesheet"
	href="vendors/flag-icon-css/css/flag-icon.min.css" />
<link rel="stylesheet"
	href="vendors/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet"
	href="vendors/jquery-bar-rating/fontawesome-stars-o.css">
<link rel="stylesheet"
	href="vendors/jquery-bar-rating/fontawesome-stars.css">
<!-- End plugin css for this page -->
<!-- inject:css -->
<link rel="stylesheet" href="css/style.css">
<!-- endinject -->
<link rel="shortcut icon" href="images/favicon.png" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		$("#headerNav").load("partials/_navbar.html");
		$("#sidebar").load("partials/_sidebar.html");
		$("#footer").load("partials/_footer.html");
		$("#contents").load("contents/mainPage.html");
	});
</script>
<!-- base:js -->
<script src="vendors/base/vendor.bundle.base.js"></script>
<!-- endinject -->
<!-- Plugin js for this page-->
<!-- End plugin js for this page-->
<!-- inject:js -->
<script src="js/off-canvas.js"></script>
<script src="js/hoverable-collapse.js"></script>
<script src="js/template.js"></script>
<!-- endinject -->
<!-- plugin js for this page -->
<script src="vendors/chart.js/Chart.min.js"></script>
<script src="vendors/jquery-bar-rating/jquery.barrating.min.js"></script>
<!-- End plugin js for this page -->
<!-- Custom js for this page-->
<script src="js/dashboard.js"></script>
<!-- End custom js for this page-->

<style>
form .btn:hover{
	background-color: #1e2b37;
	border-color: #1e2b37;
}

form .btn {
	background-color: #2C3E50;
	border-color: #2C3E50;
	color: white;
}
</style>
</head>

<body>
<c:forEach items="${memberList }" var="memberList">
<div class="card mb-3" style="max-width: 540px;">
  <div class="row g-0">
    <div class="col-md-4"  style="float:left;">
      <img src="/resources/euploadFiles/${memberList.empFileReName }" class="img-fluid rounded-start" alt="..." style="float:left; width: 200px; height: 200px;">
    </div>
    <div class="col-md-8">
      <div class="card-body">
        <h5 class="card-title">${memberList.empName}</h5>
        <p class="card-text">${memberList.deptName}</p>
        <p class="card-text">${memberList.empJob}<small class="text-muted"></small></p>
        <c:if test="${loginEmployee.empNo eq memberList.empNo}">
        <button class="btn btn-primary" onclick="successDetailTask(this)">완료</button>
        <input type="hidden" value="${memberList.empNo}" name="empNo">
        </c:if>
      </div>
    </div>
  </div>
</div>
</c:forEach>

<script>
	function successDetailTask(data) {
		console.log(data.nextSibling.nextSibling.value)
		var empNo = data.nextSibling.nextSibling.value;
		$.ajax({
			url:"successDetailTask.do?taskNo=${taskNo}&projectNo=${project.projectNo}",
			type:"post",
			data:{
				"empNo":empNo
			},
			success:function(data){
				if(data =="success"){
					alert("완료 체크되었습니다")
				}else{
					alert("오류가 발생했습니다")
				}
			},
			error:function(){
				alert("아예실패")
			}
					
		})
	}
</script>
</body>
</html>