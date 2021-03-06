<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
  <!-- Required meta tags --> 
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>home</title>
  <link rel="stylesheet" href="../../css/inboxMail.css">
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
		// data??? ?????? ??????.. 
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
    <!-- partial:partials/_navbar.html ?????? ??? -->
    <jsp:include page="common/navbar.jsp"></jsp:include>
    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
      <!-- partial:partials/_sidebar.html ????????? ???  -->
      <jsp:include page="common/sidebar.jsp"></jsp:include>
      <!-- partial -->
      <div class="main-panel">
        <div class="content-wrapper" id="contents">
			<div class="row">
			  <div class="col-sm-12 mb-4 mb-xl-0">
			    <h4 class="font-weight-bold" style="color:#1914089c;">??????????????? Neuron?????????.</h4>
			  </div>
			</div>
			<div class="row mt-3">
		    <div class="col-xl-3 flex-column d-flex grid-margin stretch-card">
		      <div class="row flex-grow">
		        <div class="col-sm-12 grid-margin stretch-card">
		            <div class="card">
		              <div class="card-body">
		                  <p class="card-title">${loginEmployee.empName }?????? ??????</p>
		                  <h4 class="h1-dateClock"></h4>
		                  <h1 class="h1-clock" style="color:#fcb41d;"></h1>
		                  <h4 class="text-dark font-weight-bold mb-2">
		                    <button>??????</button>
		                    <button>??????</button></h4>
		                  <h4 class="text-dark font-weight-bold mb-2"></h4>
		                  
		                  
		              </div>
		            </div>
		        </div>
		        <div class="col-sm-12 stretch-card">
		            <div class="card">
		              <div class="card-body">
			        	<!-- <h1>weather api</h1> -->
			        	<h2>?????? ??????-</h2>
			        	<div id="ctemp">????????????: </div>
			        	<div id="clowTemp">????????????:</div>
			        	<div id="chightemp">????????????:</div>
			        	<div id="cicon">?????????:</div>
		              </div>
		            </div>
		       </div>
		      </div>
		    </div>
<!-- 		    ???????????? -->
		    <div class="col-xl-9 d-flex grid-margin stretch-card">
		        <div class="card">
		          <div class="card-body">
		              <h4 class="card-title">?????? ????????????</h4>
		              <div class="row">
		                <div class="col-lg-5">
		                </div>
		              </div>
		              <div class="row">
		              <a href="/noticeListView.do" style="float:right; padding-left: 92%;">?????????</a>
		              <div class="table-responsive pt-3">
								<table class="table table-bordered">
									<thead>
										<tr>
											<th>No</th>
											<th>??????</th>
											<th>?????????</th>
											<th>?????????</th>
										</tr>
									</thead>
									<c:if test="${ empty nList }">
							         	<tr>
							            	<td colspan="5" align="center">????????? ??????????????? ????????????.</td>
							         	</tr>
							     	 </c:if>
								      <c:if test="${ not empty nList }">
								         <c:forEach items="${ nList }" var="notice">
								            <tr align="center">
								               <td>${ notice.noticeNo }</td>
								               <td>
								                  <c:url var="nDetail" value="noticeDetailView.do">
								                     <c:param name="noticeNo" value="${ notice.noticeNo }"></c:param>
								                  </c:url>
								                  <a href="${ nDetail }">${ notice.noticeTitle }</a>
								               </td>
								               <td>${ notice.noticeWriter }</td>
								               <td>${ notice.regDate }</td>
								            </tr>
								         </c:forEach>
								      </c:if>
								</table>
						</div>
		              </div>
		            </div>
		          </div>
		    </div>
		    <div class="col-md-6 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h4 class="card-title">?????? ?????? ??????</h4>
                  <div class="template-demo">
                    <table class="mail-table">
		              <tr>
		                <th id="col_2"></th>
		                <th id="col_3">?????????</th>
		                <th id="col_4">??????</th>
		                <th id="col_6">?????? </th>
		              </tr>  
		              <c:if test="${empty mList }">
		                  	<tr>
		                  		<td colspan="6" align="center"> ????????? ????????? ????????????. </td>
		                  	</tr>
		              </c:if>
		              <c:forEach items="${mList }" var="mail">
		              <tr>
		                <td>
		                	<c:if test="${mail.readYn eq '????????????' }"><i class="icon-mail"></c:if>
		                </td>
		                <td>${mail.senderId }</td>
		                <td id="read">
			                <c:url var="mDetail" value="mailDetail.do">
								<c:param name="mailNo" value="${mail.mailNo }"></c:param>
							</c:url>
							<c:if test="${!empty mail.mailFileName }"><a href="${mDetail }">${mail.mailTitle }</a><i class="icon-paper-clip"></c:if>
							<c:if test="${ empty mail.mailFileName }"><a href="${mDetail }">${mail.mailTitle }</a></c:if>
						</td>
		                <td><fmt:formatDate pattern="yyyy-MM-dd" value="${mail.sendTime }"/></td>
		              </tr>
		              </c:forEach>
		              
		            </table>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-md-6 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
					<h4 class="card-title">????????????</h4>
					<c:if test="${not empty dList }">
					<p class="card-description" style="color:#E0553E; float:left;">
						???????????? ?????? ???????????? ????????? ??????????????????.
					</p>
					</c:if>
					<c:if test="${empty dList }">
					<p class="card-description" style="color:#118BF5; float:left;">
						???????????? ?????? ???????????? ????????? ??????????????????.
					</p>
					</c:if>
					<a href="/approval/documentWaitListView.do" style="float:right; padding-right: 28px;">?????????</a>
					<div class="table-responsive">
					<table class="table table-hover">
						<thead>
							<tr align="center">
								<th width="20">No</th>
								<th width="200">????????????</th>
								<th width="100">?????????</th>
								<th width="200">?????????</th>
								<th width="100">????????????</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${dList }" var="dOne">
							<c:url var="dDetail" value="documentDatail.do">
								<c:param name="documentNo" value="${dOne.documentNo }"></c:param>
							</c:url>
							<tr onclick="location.href='/${dDetail }'" align="center" style="cursor:pointer; color:#blue;">
								<th>${dOne.documentNo }</th>
								<th>${dOne.documentKind }</th>
								<th>${dOne.empName } ${dOne.empJob}</th>
								<th>${dOne.dCreateDate }</th>
								<th>${dOne.documentStatus}</th>
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