<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>클래식 캐주얼 스타일링</title>
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
	
	function viewclassiccasual() {
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
			url:"viewclassiccasual",
			type:"GET",
			dataType:"json",
			data: {"bottom_num":bottom_num, "top_num":top_num, "outer_num":outer_num, "shoes_num":shoes_num},
			success: function(result) {
				$("#classiccasual").empty();
				$("#top").empty();
				$("#bottom").empty();
				$("#shoes").empty();
				$("#outer").empty();
				$("#complete").empty();
				$(result).each(function(index,item) {
					$("#classiccasual").append("<img src=" + item + " width='170' height='240' >" + "<br>");
				})
				$("#classiccasual").append("<form name='mylist'>" + "<input type='hidden' name='top_num' value='" + top_num + "'>" + 
									"<input type='hidden' name='bottom_num' value='" + bottom_num + "'>" + 
									"<input type='hidden' name='outer_num' value='" + outer_num + "'>" + 
									"<input type='hidden' name='shoes_num' value='" + shoes_num + "'>" + 
									"<br>" + "<a href='javascript:backcoor()'>" + "코디 다시하기" + "</a>" + "&nbsp" +
									"<a href='javascript:classiccasualmylist()'>" + "마이리스트 등록" + "</a>" + "</form>");
			},
			error: function() {
				alert("error");
			}
		})
	}
	
	function classiccasualmylist() {
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
			url:"classiccasualTopBrandList",
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
			url:"classiccasualBottomBrandList",
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
			url:"classiccasualShoesBrandList",
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
			url:"classiccasualOuterBrandList",
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
						"<label>" + "<input type='radio' name='classicCasualTop_radio' value='꼬르넬리아니' onclick='selectTopBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/corneliani/inner/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='classicCasualTop_radio' value='닥스' onclick='selectTopBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/daks/inner/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='classicCasualTop_radio' value='더지지' onclick='selectTopBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/thegigi/inner/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='classicCasualTop_radio' value='돈덥' onclick='selectTopBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/dondup/inner/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='classicCasualTop_radio' value='라르디니' onclick='selectTopBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/lardini/inner/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='classicCasualTop_radio' value='라코스테' onclick='selectTopBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/lacoste/inner/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='classicCasualTop_radio' value='마시모알바' onclick='selectTopBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/massimoalba/inner/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='classicCasualTop_radio' value='버버리' onclick='selectTopBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/burberry/inner/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='classicCasualTop_radio' value='브루넬로쿠치넬리' onclick='selectTopBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/brunellocucinelli/inner/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='classicCasualTop_radio' value='서플러스워드로브' onclick='selectTopBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/surpluswardrobe/inner/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='classicCasualTop_radio' value='아스페시' onclick='selectTopBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/aspesi/inner/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='classicCasualTop_radio' value='알두까다오스타' onclick='selectTopBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/alducadaosta/inner/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='classicCasualTop_radio' value='알레그리' onclick='selectTopBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/allegri/inner/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='classicCasualTop_radio' value='제이리움' onclick='selectTopBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/jrium/inner/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='classicCasualTop_radio' value='톰브라운' onclick='selectTopBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/thombrowne/inner/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='classicCasualTop_radio' value='폴로랄프로렌' onclick='selectTopBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/poloralphlauren/inner/01.jpg' width='170' height='240'>" + "</label>" + 
						"</td></tr></table>" + "</td></tr></table></form>");
	}
	
	function backBottomBrand(){
		$("#bottom").empty();
		$("#bottom").append("<form name='to'>" + "<table><tr><td>" + "<table><tr><td>" + "<h3>하의</h3>" + "</td></tr>" + 
						"<tr id='bottomBrand'>" + "</tr>" + "<tr><td id='showBottomBrand'>" + 
						"<label>" + "<input type='radio' name='classicCasualBottom_radio' value='꼬르넬리아니' onclick='selectBottomBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/corneliani/pants/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='classicCasualBottom_radio' value='닥스' onclick='selectBottomBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/daks/pants/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='classicCasualBottom_radio' value='더지지' onclick='selectBottomBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/thegigi/pants/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='classicCasualBottom_radio' value='돈덥' onclick='selectBottomBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/dondup/pants/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='classicCasualBottom_radio' value='라르디니' onclick='selectBottomBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/lardini/pants/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='classicCasualBottom_radio' value='마시모알바' onclick='selectBottomBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/massimoalba/pants/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='classicCasualBottom_radio' value='버버리' onclick='selectBottomBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/burberry/pants/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='classicCasualBottom_radio' value='브루넬로쿠치넬리' onclick='selectBottomBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/brunellocucinelli/pants/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='classicCasualBottom_radio' value='서플러스워드로브' onclick='selectBottomBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/surpluswardrobe/pants/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='classicCasualBottom_radio' value='아스페시' onclick='selectBottomBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/aspesi/pants/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='classicCasualBottom_radio' value='알두까다오스타' onclick='selectBottomBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/alducadaosta/pants/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='classicCasualBottom_radio' value='알레그리' onclick='selectBottomBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/allegri/pants/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='classicCasualBottom_radio' value='인코텍스' onclick='selectBottomBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/incotex/pants/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='classicCasualBottom_radio' value='제이리움' onclick='selectBottomBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/jrium/pants/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='classicCasualBottom_radio' value='톰브라운' onclick='selectBottomBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/thombrowne/pants/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='classicCasualBottom_radio' value='폴로랄프로렌' onclick='selectBottomBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/poloralphlauren/pants/01.jpg' width='170' height='240'>" + "</label>" + 
						"</td></tr></table>" + "</td></tr></table></form>");
	}
	
	function backShoesBrand(){
		$("#shoes").empty();
		$("#shoes").append("<form name='the'>" + "<table><tr><td>" + "<table><tr><td>" + "<h3>신발</h3>" + "</td></tr>" + 
						"<tr id='shoesBrand'>" + "</tr>" + "<tr><td id='showShoesBrand'>" + 
						"<label>" + "<input type='radio' name='classicCasualShoes_radio' value='라코스테' onclick='selectShoesBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/lacoste/shoes/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='classicCasualShoes_radio' value='락포트' onclick='selectShoesBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/rockport/shoes/01.jpg' width='170' height='240'>" + "</label>" +
						"<label>" + "<input type='radio' name='classicCasualShoes_radio' value='바스' onclick='selectShoesBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/bass/shoes/01.jpg' width='170' height='240'>" + "</label>" +
						"<label>" + "<input type='radio' name='classicCasualShoes_radio' value='산토니' onclick='selectShoesBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/santoni/shoes/01.jpg' width='170' height='240'>" + "</label>" +
						"<label>" + "<input type='radio' name='classicCasualShoes_radio' value='처치스' onclick='selectShoesBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/churchs/shoes/01.jpg' width='170' height='240'>" + "</label>" +
						"<label>" + "<input type='radio' name='classicCasualShoes_radio' value='탠디' onclick='selectShoesBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/tandy/shoes/01.jpg' width='170' height='240'>" + "</label>" +
						"</td></tr></table>" + "</td></tr></table></form>");
	}
	
	function backOuterBrand(){
		$("#outer").empty();
		$("#outer").append("<form name='home'>" + "<table><tr><td>" + "<table><tr><td>" + "<h3>겉옷</h3>" + "</td></tr>" + 
						"<tr id='outerBrand'>" + "</tr>" + "<tr><td id='showOuterBrand'>" + 
						"<label>" + "<input type='radio' name='classicCasualOuter_radio' value='꼬르델리아니' onclick='selectOuterBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/corneliani/outer/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='classicCasualOuter_radio' value='닥스' onclick='selectOuterBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/daks/outer/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='classicCasualOuter_radio' value='더지지' onclick='selectOuterBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/thegigi/outer/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='classicCasualOuter_radio' value='돈덥' onclick='selectOuterBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/dondup/outer/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='classicCasualOuter_radio' value='라르디니' onclick='selectOuterBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/lardini/outer/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='classicCasualOuter_radio' value='마시모알바' onclick='selectOuterBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/massimoalba/outer/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='classicCasualOuter_radio' value='버버리' onclick='selectOuterBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/burberry/outer/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='classicCasualOuter_radio' value='브루넬로쿠치넬리' onclick='selectOuterBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/brunellocucinelli/outer/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='classicCasualOuter_radio' value='서플러스워드로브' onclick='selectOuterBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/surpluswardrobe/outer/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='classicCasualOuter_radio' value='아스페시' onclick='selectOuterBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/aspesi/outer/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='classicCasualOuter_radio' value='알두까다오스타' onclick='selectOuterBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/alducadaosta/outer/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='classicCasualOuter_radio' value='알레그리' onclick='selectOuterBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/allegri/outer/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='classicCasualOuter_radio' value='제이리움' onclick='selectOuterBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/jrium/outer/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='classicCasualOuter_radio' value='톰브라운' onclick='selectOuterBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/thombrowne/outer/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='classicCasualOuter_radio' value='폴로랄프로렌' onclick='selectOuterBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/poloralphlauren/outer/01.jpg' width='170' height='240'>" + "</label>" + 
						"</td></tr></table>" + "</td></tr></table></form>");
	}
