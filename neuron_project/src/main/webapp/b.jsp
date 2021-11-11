<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#divCustomWrapper { word-break: break-all; font-family: malgun gothic, dotum, arial, tahoma; width:802px !important; }
#divCustomWrapper * { max-width: 800px !important; }
#divCustomWrapper .titleSection { text-align: center; font-size: 20pt; font-weight: bold; margin-bottom: 30px !important; margin-top: 20px !important; }
#divCustomWrapper .detailSection > * { margin-bottom: 10px; }
#divCustomWrapper .detailSection { width:800px !important; clear:both; margin-top: 10px !important; vertical-align: middle; }
#divCustomWrapper table { border-collapse: collapse; word-break:break-all; }
#divCustomWrapper div.partition { display: flex; }
#divCustomWrapper div.partition.left { flex:1; }
#divCustomWrapper div.inaRowRight { flex:1; text-align: right;}
#divCustomWrapper td.BCel { font-size: 9pt !important; height:28px; border: 1px solid black !important; padding: 3px 5px 3px 5px; /*top right bottom left*/}
#divCustomWrapper td.ACel { font-size: 9pt !important; height:28px; border: 1px solid black !important; padding: 3px 5px 3px 5px; text-align: center !important; background: #eee; font-weight: bold;}
#divCustomWrapper td.noneborder { border: none !important; }
#divCustomWrapper td.center { text-align: center; }
#divCustomWrapper td.right { text-align: right; }
#divCustomWrapper td.editor { height: 300px; vertical-align: top;}
#divCustomWrapper td.area { height: 120px; vertical-align: middle;}
#divCustomWrapper .div_button { word-break:break-all; padding: 3px; margin-top:2px; margin-bottom:2px !important; height: 22px; vertical-align: middle; }
#divCustomWrapper a.button { background: rgb(102, 102, 102); color: rgb(255, 255, 255); padding: 2px 5px; border-radius: 3px; }
p.freeP{font-weight: normal; font-size: 9pt; margin: 3px 1px 3px 5px;}
</style>
<style type="text/css">
@media print {
	.viewModeHiddenPart {display: none;}
	h1,h2,h3,h4,h5,dl,dt,dd,ul,li,ol,th,td,p,blockquote,form,fieldset,legend,div,body {-webkit-print-color-adjust:exact;}
	#divCustomWrapper {margin-left:auto !important; margin-right:auto !important;}
	/*#divCustomWrapper td.ACel {border:none\9 !important; outline:black solid 0.5px\9 !important;}
	#divCustomWrapper td.BCel {border:none\9 !important; outline:black solid 0.5px\9 !important;}*/
}
</style>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="/js/document.js"></script>
</head>
<body>
	<!-- Page Wrapping (start) : Style retention -->
