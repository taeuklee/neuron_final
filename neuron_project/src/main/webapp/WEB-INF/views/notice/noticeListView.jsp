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
				<div class="content-wrapper" id="contents"></div>
				<div class="col-lg-12 grid-margin stretch-card">
					<div class="card">
						<div class="card-body">
							<br>
							<h3 class="card-title">사내 공지사항</h3>
							<br>
							<br>
							<br>
							<div class="table-responsive pt-3">
								<table class="table table-bordered">
									<thead>
										<tr>
											<th>No</th>
											<th>제목</th>
											<th>작성자</th>
											<th>조회수</th>
											<th>작성일</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>1</td>
											<td><a href="#">Herman Beck</a></td>
											<td>admin</td>
											<td>$ 77.99</td>
											<td>May 15, 2015</td>
										</tr>
										<tr>
											<td>2</td>
											<td><a href="#">Messsy Adam</a></td>
											<td>admin</td>
											<td>$245.30</td>
											<td>July 1, 2015</td>
										</tr>
										<tr>
											<td>3</td>
											<td><a href="#">John Richards</a></td>
											<td>admin</td>
											<td>$138.00</td>
											<td>Apr 12, 2015</td>
										</tr>
										<tr>
											<td>4</td>
											<td><a href="#">Peter Meggik</a></td>
											<td>admin</td>
											<td>$ 77.99</td>
											<td>May 15, 2015</td>
										</tr>
										<tr>
											<td>5</td>
											<td><a href="#">Edward</a></td>
											<td>admin</td>
											<td>$ 160.25</td>
											<td>May 03, 2015</td>
										</tr>
										<tr>
											<td>6</td>
											<td><a href="#">John Doe</a></td>
											<td>admin</td>
											<td>$ 123.21</td>
											<td>April 05, 2015</td>
										</tr>
										<tr>
											<td>7</td>
											<td><a href="#">Henry Tom</a></td>
											<td>admin</td>
											<td>$ 150.00</td>
											<td>June 16, 2015</td>
										</tr>
										<tr>
											<td>8</td>
											<td><a href="#">Henry Tom</a></td>
											<td>admin</td>
											<td>$ 150.00</td>
											<td>June 16, 2015</td>
										</tr>
										<tr>
											<td>9</td>
											<td><a href="#">Henry Tom</a></td>
											<td>admin</td>
											<td>$ 150.00</td>
											<td>June 16, 2015</td>
										</tr>
										<tr>
											<td>10</td>
											<td><a href="#">Henry Tom</a></td>
											<td>admin</td>
											<td>$ 150.00</td>
											<td>June 16, 2015</td>
										</tr>
									</tbody>
								</table>
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

