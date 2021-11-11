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
      $('#docGu').change(function(){
    	var docGuVal = $('#docGu option:selected').val();
    	if(docGuVal != ''){
    		$("#test").html($("#"+docGuVal).html());
    	}
      });
    });
    
    function fnSubmit(){
    	$("input[name=docContents]").attr('value',$("#test").html());
    	$('#doc_reg').submit();
    }
    // 결재선 추가 버튼 클릭
    function btn_approval(){
    	var a = window.open("approvalEmp.do","approval","width=1000, height=600");
    }
    
    // 결재선 추가 결과 받는 함수
     window.fn_apprEmpInfo = function(apprEmpInfo){
    	alert("자식창닫힘");
    	console.log(apprEmpInfo);
    	
	   	for(var key in apprEmpInfo){
	   		var oneEmp = apprEmpInfo[key];
	   		console.log(oneEmp.split(":")[4]);
	   		if(oneEmp.split(":")[4]=="합의"){
	   			$("#doc_reg").append("<input type='hidden' name='emp_id_1' value='"+oneEmp+"'>");
	   			$("#emp_name1").val(oneEmp.split(":")[2]);
	   			$("#emp_job1").val(oneEmp.split(":")[1]);
	   			$("#emp_dept1").val(oneEmp.split(":")[3]);
	   		}else{
	   			$("#doc_reg").append("<input type='hidden' name='emp_id_2' value='"+oneEmp+"'>");
	   			$("#emp_name2").val(oneEmp.split(":")[2]);
	   			$("#emp_job2").val(oneEmp.split(":")[1]);
	   			$("#emp_dept2").val(oneEmp.split(":")[3]);
	   		}
	   	}
    	
    };
    
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
					<!--게시판 넓이 -->
					<div class="col-lg-12">
						<h1 class="page-header">결재문 작성</h1>
					</div>
					<div class="col-lg-6 grid-margin stretch-card"
						style="max-width: 100%;">
						
						
					<div class="card">
						<form id="doc_reg" action="documentRegister.do" method="post" enctype="multipart/form-data">
							<input type="hidden" name="docContents" />
							<table class="table">
								<tr>
									<td width="100">
										<b>결재 구분</b>
									</td>
									<td>
										<select id="docGu" name="docGubun">
											<option>선택하세요.</option>
											<c:forEach items="${code }" var="item">
												<option value="${item.codeId }">${item.codeName }</option>
											</c:forEach>
										</select>
										<div id="contentArea" style="display: none;">
											<c:forEach items="${code }" var="item">
												<div id="${item.codeId }">${item.codeContents }</div>
											</c:forEach>
										</div>
									</td>
								</tr>
								<tr>
									<td>
										<b>기안자</b>
									</td>
									<td>
										<span>이태욱사원 개발1팀</span>
									</td>
								</tr>
							</table>
							<table class="table">
								<tr>
									<td>
										<button type="button" id="approvalBtn" onclick="btn_approval();"
											class="btn btn-outline btn-primary pull-left">
											<i class="fa fa-edit fa-fw"></i> 결재선 추가 +
										</button>
									</td>
								</tr>
								<tr>
									<th>구분</th>
									<th>이름</th>
									<th>직급</th>
									<th>부서</th>
								</tr>
								<tr>
									<td><b>합의자</b></td>
									<td><input id="emp_name1" type="text"></td>
									<td><input id="emp_job1" type="text"></td>
									<td><input id="emp_dept1" type="text"></td>
								</tr>
								<tr>
									<td><b>결재자</b></td>
									<td><input id="emp_name2" type="text"></td>
									<td><input id="emp_job2" type="text"></td>
									<td><input id="emp_dept2" type="text"></td>
								</tr>
							</table>
							<div id="결재선"></div>
							
							<div id="test" align="center" style="border:1px solid gray; padding:50px 0 0 0;" contenteditable="true">
							
							
							</div>
							
							<input type="file" name="uploadFile">
							<button type="button" class="btn" onclick="fnSubmit();">제출</button>
						</form>
					</div>
					</div>
				</div>	
			</div>
			<!-- page-body-wrapper ends -->
		</div>
	</div>

</body>

</html>