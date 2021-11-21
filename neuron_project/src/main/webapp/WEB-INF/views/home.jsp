<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <!-- Required meta tags --> 
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>home</title>
  <!-- base:css -->
  <link rel="stylesheet" href="/vendors/mdi/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="/vendors/feather/feather.css">
  <link rel="stylesheet" href="/vendors/base/vendor.bundle.base.css">
  <!-- endinject -->
  <!-- plugin css for this page -->
  <link rel="stylesheet" href="/vendors/flag-icon-css/css/flag-icon.min.css"/>
  <link rel="stylesheet" href="/vendors/font-awesome/css/font-awesome.min.css">
  <link rel="stylesheet" href="/vendors/jquery-bar-rating/fontawesome-stars-o.css">
  <link rel="stylesheet" href="/vendors/jquery-bar-rating/fontawesome-stars.css">
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="/css/style.css">
  <!-- endinject -->
  <link rel="shortcut icon" href="/images/favicon.png" />
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script>
    $(document).ready(function(){
      $("#headerNav").load("/partials/_navbar.html");
      $("#sidebar").load("/partials/_sidebar.html");
      $("#footer").load("/partials/_footer.html");
      $("#contents").load("/contents/mainPage.html");
    });
  </script>
  <!-- base:js -->
  <script src="/vendors/base/vendor.bundle.base.js"></script>
  <!-- endinject -->
  <!-- Plugin js for this page-->
  <!-- End plugin js for this page-->
  <!-- inject:js -->
  <script src="/js/off-canvas.js"></script>
  <script src="/js/hoverable-collapse.js"></script>
  <script src="/js/template.js"></script>
  <!-- endinject -->
  <!-- plugin js for this page -->
  <script src="/vendors/chart.js/Chart.min.js"></script>
  <script src="/vendors/jquery-bar-rating/jquery.barrating.min.js"></script>
  <!-- End plugin js for this page -->
  <!-- Custom js for this page-->
  <script src="/js/dashboard.js"></script>
  <!-- End custom js for this page-->
  <link rel="stylesheet" href="/css/clock.css" />

  
</head>
<script>
	$.getJSON('http://api.openweathermap.org/data/2.5/weather?id=1835848&APPID=9f89659568f7a5fac16fda3faaa02463&units=metric', function(data){
		// data로 할일 작성.. 
		//alert(data.list[0].main.temp_min);
		var $minTemp = data.main.temp_min;
		var $maxTemp = data.main.temp_max;
		var $cTemp = data.main.temp;
		var $now = new Date($.now());
		var $cDate = $now.getFullYear() + '/' + ($now.getMonth()+ 1) 
		+'/' + $now.getDate() + '/' + $now.getHours()+ ':'+$now.getMinutes();

		var $wIcon = data.weather[0].icon;
		
		$("#clowTemp").append($minTemp);
		$("#ctemp").append($cTemp);
		$("#chightemp").append($maxTemp);
		$("h2").append($cDate);
		$('#cicon').append('<img src="http://api.openweathermap.org/img/w/'+$wIcon+'.png"/>')
		
	});
	
</script>

<body>
  <div class="container-scroller">
    <!-- partial:partials/_navbar.html 해더 창 -->
    <jsp:include page="common/navbar.jsp"></jsp:include>
    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
      <!-- partial:partials/_sidebar.html 사이드 바  -->
      <jsp:include page="common/sidebar.jsp"></jsp:include>
      <!-- partial -->
      <div class="main-panel">
        <div class="content-wrapper" id="contents">
			<div class="row">
			  <div class="col-sm-12 mb-4 mb-xl-0">
			    <h4 class="font-weight-bold text-dark">Hi, welcome back!</h4>
			    <p class="font-weight-normal mb-2 text-muted">APRIL 1, 2019</p>
			  </div>
			</div>
			<div class="row mt-3">
		    <div class="col-xl-3 flex-column d-flex grid-margin stretch-card">
		      <div class="row flex-grow">
		        <div class="col-sm-12 grid-margin stretch-card">
		            <div class="card">
		              <div class="card-body">
		                  <p class="card-title">user01 님의 근태</p>
		                  <h4 class="h1-dateClock"></h4>
		                  <h1 class="h1-clock" style="color:#fcb41d;"></h1>
		                  <h4 class="text-dark font-weight-bold mb-2">
		                    <button>출근</button>
		                    <button>퇴근</button></h4>
		                  <h4 class="text-dark font-weight-bold mb-2"></h4>
		                  
		                  
		              </div>
		            </div>
		        </div>
		        <div class="col-sm-12 stretch-card">
		            <div class="card">
		              <div class="card-body">
			        	<h1>weather api</h1>
			        	<h2>날씨 예보-</h2>
			        	<div id="ctemp">현재온도: </div>
			        	<div id="clowTemp">최저온도:</div>
			        	<div id="chightemp">최고온도:</div>
			        	<div id="cicon">아이콘:</div>
		              </div>
		            </div>
		       </div>
		      </div>
		    </div>
<!-- 		    공지사항 -->
		    <div class="col-xl-9 d-flex grid-margin stretch-card">
		        <div class="card">
		          <div class="card-body">
		              <h4 class="card-title">공지사항</h4>
		              <div class="row">
		                <div class="col-lg-5">
		                  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit amet cumque cupiditate</p>
		                </div>
		              </div>
		              <div class="row">
		                  ㅇㅇ
		              </div>
		                
		            </div>
		          </div>
		    </div>
		    <div class="col-md-6 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h4 class="card-title">메일</h4>
                  <p class="card-description">
                    Add tags <code>&lt;h1&gt;</code> to <code>&lt;h6&gt;</code> or class <code>.h1</code> to <code>.h6</code>
                  </p>
                  <div class="template-demo">
                    <h1>h1. Heading</h1>
                    <h2>h2. Heading</h2>
                    <h3>h3. Heading</h3>
                    <h4>h4. Heading</h4>
                    <h5>h5. Heading</h5>
                    <h6>h6. Heading</h6>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-md-6 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h4 class="card-title">전자결재</h4>
                  
                </div>
              </div>
            </div>
            <div class="col-md-12 grid-margin">
              <div class="card">
                <div class="card-body">
                  <h4 class="card-title">참여중인 프로젝트</h4>
                  <p class="card-description">
                    Use class <code>.text-primary</code>, <code>.text-secondary</code> etc. for text in theme colors
                  </p>
                  <div class="row">
                    <div class="col-md-6">
                      <p class="text-primary">.text-primary</p>
                      <p class="text-success">.text-success</p>
                      <p class="text-danger">.text-danger</p>
                      <p class="text-warning">.text-warning</p>
                      <p class="text-info">.text-info</p>
                    </div>
                    <div class="col-md-6">
                      <p class="text-light bg-dark pl-1">.text-light</p>
                      <p class="text-secondary">.text-secondary</p>
                      <p class="text-dark">.text-dark</p>
                      <p class="text-muted">.text-muted</p>
                      <p class="text-white bg-dark pl-1">.text-white</p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
		  </div>
     	</div>
        <!-- partial:partials/_footer.html -->
        <jsp:include page="common/footer.jsp"></jsp:include>
        <!-- partial -->
      <!-- main-panel ends -->
    </div>
    <!-- page-body-wrapper ends -->
  </div>
  <!-- container-scroller -->
</div>
</body>
<script src="/js/clock.js"></script>

</html>