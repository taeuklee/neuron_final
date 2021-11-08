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
<title>프로젝트 생성</title>
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
	<div class="container-scroller">
		<!-- partial:partials/_navbar.html 해더 창 -->
		<jsp:include page="../common/navbar.jsp"></jsp:include>
		<!-- partial -->
		<div class="container-fluid page-body-wrapper">
			<!-- partial:partials/_sidebar.html 사이드 바  -->
			<jsp:include page="../common/sidebar.jsp"></jsp:include>
			<!-- partial -->
			<div class="main-panel">
				<div class="content-wrapper" id="contents">
					<div class="col-lg-6" style="float: left">
						<div id="projectContents" style="height: 30%">
							<div class="mb-3">
								<label for="exampleFormControlInput1" class="form-label"><h1>프로젝트 제목</h1>
									 </label> <input type="text" class="form-control"
									id="exampleFormControlInput1" placeholder="제목을 입력해주세요">
							</div>
							<div class="mb-3">
								<label for="exampleFormControlTextarea1" class="form-label"><h1>생성 사유</h1>
									</label>
								<textarea class="form-control" id="exampleFormControlTextarea1"
									rows="3"></textarea>
							</div>
						</div>
						<div id="projectMember" style="height: 875px; overflow: auto;">
							<h1>팀원 목록</h1>
							<div class="card mb-3 m-0" style="max-width: 540px;">
								<div class="row g-0 m-0" >
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
					</div>
					<div class="col-lg-6"
						style="height: 100%; border-left: 1px solid black; float: left">
						<div id="memberSearch" style="height: 20%">
							<h1>팀원 검색</h1>
							<form class="d-flex">
								<input class="form-control me-2" type="search"
									placeholder="이름을 입력해주세요" aria-label="Search">
								<button class="btn btn-outline-success" type="submit">Search</button>
							</form>
						</div>
						<div id="memberList" style="height: 875px; overflow: auto;">
							<h1>사원 목록</h1>
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
					</div>
				</div>
				<!-- partial:partials/_footer.html -->
				<jsp:include page="../common/footer.jsp"></jsp:include>
				<!-- partial -->
			</div>
			<!-- main-panel ends -->
		</div>
		<!-- page-body-wrapper ends -->
	</div>
	<!-- container-scroller -->

</body>

</html>