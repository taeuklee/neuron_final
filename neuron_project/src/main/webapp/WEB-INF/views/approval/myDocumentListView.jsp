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
						<form action="/approval/myDocumentListView.do">
							<table id="search">
								<tr>
									<td>
										<span>기안일 : </span> <input type="date" name="startDt" value="${rMap.startDt }" /> ~ <input type="date" name ="endDt" value="${rMap.endDt }" />
									
										<span>문서양식 : </span> 
										<select name="docGubun">
											<option value="all">전체</option>
											<c:forEach items="${code }" var="item">
												<option value="${item.codeName }"<c:if test="${rMap.docGubun eq item.codeName }">selected</c:if>>${item.codeName }</option>
											</c:forEach>
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
												<th width="100">기안자</th>
												<th width="200">기안일</th>
												<th width="200">완료일</th>
												<th width="100">문서상태</th>
											</tr>
										</thead>
										<tbody>
										<c:forEach items="${dList }" var="dOne" varStatus="count">
											<c:url var="dDetail" value="documentDatail.do">
												<c:param name="documentNo" value="${dOne.documentNo }"></c:param>
											</c:url>
											<tr align="center" style="cursor:pointer; color:#blue;">
												<td onclick="location.href='/${dDetail }'">${dOne.documentNo }</td>
												<td onclick="location.href='/${dDetail }'">${dOne.documentKind }</td>
												<td onclick="location.href='/${dDetail }'">${dOne.empName }</td>
												<td onclick="location.href='/${dDetail }'">${dOne.dCreateDate }</td>
												<c:if test="${dOne.documentStatus eq '최종완료' or dOne.documentStatus eq '반려'}">
													<td onclick="location.href='/${dDetail }'">${dOne.dUpdateDate }</td>												
												</c:if>
												<c:if test="${dOne.documentStatus eq '합의대기' or dOne.documentStatus eq '결재대기'}">
													<td onclick="location.href='/${dDetail }'"></td>												
												</c:if>
												<td>
													<button class="question" id="que-${count.count }">
														<span>${dOne.documentStatus }</span><span id="que-${count.count }-toggle">+</span>
													</button>
												</td>
											</tr>
											<tr>
												<td colspan="5" style="padding: 5px">
													<div class="answer" id="ans-${count.count }">
														<input type="hidden" id="docNo-${count.count }" value="${dOne.documentNo }">
														<table class="table table-bordered"align="center" border="1">
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
															<tbody id="tbody-${count.count }">
															</tbody>
														</table>
													</div>
												</td>
											</tr>
										</c:forEach>
										<!-- 페이징 처리 -->
										<tr align="center" height="20">
									         <td colspan="6">
									         <c:url var="before" value="/approval/myDocumentListView.do">
									            <c:param name="page" value="${pi.currentPage - 1 }"></c:param>
									         </c:url>
									         <c:url var="after" value="/approval/myDocumentListView.do">
									            <c:param name="page" value="${pi.currentPage + 1 }"></c:param>         
									         </c:url>
									         <c:url var="pagination" value="/approval/myDocumentListView.do">
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
	      var docId = this.id.replace("que","docNo");
	      var docNo = $('#'+docId).val();
	      var tbody = this.id.replace("que","tbody");
	      
		  $.ajax({
			  url : "/apprList.do",
			  type : "get",
			  data : {"documentNo":docNo },
			  dataType : "json",
			  success : function(data){
				  var $tableBody = $('#'+tbody);
				  $tableBody.html("");
				  var $tr;
				  var $seq;
				  var $writer;
				  var $apprType;
				  var $apprState;
				  var $startDate;
				  var $endDate;
				  var $apprOp;
				  if(data.length>0){
						var count = 0;
						for(var i in data){
							count++;
							$tr= $("<tr>");
							$seq = $("<td>").text(count);
							$writer = $("<td>").text(data[i].empName+" "+data[i].empJob+"("+data[i].teamName+")");
							$apprType = $("<td>").text(data[i].approvalType);
							$apprState = $("<td>").text(data[i].approvalStatus);
							$startDate = $("<td>").text(data[i].approvalStartdate);
							$endDate = $("<td>").text(data[i].approvalEnddate);
							$apprOp = $("<td>").text(data[i].approvalOpinion);
							$tr.append($seq);
							$tr.append($writer);
							$tr.append($apprType);
							$tr.append($apprState);
							$tr.append($startDate);
							$tr.append($endDate);
							$tr.append($apprOp);
							$tableBody.append($tr);
						}
					}
			  },
			  error : function(){
				  alert("ajax 실패");
			  }
		  });	
	      if(document.getElementById(answerId).style.display === 'block') {
	        document.getElementById(answerId).style.display = 'none';
	        document.getElementById(this.id + '-toggle').textContent = '+';
	      }
	      else {
	        document.getElementById(answerId).style.display = 'block';
	        document.getElementById(this.id + '-toggle').textContent = '-';
	      }
	    }
	    items.forEach(item => item.addEventListener('click', openCloseAnswer));
	</script>
</body>

</html>