<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
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
            <img src="images/faces/face28.png">
          </div>
          <div class="emp-name">
              edward spenser
          </div>
          <div class="emp-job">
              developer
          </div>
        </div>
        </c:if>
		<c:if test="${not empty sessionScope.loginEmployee }">
        <div class="user-profile">
          <div class="user-image">
            <a href="#" onclick="location.href='empInfo.do'"><img src="images/faces/face28.png"></a>
          </div>
          <div class="emp-name">
              ${loginEmployee.empName}
          </div>
          <div class="emp-job">
              ${loginEmployee.empJob}
          </div>
        </div>
        </c:if>
        <ul class="nav">
        	<li class="nav-item">
            <a class="nav-link" href="index.jsp">
              <i class="icon-box menu-icon"></i>
              <span class="menu-title">Home</span>
            </a>
          </li>
          
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#menu1" aria-expanded="false" aria-controls="menu1">
              <i class="icon-disc menu-icon"></i>
              <span class="menu-title">근태관리</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="menu1">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="#">나의 근태 내역</a></li>
                <li class="nav-item"> <a class="nav-link" href="#">나의 휴가 내역</a></li>
              </ul>
            </div>
          </li>
          
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#menu2" aria-expanded="false" aria-controls="menu2">
              <i class="icon-disc menu-icon"></i>
              <span class="menu-title">조직도</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="menu2">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="#">조직개편</a></li>
                <li class="nav-item"> <a class="nav-link" href="#">사원관리</a></li>
              </ul>
            </div>
          </li>
          
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#menu3" aria-expanded="false" aria-controls="menu3">
              <i class="icon-disc menu-icon"></i>
              <span class="menu-title">메일</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="menu3">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="#">받은 메일함</a></li>
                <li class="nav-item"> <a class="nav-link" href="#">보낸 메일함</a></li>
              	<li class="nav-item"> <a class="nav-link" href="#">수신확인</a></li>
              </ul>
            </div>
          </li>
          
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#menu4" aria-expanded="false" aria-controls="menu4">
              <i class="icon-disc menu-icon"></i>
              <span class="menu-title">프로젝트</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="menu4">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="#" onclick="location.href='selectProjectMain.do'">Neuron Project1</a></li>
                <li class="nav-item"> <a class="nav-link" href="#">Neuron Project2</a></li>
              </ul>
            </div>
          </li>
          
          <li class="nav-item">
            <a class="nav-link" href="selectMemberCalendar.do">
              <i class="icon-file menu-icon"></i>
              <span class="menu-title">일정 관리</span>
            </a>
          </li>
          
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#menu5" aria-expanded="false" aria-controls="menu5">
              <i class="icon-disc menu-icon"></i>
              <span class="menu-title">전자결재</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="menu5">
              <ul class="nav flex-column sub-menu">
	            <li class="nav-item" align="center">
	            <i class="menu-arrow"></i><span style="font-size:large; color:#F9D955;">기안</span>
	              	<ul style="list-style:none; cursor:pointer;">
		                <li class="nav-item"> <a class="nav-link" onclick="location:href='/documentList.do';">결재요청함</a></li>
		                <li class="nav-item"> <a class="nav-link" href="#">임시저장함</a></li>
	              	</ul>
	            </li>
	            <li class="nav-item" align="center">
	            <i class="menu-arrow"></i><span style="font-size:large; color:#F9D955;">결재</span>
	            	<ul style="list-style:none">
		                <li class="nav-item"> <a class="nav-link" href="#">결재대기함</a></li>
		                <li class="nav-item"> <a class="nav-link" href="#">결재진행함</a></li>
		                <li class="nav-item"> <a class="nav-link" href="#">반려문서함</a></li>
		                <li class="nav-item"> <a class="nav-link" href="#">완료문서함</a></li>
	            	</ul>
	            </li>
              </ul>
            </div>
          </li>
          
          <li class="nav-item">
            <a class="nav-link" onclick="location.href='/noticeListView.do'">
              <i class="icon-file menu-icon"></i>
              <span class="menu-title">공지사항</span></a>
            </a>
          </li>
          <c:if test="${not empty sessionScope.loginEmployee }">
                   <li class="nav-item">
            <a class="nav-link" onclick="location.href='/enrollView.do'">
              <i class="icon-file menu-icon"></i>
              <span class="menu-title">사원 관리</span></a>
            </a>
          </li>
          </c:if>
        </ul>
      </nav>
</body>
</html>