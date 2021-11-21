<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>프로젝트 팀원 목록</title>
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
	$(document).ready(function() {
		$("#headerNav").load("partials/_navbar.html");
		$("#sidebar").load("partials/_sidebar.html");
		$("#footer").load("partials/_footer.html");
		$("#contents").load("contents/mainPage.html");
	});
</script>
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
<style>
.demo {
	background-color: #f5f5f5;
	font-family: 'Varela Round', sans-serif;
}

.panel {
	padding: 0;
	border-radius: 0;
}

.panel .panel-heading {
	background: #ff393f;
	padding: 20px 40px;
	border-radius: 0;
	margin: 0;
}

.panel .panel-heading .title {
	color: #fff;
	font-size: 28px;
	font-weight: 400;
	text-transform: capitalize;
	margin: 0;
}

.panel .panel-heading .btn {
	color: #566787;
	font-size: 13px;
	padding: 7px 12px 5px;
	border-radius: 0;
	/* 	border: none; */
	transition: all 0.3s ease 0s;
}

.panel .panel-heading .btn:hover {
	background: #fff;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
}

.panel .panel-body {
	padding: 20px;
}

.panel .panel-body .table {
	margin: 0;
	border-top: 1px solid #ddd;
}

.panel .panel-body .table thead tr th {
	font-size: 17px;
	font-weight: 600;
	padding: 12px;
}

.panel .panel-body .table tbody tr td {
	color: #555;
	font-size: 15px;
	padding: 10px 12px;
	vertical-align: middle;
}

.panel .panel-body .table .user_icon {
	width: 50px;
	height: 50px;
	margin: 0 5px 0 0;
	border-radius: 100px;
	display: inline-block;
}

.panel .panel-body .table .user_icon img {
	width: 100%;
	height: auto;
	border-radius: 50%;
}

.panel .panel-body .table tbody .status {
	position: relative;
	padding-left: 12px;
}

.panel .panel-body .table tbody .status:before {
	content: "";
	background: #28a745;
	width: 8px;
	height: 8px;
	border-radius: 50%;
	position: absolute;
	top: 5px;
	left: 0;
}

.panel .panel-body .table tbody .status.block:before {
	background: #dc3545;
}

.panel .panel-body .table tbody .status.inactive:before {
	background: #ffc107;
}

.panel .panel-body .table tbody .action-list {
	padding: 0;
	margin: 0;
	list-style: none;
}

.panel .panel-body .table tbody .action-list li {
	display: inline-block;
	margin: 0 5px;
}

.panel .panel-body .table tbody .action-list li a {
	color: #03A9F4;
	font-size: 16px;
	position: relative;
	z-index: 1;
	transition: all 0.3s ease 0s;
}

.panel .panel-body .table tbody .action-list li a:hover {
	text-shadow: 0 0 2px rgba(0, 0, 0, 0.3);
}

.panel .panel-body .table tbody .action-list li a.delete {
	color: #E34724;
}

.panel .panel-body .table tbody .action-list li a:before, .panel .panel-body .table tbody .action-list li a:after
	{
	content: attr(data-tip);
	color: #fff;
	background-color: #111;
	font-size: 12px;
	padding: 5px 7px;
	border-radius: 4px;
	text-transform: capitalize;
	display: none;
	transform: translateX(-50%);
	position: absolute;
	left: 50%;
	top: -32px;
	transition: all 0.3s ease 0s;
}

.panel .panel-body .table tbody .action-list li a:after {
	content: '';
	height: 15px;
	width: 15px;
	padding: 0;
	border-radius: 0;
	transform: translateX(-50%) rotate(45deg);
	top: -18px;
	z-index: -1;
}

.panel .panel-body .table tbody .action-list li a:hover:before, .panel .panel-body .table tbody .action-list li a:hover:after
	{
	display: block;
}

.panel .panel-footer {
	color: #999;
	background-color: transparent;
	padding: 15px;
	border: none;
}

.panel .panel-footer .col {
	line-height: 35px;
}

.pagination {
	margin: 0;
}

.pagination li a {
	color: #999;
	font-size: 20px;
	font-weight: 500;
	margin: 0 2px;
	border: none;
}

.pagination li a:hover {
	color: #999;
	background: #e9ecef;
}

.pagination li a:focus, .pagination li.active a {
	color: #fff;
	background-color: #ff393f;
}

@media only screen and (max-width:767px) {
	.panel .panel-heading .title {
		text-align: center;
		margin: 0 0 10px;
	}
	.panel .panel-heading .btn_group {
		text-align: center;
	}
}
</style>


</head>

