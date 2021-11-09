<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<style type="text/css">
body {
	margin: 0;
	padding: 0;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	function checkOne(){
// 		var a = this.val();
		
		alert("합의 클릭하셨습니다.");
		var insertTr ="";
		insertTr += "<tr>";
		insertTr += "<td>1</td>";
		insertTr += "<td>합의</td>";
		insertTr += "<td>합의</td>";
		insertTr += "</tr>";
		$("#test1").append(insertTr);
	}
</script>
</head>

<body>
	<div style="width: 100%; height: 30px; background: gray; color: white;">
		결재선 지정
	</div>
	<div class="main-panel" style="width:100%">        
        <div class="content-wrapper">
          <div class="row">
            <div class="col-12 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h4 class="card-title">조직도</h4>

                  <form class="forms-sample">
                  	<select>
                  		<option>사원명</option>
                  		<option>부서명</option>
                  	</select>
                  	<input type="text">
                  	<button>검색</button>
                  </form>
                  
                  	<c:forEach items="${dList }" var="dOne">
                  		${dOne.deptName } ( 
	                  	<c:forEach items="${tList }" var="tOne">
	                  		<c:if test="${dOne.deptNo eq tOne.deptNo }">
	                  			<br>
		                  		${tOne.teamName }-
		                  		<c:forEach items="${eList }" var="eOne">
		                  			<c:if test="${tOne.teamNo eq eOne.teamNo }">
				                  		${eOne.empName }
			                  		</c:if>
		                  		</c:forEach>
	                  		</c:if>
	                  	</c:forEach><br>)
	                  		<hr>
                  	</c:forEach>
                  	<hr>
                  	
                  	<table class="table table-hover">
                  		<tr>
                  			<th>부서명</th>
                  			<th>사원명</th>
                  			<th>직급</th>
                  			<th>선택</th>
                  		</tr>
                  	<c:forEach items="${eList }" var="eOne">
                  		<tr>
                  			<td>${eOne.teamNo }</td>
                  			<td>${eOne.empName }</td>
                  			<td>${eOne.empJob }</td>
                  			<td>
                  				<button onclick="checkOne();">합의</button>
                  				<button>결재</button>
                  			<td>
                  		</tr>
                  	</c:forEach>
                  	</table>
                  		
                </div>
              </div>
            </div>
            
	       	 <div class="col-12 grid-margin stretch-card">
	            <div class="card">
	              <div class="card-body">
	                <h4 class="card-title">결재선</h4>
	                <form class="forms-sample">
	                	<table class="table" id="test1">
	                		
	                	</table>
	                </form>
	              </div>
	            </div>
	          </div>
          </div>
       	</div>
      </div>
</body>
</html>