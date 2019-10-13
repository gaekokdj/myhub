<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>미니멀스타일링</title>
<link rel="stylesheet" type="text/css" href="/sesoc/resources/css/css.css" />
<script src="/sesoc/resources/js/jquery-3.4.1.js"></script>
<script>
	function garmentlablepants() {
		$("#brandpants").empty();
		$("#brandpants").append("<label><input type='radio' name='garmentspants_radio' value='garmentspants01'>" +
							"<img src='/sesoc/resources/img/brand/garmentlable/pants/01.jpg' width='250' height='350' >" + "</label>" + 
							"<label><input type='radio' name='garmentspants_radio' value='garmentspants02'>" +
							"<img src='/sesoc/resources/img/brand/garmentlable/pants/02.jpg' width='250' height='350' >" + "</label>" +
							"<label><input type='radio' name='garmentspants_radio' value='garmentspants03'>" +
							"<img src='/sesoc/resources/img/brand/garmentlable/pants/03.jpg' width='250' height='350' >" + "</label>" +
							"<label><input type='radio' name='garmentspants_radio' value='garmentspants04'>" +
							"<img src='/sesoc/resources/img/brand/garmentlable/pants/04.jpg' width='250' height='350' >" + "</label>" + 
							"<label><input type='radio' name='garmentspants_radio' value='garmentspants05'>" +
							"<img src='/sesoc/resources/img/brand/garmentlable/pants/05.jpg' width='250' height='350' >" + "</label>" + "<br>" +
							"<input type='button' value='뒤로' onclick='backgenre()'>" + "</td>" + "&nbsp" +
							"<td>" + "<input type='button' value='선택' onclick='minimalinner()'>" + "</td></tr>");
	}
	
	function backgenre() {
		location.href = "/sesoc/";
	}
	
	function minimalinner() {
		$("#clothes").empty();
		$("#clothes").append("<h2>상의</h2>" + "<form name='to'>" + "<table>" + "<tr><td>" + "<h3>브랜드</h3>" +
					"<a href='javascript:garmentlableinner()'>" + "가먼트레이블" + "</a><br>" + 
					"꼼데가르송<br>" + "던스트<br>" + "</td>" +
					"<td id='brandinner'>" + "</table>" + "</form>");
	}
	
	function garmentlableinner() {
		$("#brandinner").empty();
		$("#brandinner").append("<label><input type='radio' name='garmentsinner_radio' value='garmentsinner01'>" +
							"<img src='/sesoc/resources/img/brand/garmentlable/inner/01.jpg' width='250' height='350' >" + "</label>" +
							"<label><input type='radio' name='garmentsinner_radio' value='garmentsinner02'>" +
							"<img src='/sesoc/resources/img/brand/garmentlable/inner/02.jpg' width='250' height='350' >" + "</label>" +
							"<label><input type='radio' name='garmentsinner_radio' value='garmentsinner03'>" +
							"<img src='/sesoc/resources/img/brand/garmentlable/inner/03.jpg' width='250' height='350' >" + "</label>" +
							"<label><input type='radio' name='garmentsinner_radio' value='garmentsinner04'>" +
							"<img src='/sesoc/resources/img/brand/garmentlable/inner/04.jpg' width='250' height='350' >" + "</label>" +
							"<label><input type='radio' name='garmentsinner_radio' value='garmentsinner05'>" +
							"<img src='/sesoc/resources/img/brand/garmentlable/inner/05.jpg' width='250' height='350' >" + "</label>" + "<br>" + 
							"<input type='button' value='리셋' onclick='backgenre()'>" + "</td>" + "&nbsp" +
							"<td>" + "<input type='button' value='선택' onclick='minimalouter()'>" + "</td></tr>");
	}
	
	function minimalouter() {
		$("#clothes").empty();
		$("#clothes").append("<h2>겉옷</h2>" + "<form name='the'>" + "<table>" + "<tr><td>" + "<h3>브랜드</h3>" +
					"<a href='javascript:garmentlableouter()'>" + "가먼트레이블" + "</a><br>" + 
					"꼼데가르송<br>" + "던스트<br>" + "</td>" +
					"<td id='brandouter'>" + "</table>" + "</form>");
	}
	
	function garmentlableouter() {
		$("#brandouter").empty();
		$("#brandouter").append("<label><input type='radio' name='garmentsouter_radio' value='garmentsouter01'>" +
							"<img src='/sesoc/resources/img/brand/garmentlable/outer/01.jpg' width='250' height='350' >" + "</label>" + "<br>" + 
							"<input type='button' value='리셋' onclick='backgenre()'>" + "</td>" + "&nbsp" +
							"<td>" + "<input type='button' value='선택' onclick='minimalshoes()'>" + "</td></tr>");
	}
	
	function minimalshoes() {
		$("#clothes").empty();
		$("#clothes").append("<h2>신발</h2>" + "<form name='home'>" + "<table>" + "<tr><td>" + "<h3>브랜드</h3>" +
					"<a href='javascript:novestashoes()'>" + "노베스타" + "</a><br>" + 
					"돔바<br>" + "로스코<br>" + "</td>" +
					"<td id='brandshoes'>" + "</table>" + "</form>");
	}
	
	function novestashoes() {
		$("#brandshoes").empty();
		$("#brandshoes").append("<label><input type='radio' name='novestashoes_radio' value='novestashoes01'>" +
							"<img src='/sesoc/resources/img/brand/novesta/shoes/01.jpg' width='250' height='350' >" + "</label>" +
							"<label><input type='radio' name='novestashoes_radio' value='garmentsinner02'>" +
							"<img src='/sesoc/resources/img/brand/novesta/shoes/02.jpg' width='250' height='350' >" + "</label>" +
							"<label><input type='radio' name='novestashoes_radio' value='garmentsinner03'>" +
							"<img src='/sesoc/resources/img/brand/novesta/shoes/03.jpg' width='250' height='350' >" + "</label>" +
							"<label><input type='radio' name='novestashoes_radio' value='garmentsinner04'>" +
							"<img src='/sesoc/resources/img/brand/novesta/shoes/04.jpg' width='250' height='350' >" + "</label>" +
							"<label><input type='radio' name='novestashoes_radio' value='garmentsinner05'>" +
							"<img src='/sesoc/resources/img/brand/novesta/shoes/05.jpg' width='250' height='350' >" + "</label>" + "<br>" + 
							"<input type='button' value='리셋' onclick='backgenre()'>" + "</td>" + "&nbsp" +
							"<td>" + "<input type='button' value='코디 완료' onclick='minimalmylist()'>" + "</td></tr>");
	}
	
	function minimalmylist() {
		$("#minimal").empty();
		$("#clothes").empty();
		$("#minimal").append("패션 선택 완료");
	}
	
</script>
</head>
<body>
	<div id="minimal">
		<h1>미니멀</h1>
		<table>
			<tr>
				<td>
					<img src='/sesoc/resources/img/fashion/minimal/01.jpg' width='300' height='300' >
					<img src='/sesoc/resources/img/fashion/minimal/02.jpg' width='300' height='300' >
				</td>
			</tr>
		</table>
	</div>
	
	<div id="clothes">	
		<h2>하의</h2>
		<form name="go">
		<table>
			<tr>
				<td>
					<h3>브랜드</h3>
					<a href="javascript:garmentlablepants()">가먼트레이블</a><br>
					꼼데가르송<br>
					던스트<br>
				</td>
				<td id="brandpants">
		</table>
		</form>
	</div>
</body>
</html>