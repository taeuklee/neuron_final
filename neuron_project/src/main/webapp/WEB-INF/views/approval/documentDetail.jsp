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
#btnBar {
	display: inline-flex;
    align-items: baseline;
    justify-content: flex-end;
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
	function fn_print(){
		var target = "printPop";
		window.open('', target, "width=800, height=800");
		$("input[name='bodyContents']").val($("#printArea").html());
		$("#printForm").submit();
		
	}
	
	function fn_withdraw(){
		var docNo = $("#documentNo").val();
		alert(docNo);
		var check = confirm('?????? ?????? ???????????????????');
		if(check){
			$.ajax({
				url : "/documentWithDraw.do",
				type : "post",
				data : 
					{
					"documentNo" : docNo, // ?????? ?????? 
					}
				,
				success: function(data){
					if(data == "success"){
						alert("?????? ??????!");
						location.reload();
					}else{
						alert("???????????? ??????!");
					}
				}
			});
		}
		
	}
	
	function fn_appr(type){
		var apprOpinion = prompt("????????????");
		var docNo = $("#documentNo").val();
		var approvalType = $("#approvalType").val();
		var documentKind = '<c:out value="${docOne.documentKind }"/>';
		var empNo = '<c:out value="${empInfo.EMP_NO }"/>';
		var vacKind = '<c:out value="${docOne.vacationKind }"/>'
		var start = '<c:out value="${docOne. vacationStartDate}"/>';
		var end = '<c:out value="${docOne. vacationEndDate}"/>';
		var day =  (new Date(end).getTime() - new Date(start).getTime())/1000/60/60/24 +1;
		if(apprOpinion){
			alert("??????");
			$.ajax({
				url : "/transApproval.do",
				type : "post",
				data : 
					{
					"apprOpinion" : apprOpinion, // ????????????
					"apprStatus" : type, // ?????? or ?????? ?????? 
					"documentNo" : docNo, // ?????? ?????? 
					"approvalType" : approvalType, // ?????? or ??????
					"documentKind": documentKind,
					"day" : day,
					"vacKind" : vacKind,
					"wtEmpNo" : empNo
					}
				,
				success: function(data){
					if(data == "success"){
						alert("???????????? ??????!");
						location.reload();
					}else{
						alert("???????????? ??????!");
					}
				},
				error : function(){
					alert("ajax ??????");
				}
			});
		}else if(apprOpinion == null){
			alert("??????");
		}else{
			alert("????????? ???????????????")
		}
		

				
	}

</script>
</head>

