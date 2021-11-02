<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>결재요청함</title>

<style>
	.answer {
        display: none;
	}
	#search{
	    width: 100%;
	    max-width: 100%;
	}
	#search tr td{
		padding: 8px;
	    line-height: 1.42857143;
	    vertical-align: top;
	}
</style>
<script>
	$(function (){
		$("#btn_toggle").click(function (){
	  	$("#Toggle").toggle();
	  });
	});
</script>

</head>
<body>
<div class="page-wrapper">
    <div class="container-fluid">
        <div class="col-lg-8"><!--게시판 넓이 -->
            <div class="col-lg-12">
                <h1 class="page-header">결재요청함</h1>
            </div>
            <div class="row">
                  <div class="col-lg-12">
                      <button type="button" class="btn btn-outline btn-primary pull-right">
                          <i class="fa fa-edit fa-fw"></i> 결재요청
                      </button>
                  </div>
              </div>
            <div class="panel panel-default" style='padding: 20px'>
            	<form action="">
            	 <table id="search">
            	 	<tr>
            	 		<td>
		            		<span>기안일 : </span>  <input type="date"> ~ <input type="date">
            	 		</td>
            	 		<td rowspan="2">
            	 			<button> 검색</button>
            	 		</td>
            	 	</tr>
            	 	<tr>
            	 		<td>
            	 			<span>문서형태 : </span> 
            	 			<select>
            	 				<option value="none" hidden>=== 선택 ===</option>
            	 				<option value="all">전체</option>
            	 				<option value="none">휴가신청서</option>
            	 				<option value="none">업무보고서</option>
            	 				<option value="none">지출결의서</option>
            	 				<option value="none">회의록</option>
            	 			</select>
            	 		<td>
            	 	</tr>
            	 </table>
            		
            	</form>
            </div>
            
            <div class="panel panel-default">
                <div class="panel-heading">결재요청함</div>
                <div class="panel-body">
                    <table class="table table-hover">
                        <thead>
                            <tr align="center">
                                <th width="20">No</th>
                                <th width="200">문서종류</th>
                                <th width="200">기안일</th>
                                <th width="200">완료일</th>
                                <th width="100">
                                	문서상태
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                        	<tr align="left">
                                <td>1</td>
                                <td>휴가신청서</td>
                                <td>2021.10.26 13:14</td>
                                <td></td>
                                <td>
									<button class="question" id="que-1"><span>진행중</span><span id="que-1-toggle">+</span></button>
								</td>
                            </tr>
                            <tr>
                            	<td colspan="5">
									<div class="answer"  id="ans-1">
										<table align="center" border="1">
	                            			<thead  align="center">
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
                            <tr align="left">
                                <td>1</td>
                                <td>휴가신청서</td>
                                <td>2021.10.26 13:14</td>
                                <td></td>
                                <td>
									<button class="question" id="que-2"><span>진행중</span><span id="que-2-toggle">+</span></button>
								</td>
                            </tr>
                            <tr>
                            	<td colspan="5">
									<div class="answer"  id="ans-2">
										<table align="center" border="2">
	                            			<thead  align="center">
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
                        </tbody>
                    </table>
                </div>
            </div>
            
        </div>
    </div>
</div>

<!-- 버튼 클릭시 toggle 보이게 숨기게 하는 기능 -->
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