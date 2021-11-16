<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>일정추가</title>
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
</head>
<body>
	<form action="insertProjectCalendar.do" method="get" onsubmit="return false">
		<input type="hidden" value="${projectNo}" name="projectNo" id="projectNo">
		<div class="mb-3">
			<label for="exampleInputEmail1" class="form-label"> 일정제목 </label> <input
				type="text" class="form-control" id="eventTitle" name="eventTitle"
				aria-describedby="emailHelp">
		</div>
		<div class="mb-3">
			<label for="exampleInputPassword1" class="form-label">시작날짜</label> 
			<input type="date" class="form-control" id="startTime" name="startTime">
			<input type="time" class="form-control" id="startTimeDetail" name="startTimeDetail">	
		</div>
		<div class="mb-3">
			<label for="exampleInputPassword1" class="form-label">마감 날짜</label> 
			<input type="date" class="form-control" id="endTime"  name="endTime">
			<input type="time" class="form-control" id="endTimeDetail" name="endTimeDetail">	
		</div>
		<button type="button" class="btn btn-primary" onclick="insertEmpCalendar()">추가</button>
	</form>
	<script>
		function insertEmpCalendar() {
			var eventTitle = document.getElementById('eventTitle').value;
			var startTime = document.getElementById('startTime').value;
			var startTimeDetail = document.getElementById('startTimeDetail').value;
			var endTime = document.getElementById('endTime').value;
			var endTimeDetail = document.getElementById('endTimeDetail').value;
			$.ajax({
				url:"insertProjectCalendar.do?projectNo=${projectNo}",
				type:"get",
				data:{
					"eventTitle":eventTitle,
					"startTime":startTime,
					"startTimeDetail":startTimeDetail,
					"endTime":endTime,
					"endTimeDetail":endTimeDetail
				},
				success: function(data) {
					console.log(data);
					if(data=="success"){
						alert("일정이 등록되었습니다")
						window.opener.location.reload();
					}else{
						alert("등록이 실패했습니다")
					}
				},
				error:function(){
					alert("오류발생!")
				}
			});
		}
	</script>
</body>
</html>