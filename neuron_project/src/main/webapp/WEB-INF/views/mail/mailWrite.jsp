<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>받은메일함</title>
<link rel="stylesheet" href="../../css/mailWrite.css">
 
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
  
  <script>
            function openPop(){
              var popup = window.open('/addressbook.jsp', '주소록팝업','width=800px;, height=800px;');
            }
   </script>
</head>
<body>
	<div class="container-scroller">
		<jsp:include page="../common/navbar.jsp"></jsp:include>
		<div class="container-fluid page-body-wrapper">
			<jsp:include page="../common/sidebar.jsp"></jsp:include>
			
			<div class="main-panel">
		        <div class="content-wrapper">
		          <div class="top-title">
		            <h2>메일쓰기</h2>
		          </div>
		          <br><br>
		          <div class="mail-content">
		            <table class="mail-top" border="0">
		            <input type="hidden" name="senderId"> 
		              <tr>
		                <th>받는사람</th>
		                <td><input type="text" name="" class="mt1"><button class="addr_btn" target="_blank" onclick="openPop()">주소록</button></td>
		                <!-- 엔터 누르면 블락 잡히는거 -->
		              </tr>
		              <tr>
		                <th>참조</th>
		                <td><input type="text" name="" class="mt1"><button class="addr_btn">주소록</button></td>
		              </tr>
		              <tr>
		                <th>제목</th>
		                <td></td>
		              </tr>
		              <tr>
		                <th>첨부파일</th>
		                <td></td>
		              </tr>
		            </table>
		            <br>
		            <textarea name="" id="" cols="173" rows="10"></textarea>
		          </div>
		        </div>
		      </div>
		</div>
	</div>
</body>
</html>