<body>
	<div class="container-scroller">
		<!-- partial:partials/_navbar.html ?????? ??? -->
		<jsp:include page="../common/navbar.jsp"></jsp:include>
		<!-- partial -->
		<div class="container-fluid page-body-wrapper">
			<!-- partial:partials/_sidebar.html ????????? ???  -->
			<jsp:include page="../common/sidebar.jsp"></jsp:include>
			<!-- partial -->
			<div class="main-panel">
				<div class="content-wrapper" id="contents">
					<!--????????? ?????? -->
					<div class="col-lg-12">
						<h1 class="page-header">????????? ??????</h1>
					</div>
					<div class="col-lg-6 grid-margin stretch-card" style="max-width: 100%;">
						<div id="printArea" class="card">
							<div class="card">
								<div id="btnBar" class="template-demo" align="right">
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
								<c:if test="${sessionScope.loginEmployee.empNo eq docOne.documentWriterNo and docOne.withdrowChk eq 'N' }">
									<button class="btn btn-inverse-light btn-fw" onclick="fn_withdraw();">??????</button>
								</c:if>
									<button class="btn btn-inverse-light btn-fw" onclick="fn_print();">??????</button>
								<c:forEach items="${aList }" var="aOne">
								<c:if test="${sessionScope.loginEmployee.empNo eq aOne.empNo  }">
									<c:if test="${docOne.documentStatus eq '????????????' and aOne.approvalType eq '??????' and aOne.approvalStatus eq '??????'}">
										<button class="btn btn-inverse-light btn-fw" onclick="fn_appr('Y');">??????</button>
										<button class="btn btn-inverse-light btn-fw" onclick="fn_appr('N');">??????</button>
									</c:if>
									<c:if test="${docOne.documentStatus eq '????????????' and aOne.approvalType eq '??????'}">
										<button class="btn btn-inverse-light btn-fw" onclick="fn_appr('Y');">??????</button>
										<button class="btn btn-inverse-light btn-fw" onclick="fn_appr('N');">??????</button>
									</c:if>
								</c:if>
								</c:forEach>
									<button class="btn btn-inverse-light btn-fw" onclick="javascript: void history.back();">??????</button>
								</div>
								<div style="display:grid;  border: 0.5px solid #989b9c78; margin:auto; justify-items: stretch; justify-content: space-evenly;margin-top: 20px; margin-bottom: 40px;">
									<!-- ?????? ?????? ?????????????????? -->
									<div>
										<h1 id="titleName" align='center' style='padding:70px 0 40px 0'>${docOne.documentKind }</h1>
										<table style="display: inline-flex; position: relative; float: left; left: 10%;">
											<tbody id="infoTable">
											<tr>
				    							<td style='background: rgb(221, 221, 221); width:100px; padding: 5px; border: 1px solid black; height: 35.5px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;'>
				    								????????????
				    							</td>
				    							<td style='background: rgb(255, 255, 255); width:150px; border-width:1px 1px; border-style:  solid solid; border-color: currentColor black black; padding: 5px; height: 25px; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;' colspan='3' class='dext_table_border_t'>
				    								No. ${docOne.documentNo }
				    							</td>
			    							</tr>
											
											<tr>
				    							<td style='background: rgb(221, 221, 221); width:100px; padding: 5px; border: 1px solid black; height: 35.5px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;'>
				    								??????
				    							</td>
				    							<td style='background: rgb(255, 255, 255); width:150px; border-width:1px 1px; border-style:  solid solid; border-color: currentColor black black; padding: 5px; height: 25px; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;' colspan='3' class='dext_table_border_t'>
				    								${empInfo.TEAM_NAME }
				    							</td>
			    							</tr>
			    							
			    							<tr>
				    							<td style='background: rgb(221, 221, 221); width:100px; padding: 5px; border: 1px solid black; height: 35.5px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;'>
				    								??????
				    							</td>
				    							<td style='background: rgb(255, 255, 255); width:150px; border-width:1px 1px; border-style:  solid solid; border-color: currentColor black black; padding: 5px; height: 25px; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;' colspan='3' class='dext_table_border_t'>
				    								${empInfo.EMP_JOB }
				    							</td>
			    							</tr>
			    							
			    							<tr>
				    							<td style='background: rgb(221, 221, 221); width:100px; padding: 5px; border: 1px solid black; height: 35.5px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;'>
				    								??????
				    							</td>
				    							<td style='background: rgb(255, 255, 255); width:150px; border-width:1px 1px; border-style:  solid solid; border-color: currentColor black black; padding: 5px; height: 25px; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;' colspan='3' class='dext_table_border_t'>
				    								${empInfo.EMP_NAME }
				    							</td>
				    						</tr>
											</tbody>
										</table>
										<table border="1" style="display:inline-flex; position:relative; float: right; right: 10%;">
											<tbody id="apprTable">
												<tr id='apprLine1'>
				    								<td id='apprLine1-def'style='width:20px; background: rgb(221, 221, 221);' rowspan='4'>??????</td><td id='apprLine1-def' style='width:80px; height:21px; text-align:center'>${empInfo.EMP_JOB }</td>
				    								<c:forEach items="${aList }" var="aOne" varStatus="status">
				    									<c:if test="${aOne.approvalType eq '??????' }">
				    										<td id='apprLine1-def'style='width:20px; background: rgb(221, 221, 221);' rowspan='4'>??????</td><td id='apprLine1-def' style='width:80px; height:21px; text-align:center'>${aOne.empJob }</td>
				    									</c:if>
				    								</c:forEach>
				    								<c:forEach items="${aList }" var="aOne" varStatus="status">
				    									<c:if test="${aOne.approvalType eq '??????' }">
				    										<td id='apprLine1-def'style='width:20px; background: rgb(221, 221, 221);' rowspan='4'>??????</td><td id='apprLine1-def' style='width:80px; height:21px; text-align:center'>${aOne.empJob }</td>
				    									</c:if>
				    								</c:forEach>
				    							</tr>
				    							<tr id='apprLine2'>
				    								<td id='apprLine2-def' rowspan='2' style='height:90px; text-align:center'>${empInfo.EMP_NAME }</td>
				    								<c:forEach items="${aList }" var="aOne" varStatus="status">
				    									<c:if test="${aOne.approvalType eq '??????' }">
				    										<td id='apprLine2-def' rowspan='2' style='height:90px; text-align:center'>
				    										<c:if test="${aOne.approvalStatus eq '??????' }">
				    											<img src="/images/approval.png" width="60px">
				    										</c:if>
				    										<c:if test="${aOne.approvalStatus eq '??????' }">
				    											<img src="/images/reject.png" width="60px">
				    										</c:if>
				    											${aOne.empName }
				    										</td>
				    									</c:if>
				    								</c:forEach>
				    								<c:forEach items="${aList }" var="aOne" varStatus="status">
				    									<c:if test="${aOne.approvalType eq '??????' }">
				    										<td id='apprLine2-def' rowspan='2' style='height:90px; text-align:center'>
				    										<c:if test="${aOne.approvalStatus eq '??????' }">
				    											<img src="/images/approval.png" width="60px">
				    										</c:if>
				    										<c:if test="${aOne.approvalStatus eq '??????' }">
				    											<img src="/images/reject.png" width="60px">
				    										</c:if>
				    											${aOne.empName }
				    										</td>
				    									</c:if>
				    								</c:forEach>
				    							</tr>
				    							<tr></tr>
				    							<tr id='apprLine3'>
				    								<td id='apprLine3-def' style='height:28px;text-align:center'>${docOne.dCreateDate }</td>
				    								<c:forEach items="${aList }" var="aOne" varStatus="status">
				    									<c:if test="${aOne.approvalType eq '??????' }">
				    										<td id='apprLine3-def' style='height:28px;text-align:center'>${aOne.approvalEnddate }</td>
				    									</c:if>
				    								</c:forEach>
				    								<c:forEach items="${aList }" var="aOne" varStatus="status">
				    									<c:if test="${aOne.approvalType eq '??????' }">
				    										<td id='apprLine3-def' style='height:28px;text-align:center'>${aOne.approvalEnddate }</td>
				    									</c:if>
				    								</c:forEach>
				    							</tr>
											</tbody>
										</table>
									</div>
									<!-- ?????? ?????? ?????????????????? -->
									<c:if test="${docOne.documentKind eq '???????????????'}">
									<div id="vacationArea" style="padding:0 100px 50px 100px;">
										<table
											style="border: 0px solid rgb(0, 0, 0); width: 800px; font-family: malgun gothic, dotum, arial, tahoma; margin-top: 10px; border-collapse: collapse;">
											<!-- ????????? -->
											<colgroup>
												<col width="200">
												<col width="350">
												<col width="200">
												<col width="200">
											</colgroup>
											<tbody>
												<tr>
													<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">
														????????????
													</td>
													<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; height: 25px; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;" colspan="3">
														${docOne.vacationKind }
													</td>
												</tr>
												<tr>
													<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">
		
														????????????</td>
													<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; height: 25px; text-align: left; color: rgb(0, 0, 0); font-size: 14px; vertical-align: middle;"  colspan="3">
														${docOne.vStartDate }
														~
														${docOne.vEndDate }
													</td>
													
												</tr>
												<tr>
													<td
														style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">
		
														????????????</td>
													<td
														style="background: rgb(255, 255, 255); border-width: medium 1px 1px; border-style: none solid solid; border-color: currentColor black black; padding: 5px; height: 25px; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;"
														colspan="3" class="dext_table_border_t">
														${docOne.documnetReason }
													</td>
												</tr>
												<tr>
													<td
														style="border-width: medium 1px 1px; border-style: none solid solid; border-color: currentColor black black; padding: 5px; height: 100px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; vertical-align: middle; background-color: rgb(255, 255, 255);"
														colspan="4" class="dext_table_border_t"><span
														style="font-weight: bold; font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">????????????
															??? 13?????? ?????? ????????? ??????????????? ???????????? ????????? ????????????.</span></td>
												</tr>
											</tbody>
										</table>
										<p style="font-family: &amp; quot; ?????? ??????&amp;quot;; font-size: 10pt; line-height: 20px; margin-top: 0px; margin-bottom: 0px;"><br></p>
									</div>
									</c:if>
									<c:if test="${docOne.documentKind ne '???????????????'}">
									<div align="center" style="padding:0 100px 50px 100px;">
										${docOne.documentContents }
									</div>
									</c:if>
								</div>
								<div class="col-lg-12">
									<form action="">
										<input type="hidden" id="documentNo" name="documentNo" value="${docOne.documentNo }" >
									</form>
									
									<table class="table table-bordered">
										<tr>
											<th>??????</th>
											<th>??????/?????????</th>
											<th>????????????</th>
											<th>????????????</th>
											<th>????????????</th>
											<th>????????????</th>
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
			</div>
			<!-- page-body-wrapper ends -->
		</div>
	</div>
	<form action="/documentPrint.do" method="post" id="printForm" target="printPop">
		<input name="bodyContents" type="hidden">	
	</form>
</body>

</html>