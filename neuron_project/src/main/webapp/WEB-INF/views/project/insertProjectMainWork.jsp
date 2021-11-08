<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>대표업무 등록</title>
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
	<div class="container-scroller">
		<!-- partial:partials/_navbar.html 해더 창 -->
		<jsp:include page="../projectCommon/navbar.jsp"></jsp:include>
		<!-- partial -->
		<div class="container-fluid page-body-wrapper">
			<!-- partial:partials/_sidebar.html 사이드 바  -->
			<jsp:include page="../projectCommon/sidebar.jsp"></jsp:include>
			<!-- partial -->
			<div class="main-panel">
				<div class="content-wrapper" id="contents">
					<form>
						<div style="height: 10%">
							<h1>대표업무 제목</h1>
							<div class="input-group mb-3">
								<input type="text" class="form-control"
									aria-label="Sizing example input"
									aria-describedby="inputGroup-sizing-default"
									placeholder="제목을 입력해 주세요">
							</div>
						</div>
						<div style="height: 80%" id="taskForm">
							<div style="height: 100%;" id="taskInfo">
								<h1>세부사항 제목</h1>
								<button type="button" class="btn btn-primary btn-sm"
									onclick="insertTask()" id="insertMaikWorkTask">추가</button>
									<br><br>
								<div class="input-group mb-3">
									<input type="text" class="form-control"
										aria-label="Sizing example input"
										aria-describedby="inputGroup-sizing-default"
										placeholder="제목을 입력해 주세요">
								</div>
									<button type="button" class="btn btn-primary btn-sm" onclick="insertTaskMember()">팀원
										할당</button>
							<div
								style="width: 100%; border: 1px solid #1e2b37; height: 500px; overflow: auto"
								id="mainWorkMemberList"></div>
							</div>
						</div>
						<div style="height: 10%">
							<input class="btn btn-primary" type="submit" value="등록">
							<input class="btn btn-primary" type="reset" value="취소">
						</div>
					</form>
				</div>
				<!-- partial:partials/_footer.html -->
				<jsp:include page="../projectCommon/footer.jsp"></jsp:include>
				<!-- partial -->
			</div>
			<!-- main-panel ends -->
		</div>
		<!-- page-body-wrapper ends -->
	</div>
	<!-- container-scroller -->
	<script>
	
		function insertTask() {
			console.log("여기론오니")
			var task = document.createElement('div');
			var memberList = document.getElementById('mainWorkMemberList');
			var memberList1 = memberList.cloneNode();
			
			//var deleteTask = document.createElement("<input type='button' value='삭제' onclick='deleteTask(this)'  id='deleteMainWorkTask'/>");
			//var insertTask = document.getElementById('insertMaikWorkTask');
			var taskInfo = document.getElementById('taskInfo');
			var taskInfo1 = taskInfo.cloneNode();
// 			var taskInfo = "<div style=\"height: 30%;\" id=\"taskInfo\">";
// 			taskInfo += "<h1>세부사항 제목</h1>";
// 			taskInfo += "<button type=\"button\" class=\"btn btn-primary btn-sm\"
// 			onclick=\"insertTask()\" id=\"insertMaikWorkTask\">추가</button>";
// 			taskInfo += "<div class=\"input-group mb-3\">";
// 			taskInfo += "<input type=\"text\" class=\"form-control\"
// 			aria-label=\"Sizing example input\"
// 				aria-describedby=\"inputGroup-sizing-default\"
// 				placeholder=\"제목을 입력해 주세요\">";
// 			taskInfo += "<button type=\"button\" class=\"btn btn-primary btn-sm\">팀원
// 			할당</button>";
// 			taskInfo += "</div>";
// 			taskInfo += "</div>";
			
			taskInfo1.innerHTML +="<h1>세부사항 제목</h1>"
			taskInfo1.innerHTML += "<button type='button' class='btn btn-primary btn-sm' value='삭제' onclick ='deleteTask(this)'>삭제</button>"
			taskInfo1.innerHTML += "<div class='input-group mb-3'>"
			taskInfo1.innerHTML += "<input type='text' class='form-control' placeholder='제목을 입력해주세요'aria-label='Sizing example input' aria-describedby='inputGroup-sizing-default' />"
			taskInfo1.innerHTML += "<button type='button' class='btn btn-primary btn-sm'>팀원할당</button>"
			taskInfo1.innerHTML += "</div>"
			taskInfo1.innerHTML += "<div style='width: 100%; border: 1px solid #1e2b37; height: 500px; overflow: auto' id='mainWorkMemberList'></div>"
			task.innerHTML = taskInfo1.innerHTML
//			taskInfo1 += "<button type='button' valued='삭제' onclick='deleteTask(this)'>삭제</button>"
			//taskInfo1.replaceChild(deleteTask, insertTask);
		    document.getElementById('taskForm').appendChild(taskInfo1);
//		    document.getElementById('taskForm').appendChild(memberList1);
		


		}

		
		
		function deleteTask(id) {
			console.log("삭제");
			console.log(id);
			var parent = id.parentNode;
			console.log(parent);
			var mainWorkDetail = document.getElementById('mainWorkMemberList');
			console.log(mainWorkDetail);
			parent.parentNode.removeChild(parent);
			
			
			
		}
		
		function  insertTaskMember() {
			var url = "moveTaskMember.do";
			var name = "팀원 할당";
			var option = "width = 1000, height = 800, top = 300 , left = 650, location = no, toolbars = no, status = no, scrollbars = no, resizable = no";
			window.open(url, name, option);
		}
	</script>
</body>

</html>