<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 근태관리</title>
  
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
/*     -ms-flex: 0 0 33%; */
    flex: 0 0 33%;
/*     max-width: 50%; */
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
    background-color:  #FFFFFF;
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
      flex: 0 0 75%;
      max-width: 75%;
      
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
  }
  /* .table-detail {
    border-bottom-color: transparent;
    color: #EFF0F6;
  } */
 
  .main-table{
      min-width:100%;
      background-color: whitesmoke;
  }
  .box{
    
    text-align:center;
    vertical-align: bottom;

  }
  #time{
    text-align: center;
    font-size: 40px;
     
  }
  #startWork,#finishWork{
  	height: 30px;
  	width: 70px;
  	border-radius: 10%;
  }
  .listTitle{
  	color:black;
  	text-decoration:none;
  	}
  }
  th{
  	background-color: yellow;
  }
  table td{
  		border-bottom: 1px solid rgb(240, 240, 240);
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
		            <h2>나의 근태관리</h2>
		          </div>
		          <div class="top-date" align="center">
		             <h2><span id="date"> </span></h2>
		             <input type="hidden" id="attendYearMonth" value=""> 
		             <br><br>
		          </div>
		          <div class="row stat-cards" id="stats">
		          
		            <div class="col-md-6 col-xl-3">
		              <article class="stat-cards-item">
		                <div class="stat-cards-icon primary">
		                  <i class="icon-paper" ></i>
		                </div>
		                <div class="stat-cards-info">
		                  <p class="stat-cards-info__num">${attendance.countLate }</p>
		                  <p class="stat-cards-info__title">이번 달 지각일</p>
		                  <p class="stat-cards-info__progress">
		                    <span class="stat-cards-info__profit success">
		                      <i data-feather="trending-up" aria-hidden="true"></i>
		                    </span>
		                   
		                  </p>
		                </div>
		              </article>
		            </div>
		            <div class="col-md-6 col-xl-3">
		              <article class="stat-cards-item">
		                <div class="stat-cards-icon warning">
		                  <i class="icon-paper" ></i>
		                </div>
		                <div class="stat-cards-info">
		                  <p class="stat-cards-info__num"><span id="countAbs">${attendance.countAbs }</span></p>
		                  <p class="stat-cards-info__title">이번 달 결근일</p>
		                  <p class="stat-cards-info__progress">
		                    <span class="stat-cards-info__profit success">
		                      <i data-feather="trending-up" aria-hidden="true"></i>
		                    </span>
		                  </p>
		                </div>
		              </article>
		            </div>
		            <div class="col-md-6 col-xl-3">
		              <article class="stat-cards-item">
		                <div class="stat-cards-icon warning">
		                  <i class="icon-paper" ></i>
		                </div>
		                <div class="stat-cards-info">
		                  <p class="stat-cards-info__num">${attendance.count }</p>
		                  <p class="stat-cards-info__title">이번 달 근무일</p>
		                  <p class="stat-cards-info__progress">
		                    <span class="stat-cards-info__profit success">
		                      <i data-feather="trending-up" aria-hidden="true"></i>
		                    </span>
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
		                  </div>
		                	<div id="time"></div> 
		                  <div align="center" id="attend_btn">
			                  	<input type="submit" id="startWork" value="출근">
			                   	<button id="finishWork">퇴근</button>
		                  </div>
		                  <br>
		              </article>
		            </div>
		            <div class="main-contents">
		                <table class="main-table">
		                  <thead>
		                    <tr class="table-detail">
		                      <th>일자</th>
		                      <th>업무시작시간</th>
		                      <th>업무종료시간</th>
		                      <th>근무시간</th>
		                      <th>구분</th>
		                      <th>비고</th>
		                    </tr>
		                  </thead>
		                  <tbody>
		                  <c:if test="${empty aList }">
		                  	<tr>
		                  		<td colspan="6" align="center"> 조회된 정보가 없습니다. </td>
		                  	</tr>
		                  </c:if>
		                  <c:forEach items="${aList }" var="attendance">
		                    <tr>
		                      
		                      <td><fmt:formatDate pattern="yyyy년 MM월 dd일" value="${attendance.attendDate }"/></td>
		                      <td>${attendance.startTime }</td>    
		                      <td>${attendance.finishTime }</td>
		                      <td>${attendance.totalWorkhour }분</td>
		                      <td>${attendance.division }</td>
		                      <td>${attendance.note }</td>
		                    </tr>
		                   </c:forEach>
		                   
		                   <tr align="center" height="20">
					         <td colspan="6">
					         <c:url var="before" value="attendanceList.do">
					            <c:param name="page" value="${pi.currentPage - 1 }"></c:param>
					         </c:url>
					            <c:if test="${pi.currentPage <= 1 }">
					               [이전]
					            </c:if>
					            <c:if test="${pi.currentPage > 1 }">
					               <a href="${before }">[이전]</a>
					            </c:if>
					            <c:forEach var="p" begin="${pi.startNavi }" end="${pi.endNavi }">
						         <c:url var="pagination" value="attendanceList.do">
						            <c:param name="page" value="${p }"></c:param>
						         </c:url>
					               <c:if test="${p eq pi.currentPage }">
					                  <font color="red" size="4">[${p }]</font>
					               </c:if>
					               <c:if test="${p ne pi.currentPage }">
					                  <a href="${pagination }">[${p }]</a>&nbsp;
					               </c:if>
					            </c:forEach>
					         <c:url var="after" value="attendanceList.do">
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
		              $("#startWork").click(function(){
		            	  var now = new Date();
		            	  var hr = now.getHours();
		            	  var min = now.getMinutes();
		            	  var sec = now.getSeconds();
		            	  var now1 = hr+ ":" + min +":"+ sec;
		            	  confirm("출근하시겠습니까?");
		            	  if(true){
								location.href="/insertStartTime.do";
		            	  }
		              })
		              
		              $("#finishWork").click(function(){
		            	  var now = new Date();
		            	  var hr = now.getHours();
		            	  var min = now.getMinutes();
		            	  var sec = now.getSeconds();
		            	  var now1 = hr+ ":"+ min+ ":"+ sec;
		            	  confirm("퇴근하시겠습니까?");
		            		if(true){
								location.href="/insertFinishTime.do";
			            	 }
		              })
		              
		              $(document).ready(function(){
		            	  var now = new Date();
		            	  var year = now.getFullYear();
		            	  var month = now.getMonth()+1;
		            	  var date = now.getDate();
		            	  var hr = now.getHours();
		            	  var min = now.getMinutes();
		            	  var sec = now.getSeconds();
		            	  var now = year + "년 " + month  + "월";
		            	  var now1 = year + "/" + month + "/" + date; 
		            	  var now2 = hr+ ":"+ min+ ":"+ sec;
		            	  $(".box").text(now1);
		            	  $(".top-cat-title").text(now1);
		            	  $("#time").text(now2);
		            	  $("#date").text(now);
		              })

		            	 $("#previousMonth").click(function() {	
		            		 var date1 = new Date($("#date").text());
		            		 console.log(date1);
		            		 if(date1.getMonth() === 1){
		            			 pageFirst = new Date(date1.getFullYear()-1, 12);
		            			 first = pageFirst;
		            		 }else{
		            			 pageFirst = new Date(date1.getFullYear(),date1.getMonth()-1);
		            			 first = pageFirst;
		            		 }
		            		 var year = first.getFullYear();
		            		 var month = first.getMonth()+1;
		            		 var now = year + "-" + month;
		            		 
		            		 $("#date").text(now);
		            		 $("#attendYearMonth").val(now);
		            	 });
		            	 
		            	 $("#nextMonth").click(function() {	
		            		 var date1 = new Date($("#date").text());
		            		 console.log(date1);
		            		 if(date1.getMonth() === 12){
		            			 pageFirst = new Date(date1.getFullYear()+1, 12);
		            			 first = pageFirst;
		            		 }else{
		            			 pageFirst = new Date(date1.getFullYear(),date1.getMonth()+1);
		            			 first = pageFirst;
		            		 }
		            		 var year = first.getFullYear();
		            		 var month = first.getMonth()+1;
		            		 var now = year + "-" + month;
		            		 
		            		 $("#date").text(now);
		            		 $("#attendYearMonth").val(now);
		            		 
		            	 });
		              </script>
</body>
</html>