<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보낸메일함</title>
<link rel="stylesheet" href="../../css/addressbook.css">
 
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
			
			<div class="main">
		      <div class="addrTitle"><h2>주소록</h2></div>
		      <br><br>
		      <div class="searchBar">
		        <select name="" id="">
		          <option>이름</option>
		          <option>부서</option>
		          <option>전화번호</option>
		        </select>
		        <input type="search" name="" id="">
		        <button>검색</button>
		      </div>
		      <br>
		      <div class="userInfoSelect">
		        <div class="userInfoTable">
		          <table class="InfoTable">
		            <tr>
		              <th><input type="checkbox" name="checkAll" id=""></th>
		              <th>사원번호</th>
		              <th>사원이름</th>
		              <th>팀번호</th>
		              <th>연락처</th>
		              <th>이메일</th>
		              <th>내선번호</th>
		            </tr>
		            <tr>
		              <td colspan="7" align="center">조회된 정보가 없습니다.</td>
		            </tr>
		            <tr>
		              <td><input type="checkbox" name="" id=""></td>
		              <td></td>
		              <td></td>
		              <td></td>
		              <td></td>
		              <td></td>
		              <td></td>
		            </tr>
		            <tr>
		              <td><input type="checkbox" name="" id=""></td>
		              <td></td>
		              <td></td>
		              <td></td>
		              <td></td>
		              <td></td>
		              <td></td>
		            </tr>
		            
		          </table>
		        </div>
		        <div class="middle_btn">
		          <div class="receiver_btns">
		          <br><br>
		          <br><br>
		
		            <button>></button>
		            <br>
		            <button><</button>
		          </div>
		          <br><br>
		          <br><br>
		          <br><br>
		          <br><br>
		
		          <div class="receiver2_btns">
		            <button>></button>
		            <br>
		            <button><</button>
		          </div>
		        </div>
		        <div class="aside">
		          <div class="aside-top">
		       	     받는사람
		            <table class="InfoTable">
		              <tr>
		                <th>이름</th>
		                <th>소속팀</th>
		                <th>이메일</th>
		                <th>핸드폰번호</th>
		              </tr>
		              <tr>
		                <td></td>
		                <td></td>
		                <td></td>
		                <td></td>
		              </tr>
		            </table>
		          </div>
		          <br>
		          <div class="aside-bottom">
		       		     참조인
		            <table class="InfoTable">
		              <tr>
		                <th>이름</th>
		                <th>소속팀</th>
		                <th>이메일</th>
		                <th>핸드폰번호</th>
		              </tr>
		              <tr>
		                <td></td>
		                <td></td>
		                <td></td>
		                <td></td>
		              </tr>
		            </table>
		          </div>
		        </div>
		        <div class="btns"><button>선택완료</button> <button>취소</button></div>
		      </div>
		      
		   </div>
		
		</div>
	</div>	
</body>
</html>