<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
  <style>
  .main{
    height:800px;
    width: 1000px;
    background-color: #f4f7fa;
}

.userInfoTable{
    background-color: #ffff;
    height: 400px;
    width: 60%;
    float:left;
}
.InfoTable{
    /* border : 1px solid black; */
    width:100%;
}
.InfoTable th{
    border-bottom: 1px solid #444444;
    background-color: aquamarine;
    padding: 5px;
  }
  .InfoTable td{
    border-bottom: 1px solid #444444;
    padding: 5px;
  }
.middle_btn{
    width:5%;
    float:left;
    text-align: center;
    /* background-color: blue; */
}
.aside{
    height:400px;
    width: 35%;
    float:left;
    background-color: #ffff;
    text-align: center;
}
.aside-top{
    height:50%;
}
table{
    border-collapse: collapse;
    width:100%

}
.btns{
    text-align: center;
}
  
  </style>
</head>
<body>
			<div class="main">
		      <div class="addrTitle"><br><h2>주소록</h2></div>
		      <br><br>
		      <div class="searchBar">
		      <form action="addressSearch.do" method="get">
		        <select name="" id="">
		          <option value="all"<c:if test="${search.searchCondition == 'all' }">selected</c:if>>전체</option>
		          <option value="name"<c:if test="${search.searchCondition == 'name' }">selected</c:if>>이름</option>
				  <option value="empEmail"<c:if test="${search.searchCondition == 'empEmail' }">selected</c:if>>이메일</option>
		          <option value="empPhone"<c:if test="${search.searchCondition == 'empPhone' }">selected</c:if>>전화번호</option>
		        </select>
		        <input type="search" name="searchValue" value="${search.searchValue }" id="">
		        <input type="submit" value="검색">
		        </form>
		      </div>
		      <br>
		      <div class="userInfoSelect">
		        <div class="userInfoTable">
		          <table class="InfoTable">
		            <tr>
		              <th><input type="checkbox" name="checkAll" id=""></th>
		              <th>사원번호</th>
		              <th>사원이름</th>
		              <th>팀코드</th>
		              <th>연락처</th>
		              <th>이메일</th>
		              <th>생년월일</th>
		            </tr>
						<c:if test="${empty eList }">
		                  	<tr>
		                  		<td colspan="7" align="center"> 조회된 정보가 없습니다. </td>
		                  	</tr>
		                  </c:if>
		                  <c:forEach items="${eList }" var="employee">
		                    <tr>
		                      <td><input type="checkbox" name="" id=""></td>
		                      <td>${employee.empNo }</td>    
		                      <td>${employee.empName }</td>
		                      <td>${employee.teamCode }</td>
		                      <td>${employee.empPhone }</td>
		                      <td>${employee.empEmail }</td>
		                      <td>${employee.empBirth }</td>
		                    </tr>
		                   </c:forEach>
		                   <tr align="center" height="20">			
								<td colspan="6">
									<c:url var="before" value="addressbook.do">
										<c:param name="page" value="${pi.currentPage - 1 }"></c:param>
									</c:url>
									<c:if test="${pi.currentPage <= 1 }">
										[이전]
									</c:if>
									<c:if test="${pi.currentPage > 1 }">
										<a href="${before }">[이전]</a>
									</c:if>
									<c:forEach var="p" begin="${pi.startNavi }" end="${pi.endNavi }">
										<c:url var="pagination" value="addressbook.do">
											<c:param name="page" value="${p }"></c:param>
										</c:url>
										<c:if test="${p eq pi.currentPage }">
											<font color="red" size="4">[${p }]</font>
										</c:if>
										<c:if test="${p ne pi.currentPage }">
											<a href="${pagination }">${p }</a>&nbsp;					
										</c:if>
									</c:forEach>
									<c:url var="after" value="addressbook.do">
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
		                <td colspan="5" align="center">정보가 없습니다.</td>
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
		                <td colspan="5" align="center"> 정보가 없습니다.</td>
		              </tr>
		            </table>
		          </div>
		        </div>
		        <div class="btns"><button>선택완료</button> <button>취소</button></div>
		      </div>
		   </div>
</body>
</html>