<div id="divCustomWrapper">
	<!-- 1. Title Section (start) -->
	<div class="titleSection">양식명</div>
	<!-- 1. Title Section (end) -->
	<!-- 2. Draft Section (Start) -->
	<div class="partition">
		<!-- 2.1 Drafter Information (Start) -->
		<div class="left">
			<table style="width:335px; height:131px;">
				<colgroup><col width="65"><col width="270"></colgroup>
				<tbody>
					<tr><td class="ACel">문서번호</td><td class="BCel"><span data-dsl="{{label:docNo}}"></span></td></tr>
					<tr><td class="ACel">작 성 일</td><td class="BCel"><span data-dsl="{{label:draftDate}}"></span></td></tr>
					<tr><td class="ACel">작성부서</td><td class="BCel"><span data-dsl="{{label:draftDept}}"></span></td></tr>
					<tr><td class="ACel">작 성 자</td><td class="BCel"><span data-dsl="{{label:draftUser}}"></span></td></tr>
				</tbody>
			</table>
		</div>
		<!-- 2.1 Drafter Information (end) -->
		<!-- 2.2 Draft Line (start) -->
		<div class="inaRowRight">
			<!-- 결재선 Start--><span unselectable="on" contenteditable="false" class="comp_wrap"><span class="sign_type1_inline" data-group-seq="0" data-group-name="결재" data-group-max-count="4" data-group-type="type1" data-is-reception=""><span class="sign_tit_wrap"><span class="sign_tit"><strong>결재</strong></span></span><!-- 결재방 1EA Start --><span class="sign_member_wrap"><span class="sign_member" ><span class="sign_rank_wrap" ><span class="sign_rank" ></span></span><span class="sign_wrap"></span><span class="sign_date_wrap"><span class="sign_date"></span></span></span></span><!-- 결재방 1EA End--><!-- 결재방 1EA Start --><span class="sign_member_wrap"><span class="sign_member" ><span class="sign_rank_wrap" ><span class="sign_rank" ></span></span><span class="sign_wrap"></span><span class="sign_date_wrap"><span class="sign_date"></span></span></span></span><!-- 결재방 1EA End--><!-- 결재방 1EA Start --><span class="sign_member_wrap"><span class="sign_member" ><span class="sign_rank_wrap" ><span class="sign_rank" ></span></span><span class="sign_wrap"></span><span class="sign_date_wrap"><span class="sign_date"></span></span></span></span><!-- 결재방 1EA End--><!-- 결재방 1EA Start --><span class="sign_member_wrap"><span class="sign_member" ><span class="sign_rank_wrap" ><span class="sign_rank" ></span></span><span class="sign_wrap"></span><span class="sign_date_wrap"><span class="sign_date"></span></span></span></span><!-- 결재방 1EA End--></span></span><!-- 결재선 End-->
			<!-- 합의 Start --><span class="sign_type1_inline" data-group-seq="10" data-group-name="합의" data-group-max-count="1" data-group-type="type1" data-is-agreement="true" id="agreementWrap"><span class="sign_tit_wrap"><span class="sign_tit"><strong>합의</strong></span></span><span class="sign_member_wrap"><span class="sign_member"><span class="sign_rank_wrap"><span class="sign_rank"></span></span><span class="sign_wrap"></span><span class="sign_date_wrap"><span class="sign_date"></span></span></span></span></span><!-- 합의 End -->
		</div>
		<!-- 2.2 Draft Line (end) -->
	</div>
	<!-- 2. Draft Section (end) -->
	<!-- 3. Detail Section (start) -->
	<table class="detailSection">
		<colgroup>
			<col width="100">
			<col width="700">
		</colgroup>
		<tbody>
			<tr>
				<td colspan="1" class="ACel">제목</td>
				<td colspan="1" class="BCel">
					<span data-dsl="{{text:subject}}"></span>
				</td>
			</tr>
		</tbody>
	</table>
	<table class="detailSection">
		<colgroup>
			<col width="40">
			<col width="220">
			<col width="220">
			<col width="220">
		</colgroup>
		<tbody id="dynamic_table1"><!-- 기능 삽입 부분 -->
			<tr><!-- 행 추가 삭제 버튼 -->
				<td colspan="2" class="noneborder BCel">테이블명</td>
				<td colspan="2" class="BCel viewModeHiddenPart noneborder right">
					<a class="button" id="plus1">추가</a> <a class="button" id="minus1">삭제</a>
				</td>
			</tr>
			<tr>
				<td class="ACel">NO</td>
				<td class="ACel">구분1</td>
				<td class="ACel">구분2</td>
				<td class="ACel">구분3</td>
			</tr>
			<tr class="copyRow1">
				<td class="BCel center copyRowNo1">1</td>
				<td class="BCel center">
					<span data-dsl="{{text}}"></span>
				</td>
				<td class="BCel center">
					<span data-dsl="{{text}}"></span>
				</td>
				<td class="BCel center">
					<span data-dsl="{{text}}"></span>
				</td>
			</tr>
		</tbody>
	</table>
	<!-- 3. Detail Section (end) -->
</div>
<!-- Page Wrapping (end) -->
<!----------------------------------------Style Start---------------------------------------->
</body>
</html>