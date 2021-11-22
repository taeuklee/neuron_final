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
  <style>
  .mail-navi{
	  width:100%;
  }
  	.mail-delete{
  		width:20%;
		float:left;
  	}
  	.mail-search{
  		width:80%;
		float:right;
		text-align:right;
  	}
  	th {
			background-color : yellow;
		}
  	
  </style>
</head>
<body>
	<div class="container-scroller">
		<jsp:include page="../mailCommon/navbar.jsp"></jsp:include>
		<div class="container-fluid page-body-wrapper">
			<jsp:include page="../common/sidebar.jsp"></jsp:include>
			
			<div class="main-panel">
		        <div class="content-wrapper">
		          <div class="top-title">
		            <h2>보낸메일함</h2>
		            <br><br>
		          </div>
		          <div class="mail-navi">
		          <div class="mail-delete">
		            <button type="button" id="delete-btn">삭제</button>	
		          </div>
		          <div class="mail-search">
				  <form action="mailSearch.do" method="get">
					<select name="searchCondition">
						<option value="all" <c:if test="${search.searchCondition == 'all' }">selected</c:if>>전체</option>
						<option value="senderId" <c:if test="${search.searchCondition == 'senderId' }">selected</c:if>>발신인</option>
						<option value="mailTitle" <c:if test="${search.searchCondition == 'mailTitle' }">selected</c:if>>제목</option>
						<option value="mailContents" <c:if test="${search.searchCondition == 'mailContents' }">selected</c:if>>내용</option>
					</select>
					<input type="text" name="searchValue">
					<input type="submit" value="검색">
					</form>
				  </div>
				  </div>	
				  <br><br>	 
		          <div class="card">
		            <table class="mail-table">
		              <tr>
		                <th id="col_1"><input type="checkbox" name="checkAll" id="checkAll"></th>
		                <th id="col_3">수신인</th>
		                <th id="col_4">제목</th>
		                <th id="col_6">날짜 및 시간</th>
		                <th id="col_7">크기</th>
		              </tr>  
		              <c:if test="${empty mList }">
		                  	<tr>
		                  		<td colspan="6" align="center"> 조회된 정보가 없습니다. </td>
		                  	</tr>
		              </c:if>
		              <c:forEach items="${mList }" var="mail">
		              <tr>
		                <td><input type="checkbox" class="choiceOne" value="${mail.mailNo }"></td>
		                <td>${mail.senderId }</td>
		                <td>
		                	<c:url var="mDetail" value="mailDetail.do">
								<c:param name="mailNo" value="${mail.mailNo }"></c:param>
							</c:url>
							<c:if test="${!empty mail.mailFileName }"><a href="${mDetail }">${mail.mailTitle }</a><i class="icon-paper-clip"></c:if>
							<c:if test="${ empty mail.mailFileName }"><a href="${mDetail }">${mail.mailTitle }</a></c:if>
						</td>
		                <td><fmt:formatDate pattern="yyyy년 MM월 dd일 HH:mm:ss" value="${mail.sendTime }"/></td>
		                <td>${mail.mailFileSize } bytes</td>
		              </tr>
		              </c:forEach>
		              <tr align="center" height="20">			
								<td colspan="6">
									<c:url var="before" value="holidayList.do">
										<c:param name="page" value="${pi.currentPage - 1 }"></c:param>
									</c:url>
									<c:if test="${pi.currentPage <= 1 }">
										[이전]
									</c:if>
									<c:if test="${pi.currentPage > 1 }">
										<a href="${before }">[이전]</a>
									</c:if>
									<c:forEach var="p" begin="${pi.startNavi }" end="${pi.endNavi }">
										<c:url var="pagination" value="holidayList.do">
											<c:param name="page" value="${p }"></c:param>
										</c:url>
										<c:if test="${p eq pi.currentPage }">
											<font color="red" size="4">[${p }]</font>
										</c:if>
										<c:if test="${p ne pi.currentPage }">
											<a href="${pagination }">${p }</a>&nbsp;					
										</c:if>
									</c:forEach>
									<c:url var="after" value="holidayList.do">
										<c:param name="page" value="${pi.currentPage + 1 }"></c:param>
									</c:url>
									<c:if test="${pi.currentPage >= pi.maxPage }">
										[다음]
									</c:if>
									<c:if test="${pi.currentPage < pi.maxPage }">
										<a href="${after }">[다음]</a>
									</c:if>
								</td>
							</tr>
		            </table>
		          </div>
		        </div>  
		      </div>
		</div>
	</div>	
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
		$("#delete-btn").click(function(){
			var confirm_val = confirm("삭제하시겠습니까?");
			var mailNo = "<c:out value='${mail.mailNo}'/>";
			
			if(confirm_val){
				var checkArr = new Array();
				$("input[class='choiceOne']:checked").each(function(){
					checkArr.push(this.value);
				});
				console.log(checkArr.toString());
				$.ajax({
					url : "OutboxMailDelete.do",
					type : "post",
					traditional : true,
					data : { choiceOne : checkArr },
					success : function(data){
						location.href ="outbox.do";
					},
					error: function(){
						location.href="outbox.do";
					}
				});
			}
		});
	</script>
</body>
</html>