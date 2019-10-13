<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스타일링</title>
<link rel="stylesheet" type="text/css" href="/sesoc/resources/css/css.css" />
<script src="/sesoc/resources/js/jquery-3.4.1.js"></script>
<script>
	$(function() {
		$("#searchbtn").on("click", showList);
	});
	
	function showList() {
		var height = $("#height").val();
		var shoulder = $("#shoulder").val();
		var weist = $("#weist").val();
		
		if(height <= 167 && shoulder <= 46 && weist <= 77) {
			$("#bodycheck").empty();
			$("#bodycheck").append("<tr><td>" + "<input type='radio' name='thin_fashion' value='minimal'>" + "미니멀" + 
									"<img src='/sesoc/resources/img/fashion/minimal/01.jpg' width='300' height='300' >" + "</td>" +
									"<td>" + "<img src='/sesoc/resources/img/fashion/minimal/02.jpg' width='300' height='300' >" + "</td></tr>" +
									"<tr><td>" + "<input type='radio' name='thin_fashion' value='street'>" + "스트릿" + 
									"<img src='/sesoc/resources/img/fashion/street/01.jpg' width='300' height='300' >" + "</td>" +
									"<td>" + "<img src='/sesoc/resources/img/fashion/street/02.jpg' width='300' height='300' >" + "</td></tr>" +
									"<tr><td>" + "<input type='button' value='선택' onclick='thin_styling()'>" + "</td></tr>");
		}
		if(height <= 167 && shoulder > 46 && weist > 77) {
			$("#bodycheck").empty();
			$("#bodycheck").append("<tr><td>" + "<input type='radio' name='chubby_fashion' value='amecaji'>" + "아메카지" + 
									"<img src='/sesoc/resources/img/fashion/amecaji/01.jpg' width='300' height='300' >" + "</td>" +
									"<td>" + "<img src='/sesoc/resources/img/fashion/amecaji/02.jpg' width='300' height='300' >" + "</td></tr>" +
									"<tr><td>" + "<input type='radio' name='chubby_fashion' value='workwear'>" + "워크웨어" + 
									"<img src='/sesoc/resources/img/fashion/workwear/01.jpg' width='300' height='300' >" + "</td>" +
									"<td>" + "<img src='/sesoc/resources/img/fashion/workwear/02.jpg' width='300' height='300' >" + "</td></tr>" +
									"<tr><td>" + "<input type='button' value='선택' onclick='chubby_styling()'>" + "</td></tr>");
		}
		if(height <= 167 && shoulder > 46 && weist <= 77) {
			$("#bodycheck").empty();
			$("#bodycheck").append("<tr><td>" + "<input type='radio' name='fit_fashion' value='classic'>" + "클래식" + 
									"<img src='/sesoc/resources/img/fashion/classic/01.jpg' width='300' height='300' >" + "</td>" +
									"<td>" + "<img src='/sesoc/resources/img/fashion/classic/02.jpg' width='300' height='300' >" + "</td></tr>" +
									"<tr><td>" + "<input type='radio' name='fit_fashion' value='classiccasual'>" + "클래식캐주얼" + 
									"<img src='/sesoc/resources/img/fashion/classiccasual/01.jpg' width='300' height='300' >" + "</td>" +
									"<td>" + "<img src='/sesoc/resources/img/fashion/classiccasual/02.jpg' width='300' height='300' >" + "</td></tr>" +
									"<tr><td>" + "<input type='button' value='선택' onclick='fit_styling()'>" + "</td></tr>");
		}
		if(height <= 167 && shoulder <= 46 && weist > 77) {
			$("#bodycheck").empty();
			$("#bodycheck").append("<tr><td>" + "<input type='radio' name='chubby_fashion' value='amecaji'>" + "아메카지" + 
									"<img src='/sesoc/resources/img/fashion/amecaji/01.jpg' width='300' height='300' >" + "</td>" +
									"<td>" + "<img src='/sesoc/resources/img/fashion/amecaji/02.jpg' width='300' height='300' >" + "</td></tr>" +
									"<tr><td>" + "<input type='radio' name='chubby_fashion' value='workwear'>" + "워크웨어" + 
									"<img src='/sesoc/resources/img/fashion/workwear/01.jpg' width='300' height='300' >" + "</td>" +
									"<td>" + "<img src='/sesoc/resources/img/fashion/workwear/02.jpg' width='300' height='300' >" + "</td></tr>" + 
									"<tr><td>" + "<input type='button' value='선택' onclick='chubby_styling()'>" + "</td></tr>");
		}
		
		if(height > 167 && height <= 179 && shoulder <= 48 && weist <= 80) {
			$("#bodycheck").empty();
			$("#bodycheck").append("<tr><td>" + "<input type='radio' name='thin_fashion' value='minimal'>" + "미니멀" + 
									"<img src='/sesoc/resources/img/fashion/minimal/01.jpg' width='300' height='300' >" + "</td>" +
									"<td>" + "<img src='/sesoc/resources/img/fashion/minimal/02.jpg' width='300' height='300' >" + "</td></tr>" +
									"<tr><td>" + "<input type='radio' name='thin_fashion' value='street'>" + "스트릿" + 
									"<img src='/sesoc/resources/img/fashion/street/01.jpg' width='300' height='300' >" + "</td>" +
									"<td>" + "<img src='/sesoc/resources/img/fashion/street/02.jpg' width='300' height='300' >" + "</td></tr>" + 
									"<tr><td>" + "<input type='button' value='선택' onclick='thin_styling()'>" + "</td></tr>");
		}
		if(height > 167 && height <= 179 && shoulder > 48 && weist > 80) {
			$("#bodycheck").empty();
			$("#bodycheck").append("<tr><td>" + "<input type='radio' name='chubby_fashion' value='amecaji'>" + "아메카지" + 
									"<img src='/sesoc/resources/img/fashion/amecaji/01.jpg' width='300' height='300' >" + "</td>" +
									"<td>" + "<img src='/sesoc/resources/img/fashion/amecaji/02.jpg' width='300' height='300' >" + "</td></tr>" +
									"<tr><td>" + "<input type='radio' name='chubby_fashion' value='workwear'>" + "워크웨어" + 
									"<img src='/sesoc/resources/img/fashion/workwear/01.jpg' width='300' height='300' >" + "</td>" +
									"<td>" + "<img src='/sesoc/resources/img/fashion/workwear/02.jpg' width='300' height='300' >" + "</td></tr>" + 
									"<tr><td>" + "<input type='button' value='선택' onclick='chubby_styling()'>" + "</td></tr>");
		}
		if(height > 167 && height <= 179 && shoulder > 48 && weist <= 80) {
			$("#bodycheck").empty();
			$("#bodycheck").append("<tr><td>" + "<input type='radio' name='fit_fashion' value='classic'>" + "클래식" + 
									"<img src='/sesoc/resources/img/fashion/classic/01.jpg' width='300' height='300' >" + "</td>" +
									"<td>" + "<img src='/sesoc/resources/img/fashion/classic/02.jpg' width='300' height='300' >" + "</td></tr>" +
									"<tr><td>" + "<input type='radio' name='fit_fashion' value='classiccasual'>" + "클래식캐주얼" + 
									"<img src='/sesoc/resources/img/fashion/classiccasual/01.jpg' width='300' height='300' >" + "</td>" +
									"<td>" + "<img src='/sesoc/resources/img/fashion/classiccasual/02.jpg' width='300' height='300' >" + "</td></tr>" + 
									"<tr><td>" + "<input type='button' value='선택' onclick='fit_styling()'>" + "</td></tr>");
		}
		if(height > 167 && height <= 179 && shoulder <= 48 && weist > 80) {
			$("#bodycheck").empty();
			$("#bodycheck").append("<tr><td>" + "<input type='radio' name='chubby_fashion' value='amecaji'>" + "아메카지" + 
									"<img src='/sesoc/resources/img/fashion/amecaji/01.jpg' width='300' height='300' >" + "</td>" +
									"<td>" + "<img src='/sesoc/resources/img/fashion/amecaji/02.jpg' width='300' height='300' >" + "</td></tr>" +
									"<tr><td>" + "<input type='radio' name='chubby_fashion' value='workwear'>" + "워크웨어" + 
									"<img src='/sesoc/resources/img/fashion/workwear/01.jpg' width='300' height='300' >" + "</td>" +
									"<td>" + "<img src='/sesoc/resources/img/fashion/workwear/02.jpg' width='300' height='300' >" + "</td></tr>" + 
									"<tr><td>" + "<input type='button' value='선택' onclick='chubby_styling()'>" + "</td></tr>");
		}
		
		if(height > 179 && height <= 191 && shoulder <= 50 && weist <= 83) {
			$("#bodycheck").empty();
			$("#bodycheck").append("<tr><td>" + "<input type='radio' name='thin_fashion' value='minimal'>" + "미니멀" + 
									"<img src='/sesoc/resources/img/fashion/minimal/01.jpg' width='300' height='300' >" + "</td>" +
									"<td>" + "<img src='/sesoc/resources/img/fashion/minimal/02.jpg' width='300' height='300' >" + "</td></tr>" +
									"<tr><td>" + "<input type='radio' name='thin_fashion' value='street'>" + "스트릿" + 
									"<img src='/sesoc/resources/img/fashion/street/01.jpg' width='300' height='300' >" + "</td>" +
									"<td>" + "<img src='/sesoc/resources/img/fashion/street/02.jpg' width='300' height='300' >" + "</td></tr>" + 
									"<tr><td>" + "<input type='button' value='선택' onclick='thin_styling()'>" + "</td></tr>");
		}
		if(height > 179 && height <= 191 && shoulder > 50 && weist > 83) {
			$("#bodycheck").empty();
			$("#bodycheck").append("<tr><td>" + "<input type='radio' name='chubby_fashion' value='amecaji'>" + "아메카지" + 
									"<img src='/sesoc/resources/img/fashion/amecaji/01.jpg' width='300' height='300' >" + "</td>" +
									"<td>" + "<img src='/sesoc/resources/img/fashion/amecaji/02.jpg' width='300' height='300' >" + "</td></tr>" +
									"<tr><td>" + "<input type='radio' name='chubby_fashion' value='workwear'>" + "워크웨어" + 
									"<img src='/sesoc/resources/img/fashion/workwear/01.jpg' width='300' height='300' >" + "</td>" +
									"<td>" + "<img src='/sesoc/resources/img/fashion/workwear/02.jpg' width='300' height='300' >" + "</td></tr>" + 
									"<tr><td>" + "<input type='button' value='선택' onclick='chubby_styling()'>" + "</td></tr>");
		}
		if(height > 179 && height <= 191 && shoulder > 50 && weist <= 83) {
			$("#bodycheck").empty();
			$("#bodycheck").append("<tr><td>" + "<input type='radio' name='fit_fashion' value='classic'>" + "클래식" + 
									"<img src='/sesoc/resources/img/fashion/classic/01.jpg' width='300' height='300' >" + "</td>" +
									"<td>" + "<img src='/sesoc/resources/img/fashion/classic/02.jpg' width='300' height='300' >" + "</td></tr>" +
									"<tr><td>" + "<input type='radio' name='fit_fashion' value='classiccasual'>" + "클래식캐주얼" + 
									"<img src='/sesoc/resources/img/fashion/classiccasual/01.jpg' width='300' height='300' >" + "</td>" +
									"<td>" + "<img src='/sesoc/resources/img/fashion/classiccasual/02.jpg' width='300' height='300' >" + "</td></tr>" + 
									"<tr><td>" + "<input type='button' value='선택' onclick='fit_styling()'>" + "</td></tr>");
		}
		if(height > 179 && height <= 191 && shoulder <= 50 && weist > 83) {
			$("#bodycheck").empty();
			$("#bodycheck").append("<tr><td>" + "<input type='radio' name='chubby_fashion' value='amecaji'>" + "아메카지" + 
									"<img src='/sesoc/resources/img/fashion/amecaji/01.jpg' width='300' height='300' >" + "</td>" +
									"<td>" + "<img src='/sesoc/resources/img/fashion/amecaji/02.jpg' width='300' height='300' >" + "</td></tr>" +
									"<tr><td>" + "<input type='radio' name='chubby_fashion' value='workwear'>" + "워크웨어" + 
									"<img src='/sesoc/resources/img/fashion/workwear/01.jpg' width='300' height='300' >" + "</td>" +
									"<td>" + "<img src='/sesoc/resources/img/fashion/workwear/02.jpg' width='300' height='300' >" + "</td></tr>" + 
									"<tr><td>" + "<input type='button' value='선택' onclick='chubby_styling()'>" + "</td></tr>");
		}
		
		if(height > 191 && shoulder <= 52 && weist <= 85) {
			$("#bodycheck").empty();
			$("#bodycheck").append("<tr><td>" + "<input type='radio' name='thin_fashion' value='minimal'>" + "미니멀" + 
									"<img src='/sesoc/resources/img/fashion/minimal/01.jpg' width='300' height='300' >" + "</td>" +
									"<td>" + "<img src='/sesoc/resources/img/fashion/minimal/02.jpg' width='300' height='300' >" + "</td></tr>" +
									"<tr><td>" + "<input type='radio' name='thin_fashion' value='street'>" + "스트릿" + 
									"<img src='/sesoc/resources/img/fashion/street/01.jpg' width='300' height='300' >" + "</td>" +
									"<td>" + "<img src='/sesoc/resources/img/fashion/street/02.jpg' width='300' height='300' >" + "</td></tr>" + 
									"<tr><td>" + "<input type='button' value='선택' onclick='thin_styling()'>" + "</td></tr>");
		}
		if(height > 191 && shoulder > 52 && weist > 85) {
			$("#bodycheck").empty();
			$("#bodycheck").append("<tr><td>" + "<input type='radio' name='chubby_fashion' value='amecaji'>" + "아메카지" + 
									"<img src='/sesoc/resources/img/fashion/amecaji/01.jpg' width='300' height='300' >" + "</td>" +
									"<td>" + "<img src='/sesoc/resources/img/fashion/amecaji/02.jpg' width='300' height='300' >" + "</td></tr>" +
									"<tr><td>" + "<input type='radio' name='chubby_fashion' value='workwear'>" + "워크웨어" + 
									"<img src='/sesoc/resources/img/fashion/workwear/01.jpg' width='300' height='300' >" + "</td>" +
									"<td>" + "<img src='/sesoc/resources/img/fashion/workwear/02.jpg' width='300' height='300' >" + "</td></tr>" + 
									"<tr><td>" + "<input type='button' value='선택' onclick='chubby_styling()'>" + "</td></tr>");
		}
		if(height > 191 && shoulder > 52 && weist <= 85) {
			$("#bodycheck").empty();
			$("#bodycheck").append("<tr><td>" + "<input type='radio' name='fit_fashion' value='classic'>" + "클래식" + 
									"<img src='/sesoc/resources/img/fashion/classic/01.jpg' width='300' height='300' >" + "</td>" +
									"<td>" + "<img src='/sesoc/resources/img/fashion/classic/02.jpg' width='300' height='300' >" + "</td></tr>" +
									"<tr><td>" + "<input type='radio' name='fit_fashion' value='classiccasual'>" + "클래식캐주얼" + 
									"<img src='/sesoc/resources/img/fashion/classiccasual/01.jpg' width='300' height='300' >" + "</td>" +
									"<td>" + "<img src='/sesoc/resources/img/fashion/classiccasual/02.jpg' width='300' height='300' >" + "</td></tr>" + 
									"<tr><td>" + "<input type='button' value='선택' onclick='fit_styling()'>" + "</td></tr>");
		}
		if(height > 191 && shoulder <= 52 && weist > 85) {
			$("#bodycheck").empty();
			$("#bodycheck").append("<tr><td>" + "<input type='radio' name='chubby_fashion' value='amecaji'>" + "아메카지" + 
									"<img src='/sesoc/resources/img/fashion/amecaji/01.jpg' width='300' height='300' >" + "</td>" +
									"<td>" + "<img src='/sesoc/resources/img/fashion/amecaji/02.jpg' width='300' height='300' >" + "</td></tr>" +
									"<tr><td>" + "<input type='radio' name='chubby_fashion' value='workwear'>" + "워크웨어" + 
									"<img src='/sesoc/resources/img/fashion/workwear/01.jpg' width='300' height='300' >" + "</td>" +
									"<td>" + "<img src='/sesoc/resources/img/fashion/workwear/02.jpg' width='300' height='300' >" + "</td></tr>" + 
									"<tr><td>" + "<input type='button' value='선택' onclick='chubby_styling()'>" + "</td></tr>");
		}
	}
	
	function thin_styling() {
		var thfa = $("[name=thin_fashion]:checked").val();
		
		if(thfa === "minimal") {
			var form = document.go;
			form.action = "/sesoc/minimalbrand";
			form.method = "post";
			form.submit();
		}
	}
	
	function chubby_styling() {
		
	}
	
	function fit_styling() {
		
	}
	
</script>
</head>
<body>
	<div>
		<h1>[ 체형 분석 ]</h1>
		<form id="search">
		<table>
			<tr>
				<td>
					키: <input type="text" id="height">
				</td>
			</tr>
			<tr>
				<td>
					어깨너비: <input type="text" id="shoulder">
				</td>
			</tr>
			<tr>
				<td>
					허리둘레: <input type="text" id="weist">
				</td>
			</tr>
			<tr>
				<td>
					<input type="button" id="searchbtn" value="체형 분석">
				</td>
			</tr>
		</table>
		</form>
		
		<form name="go">
		<table id="bodycheck">
		
		</table>
		</form>
	</div>
</body>
</html>