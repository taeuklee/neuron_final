<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            <img src="images/faces/face28.png">
          </div>
          <div class="user-name">
              Edward Spencer
          </div>
          <div class="user-designation">
              Developer
          </div>
        </div>
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
              <span class="menu-title">프로젝트이름</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="menu4">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"><b1>대표업무</b1></li>
                <li class="nav-item"> <a class="nav-link" href="#" onclick="location.href='selectProjectMainWork.do'">대표업무 조회</a></li>
                <li class="nav-item"> <a class="nav-link" href="#" onclick="location.href='moveInsertMainWorkForm.do'">대표업무 등록</a></li>
                <li class="nav-item"><b1>팀원</b1></li>
                <li class="nav-item"> <a class="nav-link" href="#" onclick="location.href='selectProjectMemberList.do'">팀원목록</a></li>
                <li class="nav-item"><b1>이동</b1></li>
                <li class="nav-item"> <a class="nav-link" href="#" onclick="location.href='selectProjectMain.do'">프로젝트메인으로</a></li>
                <li class="nav-item"> <a class="nav-link" href="#" onclick="location.href='/'">프로젝트나가기</a></li>
              </ul>
            </div>
          </li>                  
       		
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#menu5" aria-expanded="false" aria-controls="menu5">
              <i class="icon-disc menu-icon"></i>
              <span class="menu-title">전자결재</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="menu5">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"><b1>기안</b1><a class="nav-link" href="#">결재요청함</a></li>
                <li class="nav-item"> <a class="nav-link" href="#">임시저장함</a></li>
                <li class="nav-item"><b1>결재</b1><a class="nav-link" href="#">결재대기함</a></li>
                <li class="nav-item"> <a class="nav-link" href="#">결재진행함</a></li>
                <li class="nav-item"> <a class="nav-link" href="#">반려문서함</a></li>
                <li class="nav-item"> <a class="nav-link" href="#">완료문서함</a></li>
              </ul>
            </div>
          </li>
          
          <li class="nav-item">
            <a class="nav-link" href="#">
              <i class="icon-file menu-icon"></i>
              <span class="menu-title">공지사항</span>
            </a>
          </li>
        </ul>
      </nav>
</body>
</html>