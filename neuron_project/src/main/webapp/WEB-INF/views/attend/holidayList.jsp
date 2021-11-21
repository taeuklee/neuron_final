<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 휴가내역</title>

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
		             <button id="previousYear"><</button> <span id="date"> </span> <button id="nextYear">></button> 
		             <input type="hidden" id="holiYear" name="year" value="">
		             <br><br>
		          </div>
		          <c:forEach items="${eList }" var="employee">
		          <div class="row stat-cards">
		            <div class="col-md-6 col-xl-3">
		              <article class="stat-cards-item">
		                <div class="stat-cards-icon primary">
		                  <i data-feather="bar-chart-2" aria-hidden="true"></i>
		                </div>
		                <div class="stat-cards-info">
		                  <p class="stat-cards-info__num">남은 연가</p>
		                  <p class="stat-cards-info__title">${employee.empVac }</p>
		                  <p class="stat-cards-info__progress">
		                    <span class="stat-cards-info__profit success">
		                      <i data-feather="trending-up" aria-hidden="true"></i>1
		                    </span>
		                    이번 년에 사용한 총 연가
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
		                  <p class="stat-cards-info__num">${employee.empMed }</p>
		                  <p class="stat-cards-info__title">남은 병가</p>
		                  <p class="stat-cards-info__progress">
		                    <span class="stat-cards-info__profit success">
		                      <i data-feather="trending-up" aria-hidden="true"></i>2
		                    </span>
		                    이번 년에 사용한 총 병가
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
		                  <p class="stat-cards-info__num">${employee.empExVac }</p>
		                  <p class="stat-cards-info__title">기타 휴가</p>
		                  <p class="stat-cards-info__progress">
		                    <span class="stat-cards-info__profit danger">
		                      <i data-feather="trending-down" aria-hidden="true"></i>0
		                    </span>
		                    이번 년에 사용한 기타휴가
		                  </p>
		                </div>
		              </article>
		            </div>
		            </c:forEach>
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
		                  <c:forEach items="${dList }" var="document">
		                    <tr>
		                      <td><fmt:formatDate pattern="yyyy년 MM월 dd일" value="${document.dUpdateDate }"/></td>
		                      <td>${document.vacKind }</td>    
		                      <td>${document.vStartDate } ~ ${document.vEndDate }</td>
		                      <td></td>
		                      <td>${document.docReason }</td>
		                    </tr>
		                    </c:forEach>
		                  </tbody>
		                </table>
		            </div>
		          </div>
		        </div>
		      </div>
		</div>
	</div>
	<script>
	  $(document).ready(function(){
		  var now = new Date();
		  var year = now.getFullYear();
		  $("#date").text(year + "년");
		  $("#holiYear").val(year);
	  })
	  $("#previousYear").click(function() {	
	   		 var date1 = $("#date").text();
	   		 var todayYear = date1.replace(/[^0-9]/g,'') - 1 ; 
	   		 $("#date").text(todayYear + "년");
	   		$("#holiYear").val(todayYear);
	   	 });
	  $("#nextYear").click(function() {	
		  var date1 = $("#date").text();
	   	   var todayYear = date1.replace(/[^0-9]/g,'') + 1; 
	   		 $("#date").text(todayYear + "년");
	   		$("#holiYear").val(todayYear);
		 });
  </script>
</body>
</html>