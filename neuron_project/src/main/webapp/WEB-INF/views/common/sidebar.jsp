<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<nav class="sidebar sidebar-offcanvas" id="sidebar">
		<c:if test="${ empty sessionScope.loginEmployee }">
			<div class="user-profile">
				<div class="user-image">
					<img src="images/faces/basic.jpg">
				</div>
				<div class="emp-name">로그인이</div>
				<div class="emp-job">필요합니다</div>
			</div>
		</c:if>
		<c:if test="${not empty sessionScope.loginEmployee }">

			<div class="user-profile">
				<div class="user-image">
					<a href="#" onclick="location.href='empInfo.do'"><img
						src="/resources/euploadFiles/${loginEmployee.empFileReName}"></a>
				</div>
				<div class="emp-name">${loginEmployee.empName}</div>
				<div class="emp-job">${loginEmployee.empJob}</div>
			</div>
		</c:if>
		<ul class="nav">
			<li class="nav-item"><a class="nav-link" href="/home.do"> <i
					class="icon-box menu-icon"></i> <span class="menu-title">Home</span>
			</a></li>

			<li class="nav-item"><a class="nav-link" data-toggle="collapse"
				href="#menu1" aria-expanded="false" aria-controls="menu1"> <i
					class="icon-disc menu-icon"></i> <span class="menu-title">근태관리</span>
					<i class="menu-arrow"></i>
			</a>
				<div class="collapse" id="menu1">
					<ul class="nav flex-column sub-menu">
						<li class="nav-item"><a class="nav-link" href="#" onclick="location.href='/attendanceList.do'">나의 근태
								내역</a></li>
						<li class="nav-item"><a class="nav-link" href="#" onclick="location.href='/holidayList.do'">나의 휴가
								내역</a></li>
					</ul>
				</div></li>
			<li class="nav-item"><a class="nav-link" href="#menu2" onclick="location:href='/orEmpListView.do';"> <i
					class="icon-box menu-icon"></i> <span class="menu-title">조직도</span>
			</a></li>
			<!-- <li class="nav-item"><a class="nav-link" data-toggle="collapse"
				href="#menu2" aria-expanded="false" aria-controls="menu2" onclick="location:href='/orEmpListView.do';"> <i
					class="icon-disc menu-icon"></i> <span class="menu-title">조직도</span></li></a> -->

			<li class="nav-item"><a class="nav-link" data-toggle="collapse"
				href="#menu3" aria-expanded="false" aria-controls="menu3"> <i
					class="icon-disc menu-icon"></i> <span class="menu-title" >메일</span>
					<i class="menu-arrow"></i>
			</a>
				<div class="collapse" id="menu3">
					<ul class="nav flex-column sub-menu">
						<li class="nav-item"><a class="nav-link" href="#" onclick="location:href='/inbox.do';">받은 메일함</a></li>
						<li class="nav-item"><a class="nav-link" href="#" onclick="location:href='/outbox.do';">보낸 메일함</a></li>
						<li class="nav-item"><a class="nav-link" href="#" onclick="location:href='/checkOutbox.do';">수신확인</a></li>
					</ul>
				</div></li>

			<li class="nav-item"><a class="nav-link" data-toggle="collapse"
				href="#menu4" aria-expanded="false" aria-controls="menu4"> <i
					class="icon-disc menu-icon"></i> <span class="menu-title">프로젝트</span>
					<i class="menu-arrow"></i>
			</a>
				<div class="collapse" id="menu4">
					<ul class="nav flex-column sub-menu" id="projectList">
					</ul>
				</div></li>

			<li class="nav-item"><a class="nav-link"
				href="moveSelectMemberCalendar.do?empNo=${loginEmployee.empNo }">
					<i class="icon-file menu-icon"></i> <span class="menu-title">일정
						관리</span>
			</a></li>

			<li class="nav-item"><a class="nav-link" data-toggle="collapse"
				href="#menu5" aria-expanded="false" aria-controls="menu5"> <i
					class="icon-disc menu-icon"></i> <span class="menu-title">전자결재</span>
					<i class="menu-arrow"></i>
			</a>
				<div class="collapse" id="menu5">
					<ul class="nav flex-column sub-menu">
						<li class="nav-item" align="center"><i class="menu-arrow"></i><span
							style="font-size: large; color: #F9D955;">기안</span>
							<ul style="list-style: none; cursor: pointer;">
								<li class="nav-item"><a class="nav-link"
									onclick="location:href='/approval/myDocumentListView.do';">결재요청함</a></li>
								<li class="nav-item"><a class="nav-link"
									href="#">임시저장함</a></li>
							</ul></li>
						<li class="nav-item" align="center"><i class="menu-arrow"></i><span
							style="font-size: large; color: #F9D955;">결재</span>
							<ul style="list-style: none">
								<li class="nav-item"><a class="nav-link"
									onclick="location:href='/approval/documentWaitListView.do';">결재대기함</a></li>
								<li class="nav-item"><a class="nav-link"
									onclick="location:href='#'">결재진행함</a></li>
								<li class="nav-item"><a class="nav-link" 
									onclick="location:href='/approval/documentRejectListView.do';">반려문서함</a></li>
								<li class="nav-item"><a class="nav-link" 
									onclick="location:href='/approval/documentCompleteListView.do';">완료문서함</a></li>
							</ul>
						</li>
					</ul>
				</div></li>

			<li class="nav-item"><a class="nav-link"
				onclick="location.href='/noticeListView.do'"> <i
					class="icon-file menu-icon"></i> <span class="menu-title">공지사항</span>
			</a></li>
			<c:if test="${loginEmployee.empId eq 'admin' }">
			<!-- 문서양식 등록하는 메뉴 추가했습니다 -->
				<li class="nav-item"><a class="nav-link" href="#menu2" onclick="location:href='/docFormRegister.do';"> <i
					class="icon-box menu-icon"></i> <span class="menu-title">문서양식등록</span></a></li>
				<li class="nav-item"><a class="nav-link" data-toggle="collapse"
					href="#menu6" aria-expanded="false" aria-controls="menu6"> <i
						class="icon-disc menu-icon"></i> <span class="menu-title">사원 관리</span>
						<i class="menu-arrow"></i>
				</a>
					<div class="collapse" id="menu6">
						<ul class="nav flex-column sub-menu">
							<li class="nav-item"><a class="nav-link"
								onclick="location.href='/enrollView.do'">사원 등록</a></li>
							<li class="nav-item"><a class="nav-link"
								onclick="location.href='/empListView.do'">사원 조회</a></li>
						</ul>
					</div></li>
				<li class="nav-item"><a class="nav-link" data-toggle="collapse"
					href="#menu7" aria-expanded="false" aria-controls="menu7"> <i
						class="icon-disc menu-icon"></i> <span class="menu-title">부서 관리</span>
						<i class="menu-arrow"></i>
				</a>
					<div class="collapse" id="menu7">
						<ul class="nav flex-column sub-menu">
							<li class="nav-item"><a class="nav-link"
								onclick="location.href='/deptListView.do'">부서 조회</a></li>
							<li class="nav-item"><a class="nav-link"
								onclick="location.href='/deptAddView.do'">부서 추가</a></li>
						</ul>
					</div></li>
				<li class="nav-item"><a class="nav-link" data-toggle="collapse"
					href="#menu8" aria-expanded="false" aria-controls="menu8"> <i
						class="icon-disc menu-icon"></i> <span class="menu-title">프로젝트 관리</span>
						<i class="menu-arrow"></i>
				</a>
					<div class="collapse" id="menu8">
						<ul class="nav flex-column sub-menu">
							<li class="nav-item"><a class="nav-link"
								onclick="location:href='/proListView.do';">리스트 조회</a></li>
							<li class="nav-item"><a class="nav-link"
								onclick="location:href='/proOkListView.do';">생성 요청</a></li>
							<li class="nav-item"><a class="nav-link"
								onclick="location:href='/proNoListView.do';">삭제 요청</a></li>
						</ul>
					</div></li>
			</c:if>
		</ul>
	</nav>

	<script>
			window.onload = function() {
				$.ajax({
					url : "selectProjectList.do?empNo=${loginEmployee.empNo}",
					type : "get",
					dataType:"json",
					async:false,
					success:function(data){
						
						var $projectList = $("#projectList");
						//$projectList.html("");
						if(data.length > 0){
							for(var i in data){
							console.log(data[i]);
							var $li = $("<li class='nav-item'> <a class='nav-link' href='#' onclick='selectProjectDetail("+data[i].projectNo+")'>"+data[i].projectTitle+"</a></li>")
							$projectList.append($li)
							}
						}
					},error:function(){
					}
				});
				
				$.ajax({
					url : "selectMemberProjectList.do?empNo=${loginEmployee.empNo}",
					type : "get",
					dataType:"json",
					async:false,
					success:function(data){
						
						var $projectList = $("#projectList");
						//$projectList.html("");
						if(data.length > 0){
							for(var i in data){
							console.log(data[i]);
							var $li = $("<li class='nav-item'> <a class='nav-link' href='#' onclick='selectProjectDetail("+data[i].projectNo+")'>"+data[i].projectTitle+"</a></li>")
							$projectList.append($li)
							}
						}
					},error:function(){
					}
				});
				
				
				
				
			}
			
			function selectProjectDetail(projectNo) {
				console.log(projectNo)
				location.href ='selectProjectDetail.do?projectNo='+projectNo	
			}
      </script>
</body>
</html>