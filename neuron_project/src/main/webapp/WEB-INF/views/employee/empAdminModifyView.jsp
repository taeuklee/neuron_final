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
								<form action="empAdminUpdate.do" class="form-sample" method="post" enctype="multipart/form-data">
									<div class="row">
										<div class="col-md-6">
											<div class="form-group row">
												<div class="col-sm-9">
													<img src="/resources/euploadFiles/${employee.empFileReName}">
												</div>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group row">
												<label class="col-sm-3 col-form-label">아이디</label>
												<div class="col-sm-9">
													<input type="text" name="empId" class="form-control" value="${ employee.empId }"
														readonly />
												</div>
											</div>
											<div class="form-group row">
												<label class="col-sm-3 col-form-label">비밀번호</label>
												<div class="col-sm-9">
													<input type="password" name="empPwd" class="form-control" value="${ employee.empPwd }"
														readonly />
												</div>
											</div>
											<div class="form-group row">
												<label class="col-sm-3 col-form-label">이름</label>
												<div class="col-sm-9">
													<input type="text" name="empName" class="form-control" value="${ employee.empName }"
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
													<input type="text" name="empBirth" class="form-control"
														value="${ employee.empBirth }" readonly />
												</div>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group row">
												<label class="col-sm-3 col-form-label">연락처</label>
												<div class="col-sm-9">
													<input type="text" name="empPhone" class="form-control"
														placeholder="${ employee.empPhone }" readonly />
												</div>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group row">
												<label class="col-sm-3 col-form-label">부서 및 팀</label>
												<div class="col-sm-9">
													<select name="deptCode" value="${ employee.deptCode }" class="form-control form-control-lg"
														id="exampleFormControlSelect2">
														<option>A1</option>
														<option>B1</option>
														<option>C1</option>
														<option>D1</option>
														<option>Z1</option>
													</select> <select name="teamCode" value="${ employee.teamCode }" class="form-control form-control-lg"
														id="exampleFormControlSelect2">
														<option>A11</option>
														<option>A12</option>
														<option>B11</option>
														<option>B12</option>
														<option>C11</option>
														<option>C12</option>
														<option>D11</option>
														<option>Z11</option>
														<option>Z12</option>
														<option>Z13</option>
													</select>
												</div>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group row">
												<label class="col-sm-3 col-form-label">직책</label>
												<div class="col-sm-9">
													<input type="text" name="empJob" class="form-control" value="${ employee.empJob }" />
												</div>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group row">
												<label class="col-sm-3 col-form-label">상태</label>
												<div class="col-sm-9">
													<select name="empState" value="${ employee.empState }"class="form-control form-control-lg"
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
													<input type="text" name="empExnum" class="form-control" value="${ employee.empExnum }" />
												</div>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-6">
											<div class="form-group row">
												<label class="col-sm-3 col-form-label">내부 이메일</label>
												<div class="col-sm-9">
													<input type="text" name="empEmail" class="form-control"
														value="${ employee.empEmail }" readonly />
												</div>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group row">
												<label class="col-sm-3 col-form-label">외부 이메일</label>
												<div class="col-sm-9">
													<input type="text" name="empSubEmail" class="form-control"
														value="${ employee.empSubEmail }" readonly />
												</div>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group row">
												<div class="col-sm-9">
													<input type="submit" class="btn btn-primary mr-2"
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