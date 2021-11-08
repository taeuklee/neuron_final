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
<title>프로젝트 메인</title>
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

<link href='../../../resources/fullcalendar-5.10.0/lib/main.css'
	rel='stylesheet' />
<script src='../../../resources/fullcalendar-5.10.0/lib/main.js'></script>
<script>
	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');
		var calendar = new FullCalendar.Calendar(calendarEl, {
			initialView : 'dayGridMonth'
		});
		calendar.render();
	});
</script>
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
					<div class="col-lg-10" style="float: left">
						<div style="height: 10%; margin-bottom: 30px;">
							<h1>뉴런</h1>
						</div>
						<div style="height: 20%; margin-bottom: 30px;">
							<h1>대표업무 제목</h1>
							<div class="progress" style="height: 20px;">
								<div class="progress-bar" role="progressbar" style="width: 70%;"
									aria-valuenow="70" aria-valuemin="0" aria-valuemax="100">70%</div>
							</div>
						</div>
						<div style="height: 20%; margin-bottom: 30px;">
							<div class="card mb-3" style="max-width: 540px;">
								<div class="row g-0">
									<div class="col-md-4">
										<img src="..." class="img-fluid rounded-start" alt="...">
									</div>
									<div class="col-md-8">
										<div class="card-body">
											<h5 class="card-title">Card title</h5>
											<p class="card-text">This is a wider card with supporting
												text below as a natural lead-in to additional content. This
												content is a little bit longer.</p>
											<p class="card-text">
												<small class="text-muted">Last updated 3 mins ago</small>
											</p>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div id='calendar' style="height: 50%; margin-bottom: 10px;"></div>
					</div>
					<div class="col-lg-2" style="border: 1px solid black; float: left">
						<div class="card" style="width: 10rem; margin-bottom: 10px;">
							<img src="..." class="card-img-top" alt="...">
							<div class="card-body">
								<h4>이순신</h4>
							</div>
						</div>
						<div class="card" style="width: 10rem; margin-bottom: 10px;">
							<img src="..." class="card-img-top" alt="...">
							<div class="card-body">
								<h4>홍길동</h4>
							</div>
						</div>
						<div class="card" style="width: 10rem; margin-bottom: 10px;">
							<img src="..." class="card-img-top" alt="...">
							<div class="card-body">
								<h4>장보고</h4>
							</div>
						</div>
						<div class="card" style="width: 10rem; margin-bottom: 10px;">
							<img src="..." class="card-img-top" alt="...">
							<div class="card-body">
								<h4>이산</h4>
							</div>
						</div>
						<div class="card" style="width: 10rem; margin-bottom: 10px;">
							<img src="..." class="card-img-top" alt="...">
							<div class="card-body">
								<h4>김유신</h4>
							</div>
						</div>
						<div>
							<button onclick="moveMemberList()">더보기</button>
						</div>
					</div>
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

	function moveMemberList() {
		location.href="selectProjectMemberList.do";
	}
</script>
</body>

</html>