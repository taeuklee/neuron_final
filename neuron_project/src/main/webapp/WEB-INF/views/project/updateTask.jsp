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
<title>세부사항 수정</title>
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
form .btn:hover {
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
		<!-- partial -->
		<div class="container-fluid page-body-wrapper">
			<!-- partial:partials/_sidebar.html 사이드 바  -->
			<!-- partial -->
			<div class="main-panel">
				<div class="content-wrapper" id="contents">
					<form action="updateTask.do" method="post" id="taskForm">
						<input type="hidden" name="projectNo"
							value="${project.projectNo }"> <input type="hidden"
							name="taskNo" value="${taskDetail.taskNo }"> <input
							type="hidden" name="taskDetailNo"
							value="${taskDetail.taskDetailNo }">
						<div style="height: 90%" id="taskForm2">
							<div style="height: 100%;" id="taskInfo">
								<h1>세부사항 제목</h1>
<!-- 								<button type="button" class="btn btn-primary btn-sm" -->
<!-- 									onclick="insertTask()" id="insertMaikWorkTask">추가</button> -->
								<input class="btn btn-primary btn-sm" type="submit" value="수정">
								<br> <br>
								<div class="input-group mb-3">
									<input type="text" class="form-control"
										aria-label="Sizing example input"
										aria-describedby="inputGroup-sizing-default"
										placeholder="제목을 입력해 주세요" name="taskName" id="taskName"
										value="${taskDetail.taskDetailTitle}">
								</div>
								<button type="button" class="btn btn-primary btn-sm"
									onclick="insertTaskMember(this, 0)">팀원 할당</button>
								<div
									style="width: 70%; border: 1px solid #1e2b37; height: 500px; overflow: auto; margin-bottom: 20px;"
									id="mainWorkMemberList0">
									<c:forEach items="${memberList }" var="memberList">
										<div class="card mb-3" style="max-width: 540px;">
											<div class="row g-0">
												<div class="col-md-4" style="float: left;">
													<img
														src="/resources/euploadFiles/${memberList.empFileReName }"
														class="img-fluid rounded-start" alt="..."
														style="float: left; width: 200px; height: 200px;">
												</div>
												<div class="col-md-8">
													<div class="card-body">
														<input type="hidden" value="${memberList.empNo }"
															name="empNo">
														<h5 class="card-title">${memberList.empName}</h5>
														<p class="card-text">${memberList.deptName}</p>
														<p class="card-text">${memberList.empJob}<small
																class="text-muted"></small>
														</p>
														<button type='button' class='btn btn-primary' id='choice'
															onclick='deleteEmp(this)'>삭제</button>
													</div>
												</div>
											</div>
										</div>
									</c:forEach>
								</div>
							</div>
						</div>
						<!-- 						<input type="date" name="endTime"> -->
						<!-- 						<div style="height: 10%"> -->
						<!-- 							<input class="btn btn-primary" type="submit" value="등록"> -->
						<!-- 							<input class="btn btn-primary" type="reset" value="취소"> -->
						<!-- 						</div> -->
					</form>
				</div>
				<!-- partial:partials/_footer.html -->
				<!-- partial -->
			</div>
			<!-- main-panel ends -->
		</div>
		<!-- page-body-wrapper ends -->
	</div>
	<!-- container-scroller -->
	<script>
		var count = 1;
		function insertTask() {
			console.log("여기론오니")
			var task = document.createElement('div');
			var memberList = document.getElementById('mainWorkMemberList0');
			var memberList1 = memberList.cloneNode();

			//var deleteTask = document.createElement("<input type='button' value='삭제' onclick='deleteTask(this)'  id='deleteMainWorkTask'/>");
			//var insertTask = document.getElementById('insertMaikWorkTask');
			var taskInfo = document.getElementById('taskInfo');
			var taskInfo1 = taskInfo.cloneNode();
			var taskForm = document.getElementById('taskForm');
			var taskForm1 = taskForm.cloneNode();
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
			console.log(taskForm1);
			taskForm1.innerHTML += "<div style='height: 90%' id='taskForm2'>"
			taskForm1.innerHTML += "<div style='height: 100%;' id='taskInfo'>"
			taskForm1.innerHTML += "<h1>세부사항 제목</h1>"
			taskForm1.innerHTML += "<button type='button' class='btn btn-primary btn-sm' value='삭제' onclick ='deleteTask(this)'>삭제</button>&nbsp"
			taskForm1.innerHTML += "<input class='btn btn-primary btn-sm' type='submit' value='등록' onclick='insertMainWorkTask(this)'>"
			taskForm1.innerHTML += "<div class='input-group mb-3'>"
			taskForm1.innerHTML += "<input type='text' class='form-control' placeholder='제목을 입력해주세요'aria-label='Sizing example input' aria-describedby='inputGroup-sizing-default' name='taskName' />"
			taskForm1.innerHTML += "<button type='button' class='btn btn-primary btn-sm' onclick='insertTaskMember(this,"
					+ count + ")'>팀원할당</button>"
			taskForm1.innerHTML += "</div>"
			taskForm1.innerHTML += "<div style='width: 50%; border: 1px solid #1e2b37; height: 500px; overflow: auto; margin-bottom:20px;' id='mainWorkMemberList"
					+ count + "'></div>"
			taskForm1.innerHTML += "</div>"
			taskForm1.innerHTML += "</div>"
			console.log(taskForm1);
			task.appendChild(taskForm1);
			console.log(task);
			//			taskInfo1 += "<button type='button' valued='삭제' onclick='deleteTask(this)'>삭제</button>"
			//taskInfo1.replaceChild(deleteTask, insertTask);
			document.getElementById('contents').appendChild(task);
			//		    document.getElementById('taskForm').appendChild(memberList1);
			count += 1;

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

		function deleteEmp(id) {
			var grandParent = id.parentNode.parentNode.parentNode.parentNode.parentNode;
			var parent = id.parentNode.parentNode.parentNode.parentNode;
			var insertProjectForm = document
					.getElementById('insertProjectForm');
			//var hidden = id.nextSibling;
			//console.log(hidden);
			grandParent.removeChild(parent);
		}

		function insertTaskMember(data, divNum) {
			//console.log(data.nextSibling.nextSibling)
			//var list = data.nextSibling.nextSibling.innerHTML;

			var url = "moveTaskMember.do?projectNo=${project.projectNo}&count="
					+ divNum;
			var name = "팀원 할당";
			var option = "width = 1000, height = 800, top = 300 , left = 650, location = no, toolbars = no, status = no, scrollbars = no, resizable = no";
			var page = window.open(url, name, option);
			//page.document.getElementById('projectMember').append(list);
			//page.insertTaskMember(list)

		}

		function insertMainWorkTask(id) {
			var memberList = id.parentNode.lastChild.previousSibling;
			console.log(memberList.children);
			var taskName = id.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.firstChild.nextSibling.value;
			console.log(taskName);
			var empNo = document.getElementsByName("empNo").value;
			// 			console.log();
			// 			var formData = $('#taskForm').serialize("empNo");
			// 			console.log(formData);
			$.ajax({
				url : "insertTask.do?projectNo=${project.projectNo}",
				type : "post",
				data : {
					"taskName" : taskName,
					"empNo" : empNo
				},
				success : function(data) {
					if (data == "success") {
						alert("통신 성공");
					} else {
						alert("통신은 성공~")
					}
				},
				error : function() {

				}
			})
		}

		// 		function updateMainWorkTask(data) {
		// 			window.opener.location.reload();
		// 			window.close();
		// 		}
	</script>
</body>

</html>