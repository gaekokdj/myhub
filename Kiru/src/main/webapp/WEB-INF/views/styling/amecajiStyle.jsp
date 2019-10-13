<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아메카지 스타일링</title>
<link rel="stylesheet" type="text/css" href="/sesoc/resources/css/css.css" />
<script src="/sesoc/resources/js/jquery-3.4.1.js"></script>
<script>
	var brand_name;
		
	var top_num;
	var bottom_num;
	var shoes_num;
	var outer_num;
	
	function backcoor() {
		window.location.reload(true);
	}
	
	function selectTop(temp) {
		top_num = temp.value;
	}
	
	function selectBottom(temp) {
		bottom_num = temp.value;
	}
	
	function selectShoes(temp) {
		shoes_num = temp.value;
	}
	
	function selectOuter(temp) {
		outer_num = temp.value;
	}
	
	function viewamecaji() {
		if(top_num === undefined) {
			alert("상의를 선택해주세요.");
			return false;
		}
		if(bottom_num === undefined) {
			alert("바지를 선택해주세요.");
			return false;
		}
		if(shoes_num === undefined) {
			alert("신발을 선택해주세요.");
			return false;
		}
		if(outer_num === undefined) {
			alert("겉옷을 선택해주세요.");
			return false;
		}
		$.ajax({
			url:"viewamecaji",
			type:"GET",
			dataType:"json",
			data: {"bottom_num":bottom_num, "top_num":top_num, "outer_num":outer_num, "shoes_num":shoes_num},
			success: function(result) {
				$("#amecaji").empty();
				$("#top").empty();
				$("#bottom").empty();
				$("#shoes").empty();
				$("#outer").empty();
				$("#complete").empty();
				$(result).each(function(index,item) {
					$("#amecaji").append("<img src=" + item + " width='170' height='240' >" + "<br>");
				})
				$("#amecaji").append("<form name='mylist'>" + "<input type='hidden' name='top_num' value='" + top_num + "'>" + 
									"<input type='hidden' name='bottom_num' value='" + bottom_num + "'>" + 
									"<input type='hidden' name='outer_num' value='" + outer_num + "'>" + 
									"<input type='hidden' name='shoes_num' value='" + shoes_num + "'>" + 
									"<br>" + "<a href='javascript:backcoor()'>" + "코디 다시하기" + "</a>" + "&nbsp" +
									"<a href='javascript:amecajimylist()'>" + "마이리스트 등록" + "</a>" + "</form>");
			},
			error: function() {
				alert("error");
			}
		})
	}
	
	function amecajimylist() {
		var form = document.mylist;
		form.action = "/sesoc/styling/addMyList";
		form.method = "POST";
		form.submit();
	}

	function selectTopBrand(temp) {
		brand_name = temp.value;
		
		$("#topBrand").empty();
		$("#topBrand").append("<td>" + "<a href='javascript:brandInner()'>" + 
							"<input type='hidden' name='brand_name' value='" + brand_name + "'>" + brand_name + "</a>" + "</td>");
	}
	
	function selectBottomBrand(temp) {
		brand_name = temp.value;
		
		$("#bottomBrand").empty();
		$("#bottomBrand").append("<td>" + "<a href='javascript:brandBottom()'>" + 
							"<input type='hidden' name='brand_name' value='" + brand_name + "'>" + brand_name + "</a>" + "</td>");
	}
	
	function selectShoesBrand(temp) {
		brand_name = temp.value;
		
		$("#shoesBrand").empty();
		$("#shoesBrand").append("<td>" + "<a href='javascript:brandShoes()'>" + 
							"<input type='hidden' name='brand_name' value='" + brand_name + "'>" + brand_name + "</a>" + "</td>");
	}
	
	function selectOuterBrand(temp) {
		brand_name = temp.value;
		
		$("#outerBrand").empty();
		$("#outerBrand").append("<td>" + "<a href='javascript:brandOuter()'>" + 
							"<input type='hidden' name='brand_name' value='" + brand_name + "'>" + brand_name + "</a>" + "</td>");
	}
	
	function brandInner(){
		$.ajax({
			url:"amecajiTopBrandList",
			type:"GET",
			dataType:"json",
			data:{"brand_name":brand_name},
			success: function(result) {
				$("#showTopBrand").empty();
				$("#topBrand").empty();
				$("#topBrand").append("<td>" + "<a href='javascript:backTopBrand()'>" + "뒤로" + "</a>" + "&nbsp" + "&nbsp" + brand_name + "</td>");
				$(result).each(function(index,item) {
					$("#showTopBrand").append("<label><input type='radio' name='top_radio' value='" + item.top_num + "' onclick='selectTop(this)'>" +
											"<img src=" + item.top_photo_name + " width='170' height='240' >" + "</label>");
				})
			},
			error: function() {
				alert("error");
			}
		})
	}
	
	function brandBottom(){
		$.ajax({
			url:"amecajiBottomBrandList",
			type:"GET",
			dataType:"json",
			data:{"brand_name":brand_name},
			success: function(result) {
				$("#showBottomBrand").empty();
				$("#bottomBrand").empty();
				$("#bottomBrand").append("<td>" + "<a href='javascript:backBottomBrand()'>" + "뒤로" + "</a>" + "&nbsp" + "&nbsp" + brand_name + "</td>");
				$(result).each(function(index,item) {
					$("#showBottomBrand").append("<label><input type='radio' name='bottom_radio' value='" + item.bottom_num + "' onclick='selectBottom(this)'>" +
											"<img src=" + item.bottom_photo_name + " width='170' height='240' >" + "</label>");
				})
			},
			error: function() {
				alert("error");
			}
		})
	}
	
	function brandShoes(){
		$.ajax({
			url:"amecajiShoesBrandList",
			type:"GET",
			dataType:"json",
			data:{"brand_name":brand_name},
			success: function(result) {
				$("#showShoesBrand").empty();
				$("#shoesBrand").empty();
				$("#shoesBrand").append("<td>" + "<a href='javascript:backShoesBrand()'>" + "뒤로" + "</a>" + "&nbsp" + "&nbsp" + brand_name + "</td>");
				$(result).each(function(index,item) {
					$("#showShoesBrand").append("<label><input type='radio' name='shoes_radio' value='" + item.shoes_num + "' onclick='selectShoes(this)'>" +
											"<img src=" + item.shoes_photo_name + " width='170' height='240' >" + "</label>");
				})
			},
			error: function() {
				alert("error");
			}
		})
	}
	
	function brandOuter(){
		$.ajax({
			url:"amecajiOuterBrandList",
			type:"GET",
			dataType:"json",
			data:{"brand_name":brand_name},
			success: function(result) {
				$("#showOuterBrand").empty();
				$("#outerBrand").empty();
				$("#outerBrand").append("<td>" + "<a href='javascript:backOuterBrand()'>" + "뒤로" + "</a>" + "&nbsp" + "&nbsp" + brand_name + "</td>");
				$(result).each(function(index,item) {
					$("#showOuterBrand").append("<label><input type='radio' name='outer_radio' value='" + item.outer_num + "' onclick='selectOuter(this)'>" +
											"<img src=" + item.outer_photo_name + " width='170' height='240' >" + "</label>");
				})
			},
			error: function() {
				alert("error");
			}
		})
	}
	
	function backTopBrand(){
		$("#top").empty();
		$("#top").append("<form name='go'>" + "<table><tr><td>" + "<table><tr><td>" + "<h3>상의</h3>" + "</td></tr>" + 
						"<tr id='topBrand'>" + "</tr>" + "<tr><td id='showTopBrand'>" + 
						"<label>" + "<input type='radio' name='amecajiTop_radio' value='다이클레즈' onclick='selectTopBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/dyclez/inner/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='amecajiTop_radio' value='모아' onclick='selectTopBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/moaa/inner/01.jpg' width='170' height='240'>" + "</label>" +
						"<label>" + "<input type='radio' name='amecajiTop_radio' value='에스피오나지' onclick='selectTopBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/espionage/inner/01.jpg' width='170' height='240'>" + "</label>" +
						"<label>" + "<input type='radio' name='amecajiTop_radio' value='와이엠씨엘케이와이' onclick='selectTopBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/ymclky/inner/01.jpg' width='170' height='240'>" + "</label>" +
						"<label>" + "<input type='radio' name='amecajiTop_radio' value='유니폼브릿지' onclick='selectTopBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/uniformbridge/inner/01.jpg' width='170' height='240'>" + "</label>" +
						"</td></tr></table>" + "</td></tr></table></form>");
	}
	
	function backBottomBrand(){
		$("#bottom").empty();
		$("#bottom").append("<form name='to'>" + "<table><tr><td>" + "<table><tr><td>" + "<h3>하의</h3>" + "</td></tr>" + 
						"<tr id='bottomBrand'>" + "</tr>" + "<tr><td id='showBottomBrand'>" + 
						"<label>" + "<input type='radio' name='amecajiBottom_radio' value='다이클레즈' onclick='selectBottomBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/dyclez/pants/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='amecajiBottom_radio' value='디그레' onclick='selectBottomBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/dgre/pants/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='amecajiBottom_radio' value='그라미치' onclick='selectBottomBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/gramicci/pants/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='amecajiBottom_radio' value='모아' onclick='selectBottomBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/moaa/pants/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='amecajiBottom_radio' value='에스피오나지' onclick='selectBottomBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/espionage/pants/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='amecajiBottom_radio' value='와이엠씨엘케이와이' onclick='selectBottomBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/ymclky/pants/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='amecajiBottom_radio' value='유니폼브릿지' onclick='selectBottomBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/uniformbridge/pants/01.jpg' width='170' height='240'>" + "</label>" + 
						"</td></tr></table>" + "</td></tr></table></form>");
	}
	
	function backShoesBrand(){
		$("#shoes").empty();
		$("#shoes").append("<form name='the'>" + "<table><tr><td>" + "<table><tr><td>" + "<h3>신발</h3>" + "</td></tr>" + 
						"<tr id='shoesBrand'>" + "</tr>" + "<tr><td id='showShoesBrand'>" + 
						"<label>" + "<input type='radio' name='amecajiShoes_radio' value='디아도라' onclick='selectShoesBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/diadora/shoes/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='amecajiShoes_radio' value='버켄스탁' onclick='selectShoesBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/birkenstock/shoes/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='amecajiShoes_radio' value='아몬무브먼트' onclick='selectShoesBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/amonmovement/shoes/01.jpg' width='170' height='240'>" + "</label>" + 
						"</td></tr></table>" + "</td></tr></table></form>");
	}
	
	function backOuterBrand(){
		$("#outer").empty();
		$("#outer").append("<form name='home'>" + "<table><tr><td>" + "<table><tr><td>" + "<h3>겉옷</h3>" + "</td></tr>" + 
						"<tr id='outerBrand'>" + "</tr>" + "<tr><td id='showOuterBrand'>" + 
						"<label>" + "<input type='radio' name='amecajiOuter_radio' value='다이클레즈' onclick='selectOuterBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/dyclez/outer/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='amecajiOuter_radio' value='디그레' onclick='selectOuterBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/dgre/outer/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='amecajiOuter_radio' value='모아' onclick='selectOuterBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/moaa/outer/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='amecajiOuter_radio' value='에스피오나지' onclick='selectOuterBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/espionage/outer/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='amecajiOuter_radio' value='와이엠씨엘케이와이' onclick='selectOuterBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/ymclky/outer/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='amecajiOuter_radio' value='유니폼브릿지' onclick='selectOuterBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/uniformbridge/outer/01.jpg' width='170' height='240'>" + "</label>" + 
						"</td></tr></table>" + "</td></tr></table></form>");
	}
