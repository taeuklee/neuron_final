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
				<div class="content-wrapper" id="contents">
				<div class="col-12 grid-margin stretch-card">
					<div class="card">
						<div class="card-body">
							<br>
							<h3 class="card-title">${notice.noticeNo }번 공지사항 상세보기</h3>
							<br>
							<br>
							<br>
							<input type="hidden" name="noticeNo" value="${noticeNo }">
								<h4 class="card-title-little"><b>제목</b>&nbsp&nbsp${notice.noticeTitle }</h4>
								<div class="template-demo">
									<h1 class="title-line"></h1>
								</div>
								<div class="col-md-12 grid-margin stretch-card">
									<div class="card">
										<div class="card-body">
											<b>작성자</b>&nbsp&nbsp${notice.noticeWriter }
										</div>
									</div>
								</div>
								  <div class="col-md-12 grid-margin stretch-card">
									<div class="card">
										<div class="card-body">
											 <b>첨부파일</b>&nbsp&nbsp ${notice.noticeFilePath}
										</div>
									</div>
								</div> 
								<div class="col-md-12 grid-margin stretch-card">
									<div class="card">
										<div class="card-body">
											<b>긴급공지</b>&nbsp&nbsp${notice.noticeCategory}
										</div>
									</div>
								</div>
								<div class="col-md-12 grid-margin stretch-card">
									<div class="card">
										<div class="card-body">
											${notice.noticeContents }
										</div>
									</div>
								</div>
								<c:if test="${loginEmployee.empId eq 'admin' }">
								<div class="button-notice">
									<c:url var="nModify" value="noticeModifyView.do">
										<c:param name="noticeNo" value="${notice.noticeNo }"></c:param>
									</c:url>
									<a href="${nModify }" class="btn btn-primary mr-2 modify">수정하기</a>
									
									<c:url var="nDelete" value="noticeDelete.do">
										<c:param name="noticeNo" value="${notice.noticeNo }"></c:param>
									</c:url>
									<a href="${nDelete }" class="btn btn-primary mr-2 modify">삭제하기</a>
								</div>
								</c:if>
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

