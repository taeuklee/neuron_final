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
<title>Neuron : 마이페이지</title>
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
						<div class="card">
							<div class="card-body">
								<br>
								<h4 class="card-title">사원 정보 수정</h4>
								<br>
								<br>
								<br>
								<form class="form-sample">
									<div class="row">
										<div class="col-md-6">
											<div class="form-group row">
												<div class="col-sm-9">
													<img src="../images/faces/face13.jpg"
														style="width: 250px; height: 250px;">
												</div>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group row">
												<label class="col-sm-3 col-form-label">아이디</label>
												<div class="col-sm-9">
													<input type="text" class="form-control" value="user01"
														readonly />
												</div>
											</div>
											<div class="form-group row">
												<label class="col-sm-3 col-form-label">비밀번호</label>
												<div class="col-sm-9">
													<input type="password" class="form-control" value="123456"
														readonly />
												</div>
											</div>
											<div class="form-group row">
												<label class="col-sm-3 col-form-label">이름</label>
												<div class="col-sm-9">
													<input type="text" class="form-control" value="고희동"
														readonly />
												</div>
											</div>
										</div>
									</div>

									<div class="row">
										<div class="col-md-6">
											<div class="form-group row">
												<label class="col-sm-3 col-form-label">생년월일</label>
												<div class="col-sm-9">
													<input type="text" class="form-control"
														value="1987년 6월 20일" readonly />
												</div>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group row">
												<label class="col-sm-3 col-form-label">연락처</label>
												<div class="col-sm-9">
													<input type="text" class="form-control"
														placeholder="01012345678" readonly />
												</div>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group row">
												<label class="col-sm-3 col-form-label">부서 및 팀</label>
												<div class="col-sm-9">
													<select class="form-control form-control-lg"
														id="exampleFormControlSelect2">
														<option>경영지원부</option>
														<option>개발부</option>
														<option>마케팅부</option>
														<option>고객지원부</option>
													</select> <select class="form-control form-control-lg"
														id="exampleFormControlSelect2">
														<option>인사팀</option>
														<option>총무팀</option>
														<option>개발1팀</option>
														<option>개발2팀</option>
														<option>마케팅팀</option>
														<option>영업팀</option>
														<option>A/S팀</option>
													</select>
												</div>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group row">
												<label class="col-sm-3 col-form-label">직책</label>
												<div class="col-sm-9">
													<input type="text" class="form-control" value="사원" />
												</div>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group row">
												<label class="col-sm-3 col-form-label">상태</label>
												<div class="col-sm-9">
													<select class="form-control form-control-lg"
														id="exampleFormControlSelect2">
														<option>재직</option>
														<option>휴직</option>
														<option>퇴직</option>
													</select>
												</div>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group row">
												<label class="col-sm-3 col-form-label">내선번호</label>
												<div class="col-sm-9">
													<input type="text" class="form-control" value="034" />
												</div>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-6">
											<div class="form-group row">
												<label class="col-sm-3 col-form-label">내부 이메일</label>
												<div class="col-sm-9">
													<input type="text" class="form-control"
														value="user01@neuron.com" readonly />
												</div>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group row">
												<label class="col-sm-3 col-form-label">외부 이메일</label>
												<div class="col-sm-9">
													<input type="text" class="form-control"
														value="h2dong@gmail.com" readonly />
												</div>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group row">
												<div class="col-sm-9">
													<input type="button" class="btn btn-primary mr-2"
														value="수정" />
												</div>
											</div>
										</div>
									</div>
								</form>
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

</body>

</html>