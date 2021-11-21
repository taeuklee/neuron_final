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
<script src="/ckeditor/ckeditor.js" ></script>
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
<style>

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
<script>
	$(document).ready(function() {
		$("#headerNav").load("/partials/_navbar.html");
		$("#sidebar").load("/partials/_sidebar.html");
		
		$("#docGu").change(function(){
			$("#cke_documentFormReg").css("width", '1000px');
			var docGuVal = $('#docGu option:selected').val();
			//신규등록일 경우
			if(docGuVal == 'newContent'){
				$("button[name='newContentBtn']").show();
				$("input[name='contentName']").show();
				CKEDITOR.instances.documentFormReg.setData("");
			}else{
				$("#titleName").html(docGuVal);
				$("button[name='newContentBtn']").hide();
				$("input[name='contentName']").hide();
				CKEDITOR.instances.documentFormReg.setData($("#" + docGuVal).html());
			}
		});
	});
	
	function fn_save(){
		var codeId = $('#docGu option:selected').val();
		if(codeId == ''){
			alert('결재구분을 클릭해주세요.');
			return;
		}
		var check = confirm("정말 등록/수정 하시겠습니까?");
		if(!check){
			return;
		}
		if(codeId == 'newContent'){
			//신규등록일 경우 결재 제목을 codeId로 세팅
			var el = $("input[name='contentName']");
			if(el.val() == ''){
				alert("결재 구분 제목을 입력해주세요.");
				el.focus();
				return;
			}
			$("input[name='codeId']").val(el.val());
			$("input[name='codeGubun']").val("newCode");
		}else{
			$("input[name='codeId']").val(codeId);
			$("input[name='codeGubun']").val("oldCode");
		}
		
		$("textarea[name='documentFormReg']").val(CKEDITOR.instances.documentFormReg.getData());
		$("#doc_reg").submit();
	}
	
	function fn_newContent(){
		var el = $("input[name='contentName']");
		if(el.val() == ''){
			alert("결재 구분 제목을 입력해주세요.");
			el.focus();
			return;
		}else{
			$("#titleName").html(el.val());
		}
	}
</script>


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
						<h1 class="page-header">문서양식 등록</h1>
					</div>
					<div class="col-lg-6 grid-margin stretch-card"
						style="max-width: 100%;">
						
						<div class="card">
							<form id="doc_reg" action="documentRegisterProcess.do" method="post">
								<input type="hidden" name="groupCodeId" value="DOC_GUBUN">
								<input type="hidden" name="codeId">
								<input type="hidden" name="codeGubun">
								<table class="table">
									<tr>
										<td width="100"><b>결재 구분</b></td>
										<td><select id="docGu" name="docGubun">
												<option selected disabled>선택하세요</option>
												<c:forEach items="${code }" var="item">
													<c:if test="${item.codeName ne '휴가신청서' }">
													<option value="${item.codeName }">${item.codeName }</option>
													</c:if>
												</c:forEach>
												<option value="newContent">신규등록</option>
											</select>
											<input name="contentName" type="text" style="display: none;" />
											<button name="newContentBtn" type="button" onclick="fn_newContent();" style="display: none;">제목 입력</button>
											<button name="newContentBtn2" type="button" onclick="fn_save();">등록/수정</button>
											<div id="contentArea" style="display: none;">
												<c:forEach items="${code }" var="item">
													<div id="${item.codeName }">${item.codeContents }</div>
													<c:if test="${item.codeId eq 'A' }">
													</c:if>
												</c:forEach>
											</div></td>
									</tr>
								</table>
								
								<div
									style="display: grid; border: 0.5px solid #989b9c78; margin: auto; justify-items: stretch; justify-content: space-evenly; margin-top: 20px; margin-bottom: 40px;">
									<div>
										<h1 id="titleName" align='center' style="padding: 70px 0 40px 0;"></h1>
											<p align='center'style="color:red;">기본 고정된 폼입니다. 수정이 불가합니다.</p>
										<table style="display: inline-flex; position: relative; float: left;">
											<tbody id="infoTable">
											
												<tr>
														<td style='background: rgb(221, 221, 221); width:100px; padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;'>
														소속
														</td>
														<td style='background: rgb(255, 255, 255); width:200px; border-width:1px 1px; border-style:  solid solid; border-color: currentColor black black; padding: 5px; height: 25px; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;' colspan='3' class='dext_table_border_t'>
															
														</td>
														</tr>

														<tr>
														<td style='background: rgb(221, 221, 221); width:100px; padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;'>
														직책
														</td>
														<td style='background: rgb(255, 255, 255); width:200px; border-width:1px 1px; border-style:  solid solid; border-color: currentColor black black; padding: 5px; height: 25px; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;' colspan='3' class='dext_table_border_t'>
														
														</td>
														</tr>

														<tr>
														<td style='background: rgb(221, 221, 221); width:100px; padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;'>
														성명
														</td>
														<td style='background: rgb(255, 255, 255); width:200px; border-width:1px 1px; border-style:  solid solid; border-color: currentColor black black; padding: 5px; height: 25px; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;' colspan='3' class='dext_table_border_t'>
														
														</td>
														</tr>
											</tbody>
										</table>
										<table border="1" style="display: inline-flex; position: relative; float: right;">
											<tbody id="apprTable">
											<tr id='apprLine1'>
												<td id='apprLine1-def'style='width:20px; background: rgb(221, 221, 221);' rowspan='4'>신청</td><td id='apprLine1-def' style='width:80px; height:25px; text-align:center'>
												
												</td>
												</tr>
												<tr id='apprLine2'><td id='apprLine2-def' rowspan='2' style='height:90px; text-align:center'>"
												
												</td></tr>
												<tr></tr>
												<tr id='apprLine3'><td id='apprLine3-def' style='height:28px;'></td></tr>
											</tbody>
										</table>
									</div>
									<textarea contenteditable="true" name="documentFormReg" rows="" cols=""></textarea>
									<script type="text/javascript">
										CKEDITOR.replace('documentFormReg');
									</script>
								</div>
								<br>
								<br>
								<br>
								<hr>
	
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