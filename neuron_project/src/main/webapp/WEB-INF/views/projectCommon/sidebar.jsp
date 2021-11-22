<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<nav class="sidebar sidebar-offcanvas" id="sidebar">
		<div class="user-profile">
			<div class="user-image">
				<a href="#" onclick="location.href='empInfo.do'"><img
					src="/resources/euploadFiles/${loginEmployee.empFileReName}"></a>
			</div>
			<div class="emp-name">${loginEmployee.empName}</div>
			<div class="emp-job">${loginEmployee.empJob}</div>
		</div>
		<ul class="nav">
			<li class="nav-item"><a class="nav-link" href="home.jsp"> <i
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
					class="icon-disc menu-icon"></i> <span class="menu-title">${project.projectTitle }</span>
					<i class="menu-arrow"></i>
			</a>
				<div class="collapse" id="menu4">
					<ul class="nav flex-column sub-menu">
						<li class="nav-item"><b1>대표업무</b1></li>
						<li class="nav-item"><a class="nav-link" href="#"
							onclick="moveSelectMainWork()">대표업무
								조회</a></li>
						<c:if test="${loginEmployee.empNo eq project.projectMaster}">
						<li class="nav-item"><a class="nav-link" href="#"
							onclick="moveInsertMainWork()">대표업무 등록</a></li>
						<li class="nav-item"><a class="nav-link" href="#"
							onclick="moveUpdateMainWork()">대표업무 수정</a></li>
						<li class="nav-item"><a class="nav-link" href="#"
							onclick="moveInsertTask()">세부사항 등록</a></li>
						</c:if>
						<li class="nav-item"><b1>팀원</b1></li>
						<li class="nav-item"><a class="nav-link" href="#"
							onclick="location.href='selectProjectMemberList.do?projectNo=${project.projectNo}'">팀원목록</a></li>
						<li class="nav-item"><b1>이동</b1></li>
						<li class="nav-item"><a class="nav-link" href="#"
							onclick="location.href='selectProjectDetail.do?projectNo=${project.projectNo}'">프로젝트메인으로</a></li>
						<li class="nav-item"><a class="nav-link" href="#"
							onclick="location.href='/'">프로젝트나가기</a></li>
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
<!-- 		</ul> -->
			<c:if test="${loginEmployee.empNo eq master.empNo }">
				<li class="nav-item"><a class="nav-link" href="#"
					onclick="location.href='deleteProject.do?projectNo=${project.projectNo}'">
						<i class="icon-file menu-icon"></i> <span class="menu-title">프로젝트
							삭제요청</span>
				</a></li>
			</c:if>
		</ul>
	</nav>
	<script>
		function moveInsertMainWork() {
			$.ajax({
						url : "moveInsertMainWorkForm.do?projectNo=${project.projectNo}",
						type : "get",
						success : function(data) {
							if (data == "success") {
								location.href = "moveInsertMainWork.do?projectNo=${project.projectNo}";
							} else {
								alert("이미 대표업무가 등록되어 있습니다.")
							}
						},
						error : function() {

						}
					})
		}
		
		function moveInsertTask() {
			$.ajax({
						url : "checkMainWork.do.do?projectNo=${project.projectNo}",
						type : "get",
						success : function(data) {
							if (data == "success") {
								alert("대표업무가 등록되어 있지 않습니다.")
							} else {
								location.href = "moveInsertTaskForm.do?projectNo=${project.projectNo}";
							}
						},
						error : function() {

						}
					})
					
		}
		
		function moveSelectMainWork() {
			$.ajax({
						url : "checkMainWork.do.do?projectNo=${project.projectNo}",
						type : "get",
						success : function(data) {
							if (data == "success") {
								alert("대표업무가 등록되어 있지 않습니다.")
							} else {
								location.href="selectProjectMainWork.do?projectNo=${project.projectNo}";
							}
						},
						error : function() {

						}
					})
					
		}
		
		function moveUpdateMainWork() {
			$.ajax({
				url : "checkMainWork.do.do?projectNo=${project.projectNo}",
				type : "get",
				success : function(data) {
					if (data == "success") {
						alert("대표업무가 등록되어 있지 않습니다.")
					} else {
						location.href="selectDetailMainWork.do?projectNo=${project.projectNo}";
					}
				},
				error : function() {

				}
			})
		}
	
	</script>
</body>
</html>