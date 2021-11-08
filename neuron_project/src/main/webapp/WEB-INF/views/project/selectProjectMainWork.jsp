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
<title>대표업무 조회</title>
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
.panel {
	font-family: 'Raleway', sans-serif;
	padding: 0;
	border: none;
}

.panel .panel-heading {
	background: #fff;
	padding: 15px;
	margin: 0;
}

.panel .panel-heading .title {
	color: #ff4e5a;
	font-size: 23px;
	font-weight: 500;
	line-height: 28px;
	text-transform: capitalize;
	margin: 0 10px 0 0;
}

.panel .panel-heading .btn {
	background-color: #333;
	vertical-align: top;
	border: none;
	transition: all 0.3s ease 0s;
}

.panel .panel-heading .btn:hover {
	box-shadow: 3px -3px rgba(0, 0, 0, 0.3);
}

.panel .panel-body {
	padding: 0;
}

.panel .panel-body .table thead tr th {
	color: #333;
	background-color: #f5f5f5;
	font-size: 17px;
	font-weight: 500;
	padding: 12px;
	border-bottom: none;
}

.panel .panel-body .table tbody tr td {
	color: #555;
	font-size: 15px;
	padding: 10px 12px;
	vertical-align: middle;
	border-color: #f1f1f1;
}

.panel .panel-body .table tbody tr td .progress {
	margin: 0;
	background-color: #ccc;
}

.panel .panel-body .table tbody tr td .progress .progress-bar {
	background-color: #20bf6b;
}

.panel .panel-body .table tbody .action-list {
	padding: 0;
	margin: 0;
	list-style: none;
}

.panel .panel-body .table tbody .action-list li {
	display: inline-block;
}

.panel .panel-body .table tbody .action-list li a {
	color: #fff;
	font-size: 13px;
	line-height: 28px;
	height: 28px;
	width: 28px;
	padding: 0;
	border-radius: 50%;
	transition: all 0.3s ease 0s;
}

.panel .panel-body .table tbody .action-list li a:hover {
	box-shadow: 0 0 0 3px #ccc;
}

.panel .panel-footer {
	background-color: #f5f5f5;
	padding: 15px;
	border: none;
}

.pagination {
	margin: 0;
}

.pagination li a {
	color: #fff;
	background-color: #999;
	font-size: 15px;
	font-weight: 600;
	margin: 0 2px;
	border: none;
	border-radius: 50%;
	transition: all 0.3s ease 0s;
}

.pagination li:first-child a, .pagination li:last-child a {
	border-radius: 50%;
}

.pagination li a:hover, .pagination li a:focus, .pagination li.active a
	{
	color: #fff;
	background-color: #ff4e5a;
}

@media only screen and (max-width:479px) {
	.panel .panel-heading {
		text-align: center;
	}
	.panel .panel-heading .title {
		float: none !important;
		margin: 0 0 10px;
	}
	.panel .panel-heading .btn {
		float: none !important;
	}
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
					<div style="height: 20%">
						<div style="height: 20%; margin-bottom: 30px;">
							<h1 style="text-align: center;">뉴런</h1>
						</div>
						<div
							style="height: 80%; align-content: center; width: 900px; position: relative; left: 500px;">
							<div class="progress" style="height: 30px;">
								<div class="progress-bar" role="progressbar" style="width: 25%;"
									aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">25%</div>
							</div>
						</div>
					</div>
					<div style="height: 70%; width: 100%;">

						<div class="panel" style="height: 100%">
							<div class="panel-heading">
								<div class="row">
									<div class="col-sm-12 col-xs-12">
										<h4 class="title pull-left">세부사항 목록</h4>
									</div>
								</div>
							</div>
							<div class="panel-body table-responsive" style="height: 100%;">
								<table class="table" style="height: 100%;">
									<thead>
										<tr>
											<th>세부사항 이름</th>
											<th>진행도</th>
											<th>팀원목록</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>Aenean sodales in lorem</td>
											<td>
												<div class="progress">
													<div class="progress-bar" role="progressbar"
														aria-valuenow="2" aria-valuemin="0" aria-valuemax="100"
														style="width: 80%;">
														<span> 80%</span>
													</div>
												</div>
											</td>
											<td>
												<ul class="action-list">
													<li><a href="#" class="btn btn-primary"><i
															class="fa fa-pencil-alt"></i></a></li>
													<li><a href="#" class="btn btn-danger"><i
															class="fa fa-trash"></i></a></li>
												</ul>
											</td>
										</tr>
										<tr>
											<td>placerat nibh ligula</td>
											<td>
												<div class="progress">
													<div class="progress-bar" role="progressbar"
														aria-valuenow="2" aria-valuemin="0" aria-valuemax="100"
														style="width: 50%;">
														<span> 50%</span>
													</div>
												</div>
											</td>
											<td>
												<ul class="action-list">
													<li><a href="#" class="btn btn-primary"><i
															class="fa fa-pencil-alt"></i></a></li>
													<li><a href="#" class="btn btn-danger"><i
															class="fa fa-trash"></i></a></li>
												</ul>
											</td>
										</tr>
										<tr>
											<td>non feugiat lectus justo</td>
											<td>
												<div class="progress">
													<div class="progress-bar" role="progressbar"
														aria-valuenow="2" aria-valuemin="0" aria-valuemax="100"
														style="width: 90%;">
														<span> 90%</span>
													</div>
												</div>
											</td>
											<td>
												<ul class="action-list">
													<li><a href="#" class="btn btn-primary"><i
															class="fa fa-pencil-alt"></i></a></li>
													<li><a href="#" class="btn btn-danger"><i
															class="fa fa-trash"></i></a></li>
												</ul>
											</td>
										</tr>
										<tr>
											<td>risus et egestas faucibus</td>
											<td>
												<div class="progress">
													<div class="progress-bar" role="progressbar"
														aria-valuenow="2" aria-valuemin="0" aria-valuemax="100"
														style="width: 20%;">
														<span> 20%</span>
													</div>
												</div>
											</td>
											<td>
												<ul class="action-list">
													<li><a href="#" class="btn btn-primary"><i
															class="fa fa-pencil-alt"></i></a></li>
													<li><a href="#" class="btn btn-danger"><i
															class="fa fa-trash"></i></a></li>
												</ul>
											</td>
										</tr>
										<tr>
											<td>Phasellus lobortis nisl nec</td>
											<td>
												<div class="progress">
													<div class="progress-bar" role="progressbar"
														aria-valuenow="2" aria-valuemin="0" aria-valuemax="100"
														style="width: 60%;">
														<span>60%</span>
													</div>
												</div>
											</td>
											<td>
												<ul class="action-list">
													<li><a href="#" class="btn btn-primary"><i
															class="fa fa-pencil-alt"></i></a></li>
													<li><a href="#" class="btn btn-danger"><i
															class="fa fa-trash"></i></a></li>
												</ul>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>

					</div>

					<div style="height: 10%"></div>
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
</body>

</html>