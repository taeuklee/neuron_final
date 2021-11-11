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
				<div class="content-wrapper">
					<div class="col-12 grid-margin">
						<div class="card">
							<div class="card-body">
								<br> <br>
								<!-- " -->
								<h4 class="card-title">사원 등록</h4>
								<br> <br> <br> <br>
								<form action="empRegister.do" method="post" enctype="multipart/form-data">
									<div class="row">
									<img src="images/faces/basic.jpg" style="width: 250px; height: 250px;">
									</div>
									  <div class="row">
										<div class="col-md-6">
											<div class="form-group row">
												<div class="col-sm-9">
													<div class="col-md-6"">
														<div class="form-group row">
															<label for="gdsImg">사원증 사진 등록</label>
															<input type="file" id="empImg" name="uploadFile">
														</div>

													</div>
												</div>
											</div>
										</div>
									</div>  
									<div class="row">
										<div class="col-md-6">
											<div class="form-group row">
												<label class="col-sm-3 col-form-label">이름</label>
												<div class="col-sm-9">
													<input type="text" name="empName" class="form-control" />
												</div>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group row">
												<label class="col-sm-3 col-form-label">생년월일</label>
												<div class="col-sm-9">
													<input type="text" name="empBirth" class="form-control"
														placeholder="ex) 0000년 00월 00일로 입력하세요" />
												</div>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-6">
											<div class="form-group row">
												<label class="col-sm-3 col-form-label">아이디</label>
												<div class="col-sm-9">
													<input type="text" name="empId" class="form-control" />
												</div>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group row">
												<label class="col-sm-3 col-form-label">비밀번호</label>
												<div class="col-sm-9">
													<input type="password" name="empPwd" class="form-control">
												</div>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-6">
											<div class="form-group row">
												<label class="col-sm-3 col-form-label">연락처</label>
												<div class="col-sm-9">
													<input type="text" name="empPhone" class="form-control"
														placeholder="010-0000-0000으로 입력하세요" />
												</div>
											</div>
										</div>
									</div>
									<div class="col-lg-6 grid-margin stretch-card" style="margin-left: 23%;">
										<div class="card">
											<div class="card-body">
												<h4 class="card-title">부서 및 팀 코드표</h4>
												<div class="table-responsive">
													<table class="table">
														<thead>
															<tr>
																<th>부서 코드</th>
																<th>부서명</th>
																<th>팀 코드</th>
																<th>팀명</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<td>A1</td>
																<td>경영지원부</td>
																<td>A11</td>
																<td>인사팀</td>
															</tr>
															<tr>
																<td>A1</td>
																<td>경영지원부</td>
																<td>A12</td>
																<td>총무팀</td>
															</tr>
															<tr>
																<td>B1</td>
																<td>개발부</td>
																<td>B11</td>
																<td>개발1팀</td>
															</tr>
															<tr>
																<td>B1</td>
																<td>개발부</td>
																<td>B12</td>
																<td>개발2팀</td>
															</tr>
															<tr>
																<td>C1</td>
																<td>마케팅부</td>
																<td>C11</td>
																<td>마케팅팀</td>
															</tr>
															<tr>
																<td>C1</td>
																<td>마케팅부</td>
																<td>C12</td>
																<td>영업팀</td>
															</tr>
															<tr>
																<td>D1</td>
																<td>고객지원부</td>
																<td>D12</td>
																<td>A/S팀</td>
															</tr>
															<tr>
																<td>Z1</td>
																<td>임원</td>
																<td>Z11</td>
																<td>대표이사</td>
															</tr>
															<tr>
																<td>Z1</td>
																<td>임원</td>
																<td>Z12</td>
																<td>부사장</td>
															</tr>
															<tr>
																<td>Z1</td>
																<td>임원</td>
																<td>Z13</td>
																<td>상무</td>
															</tr>
														</tbody>
													</table>
												</div>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-6">
											<div class="form-group row">
												<label class="col-sm-3 col-form-label">부서코드</label>
												<div class="col-sm-9" style="padding-top: 2%;">
													<select name="deptCode" class="form-control">
														<option>A1</option>
														<option>B1</option>
														<option>C1</option>
														<option>D1</option>
														<option>Z1</option>
													</select>
												</div>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group row">
												<label class="col-sm-3 col-form-label">팀 코드</label>
												<div class="col-sm-9" style="padding-top: 2%;">
													<select name="teamCode" class="form-control">
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
									</div>
									<div class="row">
										<div class="col-md-6">
											<div class="form-group row">
												<label class="col-sm-3 col-form-label">직책</label>
												<div class="col-sm-9">
													<input type="text" name="empJob" class="form-control" />
												</div>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group row">
												<label class="col-sm-3 col-form-label">상태</label>
												<div class="col-sm-9" style="padding-top: 2%;">
													<select name="empState" class="form-control">
														<option>재직</option>
														<option>휴직</option>
													</select>
												</div>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-6">
											<div class="form-group row">
												<label class="col-sm-3 col-form-label">이메일</label>
												<div class="col-sm-9">
													<input type="text" name="empEmail" class="form-control" />
												</div>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group row">
												<label class="col-sm-3 col-form-label">외부 이메일</label>
												<div class="col-sm-9">
													<input type="text" name="empSubEmail" class="form-control" />
												</div>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-6">
											<div class="form-group row">
												<label class="col-sm-3 col-form-label">내선 번호</label>
												<div class="col-sm-9">
													<input type="number" name="empExnum" class="form-control" />
												</div>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group row">
												<label class="col-sm-3 col-form-label">책임자 여부</label>
												<div class="col-sm-9" style="padding-top: 2%;">
													<select name="empMaster" class="form-control">
														<option>Y</option>
														<option>N</option>
													</select>
												</div>
											</div>
										</div>
										<div class="mt-3" style="padding-left: 45%;">
											<input type="submit" class="btn btn-primary mr-2" value="등록">
										</div>
									</div>
								</form>
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
	  $("#empImg").change(function(){
	   if(this.files && this.files[0]) {
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

