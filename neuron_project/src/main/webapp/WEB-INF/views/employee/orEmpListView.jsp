<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Neuron : 공지사항</title>
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
	});
</script>
<style>
.answer {
	display: none;
}

#search {
	width: 100%;
	max-width: 100%;
}

#search tr td {
	padding: 8px;
	line-height: 1.42857143;
	vertical-align: top;
}
</style>
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
				<div class="content-wrapper">
						<div class="col-12 grid-margin">
							<br>
							<h4 class="card-title" style="text-align: center;">
								<b>전체 사원 보기</b>
							</h4>
							<br><br><br>
							<div class="row">
								<div class="form-group" style="width: 10%;">
									<select class="form-control form-control-lg"
										id="exampleFormControlSelect2">
										<option>이름</option>
										<option>부서</option>
										<option>직책</option>
									</select>
								</div>
								&nbsp;&nbsp;&nbsp; <input type="text" class="member-search"
									style="height: 30px;"> &nbsp; <input type="button"
									class="btn btn-primary mr-2" style="height: 30px;" value="검색" />
							</div>
						<div class="row">
							<div class="col-md-4 grid-margin stretch-card">
								<div class="card">
									<div class="card-body">
										<div class="media">
											<div class="col-md-6">
												<div class="form-group row">
													<div class="col-sm-9">
														<img src="../images/faces/face1.jpg"
															style="width: 100px; height: 100px;">
													</div>
												</div>
											</div>
											<div class="memberinfo" style="padding-top: 8%;">
												<a href="#">박보검 사원</a><br> 부서 : 영업부 영업팀 <br> 내선번호
												: 011
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-4 grid-margin stretch-card">
								<div class="card">
									<div class="card-body">
										<div class="media">
											<div class="col-md-6">
												<div class="form-group row">
													<div class="col-sm-9">
														<img src="../images/faces/face2.jpg"
															style="width: 100px; height: 100px;">
													</div>
												</div>
											</div>
											<div class="memberinfo" style="padding-top: 8%;">
												<a href="#">이상엽 팀장</a><br> 부서 : 영업부 영업팀 <br> 내선번호
												: 012
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-4 grid-margin stretch-card">
								<div class="card">
									<div class="card-body">
										<div class="media">
											<div class="col-md-6">
												<div class="form-group row">
													<div class="col-sm-9">
														<img src="../images/faces/face3.jpg"
															style="width: 100px; height: 100px;">
													</div>
												</div>
											</div>
											<div class="memberinfo" style="padding-top: 8%;">
												<a href="#">김가은 대리</a><br> 부서 : 영업부 영업팀 <br> 내선번호
												: 013
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	<!-- partial:partials/_footer.html -->
	<footer class="footer" id="footer"></footer>
	<!-- partial -->
	</div>
	<!-- main-panel ends -->
	</div>
	<!-- page-body-wrapper ends -->
	</div>
	<!-- container-scroller -->


	</div>
	<script>
		$("#empImg").change(function() {
			if (this.files && this.files[0]) {
				var reader = new FileReader;
				reader.onload = function(data) {
					$(".row img").attr("src", data.target.result).width(250);
				}
				reader.readAsDataURL(this.files[0]);
			}
		});
	</script>
</body>

</html>