</script>
</head>
<body>
	<div id="classiccasual">
		<h1>클래식캐주얼</h1>
		<table>
			<c:forEach items="${classicCasulList}" var="recommed">
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
									<label><input type='radio' name='classicCasualTop_radio' value='꼬르넬리아니' onclick='selectTopBrand(this)'>
									<img src="/sesoc/resources/img/brand/corneliani/inner/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='classicCasualTop_radio' value='닥스' onclick='selectTopBrand(this)'>
									<img src="/sesoc/resources/img/brand/daks/inner/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='classicCasualTop_radio' value='더지지' onclick='selectTopBrand(this)'>
									<img src="/sesoc/resources/img/brand/thegigi/inner/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='classicCasualTop_radio' value='돈덥' onclick='selectTopBrand(this)'>
									<img src="/sesoc/resources/img/brand/dondup/inner/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='classicCasualTop_radio' value='라르디니' onclick='selectTopBrand(this)'>
									<img src="/sesoc/resources/img/brand/lardini/inner/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='classicCasualTop_radio' value='라코스테' onclick='selectTopBrand(this)'>
									<img src="/sesoc/resources/img/brand/lacoste/inner/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='classicCasualTop_radio' value='마시모알바' onclick='selectTopBrand(this)'>
									<img src="/sesoc/resources/img/brand/massimoalba/inner/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='classicCasualTop_radio' value='버버리' onclick='selectTopBrand(this)'>
									<img src="/sesoc/resources/img/brand/burberry/inner/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='classicCasualTop_radio' value='브루넬로쿠치넬리' onclick='selectTopBrand(this)'>
									<img src="/sesoc/resources/img/brand/brunellocucinelli/inner/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='classicCasualTop_radio' value='서플러스워드로브' onclick='selectTopBrand(this)'>
									<img src="/sesoc/resources/img/brand/surpluswardrobe/inner/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='classicCasualTop_radio' value='아스페시' onclick='selectTopBrand(this)'>
									<img src="/sesoc/resources/img/brand/aspesi/inner/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='classicCasualTop_radio' value='알두까다오스타' onclick='selectTopBrand(this)'>
									<img src="/sesoc/resources/img/brand/alducadaosta/inner/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='classicCasualTop_radio' value='알레그리' onclick='selectTopBrand(this)'>
									<img src="/sesoc/resources/img/brand/allegri/inner/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='classicCasualTop_radio' value='제이리움' onclick='selectTopBrand(this)'>
									<img src="/sesoc/resources/img/brand/jrium/inner/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='classicCasualTop_radio' value='톰브라운' onclick='selectTopBrand(this)'>
									<img src="/sesoc/resources/img/brand/thombrowne/inner/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='classicCasualTop_radio' value='폴로랄프로렌' onclick='selectTopBrand(this)'>
									<img src="/sesoc/resources/img/brand/poloralphlauren/inner/01.jpg" width='170' height='240'></label>
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
									<label><input type='radio' name='classicCasualBottom_radio' value='꼬르넬리아니' onclick='selectBottomBrand(this)'>
									<img src="/sesoc/resources/img/brand/corneliani/pants/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='classicCasualBottom_radio' value='닥스' onclick='selectBottomBrand(this)'>
									<img src="/sesoc/resources/img/brand/daks/pants/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='classicCasualBottom_radio' value='더지지' onclick='selectBottomBrand(this)'>
									<img src="/sesoc/resources/img/brand/thegigi/pants/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='classicCasualBottom_radio' value='돈덥' onclick='selectBottomBrand(this)'>
									<img src="/sesoc/resources/img/brand/dondup/pants/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='classicCasualBottom_radio' value='라르디니' onclick='selectBottomBrand(this)'>
									<img src="/sesoc/resources/img/brand/lardini/pants/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='classicCasualBottom_radio' value='마시모알바' onclick='selectBottomBrand(this)'>
									<img src="/sesoc/resources/img/brand/massimoalba/pants/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='classicCasualBottom_radio' value='버버리' onclick='selectBottomBrand(this)'>
									<img src="/sesoc/resources/img/brand/burberry/pants/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='classicCasualBottom_radio' value='브루넬로쿠치넬리' onclick='selectBottomBrand(this)'>
									<img src="/sesoc/resources/img/brand/brunellocucinelli/pants/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='classicCasualBottom_radio' value='서플러스워드로브' onclick='selectBottomBrand(this)'>
									<img src="/sesoc/resources/img/brand/surpluswardrobe/pants/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='classicCasualBottom_radio' value='아스페시' onclick='selectBottomBrand(this)'>
									<img src="/sesoc/resources/img/brand/aspesi/pants/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='classicCasualBottom_radio' value='알두까다오스타' onclick='selectBottomBrand(this)'>
									<img src="/sesoc/resources/img/brand/alducadaosta/pants/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='classicCasualBottom_radio' value='알레그리' onclick='selectBottomBrand(this)'>
									<img src="/sesoc/resources/img/brand/allegri/pants/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='classicCasualBottom_radio' value='인코텍스' onclick='selectBottomBrand(this)'>
									<img src="/sesoc/resources/img/brand/incotex/pants/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='classicCasualBottom_radio' value='제이리움' onclick='selectBottomBrand(this)'>
									<img src="/sesoc/resources/img/brand/jrium/pants/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='classicCasualBottom_radio' value='톰브라운' onclick='selectBottomBrand(this)'>
									<img src="/sesoc/resources/img/brand/thombrowne/pants/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='classicCasualBottom_radio' value='폴로랄프로렌' onclick='selectBottomBrand(this)'>
									<img src="/sesoc/resources/img/brand/poloralphlauren/pants/01.jpg" width='170' height='240'></label>
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
									<label><input type='radio' name='classicCasualShoes_radio' value='라코스테' onclick='selectShoesBrand(this)'>
									<img src="/sesoc/resources/img/brand/lacoste/shoes/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='classicCasualShoes_radio' value='락포트' onclick='selectShoesBrand(this)'>
									<img src="/sesoc/resources/img/brand/rockport/shoes/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='classicCasualShoes_radio' value='바스' onclick='selectShoesBrand(this)'>
									<img src="/sesoc/resources/img/brand/bass/shoes/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='classicCasualShoes_radio' value='산토니' onclick='selectShoesBrand(this)'>
									<img src="/sesoc/resources/img/brand/santoni/shoes/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='classicCasualShoes_radio' value='처치스' onclick='selectShoesBrand(this)'>
									<img src="/sesoc/resources/img/brand/churchs/shoes/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='classicCasualShoes_radio' value='탠디' onclick='selectShoesBrand(this)'>
									<img src="/sesoc/resources/img/brand/tandy/shoes/01.jpg" width='170' height='240'></label>
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
									<label><input type='radio' name='classicCasualOuter_radio' value='꼬르넬리아니' onclick='selectOuterBrand(this)'>
									<img src="/sesoc/resources/img/brand/corneliani/outer/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='classicCasualOuter_radio' value='닥스' onclick='selectOuterBrand(this)'>
									<img src="/sesoc/resources/img/brand/daks/outer/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='classicCasualOuter_radio' value='더지지' onclick='selectOuterBrand(this)'>
									<img src="/sesoc/resources/img/brand/thegigi/outer/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='classicCasualOuter_radio' value='돈덥' onclick='selectOuterBrand(this)'>
									<img src="/sesoc/resources/img/brand/dondup/outer/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='classicCasualOuter_radio' value='라르디니' onclick='selectOuterBrand(this)'>
									<img src="/sesoc/resources/img/brand/lardini/outer/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='classicCasualOuter_radio' value='마시모알바' onclick='selectOuterBrand(this)'>
									<img src="/sesoc/resources/img/brand/massimoalba/outer/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='classicCasualOuter_radio' value='버버리' onclick='selectOuterBrand(this)'>
									<img src="/sesoc/resources/img/brand/burberry/outer/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='classicCasualOuter_radio' value='브루넬로쿠치넬리' onclick='selectOuterBrand(this)'>
									<img src="/sesoc/resources/img/brand/brunellocucinelli/outer/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='classicCasualOuter_radio' value='서플러스워드로브' onclick='selectOuterBrand(this)'>
									<img src="/sesoc/resources/img/brand/surpluswardrobe/outer/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='classicCasualOuter_radio' value='아스페시' onclick='selectOuterBrand(this)'>
									<img src="/sesoc/resources/img/brand/aspesi/outer/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='classicCasualOuter_radio' value='알두까다오스타' onclick='selectOuterBrand(this)'>
									<img src="/sesoc/resources/img/brand/alducadaosta/outer/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='classicCasualOuter_radio' value='알레그리' onclick='selectOuterBrand(this)'>
									<img src="/sesoc/resources/img/brand/allegri/outer/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='classicCasualOuter_radio' value='제이리움' onclick='selectOuterBrand(this)'>
									<img src="/sesoc/resources/img/brand/jrium/outer/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='classicCasualOuter_radio' value='톰브라운' onclick='selectOuterBrand(this)'>
									<img src="/sesoc/resources/img/brand/thombrowne/outer/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='classicCasualOuter_radio' value='폴로랄프로렌' onclick='selectOuterBrand(this)'>
									<img src="/sesoc/resources/img/brand/poloralphlauren/outer/01.jpg" width='170' height='240'></label>
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
			<a href="javascript:viewclassiccasual()">코디 완료</a>
	</div>
</body>
</html>