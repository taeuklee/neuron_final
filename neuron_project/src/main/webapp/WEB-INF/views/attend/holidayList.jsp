<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 휴가내역</title>
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
  

.col-md-6 {
    -webkit-box-flex: 0;
    -ms-flex: 0 0 50%;
    flex: 0 0 50%;
    max-width: 50%;
  }
  .col-xl-3 {
    margin-bottom: 20px;
  }
  .col-xl-3 {
    -webkit-box-flex: 0;
    -ms-flex: 0 0 25%;
    flex: 0 0 33%;
    max-width: 33%;
  }
  .stat-cards {
    margin-right: -10px;
    margin-left: -10px;
  }
  .stat-cards > div {
    padding-left: 10px;
    padding-right: 10px;
  }
  .stat-cards {
    margin-right: -10px;
    margin-left: -10px;
  }
  
  .stat-cards > div {
    padding-left: 10px;
    padding-right: 10px;
  }
  
  .stat-cards-item {
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-align: center;
    -ms-flex-align: center;
    align-items: center;
    -ms-flex-wrap: wrap;
    flex-wrap: wrap;
    padding: 24px 19px;
    background-color: #FFFFFF;
    -webkit-box-shadow: 0px 15px 50px rgba(160, 163, 189, 0.1);
    box-shadow: 0px 15px 50px rgba(160, 163, 189, 0.1);
    border-radius: 10px;
    height: 100%;
  }
  
  .stat-cards-icon {
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-pack: center;
    -ms-flex-pack: center;
    justify-content: center;
    -webkit-box-align: center;
    -ms-flex-align: center;
    align-items: center;
    -ms-flex-wrap: wrap;
    flex-wrap: wrap;
    width: 60px;
    height: 60px;
    border-radius: 50%;
    margin-right: 9px;
  }
  
  .stat-cards-icon.primary {
    background-color: rgba(47, 73, 209, 0.1);
    color: #2f49d1;
  }
  
  .stat-cards-icon.warning {
    background-color: rgba(255, 182, 72, 0.1);
    color: #ffb648;
  }
  
  .stat-cards-icon.purple {
    background-color: rgba(95, 46, 234, 0.1);
    color: #5f2eea;
  }
  
  .stat-cards-icon.success {
    background-color: rgba(75, 222, 151, 0.1);
    color: #4bde97;
  }
  
  .stat-cards-info__num {
    font-weight: 600;
    font-size: 18px;
    line-height: 1.22;
    color: #171717;
    margin-bottom: 4px;
  }
  
  .stat-cards-info__title {
    font-weight: 500;
    font-size: 14px;
    line-height: 1.22;
    color: #b9b9b9;
    margin-bottom: 6px;
  }
  
  .stat-cards-info__progress {
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-align: center;
    -ms-flex-align: center;
    align-items: center;
    font-size: 14px;
    line-height: 1.22;
    color: #b9b9b9;
  }
  
  .stat-cards-info__profit {
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-align: center;
    -ms-flex-align: center;
    align-items: center;
    font-size: 14px;
    line-height: 1.22;
    margin-right: 10px;
  }
  
  .stat-cards-info__profit.success {
    color: #4bde97;
  }
  
  .stat-cards-info__profit.danger {
    color: #f26464;
  }
  
  .stat-cards-info__profit.warning {
    color: #ffb648;
  }
  
  .stat-cards-info__profit svg {
    width: 16px;
    height: 16px;
    margin-right: 5px;
  }

  /* aside */
  .customers-wrapper {
    height: auto;
  }
  .customers-wrapper {
    height: auto;
    background-color: #5f2eea;
    -webkit-box-shadow: 0px 15px 50px rgba(160, 163, 189, 0.1);
    box-shadow: 0px 15px 50px rgba(160, 163, 189, 0.1);
    border-radius: 10px;
    position: relative;
    overflow: hidden;
    margin-bottom: 20px;
  }
  .customers-wrapper img{
      border-radius: 50%;
      margin-left: 15%;
      margin-top: 3%
  }

  /* aside-bottom */
  .white-block__title {
    color: #D6D7E3;
  }
  .white-block {
    background-color: #222235;
    color: #D6D7E3;
  }
  .white-block {
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-orient: vertical;
    -webkit-box-direction: normal;
    -ms-flex-direction: column;
    flex-direction: column;
    background-color: #FFFFFF;
    border-radius: 10px;
    padding: 20px;
    margin-bottom: 20px;
  }
  
  .white-block__title {
    font-weight: 500;
    font-size: 16px;
    line-height: 1.5;
    color: #171717;
    margin-bottom: 20px;
  }

  /* main */
  
  .main-contents,
  .col-lg-3,
  .col-md-6,
  .col-xl-3  {
      position: relative;
      width: 100%;
      min-height: 1px;
      padding-right: 10px;
      padding-left: 10px;
    }

    .col-lg-3 {
        -webkit-box-flex: 0;
        -ms-flex: 0 0 25%;
        flex: 0 0 25%;
        max-width: 25%;
      }
    .main-contents{
      -webkit-box-flex: 0;
      -ms-flex: 0 0 75%;
      flex: 0 0 100%;
      max-width: 100%;
      
    }

  .row{
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-wrap: wrap;
    flex-wrap: wrap;
    margin-right: -15px;
    margin-left: -15px;
  }

  .main-table {
    line-height: 1.4;
    /* letter-spacing: -0.3px; */
    color: #767676;
    height: 48px;
    font-size: 14px;
  }
  .main-table th{
    font-weight: 500;
    border-bottom: 1.2px solid #dadbe4;
    background-color: yellow;
    
  }
  .main-table td{
    background-color: #FFFFFF;
    border-bottom: 1px solid rgb(240, 240, 240);
  }
  /* .table-detail {
    border-bottom-color: transparent;
    color: #EFF0F6;
  } */
 
  .main-table{
      min-width:100%;
      background-color: whitesmoke;
  }
  </style>
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
		             <h2>
		             <span id="date"> </span>
		             </h2> 
		             <input type="hidden" id="holiYear" name="year" value="">
		             <br><br>
		          </div>
		          <c:forEach items="${eList }" var="employee">
		          <div class="row stat-cards">
		            <div class="col-md-6 col-xl-3">
		              <article class="stat-cards-item">
		                <div class="stat-cards-icon primary" >
		                  <i class="icon-globe"></i>
		                </div>
		                <div class="stat-cards-info">
		                  <p class="stat-cards-info__num">${employee.empVac }</p>
		                  <p class="stat-cards-info__title">이번 년 남은 연가</p>
		                </div>
		              </article>
		            </div>
		            <div class="col-md-6 col-xl-3">
		              <article class="stat-cards-item">
		                <div class="stat-cards-icon warning">
		                  <i class="icon-circle-plus"></i>
		                </div>
		                <div class="stat-cards-info">
		                  <p class="stat-cards-info__num">${employee.empMed }</p>
		                  <p class="stat-cards-info__title">이번 년 남은 병가</p>
		                </div>
		              </article>
		            </div>
		            <div class="col-md-6 col-xl-3">
		              <article class="stat-cards-item">
		                <div class="stat-cards-icon purple">
		                  <i class="icon-umbrella"></i>
		                </div>
		                <div class="stat-cards-info">
		                  <p class="stat-cards-info__num">${employee.empExVac }</p>
		                  <p class="stat-cards-info__title">이번 년 사용한 기타 휴가</p>
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
		                      <th>휴가신청서</th>
		                    </tr>
		                  </thead>
		                  <tbody>
		                  <c:forEach items="${dList }" var="document">
		                    <tr>
		                      <td><fmt:formatDate pattern="yyyy년 MM월 dd일" value="${document.dUpdateDate }"/></td>
		                      <td>${document.vacKind }</td>    
		                      <td>${document.vStartDate } ~ ${document.vEndDate }</td>
		                      <input type="hidden" id="vSDate" value="${document.vStartDate }">
		                      <input type="hidden" id="vEDate" value="${document.vEndDate }">
		                      <td id="dateDiff"></td>
		                      <td>
