<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
       <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보낸메일함</title>
<link rel="stylesheet" href="../../css/outboxMail.css">
 
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
		$(document).ready(function() {
		$("#checkAll").click(function(){
		    if( $("#checkAll").is(':checked') ){
		      $("input[type=checkbox]").prop("checked", true);
		    }else{
		      $("input[type=checkbox]").prop("checked", false);
		    }
		});
	
		$("input[name=check]").click(function(){
			var total = $("input[name=check]").length;
			var checked = $("input[name=check]:checked").length;
			
			if(total != checked) 
				$("#agreeAll").prop("checked",false);
			else
				$("#agreeAll").prop("checked",true);
			
		});
		});
	</script>
</head>
<body>
	<div class="container-scroller">
		<jsp:include page="../mailCommon/navbar.jsp"></jsp:include>
		<div class="container-fluid page-body-wrapper">
			<jsp:include page="../common/sidebar.jsp"></jsp:include>
			
			<div class="main-panel">
		        <div class="content-wrapper">
		          <div class="top-title">
		            <h2>수신확인</h2>
		            <br><br>
		          </div>
		          <div class="mail-navi">
		            <button>삭제</button>
		            
		          </div>
					<br>
		          <div class="card">
		            <table class="mail-table">
		              <tr>
		                <th id="col_1"><input type="checkbox" name="checkAll" id="checkAll"></th>
		                <th id="col_3">수신인</th>
		                <th id="col_4">제목</th>
		                <th id="col_6">수신시간</th>
		                <th id="col_6-1">수신확인</th>
		                <th id="col_7">크기</th>
		              </tr>  
		              <c:forEach items="${mList }" var="mail">
		              <tr>
		                <td><input type="checkbox" name="" id=""></td>
		                <td>${mail.senderId }</td>
		                <td>
		                	<c:if test="${!empty mail.mailFileName }">${mail.mailTitle }<i class="icon-paper-clip"></c:if>
							<c:if test="${ empty mail.mailFileName }">${mail.mailTitle }</c:if>
						</td>
		                <td><fmt:formatDate pattern="yyyy년 MM월 dd일 HH:mm:ss" value="${mail.readTime }"/></td>
		                <td>${mail.readYn }</td>
		                <td>${mail.mailFileSize }</td>
		              </tr>
		              </c:forEach>
		            </table>
		          </div>
		        </div>  
		      </div>
		     </div>
		   </div>
</body>
</html>