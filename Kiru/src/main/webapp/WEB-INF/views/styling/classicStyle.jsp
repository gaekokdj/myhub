<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>클래식 스타일링</title>
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
		top_num = temp.value;
		bottom_num = temp.value;
	}
	
	function viewclassic() {
		if(shoes_num === undefined) {
			alert("신발을 선택해주세요.");
			return false;
		}
		if(outer_num === undefined) {
			alert("겉옷을 선택해주세요.");
			return false;
		}
		$.ajax({
			url:"viewclassic",
			type:"GET",
			dataType:"json",
			data: {"bottom_num":bottom_num, "top_num":top_num, "outer_num":outer_num, "shoes_num":shoes_num},
			success: function(result) {
				$("#classic").empty();
				$("#top").empty();
				$("#bottom").empty();
				$("#shoes").empty();
				$("#outer").empty();
				$("#complete").empty();
				$(result).each(function(index,item) {
					$("#classic").append("<img src=" + item + " width='170' height='240' >" + "<br>");
				})
				$("#classic").append("<form name='mylist'>" + "<input type='hidden' name='top_num' value='" + top_num + "'>" + 
									"<input type='hidden' name='bottom_num' value='" + bottom_num + "'>" + 
									"<input type='hidden' name='outer_num' value='" + outer_num + "'>" + 
									"<input type='hidden' name='shoes_num' value='" + shoes_num + "'>" + 
									"<br>" + "<a href='javascript:backcoor()'>" + "코디 다시하기" + "</a>" + "&nbsp" +
									"<a href='javascript:classicmylist()'>" + "마이리스트 등록" + "</a>" + "</form>");
			},
			error: function() {
				alert("error");
			}
		})
	}
	
	function classicmylist() {
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
	
	function brandOuter(){
		$.ajax({
			url:"classicOuterBrandList",
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
	
	function brandShoes(){
		$.ajax({
			url:"classicShoesBrandList",
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
	
	function backOuterBrand(){
		$("#outer").empty();
		$("#outer").append("<form name='home'>" + "<table><tr><td>" + "<table><tr><td>" + "<h3>겉옷</h3>" + "</td></tr>" + 
						"<tr id='outerBrand'>" + "</tr>" + "<tr><td id='showOuterBrand'>" + 
						"<label>" + "<input type='radio' name='minimalOuter_radio' value='돌체앤가바나' onclick='selectOuterBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/dolcegabbana/outer/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='minimalOuter_radio' value='디올' onclick='selectOuterBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/dior/outer/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='minimalOuter_radio' value='딸리아또레' onclick='selectOuterBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/tagliatore/outer/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='minimalOuter_radio' value='마에스트로' onclick='selectOuterBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/maestro/outer/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='minimalOuter_radio' value='제냐' onclick='selectOuterBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/zegna/outer/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='minimalOuter_radio' value='톰포드' onclick='selectOuterBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/tomford/outer/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='minimalOuter_radio' value='프라다' onclick='selectOuterBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/prada/outer/01.jpg' width='170' height='240'>" + "</label>" + 
						"</td></tr></table>" + "</td></tr></table></form>");
	}
	
	function backShoesBrand(){
		$("#shoes").empty();
		$("#shoes").append("<form name='the'>" + "<table><tr><td>" + "<table><tr><td>" + "<h3>신발</h3>" + "</td></tr>" + 
						"<tr id='shoesBrand'>" + "</tr>" + "<tr><td id='showShoesBrand'>" + 
						"<label>" + "<input type='radio' name='minimalShoes_radio' value='닥스' onclick='selectShoesBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/daks/shoes/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='minimalShoes_radio' value='돌체앤가바나' onclick='selectShoesBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/dolcegabbana/shoes/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='minimalShoes_radio' value='살바토르페레가모' onclick='selectShoesBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/salvatoreferragamo/shoes/01.jpg' width='170' height='240'>" + "</label>" + 
						"</td></tr></table>" + "</td></tr></table></form>");
	}
	
	
</script>
</head>
<body>
	<div id="classic">
		<h1>클래식</h1>
		<table>
			<c:forEach items="${classicList}" var="recommed">
				<th id="fashion1">
					<img src="${recommed.recommed_photo_name}" width='200' height='200'>
				</th>
			</c:forEach>
		</table>
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
									<label><input type='radio' name='classicOuter_radio' value='돌체앤가바나' onclick='selectOuterBrand(this)'>
									<img src="/sesoc/resources/img/brand/dolcegabbana/outer/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='classicOuter_radio' value='디올' onclick='selectOuterBrand(this)'>
									<img src="/sesoc/resources/img/brand/dior/outer/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='classicOuter_radio' value='딸리아또레' onclick='selectOuterBrand(this)'>
									<img src="/sesoc/resources/img/brand/tagliatore/outer/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='classicOuter_radio' value='마에스트로' onclick='selectOuterBrand(this)'>
									<img src="/sesoc/resources/img/brand/maestro/outer/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='classicOuter_radio' value='제냐' onclick='selectOuterBrand(this)'>
									<img src="/sesoc/resources/img/brand/zegna/outer/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='classicOuter_radio' value='톰포드' onclick='selectOuterBrand(this)'>
									<img src="/sesoc/resources/img/brand/tomford/outer/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='classicOuter_radio' value='프라다' onclick='selectOuterBrand(this)'>
									<img src="/sesoc/resources/img/brand/prada/outer/01.jpg" width='170' height='240'></label>
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
									<label><input type='radio' name='classicShoes_radio' value='닥스' onclick='selectShoesBrand(this)'>
									<img src="/sesoc/resources/img/brand/daks/shoes/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='clssicShoes_radio' value='돌체앤가바나' onclick='selectShoesBrand(this)'>
									<img src="/sesoc/resources/img/brand/dolcegabbana/shoes/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='classicShoes_radio' value='살바토르페레가모' onclick='selectShoesBrand(this)'>
									<img src="/sesoc/resources/img/brand/salvatoreferragamo/shoes/01.jpg" width='170' height='240'></label>
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
			<a href="javascript:viewclassic()">코디 완료</a>
	</div>
</body>
</html>