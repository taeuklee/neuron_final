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
<title>Regal Admin</title>
<!-- base:css -->
<link rel="stylesheet"
	href="/vendors/mdi/css/materialdesignicons.min.css">
<link rel="stylesheet" href="/vendors/feather/feather.css">
<link rel="stylesheet" href="/vendors/base/vendor.bundle.base.css">
<!-- endinject -->
<!-- plugin css for this page -->
<link rel="stylesheet"
	href="/vendors/flag-icon-css/css/flag-icon.min.css" />
<link rel="stylesheet"
	href="/vendors/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet"
	href="/vendors/jquery-bar-rating/fontawesome-stars-o.css">
<link rel="stylesheet"
	href="/vendors/jquery-bar-rating/fontawesome-stars.css">
<!-- End plugin css for this page -->
<!-- inject:css -->
<link rel="stylesheet" href="/css/style.css">
<!-- endinject -->
<link rel="shortcut icon" href="/images/favicon.png" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
    $(document).ready(function(){
      $("#headerNav").load("/partials/_navbar.html");
      $("#sidebar").load("/partials/_sidebar.html");
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
<script src="/vendors/base/vendor.bundle.base.js"></script>
<!-- endinject -->
<!-- Plugin js for this page-->
<!-- End plugin js for this page-->
<!-- inject:js -->
<script src="/js/off-canvas.js"></script>
<script src="/js/hoverable-collapse.js"></script>
<script src="/js/template.js"></script>
<!-- endinject -->
<!-- plugin js for this page -->
<script src="/vendors/chart.js/Chart.min.js"></script>
<script src="/vendors/jquery-bar-rating/jquery.barrating.min.js"></script>
<!-- End plugin js for this page -->
<!-- Custom js for this page-->
<script src="/js/dashboard.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script>
	function fn_appr(type){
		var apprOpinion = prompt("결재의견");
		var docNo = $("#documentNo").val();
		var approvalType = $("#approvalType").val();
		if(apprOpinion){
			alert("승인");
			$.ajax({
				url : "/transApproval.do",
				type : "post",
				data : {
					"apprOpinion" : apprOpinion, // 결재의견
					"apprStatus" : type, // 승인 or 반려 체크 
					"documentNo" : docNo, // 문서 번호 
					"approvalType" : approvalType // 합의 or 결재
				},
				success: function(data){
					if(data == "success"){
						alert("결재처리 완료!");
						location.reload();
					}else{
						alert("결재처리 실패!");
					}
				},
				error : function(){
					alert("ajax 실패");
				}
			});
		}else if(apprOpinion == null){
			alert("취소");
		}else{
			alert("글자입력해")
		}
		

				
	}

</script>
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
					<!--게시판 넓이 -->
					<div class="col-lg-12">
						<h1 class="page-header">결재문 조회</h1>
					</div>
					<div class="col-lg-6 grid-margin stretch-card"
						style="max-width: 100%;">
					<div class="card">
						<div class="template-demo" >
						&nbsp;
						&nbsp;
						&nbsp;
						&nbsp;
						&nbsp;
						&nbsp;
						&nbsp;
						&nbsp;
						&nbsp;
						&nbsp;
						&nbsp;
						&nbsp;
							<button class="btn btn-inverse-light btn-fw">회수</button>
							<button class="btn btn-inverse-light btn-fw">인쇄</button>
							<button class="btn btn-inverse-light btn-fw" onclick="fn_appr('Y');">승인</button>
							<button class="btn btn-inverse-light btn-fw" onclick="fn_appr('N');">반려</button>
							<button class="btn btn-inverse-light btn-fw">목록</button>
						</div>
							
						<div align="center" style="border:1px solid gray; margin:50px 90px 30px 90px; padding:50px 100px 50px 100px;">
							${docOne.docContents }
						</div>
						<div class="col-lg-12">
							<form action="">
								<input type="hidden" id="documentNo" name="documentNo" value="${docOne.docNo }" >
								
							</form>
							<table class="table table-bordered">
								<tr>
									<th>순번</th>
									<th>합의/결재자</th>
									<th>결재구분</th>
									<th>진행현황</th>
									<th>결재일시</th>
									<th>결재의견</th>
								</tr>
								<c:forEach items="${aList }" var="aOne" varStatus="status">
								<tr>
									<td>
										<c:if test="${aOne.empNo eq sessionScope.loginEmployee.empNo }">
											<input type="hidden" id = "approvalType" name = "approvalType" value="${aOne.approvalType }">
										</c:if>
										${status.count }
									</td>
									<td>${aOne.empName } ${aOne.empJob } (${aOne.teamName })</td>
									<td>${aOne.approvalType }</td>
									<td>${aOne.approvalStatus }</td>
									<td>${aOne.approvalEnddate }</td>
									<td>${aOne.approvalOpinion }</td>
								</tr>
								</c:forEach>
								
							</table>
						</div>
						<br><br><br>
					</div>
					</div>
				</div>	
			</div>
			<!-- page-body-wrapper ends -->
		</div>
	</div>

</body>

</html>