<body>
	<div class="container-scroller">
		<!-- partial:partials/_navbar.html 해더 창 -->
		<jsp:include page="../projectCommon/navbar.jsp"></jsp:include>
		<!-- partial -->
		<div class="container-fluid page-body-wrapper">
			<!-- partial:partials/_sidebar.html 사이드 바  -->
			<jsp:include page="../projectCommon/sidebar.jsp"></jsp:include>
			<!-- partial -->
			<div class="main-panel">
				<div class="content-wrapper" id="contents">
					<div class="col-md-offset-1 col-md-12" style="height: 100%">
						<div class="panel" style="height: 100%">
							<div class="panel-heading" style="height: 10%">
								<div class="row">
									<div class="col col-sm-3 col-xs-12">
										<h4 class="title">
											팀원 <span>목록</span>
										</h4>
									</div>
									<div class="col-sm-9 col-xs-12 text-right">
										<div class="btn_group">
											<form class="d-flex" style="width: 70%; float: left"
												onsubmit="return false">
												<input class="form-control me-1" type="search"
													placeholder="이름을 입력해주세요" aria-label="Search"
													id="searchText" onkeyup="enterKeyup()">
												<button class="btn btn-primary" type="submit"
													style="width: 20%; height: 50px"
													onclick="projectSearchMemberList()">검색</button>
											</form>
											<c:if test="${loginEmployee.empNo eq master.empNo }">
												<button class="btn btn-primary btn-sm btn-default"
													style="height: 50px" onclick="inviteMember()">
													<i class="fa fa-plus-circle"></i> 팀원 초대
												</button>
											</c:if>
										</div>
									</div>
								</div>
							</div>
							<div class="panel-body table-responsive" style="height: 85%">
								<table class="table table-hover" style="height: 100%">
									<thead>
										<tr>
											<th>이름</th>
											<th>부서</th>
											<th>권한</th>
											<th>액션</th>
										</tr>
									</thead>
									<tbody id="memberList">
										<c:forEach items="${memberList }" var="memberList">
											<tr>
												<td>
													<div class="user_icon">
														<img src="/resources/euploadFiles/${memberList.empFileReName }" alt="">
													</div> ${memberList.empName }
												</td>
												<td>${memberList.deptName }</td>
												<c:if test="${loginEmployee.empNo ne master.empNo }">
													<td>${memberList.empAuth }</td>
												</c:if>
												<c:if test="${loginEmployee.empNo eq master.empNo }">
													<td><select name="memberAuth" id="memberAuth">
															<option
																<c:if test="${memberList.empAuth  == '보조관리자' }">selected</c:if>>보조관리자</option>
															<option
																<c:if test="${memberList.empAuth  == '팀원' }">selected</c:if>>팀원</option>
													</select></td>
												</c:if>
												<c:if test="${loginEmployee.empNo eq master.empNo }">
													<td>
														<button class="btn btn-danger "
															onclick="deleteMember(${memberList.empNo})">추방</button>
														<button type="button" class="btn btn-primary"
															onclick="updateMember(${memberList.empNo}, this)">수정</button>
													</td>
												</c:if>
											</tr>
										</c:forEach>
										<!-- 										<tr> -->
										<!-- 											<td>2</td> -->
										<!-- 											<td> -->
										<!-- 												<div class="user_icon"> -->
										<!-- 													<img src="images/img2.jpg" alt=""> -->
										<!-- 												</div> Taylor Reyes -->
										<!-- 											</td> -->
										<!-- 											<td>22</td> -->
										<!-- 											<td><span class="status inactive">Inactive</span></td> -->
										<!-- 											<td> -->
										<!-- 												<ul class="action-list"> -->
										<!-- 													<li><a href="#" class="setting" data-tip="setting"><i -->
										<!-- 															class="fa fa-cog"></i></a></li> -->
										<!-- 													<li><a href="#" class="delete" data-tip="delete"><i -->
										<!-- 															class="fa fa-times-circle"></i></a></li> -->
										<!-- 												</ul> -->
										<!-- 											</td> -->
										<!-- 										</tr> -->
									</tbody>
								</table>
							</div>
							<div class="panel-footer p-0" style="height: 5%">
								<div class="row" style="height: 100%">
									<div class="col-sm-6 col-xs-4" style="height: 100%" id="page">
										<c:url var="before" value="selectSearchMemberList.do?projectNo=${project.projectNo }&searchText=${searchText }">
											<c:param name="page" value="${pi.currentPage - 1 }"></c:param>
										</c:url>
										<c:if test="${pi.currentPage <= 1 }">
											[이전]
										</c:if>
										<c:if test="${pi.currentPage > 1 }">
											<a href="${before }">[이전]</a>
										</c:if>
										<c:forEach var="p" begin="${pi.startNavi }"
											end="${pi.endNavi }">
											<c:url var="pagination" value="selectSearchMemberList.do?projectNo=${project.projectNo }&searchText=${searchText }">
												<c:param name="page" value="${p }"></c:param>
											</c:url>
											<c:if test="${p eq pi.currentPage }">
												<font color="red" size="4">[${p }]</font>
											</c:if>
											<c:if test="${p ne pi.currentPage }">
												<a href="${pagination }">${p }</a>&nbsp;
										</c:if>
										</c:forEach>
										<c:url var="after" value="selectSearchMemberList.do?projectNo=${project.projectNo }&searchText=${searchText }">
											<c:param name="page" value="${pi.currentPage + 1 }"></c:param>
										</c:url>
										<c:if test="${pi.currentPage >= pi.maxPage }">
										[다음]
										</c:if>
										<c:if test="${pi.currentPage < pi.maxPage }">
											<a href="${after }">[다음]</a>
										</c:if>
										<!-- 										<ul class="pagination visible-xs pull-right"> -->
										<!-- 											<li><a href="#"><</a></li> -->
										<!-- 											<li><a href="#">></a></li> -->
										<!-- 										</ul> -->
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- partial:partials/_footer.html -->
				<jsp:include page="../projectCommon/footer.jsp"></jsp:include>
				<!-- partial -->
			</div>
			<!-- main-panel ends -->
		</div>
		<!-- page-body-wrapper ends -->
	</div>
	<!-- container-scroller -->
	<script type="text/javascript">
	
		function inviteMember() {

			var url = "moveInviteMember.do?projectNo=${projectNo}";
			var name = "팀원 초대";
			var option = "width = 1000, height = 800, top = 300 , left = 650, location = no, toolbars = no, status = no, scrollbars = no, resizable = no";
			window.open(url, name, option);
		}

		function projectSearchMemberList() {
			var searchText = document.getElementById('searchText').value;
			var memberList = document.getElementById('memberList')
			location.href="selectSearchMemberList.do?projectNo=${project.projectNo}&searchText="+searchText;
			
// 					$.ajax({
// 						url : "selectSearchMemberList.do?projectNo=${project.projectNo}",
// 						type : "get",
// 						data : {
// 							"searchText" : searchText
// 						},
// 						dataType : "json",
// 						success : function(data) {
// 							var $memberList = $("#memberList");
// 							$memberList.html("");
// 							var $tr;
// 							var $td1;
// 							var $td2;
// 							var $td3;
// 							var $td4;
// 							var $memberName;
// 							var $memberDeptCode;
// 							var $memberJob;
// 							var $btnArea;
// 							var $imgArea;
// 							if (data.length > 0) {
// 								for ( var i in data) {
// 									$div1 = $("	<div class='card mb-3' style='max-width: 540px;'>");
// 									$tr = $("<tr>")
// 									$td1 = $("<td><div class='user_icon'><img src='images/img1.jpg' alt=''></div>"+data[i].empName + "</td>")
// 									$td2 = $("<td>"+data[i].deptName+"</td>")
// 									$td3 = $("<td>"+data[i].empAuth+"</td>")
// 									$td4 = $("<td><ul class='action-list'><li><a href='#' class='edit' data-tip='setting'><i class='fa fa-cog'></i></a></li><li><a href='#' class='delete' data-tip='delete'><i class='fa fa-times-circle'></i></a></li></ul></td>")
// 									$tr.append($td1)
// 									$tr.append($td2)
// 									$tr.append($td3)
// 									$tr.append($td4)
// 									$memberList.append($tr)
// 									//	 						$memberList.append($div2);
// 									//	 						$memberList.append($div3);
// 									//	 						$memberList.append($div4);
// 									//	 						$memberList.append($div5);
// 								}
// 							}
// 						},
// 						error : function() {
// 							alert("오류가 발생했습니다..")
// 						}
// 					});
		}

		function enterKeyup() {
			console.log("여긴오니")
			if (window.event.keyCode == 13) {
				projectSearchMemberList()
			}
		}
		
		function deleteMember(empNo) {
			$.ajax({
				url:"deleteProjectMember.do?projectNo=${project.projectNo}",
				type:"get",
				data:{
					"empNo":empNo
				},
				success:function(data){
					if(data=="success"){
						alert("삭제되었습니다.")
						window.location.reload();
					}else{
						alert("삭제가 실패하였습니다.")
					}
				},error:function(){
					alert("오류발생");
				}
			})
		}
		
		function updateMember(empNo, data) {
			console.log(data.parentNode.previousSibling.previousSibling.firstChild.nextSibling)
			var memberAuth = data.parentNode.previousSibling.previousSibling.firstChild.nextSibling.value;
			console.log(memberAuth);
			$.ajax({
				url:"updateProjectMember.do?projectNo=${project.projectNo}&empNo="+empNo,
				type:"get",
				data:{
					"memberAuth":memberAuth
				},
				success:function(data){
					if(data=="success"){						
					alert("권한 부여 성공했습니다");
					window.location.reload()
					}
				},error:function(){
					alert("오류발생")
				}
			})
		}
	</script>
</body>

</html>