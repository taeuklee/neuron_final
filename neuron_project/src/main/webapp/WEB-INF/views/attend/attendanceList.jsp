<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 근태관리</title>
<link rel="stylesheet" href="../../css/attendance.css">
  
  <!-- base:css -->
  <link rel="stylesheet" href="vendors/mdi/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="vendors/feather/feather.css">
  <link rel="stylesheet" href="vendors/base/vendor.bundle.base.css">
  <!-- endinject -->
  <!-- plugin css for this page -->
  <link rel="stylesheet" href="vendors/flag-icon-css/css/flag-icon.min.css"/>
  <link rel="stylesheet" href="vendors/font-awesome/css/font-awesome.min.css">
  <link rel="stylesheet" href="vendors/jquery-bar-rating/fontawesome-stars-o.css">
  <link rel="stylesheet" href="vendors/jquery-bar-rating/fontawesome-stars.css">
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="css/style.css">
  <!-- endinject -->
  <link rel="shortcut icon" href="images/favicon.png" />
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script>
    $(document).ready(function(){
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
</head>
<body>
	<div class="container-scroller">
		<jsp:include page="../common/navbar.jsp"></jsp:include>
		<div class="container-fluid page-body-wrapper">
			<jsp:include page="../common/sidebar.jsp"></jsp:include>
	
			<div class="main-panel">
		        <div class="content-wrapper">
		          <div class="top-title">
		            <h2>나의 근태관리</h2>
		          </div>
		          <div class="top-date" align="center">
		             <h4>2021년 11월 </h4> 
		             <br><br>
		          </div>
		          <div class="row stat-cards" id="stats">
		            <div class="col-md-6 col-xl-3">
		              <article class="stat-cards-item">
		                <div class="stat-cards-icon primary">
		                  <i class="icon-paper" ></i>
		                </div>
		                <div class="stat-cards-info">
		                  <p class="stat-cards-info__num">1</p>
		                  <p class="stat-cards-info__title">지각</p>
		                  <p class="stat-cards-info__progress">
		                    <span class="stat-cards-info__profit success">
		                      <i data-feather="trending-up" aria-hidden="true"></i>5
		                    </span>
		                    이번년 지각일 수
		                  </p>
		                </div>
		              </article>
		            </div>
		            <div class="col-md-6 col-xl-3">
		              <article class="stat-cards-item">
		                <div class="stat-cards-icon warning">
		                  <i class="icon-paper" ></i>
		                </div>
		                <div class="stat-cards-info">
		                  <p class="stat-cards-info__num">1</p>
		                  <p class="stat-cards-info__title">결근</p>
		                  <p class="stat-cards-info__progress">
		                    <span class="stat-cards-info__profit success">
		                      <i data-feather="trending-up" aria-hidden="true"></i>3
		                    </span>
		                    이번년 결근일 수
		                  </p>
		                </div>
		              </article>
		            </div>
		            <div class="col-md-6 col-xl-3">
		              <article class="stat-cards-item">
		                <div class="stat-cards-icon purple">
		                  <i class="icon-paper" ></i>
		                </div>
		                <div class="stat-cards-info">
		                  <p class="stat-cards-info__num">1</p>
		                  <p class="stat-cards-info__title">휴가</p>
		                  <p class="stat-cards-info__progress">
		                    <span class="stat-cards-info__profit danger">
		                      <i data-feather="trending-down" aria-hidden="true"></i>13
		                    </span>
		                    이번년 휴가일 수
		                  </p>
		                </div>
		              </article>
		            </div>
		            <div class="col-md-6 col-xl-3">
		              <article class="stat-cards-item">
		                <div class="stat-cards-icon warning">
		                  <i class="icon-paper" ></i>
		                </div>
		                <div class="stat-cards-info">
		                  <p class="stat-cards-info__num">13</p>
		                  <p class="stat-cards-info__title">근무일</p>
		                  <p class="stat-cards-info__progress">
		                    <span class="stat-cards-info__profit success">
		                      <i data-feather="trending-up" aria-hidden="true"></i>2
		                    </span>
		                    이번년 총 근무일 수 
		                  </p>
		                </div>
		              </article>
		            </div>
		          </div>
		          <div class="row">
		            <div class="col-lg-3">
		              <article class="customers-wrapper">
		                <!-- <div id="employee-info"> -->
		                  <div class="box">
<!-- 		                    <img src="../../elegant/elegant/img/avatar/avatar-face-02.png" alt="증명사진" class="profile" width="200" height="200" border-radius="30%"> -->
						
		                  </div>
		                	<div id="time"></div> 
		                  <div align="center" id="attend_btn">
			                  <c:if test="${attendance.startTime eq null}"> 
			                  	<button id="startWork">출근</button>
			                  </c:if>
			                  <c:if test="${attendance.startTime ne null }">
			                   	<button id="finishWork">퇴근</button>
			                  </c:if>
		                  </div>
		                  <br>
		              </article>
		              <script>
		              $("#attend_btn").click(function(){
		            	  var now = new Date();
		            	  var hr = now.getHours();
		            	  var min = now.getMinutes();
		            	  var sec = now.getSeconds();
		            	  var now1 = hr+ ":"+ min+ ":"+ sec;
		            	  confirm("정말입니까?");
		            	  if(confirmflag){
		            		  
		            	  }else{
		            		  
		            	  }
		            	  $("#now").text(now1);
		              console.log(now1);
		              })
		              $(document).ready(function(){
		            	  var now = new Date();
		            	  var year = now.getFullYear();
		            	  var month = now.getMonth()+1;
		            	  var date = now.getDate();
		            	  var hr = now.getHours();
		            	  var min = now.getMinutes();
		            	  var sec = now.getSeconds();
		            	  var now1 = year + "/" + month + "/" + date; 
		            	  var now2 = hr+ ":"+ min+ ":"+ sec;
		            	  $(".box").text(now1);
		            	  $(".top-cat-title").text(now1);
		            	  $("#time").text(now2);
		            	  
		              })
		              
		              </script>
		              <article class="white-block">
		                <div class="top-cat-title">
		                  
		                </div>
		                <c:forEach items="${aList }" var="Attendance">
		                <ul class="top-cat-list">
		                  <li>
		                      <div class="listTitle">
		                      	출근시간 : ${attendance.startTime }
		                      </div>
		                  </li>
		                  <li>
		                      <div class="listTitle">
		                      	퇴근시간: ${attendance.finishTime }
		                      </div>
		                  </li>
		                  <li>
		                      <div class="listTitle">
		                      	주간 누적 근무시간: ${attendance.totalWorkhour }
		                      </div>
		                  </li>
		                </ul>
		                </c:forEach>
		              </article>
		            </div>
		            <div class="main-contents">
		                <table class="main-table">
		                  <thead>
		                    <tr class="table-detail">
		                      <th>No</th>
		                      <th>일자</th>
		                      <th>업무시작시간</th>
		                      <th>업무종료시간</th>
		                      <th>구분</th>
		                      <th>근무시간</th>
		                      <th>비고</th>
		                    </tr>
		                  </thead>
		                  <tbody>
		                  <c:if test="${empty aList }">
		                  	<tr>
		                  		<td colspan="7"> 조회된 정보가 없습니다. </td>
		                  	</tr>
		                  </c:if>
		                  <c:forEach items="${aList }" var="attendance">
		                    <tr>
		                      <td>${attendance.attendNo }</td>
		                      <td>${attendance.attendDate }</td>
		                      <td>${attendance.startTime }</td>    
		                      <td>${attendance.finishTime }</td>
		                      <td>${attendance.division }</td>
		                      <td>${attendance.totalWorkhour }</td>
		                      <td>${attendance.note }</td>
		                    </tr>
		                   </c:forEach>
		                   
<!-- 		                   <tr align="center" height="20"> -->
<!-- 					         <td colspan="7"> -->
<%-- 					         <c:url var="before" value="/attend/attendanceList.do"> --%>
<%-- 					            <c:param name="page" value="${pi.currentPage - 1 }"></c:param> --%>
<%-- 					         </c:url> --%>
<%-- 					         <c:url var="after" value="/attend/attendanceList.do"> --%>
<%-- 					            <c:param name="page" value="${pi.currentPage + 1 }"></c:param>          --%>
<%-- 					         </c:url> --%>
<%-- 					         <c:url var="pagination" value="/attend/attendanceList.do"> --%>
<%-- 					            <c:param name="page" value="${p }"></c:param> --%>
<%-- 					         </c:url> --%>
<%-- 					            <c:if test="${pi.currentPage <= 1 }"> --%>
<!-- 					               [이전] -->
<%-- 					            </c:if> --%>
<%-- 					            <c:if test="${pi.currentPage > 1 }"> --%>
<%-- 					               <a href="${before }">[이전]</a> --%>
<%-- 					            </c:if> --%>
<%-- 					            <c:forEach var="p" begin="${pi.startNavi }" end="${pi.endNavi }"> --%>
<%-- 					               <c:if test="${p eq pi.currentPage }"> --%>
<%-- 					                  <font color="red" size="4">[${p }]</font> --%>
<%-- 					               </c:if> --%>
<%-- 					               <c:if test="${p ne pi.currentPage }"> --%>
<%-- 					                  <a href="${pagination }${p}">[${p }]</a>&nbsp; --%>
<%-- 					               </c:if> --%>
<%-- 					            </c:forEach> --%>
					            
<%-- 					            <c:if test="${pi.currentPage >= pi.maxPage }"> --%>
<!-- 					               [다음] -->
<%-- 					            </c:if> --%>
<%-- 					            <c:if test="${pi.currentPage < pi.maxPage }"> --%>
<%-- 					               <a href="${after }">[다음]</a> --%>
<%-- 					            </c:if> --%>
					         </td>
					      </tr>
		                  </tbody>
		                </table>
		            </div>
		          </div>
		        </div>
		      </div>
         </div>
	</div>
</body>
</html>