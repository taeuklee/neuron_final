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
<title>Neuron : ๋ถ์ ์กฐํ</title>
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
		<!-- partial:partials/_navbar.html ํด๋ ์ฐฝ -->
		<jsp:include page="../common/navbar.jsp"></jsp:include>
		<!-- partial -->
		<div class="container-fluid page-body-wrapper">
			<!-- partial:partials/_sidebar.html ์ฌ์ด๋ ๋ฐ  -->
			<jsp:include page="../common/sidebar.jsp"></jsp:include>
			<!-- partial -->
			<div class="main-panel">
				<div class="content-wrapper" id="contents">
					<div class="col-lg-12 grid-margin stretch-card">
						<div class="card">
						<!--  <input type="hidden" name="deptCode" value="${deptCode }"> -->
						<input type="hidden" name="teamCode" value="${teamCode }">
							<div class="card-body">
								<br>
								<h3 class="card-title">๋ถ์ ๊ด๋ฆฌ</h3>
								<br>
								<br>
								<br>
								<div class="row">
									
								<div class="table-responsive pt-3">
									<table class="table table-bordered">
										<thead>
											<tr>
												<th>๋ถ์์ฝ๋</th>
												<th>๋ถ์๋ช</th>
												<th>ํ์ฝ๋</th>
												<th>ํ๋ช</th>
												<th>์ญ์?</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${ daList }" var="deptAdmin">
											<tr>
												<td>${deptAdmin.deptCode }</td>
												<td>${deptAdmin.deptName }</td>
												<td>${deptAdmin.teamCode }</td>
												<c:url var="dModify" value="deptModifyView.do">
								                     <c:param name="teamCode" value="${ deptAdmin.teamCode }"></c:param>
								                 </c:url>
												<td><a href="${dModify} ">${deptAdmin.teamName }</a></td>
												<c:url var="dDelete" value="deptDelete.do">
													<c:param name="deptCode" value="${deptAdmin.deptCode }"></c:param>
												</c:url>
												<td><a href="${dDelete }" class="btn btn-primary mr-2 modify">์ญ์?</a></td>
												
											</tr>
											</c:forEach>
										</tbody>
									</table>
									<br>
									<div class="button-notice"></div>
								
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- partial:partials/_footer.html -->
				<!-- partial -->
			</div>
			<!-- main-panel ends -->
		</div>
		<!-- page-body-wrapper ends -->
	</div>
	<!-- container-scroller -->

</body>

</html>

