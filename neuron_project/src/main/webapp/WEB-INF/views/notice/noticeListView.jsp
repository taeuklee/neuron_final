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
				<div class="col-lg-12 grid-margin stretch-card">
					<div class="card">
						<div class="card-body">
							<br>
							<h3 class="card-title">사내 공지사항</h3>
							<br>
							<br>
							<br>
							<c:if test="${loginEmployee.empId eq 'admin' }">
							<div class="write-button" id="write-button" style="padding-left:92%;">
								<button class="btn btn-primary mr-2" onclick="location.href='/noticeWriteForm.do'">글쓰기</button></div>
							</c:if>
							<div class="table-responsive pt-3">
								<table class="table table-bordered">
									<thead>
										<tr>
											<th>No</th>
											<th>제목</th>
											<th>작성자</th>
											<th>작성일</th>
										</tr>
									</thead>
									<c:if test="${ empty nList }">
							         	<tr>
							            	<td colspan="5" align="center">등록된 공지사항이 없습니다.</td>
							         	</tr>
							     	 </c:if>
								      <c:if test="${ not empty nList }">
								         <c:forEach items="${ nList }" var="notice">
								            <tr align="center">
								               <td>${ notice.noticeNo }</td>
								               <td>
								                  <c:url var="nDetail" value="noticeDetailView.do">
								                     <c:param name="noticeNo" value="${ notice.noticeNo }"></c:param>
								                  </c:url>
								                  <a href="${ nDetail }">${ notice.noticeTitle }</a>
								               </td>
								               <td>${ notice.noticeWriter }</td>
								               <td>${ notice.regDate }</td>
								            </tr>
								         </c:forEach>
								      </c:if>

								<tr align="center" height="20" >
						   		<td colspan="5" > 
						   			<!-- 이전 페이지 보기 -->
						   			<c:url var="before" value="noticeListView.do">
						   				<c:param name="page" value="${pi.currentPage - 1 }"></c:param>
						   			</c:url>
						   		 	<c:if test="${pi.currentPage <= 1 }">
						   		 		[이전]
						   		 	</c:if>
						   		 	<c:if test="${pi.currentPage > 1 }">
						   		 		<a href="${before }">[이전]</a>
						   		 	</c:if>
						   		 	<c:forEach var="p" begin="${pi.startNavi }" end="${pi.endNavi }">
						   		 		<c:url var="pagination" value="noticeListView.do">
						   		 			<c:param name="page" value="${p }"></c:param>
						   		 		</c:url>
						   		 		<c:if test="${p eq pi.currentPage }">
						   		 			<font color="green" size="4">[${p }]</font>
						   		 		</c:if>
						   		 		<c:if test="${p ne pi.currentPage }">
						   		 			<a href="${pagination }">[${p }]</a>&nbsp;
						   		 		</c:if>
						   		 	</c:forEach>
						   		 	<c:url var="after" value="noticeListView.do">
						   		 		<c:param name="page" value="${pi.currentPage +1 }"></c:param>
						   		 	</c:url>
						   		 	<c:if test="${pi.currentPage >= pi.maxPage }">
						   		 		[다음]
						   		 	</c:if>
						   		 	<c:if test="${pi.currentPage < pi.maxPage }">
						   		 		<a href="${after }">[다음]</a>
						   		 	</c:if>
						   		</td>
						   	</tr>
							</table>
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

