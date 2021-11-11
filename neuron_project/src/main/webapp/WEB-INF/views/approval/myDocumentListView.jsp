<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Regal Admin</title>
<!-- base:css -->
<link rel="stylesheet" href="/vendors/mdi/css/materialdesignicons.min.css">
<link rel="stylesheet" href="/vendors/feather/feather.css">
<link rel="stylesheet" href="/vendors/base/vendor.bundle.base.css">
<!-- endinject -->
<!-- plugin css for this page -->
<link rel="stylesheet" href="/vendors/flag-icon-css/css/flag-icon.min.css" />
<link rel="stylesheet" href="/vendors/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="/vendors/jquery-bar-rating/fontawesome-stars-o.css">
<link rel="stylesheet" href="/vendors/jquery-bar-rating/fontawesome-stars.css">
<!-- End plugin css for this page -->
<!-- inject:css -->
<link rel="stylesheet" href="/css/style.css">
<!-- endinject -->
<link rel="shortcut icon" href="/images/favicon.png" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
    $(document).ready(function(){
      $("#headerNav").load("/partials/_navbar.html");
      $("#sidebar").load("/partials/_sidebar.html");
    });
  </script>
<style>
.answer {
	display: none;
}

#search {
	width: 100%;
	max-width: 100%;
}

#search tr td {
	padding: 8px;
	line-height: 1.42857143;
	vertical-align: top;
}
</style>
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
					<!--게시판 넓이 -->
					<div class="col-lg-12">
						<h1 class="page-header">결재요청함</h1>
					</div>
				

					<!-- 검색창	               -->
					<div class="col-lg-6 grid-margin stretch-card"
						style="max-width: 100%;">
					<div class="card">
						<form action="">
							<table id="search">
								<tr>
									<td>
										<span>기안일 : </span> <input type="date"> ~ <input type="date">
									
										<span>문서형태 : </span> 
										<select>
											<option value="none" hidden>=== 선택 ===</option>
											<option value="all">전체</option>
											<option value="none">휴가신청서</option>
											<option value="none">업무보고서</option>
											<option value="none">지출결의서</option>
											<option value="none">회의록</option>
										</select>
										<button>검색</button>
									</td>
								</tr>
							</table>

						</form>
					</div>
					</div>
					<div class="col-lg-6 grid-margin stretch-card"
						style="max-width: 100%;">
						<div class="card">
							<div class="card-body">
								<h4 class="card-title" style="float:left">내 결재문서 조회 </h4>
								<button type="button" onclick="location.href='/documentWriteView.do';"
									class="btn btn-outline btn-primary pull-right">
									<i class="fa fa-edit fa-fw"></i> 결재요청
								</button>
								<div class="table-responsive">
									<table class="table table-hover">
										<thead>
											<tr align="center">
												<th width="20">No</th>
												<th width="200">문서종류</th>
												<th width="200">기안일</th>
												<th width="200">완료일</th>
												<th width="100">문서상태</th>
											</tr>
										</thead>
										<tbody>
										<c:forEach items="${dList }" var="dOne" varStatus="count">
											<tr align="center">
												<td>${dOne.docNo }</td>
												<td>${dOne.docKind }</td>
												<td>${dOne.dCreateDate }</td>
												<c:if test="${dOne.docStatus eq '결재완료'}">
												<td>${dOne.dUpdateDate }</td>												
												</c:if>
												<c:if test="${dOne.docStatus ne '결재완료'}">
												<td></td>												
												</c:if>
												<td>
													<button class="question" id="que-${count.count }">
														<span>${dOne.docStatus }</span><span id="que-${count.count }-toggle">+</span>
													</button>
												</td>
											</tr>
											<tr>
												<td colspan="5" style="padding: 5px">
													<div class="answer" id="ans-${count.count }">
														<table align="center" border="1">
															<thead align="center">
																<tr>
																	<th>순번</th>
																	<th>합의/결재자</th>
																	<th>결재유형</th>
																	<th>결재내역</th>
																	<th>배정일시</th>
																	<th>결재일시</th>
																	<th>결재의견</th>
																</tr>
															</thead>
															<tbody>
																<tr>
																	<td>1</td>
																	<td>이태욱대리 개발1팀</td>
																	<td>합의</td>
																	<td>승인</td>
																	<td>2021.10.26 13:14</td>
																	<td>2021.10.26 16:40</td>
																	<td>승인완료</td>
																</tr>
																
																
															</tbody>
														</table>
													</div>
												</td>
											</tr>
										</c:forEach>
										<!-- 페이징 처리 -->
										<tr align="center" height="20">
									         <td colspan="6">
									         <c:url var="before" value="/documentList.do">
									            <c:param name="page" value="${pi.currentPage - 1 }"></c:param>
									         </c:url>
									         <c:url var="after" value="/documentList.do">
									            <c:param name="page" value="${pi.currentPage + 1 }"></c:param>         
									         </c:url>
									         <c:url var="pagination" value="/documentList.do">
									            <c:param name="page" value="${p }"></c:param>
									         </c:url>
									            <c:if test="${pi.currentPage <=1 }">
									               [이전]
									            </c:if>
									            <c:if test="${pi.currentPage >1 }">
									               <a href="${before }">[이전]</a>
									            </c:if>
									            <c:forEach var="p" begin="${pi.startNavi }" end="${pi.endNavi }">
									               <c:if test="${p eq pi.currentPage }">
									                  <font color="red" size="4">[${p }]</font>
									               </c:if>
									               <c:if test="${p ne pi.currentPage }">
									                  <a href="${pagination }${p}">[${p }]</a>&nbsp;
									               </c:if>
									            </c:forEach>
									            
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
					<!-- partial -->
				</div>
				<!-- main-panel ends -->
			</div>
			<!-- page-body-wrapper ends -->
		</div>
	</div>
	<!-- container-scroller -->
	<script>
	    const items = document.querySelectorAll('.question');
	    function openCloseAnswer() {
	      const answerId = this.id.replace('que', 'ans');
	  
	      if(document.getElementById(answerId).style.display === 'block') {
	        document.getElementById(answerId).style.display = 'none';
	        document.getElementById(this.id + '-toggle').textContent = '+';
	      } else {
	        document.getElementById(answerId).style.display = 'block';
	        document.getElementById(this.id + '-toggle').textContent = '-';
	      }
	    }
	    items.forEach(item => item.addEventListener('click', openCloseAnswer));
	</script>
</body>

</html>