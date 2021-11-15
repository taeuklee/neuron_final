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
<title>Neuron : 부서 조회</title>
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
    $(document).ready(function(){
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
				<div class="content-wrapper" id="contents">
					<div class="col-lg-12 grid-margin stretch-card">
						<div class="card">
							<div class="card-body">
								<br>
								<h3 class="card-title">부서 관리</h3>
								<br>
								<br>
								<br>
								<div class="row">
									<div class="form-group" style="width: 10%;">
										<select class="form-control form-control-lg"
											id="exampleFormControlSelect2">
											<option>부서</option>
											<option>팀</option>
										</select>
									</div>
									&nbsp;&nbsp;&nbsp; <input type="text" class="member-search"
										style="height: 30px;"> &nbsp; <input type="button"
										class="btn btn-primary mr-2" style="height: 30px;" value="검색" />
								</div>
								<div class="table-responsive pt-3">
									<table class="table table-bordered">
										<thead>
											<tr>
												<th></th>
												<th>No</th>
												<th>부서명</th>
												<th>팀명</th>
												<th>책임자</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td><input type="checkbox" name="teamDelete"></td>
												<td>1</td>
												<td><a href="#">경영지원부</a></td>
												<td>인사팀</td>
												<td>이제훈</td>
											</tr>
											<tr>
												<td><input type="checkbox" name="teamDelete"></td>
												<td>1</td>
												<td><a href="#">경영지원부</a></td>
												<td>총무팀</td>
												<td>문소리</td>
											</tr>
											<tr>
												<td><input type="checkbox" name="teamDelete"></td>
												<td>2</td>
												<td><a href="#">개발부</a></td>
												<td>개발1팀</td>
												<td>이주빈</td>
											</tr>
											<tr>
												<td><input type="checkbox" name="teamDelete"></td>
												<td>2</td>
												<td><a href="#">개발부</a></td>
												<td>개발2팀</td>
												<td>이익준</td>
											</tr>
											<tr>
												<td><input type="checkbox" name="teamDelete"></td>
												<td>3</td>
												<td><a href="#">마케팅부</a></td>
												<td>마케팅팀</td>
												<td>안정원</td>
											</tr>
											<tr>
												<td><input type="checkbox" name="teamDelete"></td>
												<td>3</td>
												<td><a href="#">마케팅부</a></td>
												<td>영업팀</td>
												<td>박보검</td>
											</tr>
											<tr>
												<td><input type="checkbox" name="teamDelete"></td>
												<td>4</td>
												<td><a href="#">고객지원부</a></td>
												<td>A/S팀</td>
												<td>배수지</td>
											</tr>
											<tr>
												<td><input type="checkbox" name="teamDelete"></td>
												<td>0</td>
												<td><a href="#">임원</a></td>
												<td>-</td>
												<td>김이사</td>
											</tr>
										</tbody>
									</table>
									<br>
									<div class="button-notice"></div>
									<button type="submit" class="btn btn-primary mr-2 modify">삭제</button>
									<button type="reset" class="btn btn-primary mr-2 modify">수정</button>
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

</body>

</html>

