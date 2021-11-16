<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>home</title>
<!-- base:css -->
<link rel="stylesheet"
	href="vendors/mdi/css/materialdesignicons.min.css">
<link rel="stylesheet" href="vendors/feather/feather.css">
<link rel="stylesheet" href="vendors/base/vendor.bundle.base.css">
<!-- endinject -->
<!-- plugin css for this page -->
<link rel="stylesheet"
	href="vendors/flag-icon-css/css/flag-icon.min.css" />
<link rel="stylesheet"
	href="vendors/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet"
	href="vendors/jquery-bar-rating/fontawesome-stars-o.css">
<link rel="stylesheet"
	href="vendors/jquery-bar-rating/fontawesome-stars.css">
<!-- End plugin css for this page -->
<!-- inject:css -->
<link rel="stylesheet" href="css/style.css">
<!-- endinject -->
<link rel="shortcut icon" href="images/favicon.png" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {
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
<link href='../../../resources/fullcalendar-5.10.0/lib/main.css'
	rel='stylesheet' />
<script src='../../../resources/fullcalendar-5.10.0/lib/main.js'></script>
<script>

//   var eventTitle = ${empCalendar[0].empCalendarEventTitle};
  
//   console.log(eventTitle)
//   console.log(eventStartTime)
//   console.log(eventEndTime)


document.addEventListener('DOMContentLoaded', function() {
  var empNo = ${empNo}
  console.log(empNo)
  var events;
  var calendarEl = document.getElementById('calendar');
  var calendar = new FullCalendar.Calendar(calendarEl, {	  	  
    headerToolbar: {
      left: 'prev,next',
      center: 'title',
      right: 'listDay,listWeek'
    },

    // customize the button names,
    // otherwise they'd all just say "list"
    views: {
      listDay: { buttonText: '일일일정' },
      listWeek: { buttonText: '주간일정' }
    },

    locale : 'ko',
    initialView: 'listWeek',
    nextDayThreshold:'00:00',
    //initialDate: '2020-09-12',
    navLinks: true, // can click day/week names to navigate views
    editable: true,
    dayMaxEvents: true, // allow "more" link when too many events
		events: function(info, successCallback, failureCallback) {
			$.ajax({
				url: '<c:url value="selectMemberCalendar.do?empNo=${empNo}"/>',
				type: 'POST',
				dataType: 'json',
				data: {
					"empNo":empNo
				},
				success: function(data) {
					console.log(data)
					events = [];
					for(var i in data){
						
					var title = data[i].empCalendarEventTitle;
					var start = data[i].empCalendarStartTime;
					var end = data[i].empCalendarEndTime;
					var calNo = data[i].empCalendarNo
					events.push({
						title:title,
						start:start,
						end:end,
						calNo:calNo
					});
					console.log(events)
					}
					successCallback(events)
				},error: function () {
					alert("통신오류 입니다")
				}
			});
		},
		eventClick:function(info){
			var calNo = info.event.extendedProps.calNo;
			//var calNo = events[0].calNo
			$.ajax({
				url:'<c:url value="selectEventDetail.do?calNo='+calNo+'&empNo=${empNo}"/>',
				type:'POST',
				data:{
				},
				success:function(data){
					var url = "openEventDetail.do?calNo="+calNo;
					var name = "일정 디테일";
					var option = "width = 800, height = 700, top = 300 , left = 650, location = no, toolbars = no, status = no, scrollbars = no, resizable = no";
					window.open(url, name, option);
				},error: function () {
					alert("통신오류입니다")
				}
			});
		}

    
  });

  calendar.render();
});

</script>
<style>

	#insertEvent:hover{
	background-color: #1e2b37;
}

	#insertEvent{
		background-color: #2C3E50;
	
			color: white;
	}
</style>
</head>

<body>
	<div class="container-scroller">
		<!-- partial:partials/_navbar.html 해더 창 -->
		<jsp:include page="../common/navbar.jsp"></jsp:include>
		<!-- partial -->
		<div class="container-fluid page-body-wrapper">
			<!-- partial:partials/_sidebar.html 사이드 바  -->
			<jsp:include page="../common/sidebar.jsp"></jsp:include>
			<!-- partial -->
			<div class="main-panel">
				<div class="content-wrapper" id="contents">
					<button type="button" class="btn" onclick="moveInsertEvent()" id="insertEvent">일정추가</button>
					<div id='calendar' style="height: 100%; width:100%; margin-bottom: 10px;">
					</div>
				</div>
				<!-- partial:partials/_footer.html -->
				<jsp:include page="../common/footer.jsp"></jsp:include>
				<!-- partial -->
			</div>
			<!-- main-panel ends -->
		</div>
		<!-- page-body-wrapper ends -->
	</div>
	<!-- container-scroller -->
<script type="text/javascript">
	function moveInsertEvent() {

			var url = "moveInsertEvent.do?empNo=${loginEmployee.empNo}";
			var name = "일정 추가";
			var option = "width = 800, height = 700, top = 300 , left = 650, location = no, toolbars = no, status = no, scrollbars = no, resizable = no";
			window.open(url, name, option);
	}
</script>
</body>

</html>