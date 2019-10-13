<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스트릿 스타일링</title>
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
	
	function viewstreet() {
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
			url:"viewstreet",
			type:"GET",
			dataType:"json",
			data: {"bottom_num":bottom_num, "top_num":top_num, "outer_num":outer_num, "shoes_num":shoes_num},
			success: function(result) {
				$("#street").empty();
				$("#top").empty();
				$("#bottom").empty();
				$("#shoes").empty();
				$("#outer").empty();
				$("#complete").empty();
				$(result).each(function(index,item) {
					$("#street").append("<img src=" + item + " width='170' height='240' >" + "<br>");
				})
				$("#street").append("<form name='mylist'>" + "<input type='hidden' name='top_num' value='" + top_num + "'>" + 
									"<input type='hidden' name='bottom_num' value='" + bottom_num + "'>" + 
									"<input type='hidden' name='outer_num' value='" + outer_num + "'>" + 
									"<input type='hidden' name='shoes_num' value='" + shoes_num + "'>" + 
									"<br>" + "<a href='javascript:backcoor()'>" + "코디 다시하기" + "</a>" + "&nbsp" +
									"<a href='javascript:streetmylist()'>" + "마이리스트 등록" + "</a>" + "</form>");
			},
			error: function() {
				alert("error");
			}
		})
	}
	
	function streetmylist() {
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
			url:"streetTopBrandList",
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
			url:"streetBottomBrandList",
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
			url:"streetShoesBrandList",
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
			url:"streetOuterBrandList",
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
						"<label>" + "<input type='radio' name='streetTop_radio' value='갭' onclick='selectTopBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/gap/inner/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='streetTop_radio' value='구찌' onclick='selectTopBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/gucci/inner/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='streetTop_radio' value='낫포너드' onclick='selectTopBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/not4nerd/inner/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='streetTop_radio' value='닐바렛' onclick='selectTopBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/neilbarrett/inner/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='streetTop_radio' value='랑데부' onclick='selectTopBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/rendezvouz/inner/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='streetTop_radio' value='마르셀로불론' onclick='selectTopBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/marceloburlon/inner/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='streetTop_radio' value='마틴로즈' onclick='selectTopBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/martinrose/inner/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='streetTop_radio' value='매스노운' onclick='selectTopBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/massnoun/inner/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='streetTop_radio' value='뮌' onclick='selectTopBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/munn/inner/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='streetTop_radio' value='발렌시아가' onclick='selectTopBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/balenciaga/inner/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='streetTop_radio' value='베트멍' onclick='selectTopBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/vetements/inner/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='streetTop_radio' value='슈프림' onclick='selectTopBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/supreme/inner/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='streetTop_radio' value='스톤아일랜드' onclick='selectTopBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/stoneisland/inner/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='streetTop_radio' value='스티그마' onclick='selectTopBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/stigma/inner/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='streetTop_radio' value='쓰래셔' onclick='selectTopBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/thrasher/inner/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='streetTop_radio' value='씨피컴퍼니' onclick='selectTopBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/cpcompany/inner/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='streetTop_radio' value='아미리' onclick='selectTopBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/amiri/inner/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='streetTop_radio' value='엘엠씨' onclick='selectTopBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/lmc/inner/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='streetTop_radio' value='오베이' onclick='selectTopBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/obey/inner/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='streetTop_radio' value='오에이엠씨' onclick='selectTopBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/oamc/inner/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='streetTop_radio' value='오프화이트' onclick='selectTopBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/offwhite/inner/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='streetTop_radio' value='챔피언' onclick='selectTopBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/champion/inner/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='streetTop_radio' value='킬리자로' onclick='selectTopBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/kilijaro/inner/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='streetTop_radio' value='팔칠엠엠서울' onclick='selectTopBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/87mm/inner/01.jpg' width='170' height='240'>" + "</label>" + 
						"</td></tr></table>" + "</td></tr></table></form>");
	}
	
	function backBottomBrand(){
		$("#bottom").empty();
		$("#bottom").append("<form name='to'>" + "<table><tr><td>" + "<table><tr><td>" + "<h3>하의</h3>" + "</td></tr>" + 
						"<tr id='bottomBrand'>" + "</tr>" + "<tr><td id='showBottomBrand'>" + 
						"<label>" + "<input type='radio' name='streetBottom_radio' value='구찌' onclick='selectBottomBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/gucci/pants/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='streetBottom_radio' value='낫포너드' onclick='selectBottomBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/not4nerd/pants/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='streetBottom_radio' value='닐바렛' onclick='selectBottomBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/neilbarrett/pants/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='streetBottom_radio' value='랑데부' onclick='selectBottomBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/rendezvouz/pants/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='streetBottom_radio' value='마르셀로불론' onclick='selectBottomBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/marceloburlon/pants/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='streetBottom_radio' value='마틴로즈' onclick='selectBottomBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/martinrose/pants/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='streetBottom_radio' value='매스노운' onclick='selectBottomBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/massnoun/pants/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='streetBottom_radio' value='발렌시아가' onclick='selectBottomBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/balenciaga/pants/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='streetBottom_radio' value='스톤아일랜드' onclick='selectBottomBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/stoneisland/pants/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='streetBottom_radio' value='스티그마' onclick='selectBottomBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/stigma/pants/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='streetBottom_radio' value='씨피컴퍼니' onclick='selectBottomBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/cpcompany/pants/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='streetBottom_radio' value='아미리' onclick='selectBottomBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/amiri/pants/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='streetBottom_radio' value='엘엠씨' onclick='selectBottomBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/lmc/pants/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='streetBottom_radio' value='오베이' onclick='selectBottomBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/obey/pants/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='streetBottom_radio' value='오에이엠씨' onclick='selectBottomBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/oamc/pants/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='streetBottom_radio' value='오프화이트' onclick='selectBottomBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/offwhite/pants/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='streetBottom_radio' value='챔피언' onclick='selectBottomBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/champion/pants/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='streetBottom_radio' value='킬리자로' onclick='selectBottomBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/kilijaro/pants/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='streetBottom_radio' value='팔칠엠엠서울' onclick='selectBottomBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/87mm/pants/01.jpg' width='170' height='240'>" + "</label>" + 
						"</td></tr></table>" + "</td></tr></table></form>");
	}
	
	function backShoesBrand(){
		$("#shoes").empty();
		$("#shoes").append("<form name='the'>" + "<table><tr><td>" + "<table><tr><td>" + "<h3>신발</h3>" + "</td></tr>" + 
						"<tr id='shoesBrand'>" + "</tr>" + "<tr><td id='showShoesBrand'>" + 
						"<label>" + "<input type='radio' name='streetShoes_radio' value='골든구스' onclick='selectShoesBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/goldengoose/shoes/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='streetShoes_radio' value='구찌' onclick='selectShoesBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/gucci/shoes/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='streetShoes_radio' value='나이키' onclick='selectShoesBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/nike/shoes/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='streetShoes_radio' value='반스' onclick='selectShoesBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/vans/shoes/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='streetShoes_radio' value='발렌시아가' onclick='selectShoesBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/balenciaga/shoes/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='streetShoes_radio' value='발렌티노' onclick='selectShoesBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/valentino/shoes/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='streetShoes_radio' value='베트멍' onclick='selectShoesBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/vetements/shoes/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='streetShoes_radio' value='와이쓰리' onclick='selectShoesBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/y3/shoes/01.jpg' width='170' height='240'>" + "</label>" + 
						"</td></tr></table>" + "</td></tr></table></form>");
	}
	
	function backOuterBrand(){
		$("#outer").empty();
		$("#outer").append("<form name='home'>" + "<table><tr><td>" + "<table><tr><td>" + "<h3>겉옷</h3>" + "</td></tr>" + 
						"<tr id='outerBrand'>" + "</tr>" + "<tr><td id='showOuterBrand'>" + 
						"<label>" + "<input type='radio' name='streetOuter_radio' value='구찌' onclick='selectOuterBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/gucci/outer/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='streetOuter_radio' value='낫포너드' onclick='selectOuterBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/not4nerd/outer/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='streetOuter_radio' value='닐바렛' onclick='selectOuterBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/neilbarrett/outer/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='streetOuter_radio' value='마르셀로불론' onclick='selectOuterBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/marceloburlon/outer/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='streetOuter_radio' value='마틴로즈' onclick='selectOuterBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/martinrose/outer/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='streetOuter_radio' value='매스노운' onclick='selectOuterBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/massnoun/outer/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='streetOuter_radio' value='뮌' onclick='selectOuterBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/munn/outer/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='streetOuter_radio' value='발렌시아가' onclick='selectOuterBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/balenciaga/outer/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='streetOuter_radio' value='베트멍' onclick='selectOuterBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/vetements/outer/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='streetOuter_radio' value='슈프림' onclick='selectOuterBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/supreme/outer/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='streetOuter_radio' value='스톤아일랜드' onclick='selectOuterBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/stoneisland/outer/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='streetOuter_radio' value='스티그마' onclick='selectOuterBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/stigma/outer/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='streetOuter_radio' value='씨피컴퍼니' onclick='selectOuterBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/cpcompany/outer/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='streetOuter_radio' value='아미리' onclick='selectOuterBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/amiri/outer/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='streetOuter_radio' value='알파인더스트리' onclick='selectOuterBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/alphaindustries/outer/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='streetOuter_radio' value='엘엠씨' onclick='selectOuterBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/lmc/outer/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='streetOuter_radio' value='오베이' onclick='selectOuterBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/obey/outer/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='streetOuter_radio' value='오에이엠씨' onclick='selectOuterBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/oamc/outer/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='streetOuter_radio' value='오프화이트' onclick='selectOuterBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/offwhite/outer/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='streetOuter_radio' value='챔피언' onclick='selectOuterBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/champion/outer/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='streetOuter_radio' value='킬리자로' onclick='selectOuterBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/kilijaro/outer/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='streetOuter_radio' value='팔칠엠엠서울' onclick='selectOuterBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/87mm/outer/01.jpg' width='170' height='240'>" + "</label>" + 
						"</td></tr></table>" + "</td></tr></table></form>");
	}
