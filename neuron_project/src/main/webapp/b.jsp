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
 	<span style="font-family: &quot;맑은 고딕&quot;; font-size: 10pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> 
		<table style=" border: 2px solid rgb(0, 0, 0); font-family: malgun gothic, dotum, arial, tahoma; margin-top: 10px; border-collapse: collapse;">
			<colgroup> 
		       <col width="130"> 
		       <col width="260"> 
		       <col width="260"> 
		       <col width="150"> 
		      </colgroup>
		      
			<tbody>
				<tr>
					<td style="background: rgb(221, 221, 221);  padding: 5px; border:1px solid black; height:18px; text-align: center; color: black; font-size: 12px; font-weight: bold; vertical-align: top;">
						
		지급 요청일
					</td>
					<td style="background: rgb(255, 248, 123); padding: 5px; border: 1px solid black; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle;" colspan="3">
						
		당사 정기 결제일
					</td>
				</tr>
				<tr>
					<td style="background: rgb(221, 221, 221);  padding: 5px; border-top:2px solid black; border-right: 1px solid black; border-bottom: 1px solid black; height:24px; text-align: center; color: black; font-size: 12px; font-weight: bold; vertical-align: top;" class="dext_table_border_l">
						
		거&nbsp;&nbsp;래&nbsp;&nbsp;처
					</td>
					<td style="background: rgb(221, 221, 221);  padding: 5px; border-top:2px solid black; border-right: 1px solid black; border-bottom: 1px solid black; height:24px; text-align: center; color: black; font-size: 12px; font-weight: bold; vertical-align: top;" colspan="2" class="dext_table_border_l">
						
		사용내역 및 용도
					</td>
					<td style="background: rgb(221, 221, 221);  padding: 5px; border-top:2px solid black; border-bottom: 1px solid black; height:24px; text-align: center; color: black; font-size: 12px; font-weight: bold; vertical-align: top;" class="dext_table_border_r dext_table_border_l">
						
		금&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;액
					</td>
				</tr>
				<tr>
					<td style="background: rgb(255, 255, 255); height: 27px; padding: 5px; border-right: 1px solid black; border-bottom: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle;" class="dext_table_border_t dext_table_border_l">
					</td>
					<td style="background: rgb(255, 255, 255); padding: 5px; border-right: 1px solid black; border-bottom: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle;" colspan="2" class="dext_table_border_t dext_table_border_l">
					</td>
					<td style="text-align: left; padding: 5px; border-bottom: 1px solid black; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle; background: rgb(255, 255, 255);" class="dext_table_border_t dext_table_border_r dext_table_border_l">
					</td>
				</tr>
				<tr>
					<td style="background: rgb(255, 255, 255); height: 27px; padding: 5px; border-right: 1px solid black; border-bottom: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle;" class="dext_table_border_t dext_table_border_l">
					</td>
					<td style="background: rgb(255, 255, 255); padding: 5px; border-right: 1px solid black; border-bottom: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle;" colspan="2" class="dext_table_border_t dext_table_border_l">
					</td>
					<td style="text-align: left; padding: 5px; border-bottom: 1px solid black; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle; background: rgb(255, 255, 255);" class="dext_table_border_t dext_table_border_r dext_table_border_l">
					</td>
				</tr>
				<tr>
					<td style="background: rgb(255, 255, 255); height: 27px; padding: 5px; border-right: 1px solid black; border-bottom: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle;" class="dext_table_border_t dext_table_border_l">
					</td>
					<td style="background: rgb(255, 255, 255); padding: 5px; border-right: 1px solid black; border-bottom: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle;" colspan="2" class="dext_table_border_t dext_table_border_l">
					</td>
					<td style="text-align: left; padding: 5px; border-bottom: 1px solid black; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle; background: rgb(255, 255, 255);" class="dext_table_border_t dext_table_border_r dext_table_border_l">
					</td>
				</tr>
				<tr>
					<td style="background: rgb(255, 255, 255); height: 27px; padding: 5px; border-right: 1px solid black; border-bottom: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle;" class="dext_table_border_t dext_table_border_l">
					</td>
					<td style="background: rgb(255, 255, 255); padding: 5px; border-right: 1px solid black; border-bottom: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle;" colspan="2" class="dext_table_border_t dext_table_border_l">
					</td>
					<td style="text-align: left; padding: 5px; border-bottom: 1px solid black; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle; background: rgb(255, 255, 255);" class="dext_table_border_t dext_table_border_r dext_table_border_l">
					</td>
				</tr>
				<tr>
					<td style="background: rgb(255, 255, 255); height: 27px; padding: 5px; border-right: 1px solid black; border-bottom: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle;" class="dext_table_border_t dext_table_border_l">
					</td>
					<td style="background: rgb(255, 255, 255); padding: 5px; border-right: 1px solid black; border-bottom: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle;" colspan="2" class="dext_table_border_t dext_table_border_l">
					</td>
					<td style="text-align: left; padding: 5px; border-bottom: 1px solid black; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle; background: rgb(255, 255, 255);" class="dext_table_border_t dext_table_border_r dext_table_border_l">
					</td>
				</tr>
				<tr>
					<td style="background: rgb(255, 255, 255); height: 27px; padding: 5px; border-right: 1px solid black; border-bottom: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle;" class="dext_table_border_t dext_table_border_l">
					</td>
					<td style="background: rgb(255, 255, 255); padding: 5px; border-right: 1px solid black; border-bottom: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle;" colspan="2" class="dext_table_border_t dext_table_border_l">
					</td>
					<td style="text-align: left; padding: 5px; border-bottom: 1px solid black; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle; background: rgb(255, 255, 255);" class="dext_table_border_t dext_table_border_r dext_table_border_l">
					</td>
				</tr>
				<tr>
					<td style="background: rgb(255, 255, 255); height: 27px; padding: 5px; border-right: 1px solid black; border-bottom: 1.5px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle;" class="dext_table_border_t dext_table_border_l">
					</td>
					<td style="background: rgb(255, 255, 255); padding: 5px; border-right: 1px solid black; border-bottom: 1.5px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle;" colspan="2" class="dext_table_border_t dext_table_border_l">
					</td>
					<td style="text-align: left; padding: 5px; border-bottom: 1.5px solid black; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle; background: rgb(255, 255, 255);" class="dext_table_border_t dext_table_border_r dext_table_border_l">
					</td>
				</tr>
				<tr>
					<td style="background: rgb(255, 255, 255); padding: 5px; border-right: 1px solid black; border-bottom: 1.5px solid black; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle;" colspan="3" class="dext_table_border_t dext_table_border_l">
						
		합&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;계
					</td>
					<td style="text-align: left; padding: 5px; border-bottom: 1px solid black; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle; background: rgb(242, 220, 219);" class="dext_table_border_t dext_table_border_r dext_table_border_l">
					</td>
				</tr>
				<tr>
					<td style="background: rgb(255, 255, 255); padding: 5px; border-right: 1px solid black; border-bottom: 1.5px solid black; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle;" colspan="3" class="dext_table_border_t dext_table_border_l">
						
		부가가치세
					</td>
					<td style="text-align: left; padding: 5px; border-bottom: 1px solid black; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle; background: rgb(242, 220, 219);" class="dext_table_border_t dext_table_border_r dext_table_border_l">
					</td>
				</tr>
				<tr>
					<td style="background: rgb(255, 255, 255); padding: 5px; border-right: 1px solid black; border-bottom: 2px solid black; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle;" colspan="3" class="dext_table_border_t dext_table_border_l">
						
		총 지출 합계
					</td>
					<td style="text-align: left; padding: 5px; border-bottom: 2px solid black; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle; background: rgb(242, 220, 219);" class="dext_table_border_t dext_table_border_r dext_table_border_l">
					</td>
				</tr>
			</tbody>
		</table>
	</span>
</body>
</html>