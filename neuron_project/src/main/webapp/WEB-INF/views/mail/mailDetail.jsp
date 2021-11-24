<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
  <style>
	  .content-wrapper{
	    background-color: #ffff;
		}
		.detail-header{
		float:left;}
		.detail-contents{
		border : 0;}
  </style>
  
</head>
<body>
	<div class="container-scroller">
		<jsp:include page="../mailCommon/navbar.jsp"></jsp:include>
		<div class="container-fluid page-body-wrapper">
			<jsp:include page="../common/sidebar.jsp"></jsp:include>
			<div class="main-panel">
		        <div class="content-wrapper">
		        <form action="mailReplyView.do" method="get">
		          <div class="detail-header">
					<input type="hidden" name ="mailNo" value="${mail.mailNo }">
					<button type="submit">답장</button> 
		          </div>
		          </form> 
		            <button id="deletea" >삭제</button>
		          <div class="detail-top">
		            
		            <div class="detail-title">
		              <br>
		              <h2>  ${mail.mailTitle }  </h2>
		            </div>
		            <br>
		            <div class="detail-Info">
		              <table>
		                <tr>
		                  <th>보낸사람: ${mail.senderId }  </th>
		                </tr>
		                <tr>
		                  <th>받는사람: ${mail.receiverId }</th>
		                </tr>
		                <tr>
		                  <th>참조: ${mail.receiverId2 }</th>
		                </tr>
		                <tr>
		                	<th>첨부파일 : ${mail.mailFileName }</th>
		                </tr>
		              </table>
		              <hr>
		             
		            </div>
		          </div>
		          <textarea cols="200" rows="80" class="detail-contents">
		             ${mail.mailContents }
		          </textarea>
		        </div>
     		 </div>
		
		</div>
	</div>
	<script>
	$(document).ready(function(){
		var preUrl = document.referrer;
		console.log("이전 Url: " + preUrl);
		if(preUrl == 'http://localhost:9999/outbox.do'){
			$('.detail-header').hide();
		}
	})
	$("#deletea").click(function(){
		var preUrl = document.referrer;
		var mailNo = "<c:out value='${mail.mailNo}'/>";
		var confirm_val = confirm("삭제하시겠습니까?");
		console.log(preUrl);
		if(confirm_val){
			
			if(preUrl == 'http://localhost:9999/inbox.do'){
				$.ajax({
					url : "InboxMailDelete.do",
					type : "post",
					traditional : true,
					data : { "choiceOne" : mailNo },
					success : function(data){
						location.href = "inbox.do";
					},
					error: function(){
						location.href="home.do";
					}
				});
			}else{
				$.ajax({
					url : "OutboxMailDelete.do",
					type : "post",
					traditional : true,
					data : { "choiceOne" : mailNo },
					success : function(data){
						location.href = "outbox.do";
					},
					error: function(){
						location.href="home.do";
				}
			});
		}
		
		}
	});
	</script>	
</body>
</html>