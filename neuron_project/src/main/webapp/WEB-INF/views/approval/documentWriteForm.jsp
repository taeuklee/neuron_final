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
    	var name = '<c:out value="${emp.empName}"/>';
    	var job = '<c:out value="${emp.empJob}"/>';
    	var team ='<c:out value="${team.TEAM_NAME}"/>';
    	alert(name);
    	alert(docGuVal);
    	if(docGuVal != ''){
    		$("#test").html($("#"+docGuVal).html());
    		$("#titleName").html(docGuVal);
    		$("#apprTable").html("<tr id='apprLine1'>"
    							+"<td id='apprLine1-def'style='width:20px; background: rgb(221, 221, 221);' rowspan='4'>신청</td><td id='apprLine1-def' style='width:80px; height:25px; text-align:center'>"+ job +"</td>"
    							+"</tr>"
    							+"<tr id='apprLine2'><td id='apprLine2-def' rowspan='2' style='height:90px; text-align:center'>"+ name +"</td></tr>"
    							+"<tr></tr>"
    							+"<tr id='apprLine3'><td id='apprLine3-def' style='height:28px;'></td></tr>");
    		
    		$("#infoTable").html("<tr>"
    							+"<td style='background: rgb(221, 221, 221); width:100px; padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;'>"
    							+"소속"
    							+"</td>"
    							+"<td style='background: rgb(255, 255, 255); width:200px; border-width:1px 1px; border-style:  solid solid; border-color: currentColor black black; padding: 5px; height: 25px; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;' colspan='3' class='dext_table_border_t'>"
    							+team
    							+"</td>"
    							+"</tr>"
    							
    							+"<tr>"
    							+"<td style='background: rgb(221, 221, 221); width:100px; padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;'>"
    							+"직책"
    							+"</td>"
    							+"<td style='background: rgb(255, 255, 255); width:200px; border-width:1px 1px; border-style:  solid solid; border-color: currentColor black black; padding: 5px; height: 25px; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;' colspan='3' class='dext_table_border_t'>"
    							+job
    							+"</td>"
    							+"</tr>"
    							
    							+"<tr>"
    							+"<td style='background: rgb(221, 221, 221); width:100px; padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;'>"
    							+"성명"
    							+"</td>"
    							+"<td style='background: rgb(255, 255, 255); width:200px; border-width:1px 1px; border-style:  solid solid; border-color: currentColor black black; padding: 5px; height: 25px; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;' colspan='3' class='dext_table_border_t'>"
    							+name
    							+"</td>"
    							+"</tr>"
    							);
    		
    	}
      });
    });
    
    function fnSubmit(){
    	$("input[name=docContents]").attr('value',$("#test").html());
    	var empIdList = [];
    	$("input[name='empId1']").each(function(){
    		empIdList.push({"empId" : $(this).val()});
    	});
    	$("input[name='empId2']").each(function(){
    		empIdList.push({"empId" : $(this).val()});
    	});
    	// JSON 배열로 리스트 담기
    	$("input[name='empIdList']").val(JSON.stringify(empIdList));

    	// 합의자 존재여부 체크 합의자가 존재하면 Y 존재하지 않으면 N 
    	if($("input[name='empId1']").length == 0){
    		$("#apprCheck").val("N");
    	}else{
	    	$("#apprCheck").val("Y");		
    	}
    	$('#doc_reg').submit();
    }
    
    // 결재선 추가 버튼 클릭
    function btn_approval(){
    	var a = window.open("approvalEmp.do","approval","width=1000, height=600");
    }
    
    // 결재선 추가 결과 받는 함수
     window.fn_apprEmpInfo = function(apprEmpInfo){
    	$("#approvalGubun tr").not(".default").each(function(i,v){
    		$(this).remove();
    	});
    	$("#apprLine1 td").not("#apprLine1-def").each(function(i,v){
    		$(this).remove();
    	});
    	$("#apprLine2 td").not("#apprLine2-def").each(function(i,v){
    		$(this).remove();
    	});
    	$("#apprLine3 td").not("#apprLine3-def").each(function(i,v){
    		$(this).remove();
    	});
    	
	   	 for(var key in apprEmpInfo){
	   		var oneEmp = apprEmpInfo[key];
	   		
	   		if(oneEmp.split(":")[4]=="합의"){
	   			var html = "<tr>";
	   			html += "<td><b>합의자</b><input name='empId1' type='hidden' value=" + oneEmp + " /></td>";
	   			html += "<td><input name='emp_name1' type='text' value=" + oneEmp.split(":")[2] + " /></td>";
	   			html += "<td><input name='emp_job1' type='text' value=" + oneEmp.split(":")[1] + " /></td>";
	   			html += "<td><input name='emp_dept1' type='text' value=" + oneEmp.split(":")[3] + " /></td>";
				html += "</tr>";
				$("#approvalGubun").append(html);
				$("#apprLine1").append("<td style='width:20px; background: rgb(221, 221, 221);' rowspan='4'>합의</td><td style='width:80px; height:21px; text-align:center'>"+oneEmp.split(":")[1]+"</td>");
				$("#apprLine2").append("<td rowspan='2' style='height:90px; text-align:center'>"+oneEmp.split(":")[2]+"</td>");
				$("#apprLine3").append("<td style='height:28px;'></td>");
	   		}
	   	}
	   	for(var key in apprEmpInfo){
	   		var oneEmp = apprEmpInfo[key];
	   		if(oneEmp.split(":")[4] != "합의"){
	   			var html = "<tr>";
	   			html += "<td><b>결재자</b><input name='empId2' type='hidden' value=" + oneEmp + " /></td>";
	   			html += "<td><input name='emp_name2' type='text' value=" + oneEmp.split(":")[2] + " /></td>";
	   			html += "<td><input name='emp_job2' type='text' value=" + oneEmp.split(":")[1] + " /></td>";
	   			html += "<td><input name='emp_dept2' type='text' value=" + oneEmp.split(":")[3] + " /></td>";
				html += "</tr>";
				$("#approvalGubun").append(html);
				$("#apprLine1").append("<td style='width:20px; background: rgb(221, 221, 221);' rowspan='4'>결재</td><td style='width:80px; height:21px; text-align:center'>"+oneEmp.split(":")[1]+"</td>");
				$("#apprLine2").append("<td rowspan='2' style='height:90px; text-align:center'>"+oneEmp.split(":")[2]+"</td>");
				$("#apprLine3").append("<td style='height:28px;'></td>");
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
							<input type="hidden" name="empIdList" />
							<input type="hidden" id="apprCheck" name="apprCheck"/>
							<table class="table">
								<tr>
									<td width="100">
										<b>결재 구분</b>
									</td>
									<td>
										<select id="docGu" name="docGubun">
											<option>선택하세요.</option>
											<c:forEach items="${code }" var="item">
												<option value="${item.codeName }">${item.codeName }</option>
											</c:forEach>
										</select>
										<div id="contentArea" style="display: none;">
											<c:forEach items="${code }" var="item">
												<div id="${item.codeName }">${item.codeContents }</div>
												<c:if test="${item.codeId eq 'A' }">
												</c:if>
											</c:forEach>
										</div>
									</td>
								</tr>
								<tr>
									<td>
										<b>기안자</b>
									</td>
									<td>
										<span>${emp.empName }${emp.empJob } ${team.TEAM_NAME }</span>
									</td>
								</tr>
							</table>
							<table id="approvalGubun" class="table">
								<tr class="default">
									<td>
										<button type="button" id="approvalBtn" onclick="btn_approval();"
											class="btn btn-outline btn-primary pull-left">
											<i class="fa fa-edit fa-fw"></i> 결재선 추가 +
										</button>
									</td>
								</tr>
								<tr class="default">
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
							<hr><br><br>
							
							
							<div style="display: grid;border: 0.5px solid #989b9c78;margin:auto;justify-items: stretch;justify-content: space-evenly;margin-top: 20px;margin-bottom: 40px;">
								<div>
									<h1 id="titleName" align='center' style="padding : 70px 0 40px 0;"></h1>
									<table style="display: inline-flex; position: relative; float: left;">
										<tbody id="infoTable">
										</tbody>
									</table>
									<table border="1" style="display:inline-flex; position:relative; float: right;">
										<tbody id="apprTable">
										</tbody>
									</table>
								</div>
								<div id="test" align="center" style="" contenteditable="true">
								</div>
							</div>
							<br><br><br><hr>
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