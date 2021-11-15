<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<style type="text/css">
body {
	margin: 0;
	padding: 0;
}

.menu a {
	cursor: pointer;
}

.menu .hide {
	display: none;
}

.sub-menu a {
	cursor: pointer;
}

.sub-menu .hide {
	display: none;
}

.chk-state {
	color: black;
	cursor: pointer;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	function fn_submit(){
		var check = window.opener.document.getElementById("check").value;
		alert(check);
// 		$("#apprCheck").val(check);
// 		$("#transAppr").submit();
		$.ajax({
			url : "/transApproval.do"
			type : "post",
			data : {
				"" : ,
				"" :
			}
			success: function(data){
				if(data == "success"){
					alert("결재처리 완료!");
				}else{
					alert("결재처리 실패!");
				}
			},
			error : function(){
				alert("ajax 실패");
			}
		});
	
	}
</script>
</head>

<body>
	<div style="width: 100%; height: 30px; background: gray; color: white;">
		결재선 지정</div>
	<div class="main-panel" style="width: 100%">
		<div class="content-wrapper">
			<div class="row">
				<div class="col-md-5 grid-margin stretch-card">
					<div class="card">
						<div class="card-body">
							<input type="hidden" id="apprCheck" name="apprCheck">
							<table style="border: 1px solid rgb(0, 0, 0); font-family: malgun gothic, dotum, arial, tahoma; margin-top: 1px; border-collapse: collapse;"><!-- User --><colgroup><col width="100"><col width="220"></colgroup>
							<tbody>
								<tr width="500" height="200">
									<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle;">
										
						결재의견
									</td>
									<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle;">
									<textarea cols="50" rows="7" name="apprOpinion"></textarea>
									</td>
								</tr>
								
							</tbody>
							</table>
							<button onclick="fn_submit()">처리</button><button>취소</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>