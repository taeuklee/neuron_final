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
		          <div class="top-date">
		             2021년 11월 
		          </div>
		          <div class="row stat-cards" id="stats">
		            <div class="col-md-6 col-xl-3">
		              <article class="stat-cards-item">
		                <div class="stat-cards-icon primary">
		                  <i data-feather="bar-chart-2" aria-hidden="true"></i>
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
		                  <i data-feather="file" aria-hidden="true"></i>
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
		                  <i data-feather="file" aria-hidden="true"></i>
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
		                  <i data-feather="file" aria-hidden="true"></i>
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
		                    <img src="../../elegant/elegant/img/avatar/avatar-face-02.png" alt="증명사진" class="profile" width="200" height="200" border-radius="30%">
		                  </div>
		                  <br><br>
		                  <div align="center"><button id="">출근</button> <button id="">퇴근</button></div> 
		                  <br>
		              </article>
		              <article class="white-block">
		                <div class="top-cat-title">
		                  
		                </div>
		                <ul class="top-cat-list">
		                  <li>
		                    <a href="##">
		                      <div class="top-cat-list__title">
		                      
		                      </div>
		                    </a>
		                  </li>
		                  <li>
		                    <a href="##">
		                      <div class="top-cat-list__title">
		                      
		                      </div>
		                    </a>
		                  </li>
		                  <li>
		                    <a href="##">
		                      <div class="top-cat-list__title">
		                      
		                      </div>
		                    </a>
		                  </li>
		                </ul>
		              </article>
		            </div>
		            <div class="main-contents">
		                <table class="main-table">
		                  <thead>
		                    <tr class="table-detail">
		                      <th>일자</th>
		                      <th>업무시작시간</th>
		                      <th>업무종료시간</th>
		                      <th>구분</th>
		                      <th>근무시간</th>
		                      <th>비고</th>
		                    </tr>
		                  </thead>
		                  <tbody>
		                    <tr>
		                      <td>21.01.01</td>
		                      <td>09:00:00</td>    
		                      <td>18:00:00</td>
		                      <td>정상</td>
		                      <td>09:00:00</td>
		                      <td>.</td>
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