</script>
</head>
<body>
	<div id="amecaji">
		<h1>아메카지</h1>
		<table>
			<c:forEach items="${amecajiList}" var="recommed">
				<th id="fashion1">
					<img src="${recommed.recommed_photo_name}" width='200' height='200'>
				</th>
			</c:forEach>
		</table>
	</div>
	
	<div id="top">	
		<form name="go">
		<table>
			<tr>
				<td>
					<table>
						<tr>
							<td><h3>상의</h3></td>
						</tr>
						<tr id="topBrand">
						
						</tr>
						<tr>
								<td id="showTopBrand">
									<label><input type='radio' name='amecajiTop_radio' value='다이클레즈' onclick='selectTopBrand(this)'>
									<img src="/sesoc/resources/img/brand/dyclez/inner/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='amecajiTop_radio' value='모아' onclick='selectTopBrand(this)'>
									<img src="/sesoc/resources/img/brand/moaa/inner/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='amecajiTop_radio' value='에스피오나지' onclick='selectTopBrand(this)'>
									<img src="/sesoc/resources/img/brand/espionage/inner/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='amecajiTop_radio' value='와이엠씨엘케이와이' onclick='selectTopBrand(this)'>
									<img src="/sesoc/resources/img/brand/ymclky/inner/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='amecajiTop_radio' value='유니폼브릿지' onclick='selectTopBrand(this)'>
									<img src="/sesoc/resources/img/brand/uniformbridge/inner/01.jpg" width='170' height='240'></label>
								</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		</form>
	</div>
	
	<div id="bottom">	
		<form name="to">
		<table>
			<tr>
				<td>
					<table>
						<tr>
							<td><h3>하의</h3></td>
						</tr>
						<tr id="bottomBrand">
						
						</tr>
						<tr>
								<td id="showBottomBrand">
									<label><input type='radio' name='amecajiBottom_radio' value='다이클레즈' onclick='selectBottomBrand(this)'>
									<img src="/sesoc/resources/img/brand/dyclez/pants/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='amecajiBottom_radio' value='디그레' onclick='selectBottomBrand(this)'>
									<img src="/sesoc/resources/img/brand/dgre/pants/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='amecajiBottom_radio' value='그라미치' onclick='selectBottomBrand(this)'>
									<img src="/sesoc/resources/img/brand/gramicci/pants/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='amecajiBottom_radio' value='모아' onclick='selectBottomBrand(this)'>
									<img src="/sesoc/resources/img/brand/moaa/pants/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='amecajiBottom_radio' value='에스피오나지' onclick='selectBottomBrand(this)'>
									<img src="/sesoc/resources/img/brand/espionage/pants/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='amecajiBottom_radio' value='와이엠씨엘케이와이' onclick='selectBottomBrand(this)'>
									<img src="/sesoc/resources/img/brand/ymclky/pants/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='amecajiBottom_radio' value='유니폼브릿지' onclick='selectBottomBrand(this)'>
									<img src="/sesoc/resources/img/brand/uniformbridge/pants/01.jpg" width='170' height='240'></label>
								</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		</form>
	</div>
	
	<div id="shoes">	
		<form name="the">
		<table>
			<tr>
				<td>
					<table>
						<tr>
							<td><h3>신발</h3></td>
						</tr>
						<tr id="shoesBrand">
						
						</tr>
						<tr>
								<td id="showShoesBrand">
									<label><input type='radio' name='amecajiShoes_radio' value='디아도라' onclick='selectShoesBrand(this)'>
									<img src="/sesoc/resources/img/brand/diadora/shoes/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='amecajiShoes_radio' value='버켄스탁' onclick='selectShoesBrand(this)'>
									<img src="/sesoc/resources/img/brand/birkenstock/shoes/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='amecajiShoes_radio' value='아몬무브먼트' onclick='selectShoesBrand(this)'>
									<img src="/sesoc/resources/img/brand/amonmovement/shoes/01.jpg" width='170' height='240'></label>
								</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		</form>
	</div>
						
	<div id="outer">	
		<form name="home">
		<table>
			<tr>
				<td>
					<table>
						<tr>
							<td><h3>겉옷</h3></td>
						</tr>
						<tr id="outerBrand">
						
						</tr>
						<tr>
								<td id="showOuterBrand">
									<label><input type='radio' name='amecajiOuter_radio' value='다이클레즈' onclick='selectOuterBrand(this)'>
									<img src="/sesoc/resources/img/brand/dyclez/outer/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='amecajiOuter_radio' value='디그레' onclick='selectOuterBrand(this)'>
									<img src="/sesoc/resources/img/brand/dgre/outer/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='amecajiOuter_radio' value='모아' onclick='selectOuterBrand(this)'>
									<img src="/sesoc/resources/img/brand/moaa/outer/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='amecajiOuter_radio' value='에스피오나지' onclick='selectOuterBrand(this)'>
									<img src="/sesoc/resources/img/brand/espionage/outer/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='amecajiOuter_radio' value='와이엠씨엘케이와이' onclick='selectOuterBrand(this)'>
									<img src="/sesoc/resources/img/brand/ymclky/outer/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='amecajiOuter_radio' value='유니폼브릿지' onclick='selectOuterBrand(this)'>
									<img src="/sesoc/resources/img/brand/uniformbridge/outer/01.jpg" width='170' height='240'></label>
								</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		</form>
	</div>
	
	<div id="complete">
			<a href="/sesoc/styling/selectGenre">장르선택으로 돌아가기</a>
			<a href="javascript:viewamecaji()">코디 완료</a>
	</div>
</body>
</html>