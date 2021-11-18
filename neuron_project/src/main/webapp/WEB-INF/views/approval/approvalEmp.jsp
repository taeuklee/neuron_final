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
	var count = 0;
	// 결재선에 추가 
	function addAppr() {
		var selectApvl = $('input[name=select-apvl]:checked').val();// 체크된 사원 번호
		var appl = $('input[name=appl]:checked').val(); // 체크된 결제 종류(합의 또는 결재)
		var checkDup = false;
		var loginId = '<c:out value="${sessionScope.loginEmployee.empNo}"/>';
		
		if(selectApvl.split(":")[0] == loginId){
			alert("자신은 결재선에 추가할 수 없습니다.")
			return;
		}
		
		if(!selectApvl){
			alert("결재자 또는 합의자를 선택하세요.");
			return;
		}
		
		if ($("#결재 input[name='emp_id']").length >= 1) {
			$("#결재 input[name='emp_id']").each(function(index, item) {
				if ($(this).val().split(":")[0] == selectApvl.split(":")[0]) {
					alert("중복 체크는 안됩니다.");
					checkDup = true;
					return false;
				}
			});
		}
		
		if (!checkDup) {
			if(appl == "결재"){
				count = count+1;
			}
			//$("#결재").append("<input type='hidden' name='emp_id' value='"+selectApvl+":"+appl+"'>");
			var html = "<tr>";
			html += "<td>" + "<input type='hidden' name='emp_id' value='"+selectApvl+":"+appl+"'>" + appl + "</td>";
			html += "<td>" + selectApvl.split(":")[3] + "</td>";
			html += "<td>" + selectApvl.split(":")[2] + "</td>";
			html += "<td>" + selectApvl.split(":")[1] + "</td>";
			html += "<td><button onclick='rmAppr(this);'>삭제</button></td>";
			html += "</tr>";
			$("#결재선택").append(html);
		}
	}

	function fn_submit() {
		//1. 결재자 체크확인
		if(count<=0){
			alert("결재자가 없습니다.")
			count = 0;
			return;
		}
		//2. 체크된 선택자 배열 넘기기
		var apprEmpInfo = new Array();
		$('input[name=emp_id]').each(function(index,item){
			apprEmpInfo[index] = $(this).val();
		})
		//3. 부모창 호출
		opener.fn_apprEmpInfo(apprEmpInfo);
		window.close();
	}
	
	function rmAppr(thisRm){
		$(thisRm).closest("td").closest("tr").remove();
	}

	// html dom 이 다 로딩된 후 실행된다.
	$(document).ready(function() {

		// memu 클래스 바로 하위에 있는 a 태그를 클릭했을때
		$(".menu>a").click(function() {
			var submenu = $(this).next("ul");

			// submenu 가 화면상에 보일때는 위로 보드랍게 접고 아니면 아래로 보드랍게 펼치기
			if (submenu.is(":visible")) {
				submenu.slideUp();
			} else {
				submenu.slideDown();
			}
		});
		$(".sub-menu>a").click(function() {
			var submenu1 = $(this).next("ul");

			// submenu 가 화면상에 보일때는 위로 보드랍게 접고 아니면 아래로 보드랍게 펼치기
			if (submenu1.is(":visible")) {
				submenu1.slideUp();
			} else {
				submenu1.slideDown();
			}
		});
		$("#allmenu").click(function() {
			var a = $(".hide");
			if (a.is(":visible")) {
				a.slideUp();
			} else {
				a.slideDown();
			}
		});
	});
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
							<h4 class="card-title">조직도</h4>

							<!--                   <form class="forms-sample"> -->
							<!--                   	<select> -->
							<!--                   		<option>사원명</option> -->
							<!--                   		<option>부서명</option> -->
							<!--                   	</select> -->
							<!--                   	<input type="text"> -->
							<!--                   	<button>검색</button> -->
							<!--                   </form> -->


						<div>
							<button id="allmenu">펼치기</button>
							<c:forEach items="${dList }" var="dOne">
							<ul>
								<li class="menu"><a>${dOne.deptName }</a>
								<ul class="hide">
								<c:forEach items="${tList }" var="tOne">
								<c:if test="${dOne.deptCode eq tOne.deptCode }">
									<li class="sub-menu"><a>${tOne.teamName }</a>
									<ul class="hide">
										<c:forEach items="${eList }" var="eOne">
											<c:if test="${tOne.teamCode eq eOne.teamCode }">
												<li id="select">
													<label> 
													<input type="radio" name="select-apvl" value="${eOne.empNo}:${eOne.empJob }:${eOne.empName }:${tOne.teamName }">
															${eOne.empName } ${eOne.empJob }
													</label>
												</li>
											</c:if>
										</c:forEach>
									</ul>
									</li>
								</c:if>
								</c:forEach>
								</ul>
								</li>
							</ul>
							</c:forEach>
						</div>

						</div>
					</div>
				</div>
				<div class="col-md grid-margin">
					<div class="card">
						<p>결재구분</p>
						<label><input type="radio" name="appl" value="합의" checked>합의</label>
						<label><input type="radio" name="appl" value="결재">결재</label>
						<button onclick="addAppr();">추가</button>
					</div>
				</div>
				<div class="col-md-5 grid-margin stretch-card">
					<div class="card">
						<div class="card-body">
							<h4 class="card-title">결재선</h4>
							<div id="결재">
								<table id="결재선택" class="table">
								</table>
								<button onclick="fn_submit();">완료</button>
								<br>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>