<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="../../css/holiday.css">
 
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
		            <h2>나의 휴가 내역</h2>
		          </div>
		          <div class="top-date" align="center">
		             <h4> 2021년 </h4>
		             <br><br>
		          </div>
		          <div class="row stat-cards">
		            <div class="col-md-6 col-xl-3">
		              <article class="stat-cards-item">
		                <div class="stat-cards-icon primary">
		                  <i data-feather="bar-chart-2" aria-hidden="true"></i>
		                </div>
		                <div class="stat-cards-info">
		                  <p class="stat-cards-info__num">15</p>
		                  <p class="stat-cards-info__title">남은연가</p>
		                  <p class="stat-cards-info__progress">
		                    <span class="stat-cards-info__profit success">
		                      <i data-feather="trending-up" aria-hidden="true"></i>1
		                    </span>
		                    이번년에 사용한 총 연가
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
		                  <p class="stat-cards-info__title">남은 병가</p>
		                  <p class="stat-cards-info__progress">
		                    <span class="stat-cards-info__profit success">
		                      <i data-feather="trending-up" aria-hidden="true"></i>2
		                    </span>
		                    이번년에 사용한 총 병가
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
		                  <p class="stat-cards-info__num">0</p>
		                  <p class="stat-cards-info__title">기타휴가</p>
		                  <p class="stat-cards-info__progress">
		                    <span class="stat-cards-info__profit danger">
		                      <i data-feather="trending-down" aria-hidden="true"></i>0
		                    </span>
		                    이번년에 사용한 기타휴가
		                  </p>
		                </div>
		              </article>
		            </div>
		            
		          </div>
		          <div class="row">
		            
		            <div class="main-contents">
		                <table class="main-table">
		                  <thead>
		                    <tr class="table-detail">
		                      <th>결재일자</th>
		                      <th>휴가종류</th>
		                      <th>휴가사용기간</th>
		                      <th>휴가일수</th>
		                      <th>내용</th>
		                    </tr>
		                  </thead>
		                  <tbody>
		                    <tr>
		                      <td>21.03.01</td>
		                      <td>연차</td>    
		                      <td>2021.03.12 ~ 2021.03.15</td>
		                      <td>4일</td>
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