</script>
</head>
<body>
	<div id="street">
		<h1>스트릿</h1>
		<table>
			<c:forEach items="${streetList}" var="recommed">
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
									<label><input type='radio' name='streetTop_radio' value='갭' onclick='selectTopBrand(this)'>
									<img src="/sesoc/resources/img/brand/gap/inner/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='streetTop_radio' value='구찌' onclick='selectTopBrand(this)'>
									<img src="/sesoc/resources/img/brand/gucci/inner/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='streetTop_radio' value='낫포너드' onclick='selectTopBrand(this)'>
									<img src="/sesoc/resources/img/brand/not4nerd/inner/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='streetTop_radio' value='닐바렛' onclick='selectTopBrand(this)'>
									<img src="/sesoc/resources/img/brand/neilbarrett/inner/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='streetTop_radio' value='랑데부' onclick='selectTopBrand(this)'>
									<img src="/sesoc/resources/img/brand/rendezvouz/inner/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='streetTop_radio' value='마르셀로불론' onclick='selectTopBrand(this)'>
									<img src="/sesoc/resources/img/brand/marceloburlon/inner/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='streetTop_radio' value='마틴로즈' onclick='selectTopBrand(this)'>
									<img src="/sesoc/resources/img/brand/martinrose/inner/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='streetTop_radio' value='매스노운' onclick='selectTopBrand(this)'>
									<img src="/sesoc/resources/img/brand/massnoun/inner/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='streetTop_radio' value='뮌' onclick='selectTopBrand(this)'>
									<img src="/sesoc/resources/img/brand/munn/inner/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='streetTop_radio' value='발렌시아가' onclick='selectTopBrand(this)'>
									<img src="/sesoc/resources/img/brand/balenciaga/inner/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='streetTop_radio' value='베트멍' onclick='selectTopBrand(this)'>
									<img src="/sesoc/resources/img/brand/vetements/inner/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='streetTop_radio' value='슈프림' onclick='selectTopBrand(this)'>
									<img src="/sesoc/resources/img/brand/supreme/inner/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='streetTop_radio' value='스톤아일랜드' onclick='selectTopBrand(this)'>
									<img src="/sesoc/resources/img/brand/stoneisland/inner/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='streetTop_radio' value='스티그마' onclick='selectTopBrand(this)'>
									<img src="/sesoc/resources/img/brand/stigma/inner/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='streetTop_radio' value='쓰래셔' onclick='selectTopBrand(this)'>
									<img src="/sesoc/resources/img/brand/thrasher/inner/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='streetTop_radio' value='씨피컴퍼니' onclick='selectTopBrand(this)'>
									<img src="/sesoc/resources/img/brand/cpcompany/inner/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='streetTop_radio' value='아미리' onclick='selectTopBrand(this)'>
									<img src="/sesoc/resources/img/brand/amiri/inner/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='streetTop_radio' value='엘엠씨' onclick='selectTopBrand(this)'>
									<img src="/sesoc/resources/img/brand/lmc/inner/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='streetTop_radio' value='오베이' onclick='selectTopBrand(this)'>
									<img src="/sesoc/resources/img/brand/obey/inner/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='streetTop_radio' value='오에이엠씨' onclick='selectTopBrand(this)'>
									<img src="/sesoc/resources/img/brand/oamc/inner/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='streetTop_radio' value='오프화이트' onclick='selectTopBrand(this)'>
									<img src="/sesoc/resources/img/brand/offwhite/inner/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='streetTop_radio' value='챔피언' onclick='selectTopBrand(this)'>
									<img src="/sesoc/resources/img/brand/champion/inner/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='streetTop_radio' value='킬리자로' onclick='selectTopBrand(this)'>
									<img src="/sesoc/resources/img/brand/kilijaro/inner/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='streetTop_radio' value='팔칠엠엠서울' onclick='selectTopBrand(this)'>
									<img src="/sesoc/resources/img/brand/87mm/inner/01.jpg" width='170' height='240'></label>
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
									<label><input type='radio' name='streetBottom_radio' value='구찌' onclick='selectBottomBrand(this)'>
									<img src="/sesoc/resources/img/brand/gucci/pants/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='streetBottom_radio' value='낫포너드' onclick='selectBottomBrand(this)'>
									<img src="/sesoc/resources/img/brand/not4nerd/pants/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='streetBottom_radio' value='닐바렛' onclick='selectBottomBrand(this)'>
									<img src="/sesoc/resources/img/brand/neilbarrett/pants/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='streetBottom_radio' value='랑데부' onclick='selectBottomBrand(this)'>
									<img src="/sesoc/resources/img/brand/rendezvouz/pants/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='streetBottom_radio' value='마르셀로불론' onclick='selectBottomBrand(this)'>
									<img src="/sesoc/resources/img/brand/marceloburlon/pants/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='streetBottom_radio' value='마틴로즈' onclick='selectBottomBrand(this)'>
									<img src="/sesoc/resources/img/brand/martinrose/pants/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='streetBottom_radio' value='매스노운' onclick='selectBottomBrand(this)'>
									<img src="/sesoc/resources/img/brand/massnoun/pants/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='streetBottom_radio' value='발렌시아가' onclick='selectBottomBrand(this)'>
									<img src="/sesoc/resources/img/brand/balenciaga/pants/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='streetBottom_radio' value='스톤아일랜드' onclick='selectBottomBrand(this)'>
									<img src="/sesoc/resources/img/brand/stoneisland/pants/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='streetBottom_radio' value='스티그마' onclick='selectBottomBrand(this)'>
									<img src="/sesoc/resources/img/brand/stigma/pants/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='streetBottom_radio' value='씨피컴퍼니' onclick='selectBottomBrand(this)'>
									<img src="/sesoc/resources/img/brand/cpcompany/pants/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='streetBottom_radio' value='아미리' onclick='selectBottomBrand(this)'>
									<img src="/sesoc/resources/img/brand/amiri/pants/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='streetBottom_radio' value='엘엠씨' onclick='selectBottomBrand(this)'>
									<img src="/sesoc/resources/img/brand/lmc/pants/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='streetBottom_radio' value='오베이' onclick='selectBottomBrand(this)'>
									<img src="/sesoc/resources/img/brand/obey/pants/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='streetBottom_radio' value='오에이엠씨' onclick='selectBottomBrand(this)'>
									<img src="/sesoc/resources/img/brand/oamc/pants/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='streetBottom_radio' value='오프화이트' onclick='selectBottomBrand(this)'>
									<img src="/sesoc/resources/img/brand/offwhite/pants/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='streetBottom_radio' value='챔피언' onclick='selectBottomBrand(this)'>
									<img src="/sesoc/resources/img/brand/champion/pants/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='streetBottom_radio' value='킬리자로' onclick='selectBottomBrand(this)'>
									<img src="/sesoc/resources/img/brand/kilijaro/pants/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='streetBottom_radio' value='팔칠엠엠서울' onclick='selectBottomBrand(this)'>
									<img src="/sesoc/resources/img/brand/87mm/pants/01.jpg" width='170' height='240'></label>
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
									<label><input type='radio' name='streetShoes_radio' value='골든구스' onclick='selectShoesBrand(this)'>
									<img src="/sesoc/resources/img/brand/goldengoose/shoes/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='streetShoes_radio' value='구찌' onclick='selectShoesBrand(this)'>
									<img src="/sesoc/resources/img/brand/gucci/shoes/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='streetShoes_radio' value='나이키' onclick='selectShoesBrand(this)'>
									<img src="/sesoc/resources/img/brand/nike/shoes/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='streetShoes_radio' value='반스' onclick='selectShoesBrand(this)'>
									<img src="/sesoc/resources/img/brand/vans/shoes/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='streetShoes_radio' value='발렌시아가' onclick='selectShoesBrand(this)'>
									<img src="/sesoc/resources/img/brand/balenciaga/shoes/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='streetShoes_radio' value='발렌티노' onclick='selectShoesBrand(this)'>
									<img src="/sesoc/resources/img/brand/valentino/shoes/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='streetShoes_radio' value='베트멍' onclick='selectShoesBrand(this)'>
									<img src="/sesoc/resources/img/brand/vetements/shoes/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='streetShoes_radio' value='와이쓰리' onclick='selectShoesBrand(this)'>
									<img src="/sesoc/resources/img/brand/y3/shoes/01.jpg" width='170' height='240'></label>
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
									<label><input type='radio' name='streetOuter_radio' value='구찌' onclick='selectOuterBrand(this)'>
									<img src="/sesoc/resources/img/brand/gucci/outer/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='streetOuter_radio' value='낫포너드' onclick='selectOuterBrand(this)'>
									<img src="/sesoc/resources/img/brand/not4nerd/outer/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='streetOuter_radio' value='닐바렛' onclick='selectOuterBrand(this)'>
									<img src="/sesoc/resources/img/brand/neilbarrett/outer/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='streetOuter_radio' value='마르셀로불론' onclick='selectOuterBrand(this)'>
									<img src="/sesoc/resources/img/brand/marceloburlon/outer/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='streetOuter_radio' value='마틴로즈' onclick='selectOuterBrand(this)'>
									<img src="/sesoc/resources/img/brand/martinrose/outer/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='streetOuter_radio' value='매스노운' onclick='selectOuterBrand(this)'>
									<img src="/sesoc/resources/img/brand/massnoun/outer/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='streetOuter_radio' value='뮌' onclick='selectOuterBrand(this)'>
									<img src="/sesoc/resources/img/brand/munn/outer/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='streetOuter_radio' value='발렌시아가' onclick='selectOuterBrand(this)'>
									<img src="/sesoc/resources/img/brand/balenciaga/outer/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='streetOuter_radio' value='베트멍' onclick='selectOuterBrand(this)'>
									<img src="/sesoc/resources/img/brand/vetements/outer/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='streetOuter_radio' value='슈프림' onclick='selectOuterBrand(this)'>
									<img src="/sesoc/resources/img/brand/supreme/outer/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='streetOuter_radio' value='스톤아일랜드' onclick='selectOuterBrand(this)'>
									<img src="/sesoc/resources/img/brand/stoneisland/outer/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='streetOuter_radio' value='스티그마' onclick='selectOuterBrand(this)'>
									<img src="/sesoc/resources/img/brand/stigma/outer/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='streetOuter_radio' value='씨피컴퍼니' onclick='selectOuterBrand(this)'>
									<img src="/sesoc/resources/img/brand/cpcompany/outer/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='streetOuter_radio' value='아미리' onclick='selectOuterBrand(this)'>
									<img src="/sesoc/resources/img/brand/amiri/outer/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='streetOuter_radio' value='알파인더스트리' onclick='selectOuterBrand(this)'>
									<img src="/sesoc/resources/img/brand/alphaindustries/outer/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='streetOuter_radio' value='엘엠씨' onclick='selectOuterBrand(this)'>
									<img src="/sesoc/resources/img/brand/lmc/outer/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='streetOuter_radio' value='오베이' onclick='selectOuterBrand(this)'>
									<img src="/sesoc/resources/img/brand/obey/outer/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='streetOuter_radio' value='오에이엠씨' onclick='selectOuterBrand(this)'>
									<img src="/sesoc/resources/img/brand/oamc/outer/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='streetOuter_radio' value='오프화이트' onclick='selectOuterBrand(this)'>
									<img src="/sesoc/resources/img/brand/offwhite/outer/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='streetOuter_radio' value='챔피언' onclick='selectOuterBrand(this)'>
									<img src="/sesoc/resources/img/brand/champion/outer/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='streetOuter_radio' value='킬리자로' onclick='selectOuterBrand(this)'>
									<img src="/sesoc/resources/img/brand/kilijaro/outer/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='streetOuter_radio' value='팔칠엠엠서울' onclick='selectOuterBrand(this)'>
									<img src="/sesoc/resources/img/brand/87mm/outer/01.jpg" width='170' height='240'></label>
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
			<a href="javascript:viewstreet()">코디 완료</a>
	</div>
</body>
</html>