<%-- 		                      <c:url var="dDetail" value="documentDatail.do"> --%>
<%-- 								<c:param name="docNo" value="${document.documentNo }"></c:param> --%>
<%-- 							</c:url> --%>
<%-- 							<a href="${dDetail }">${doc.docKind }</a> --%>
		                    </td>
		                      <td>
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
		  year = now.getFullYear();
		  $("#date").text(year + "년");
		  $("#holiYear").val(year);
		  var dt1 = (new Date($('#vEDate').val()).getTime() - new Date($('#vSDate').val()).getTime())/1000/60/60/24 +1;
		  $("#dateDiff").text(dt1 +"일");
	  })
// 	  $("#previousYear").click(function() {	
// 	   		 var date1 = $("#date").text();
// 	   		 var todayYear = parseInt(date1.replace(/[^0-9]/g,'')) - 1 ; 
// 	   		 $("#date").text(todayYear + "년");
// 	   		$("#holiYear").val(todayYear);
// 	   	 });
// 	  $("#nextYear").click(function() {	
// 		  var date1 = $("#date").text();
// 	   	   var todayYear = parseInt(date1.replace(/[^0-9]/g,'')) + 1; 
// 	   		 $("#date").text(todayYear + "년");
// 	   		$("#holiYear").val(todayYear);
// 		 });
	  
// 	$(".yearBtn").on("click", function(){
// 		var date1 = $("#date").text();
//    	   var nowYear = parseInt(date1.replace(/[^0-9]/g,'')); 
// 		$.ajax({
// 		    url: "holidayList.do",
// 		    data: {"year" : nowYear},
// 		    type: "get",
// 		    success : function(data){
// 		      var docNo = '${document.docNo}';
// 		      $.ajax({
// 		    	  url:"holidayList.do",
// 		    	  type : "get",
// 		    	  data : { "docNo" : docNo},
// 		    	  dataType : "json",
// 		    	  success : function(data){
// 		    		  var $tableBody = $(".main-table tbody");
// 		    		  $tableBody.html("");
// 		    		  var $tr;
// 		    		  var $dUpdateDate;
// 		    		  var $vacKind;
// 		    		  var $vStartDate;
// 		    		  var $vEndDate;
// 		    		  var $docReason;
		    		  
// 		    		  if(data.length > 0){
// 		    			  for(var i in data){
// 		    				  $tr = $("<tr>");
// 		    				  $dUpdateDate = $("<td>").text(data[i].dUpdateDate);
// 		    				  $vacKind = $("<td>").text(data[i].vacKind);
// 		    				  $vStartDate = $("<td>").text(data[i].vStartDate ~ data[0].vEndDate);
// 		    				  $docReason = $("<td>").text(data[i].docReason);
// 		    			  }
// 		    		  }
// 		    	  },
// 		    	  error : function() {
// 						alert("AJAX 통신 오류.. 관리자에게 문의하세요");
// 					}
		    	  
// 		      })
// 		    },
// 		    error : function(){
// 		      alert("에러")		
// 		    }
// 		});
// 	});
		  
  </script>
</body>
</html>