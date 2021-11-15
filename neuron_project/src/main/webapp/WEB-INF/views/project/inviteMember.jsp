<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags --> 
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>팀원 초대</title>
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
body, html {
	height: 100%;
	width: 100%;
}

#invite {
	background-color: #2C3E50;
	color: white;
	border-color: #2C3E50;
}

#invite:hover{

background-color:#1e2b37;
border-color:#1e2b37;
}
 

</style>
</head>
<body>
	<div style="height: 100%; width: 100%;">
		<div style="height: 20%; width: 100%; border-bottom: 1px solid black">
			<form class="d-flex" onsubmit="return false">
				<input class="form-control me-2" type="search" placeholder="팀원을 검색해주세요"
					aria-label="Search" id="searchText" onkeyup="enterKeyup()">
				<button class="btn btn-outline-success" type="submit"  onclick="insertProjectSearchMemberList()">Search</button>
			</form>
		</div>
		<div style="height: 70%; width: 100%">
		<form id="insertProjectForm" action="inviteMember.do?projectNo=${project.projectNo }" method="get">
			<div style="float: left; width: 50%; height: 100%; overflow: auto" id="projectMember">
			
			</div>
			<input type="submit" class="btn btn-primary" id="invite" style="position: relative; left:470px;" value="확인">
		</form>
			<div style="float: left; width: 50%; height: 100%;border-left: 1px solid black; overflow: auto" id="memberList">
			
			</div>
		</div>
	</div>
	<script type="text/javascript">
	function insertProjectSearchMemberList() {
		var searchText = document.getElementById('searchText').value;
		var memberList = document.getElementById('memberList')
		$.ajax({
			url : "insertInviteProjectSearchMemberList.do?empNo=${loginEmployee.empNo}&projectNo=${project.projectNo}",
			type : "post",
			data : {
				"searchText":searchText
			},
			dataType : "json",
			success : function(data) {
				var $memberList =$("#memberList");
				$memberList.html("");
				var $div1;
				var $div2;
				var $div3;
				var $div4;
				var $div5;
				var $memberName;
				var $memberDeptCode;
				var $memberJob;
				var $btnArea;
				var $imgArea;
				if(data.length > 0){
					for(var i in data){
						$div1 = $("	<div class='card mb-3' style='max-width: 540px;'>");
						$div2 = $("<div class='row g-0'>")
						$div1.append($div2)
						$div3 = $("	<div class='col-md-4' style'float:left;'>")
						$div2.append($div3)
						$imgArea = $div3.append("<img src='...' class='img-fluid rounded-start' alt='이미지영역'>")
						$div4 = $("<div class='col-md-8'>")
						$div2.append($div4)
						$div5 = $("	<div class='card-body'>")
						$memberName = $div5.append("<h5 class='card-title'>" +data[i].empName + "</h5>");
						$memberDeptCode = $div5.append("<p class='card-text'>" + data[i].deptName + "</p>"); 
						$memberJob = $div5.append("<p class='card-text'>"+data[i].empJob+ "</p>") 
						$btnArea = $div5.append("<button type='button' class='btn btn-primary' id='choice' onclick='choiceEmp(this)'>선택</button>")
						$hidden = $div5.append("<input type='hidden' id='empNo' name='empNo' value='"+data[i].empNo+ "'/>")
						$div4.append($div5)
						$memberList.append($div1);
// 						$memberList.append($div2);
// 						$memberList.append($div3);
// 						$memberList.append($div4);
// 						$memberList.append($div5);
					}
				}
			},
			error: function() {
				alert("오류가 발생했습니다..")
			}							
		});
	}
	
	
	function choiceEmp(id){
		var button = "<button type='button' class='btn btn-primary' id='choice' onclick='deleteEmp(this)'>삭제</button>";
		var main = id.parentNode.parentNode.parentNode.parentNode;
		//var mainClone = main.cloneNode(true)
		//main.replaceChild(id, button);
		//console.log(id.parentNode);
		var parent = id.parentNode;
		var hidden = id.nextSibling;
		console.log(hidden);
		parent.removeChild(id);
		parent.innerHTML += button;
		//console.log(id.parentNode.parentNode);
		var projectMemberList  = document.getElementById('projectMember');
		var insertProjectForm = document.getElementById('insertProjectForm');
		//insertProjectForm.appendChild(hidden);
		projectMemberList.appendChild(main);
		
	}
	
	function deleteEmp(id) {
		var grandParent = id.parentNode.parentNode.parentNode.parentNode.parentNode;
		var parent = id.parentNode.parentNode.parentNode.parentNode;
		var insertProjectForm = document.getElementById('insertProjectForm');
		//var hidden = id.nextSibling;
		//console.log(hidden);
		grandParent.removeChild(parent);
	}
	
	function enterKeyup(){
		console.log("여긴오니")
		if(window.event.keyCode ==13){
			insertInviteProjectSearchMemberList();
		}
	}
	
	</script>
</body>
</html>