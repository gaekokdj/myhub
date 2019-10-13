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
	
	function viewworkwear() {
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
			url:"viewworkwear",
			type:"GET",
			dataType:"json",
			data: {"bottom_num":bottom_num, "top_num":top_num, "outer_num":outer_num, "shoes_num":shoes_num},
			success: function(result) {
				$("#workwear").empty();
				$("#top").empty();
				$("#bottom").empty();
				$("#shoes").empty();
				$("#outer").empty();
				$("#complete").empty();
				$(result).each(function(index,item) {
					$("#workwear").append("<img src=" + item + " width='170' height='240' >" + "<br>");
				})
				$("#workwear").append("<form name='mylist'>" + "<input type='hidden' name='top_num' value='" + top_num + "'>" + 
									"<input type='hidden' name='bottom_num' value='" + bottom_num + "'>" + 
									"<input type='hidden' name='outer_num' value='" + outer_num + "'>" + 
									"<input type='hidden' name='shoes_num' value='" + shoes_num + "'>" + 
									"<br>" + "<a href='javascript:backcoor()'>" + "코디 다시하기" + "</a>" + "&nbsp" +
									"<a href='javascript:workwearmylist()'>" + "마이리스트 등록" + "</a>" + "</form>");
			},
			error: function() {
				alert("error");
			}
		})
	}
	
	function workwearmylist() {
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
			url:"workwearTopBrandList",
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
			url:"workwearBottomBrandList",
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
			url:"workwearShoesBrandList",
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
			url:"workwearOuterBrandList",
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
						"<label>" + "<input type='radio' name='workwearTop_radio' value='러기드하우스' onclick='selectTopBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/ruggedhouse/inner/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='workwearTop_radio' value='벤데이비스' onclick='selectTopBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/bendavis/inner/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='workwearTop_radio' value='아웃스탠딩' onclick='selectTopBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/outstanding/inner/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='workwearTop_radio' value='칼하트' onclick='selectTopBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/carhartt/inner/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='workwearTop_radio' value='콘보이' onclick='selectTopBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/convoy/inner/01.jpg' width='170' height='240'>" + "</label>" + 
						"</td></tr></table>" + "</td></tr></table></form>");
	}
	
	function backBottomBrand(){
		$("#bottom").empty();
		$("#bottom").append("<form name='to'>" + "<table><tr><td>" + "<table><tr><td>" + "<h3>하의</h3>" + "</td></tr>" + 
						"<tr id='bottomBrand'>" + "</tr>" + "<tr><td id='showBottomBrand'>" + 
						"<label>" + "<input type='radio' name='workwearBottom_radio' value='벤데이비스' onclick='selectBottomBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/bendavis/pants/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='workwearBottom_radio' value='스탠레이' onclick='selectBottomBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/stanray/pants/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='workwearBottom_radio' value='아웃스탠딩' onclick='selectBottomBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/outstanding/pants/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='workwearBottom_radio' value='칼하트' onclick='selectBottomBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/carhartt/pants/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='workwearBottom_radio' value='콘보이' onclick='selectBottomBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/convoy/pants/01.jpg' width='170' height='240'>" + "</label>" + 
						"</td></tr></table>" + "</td></tr></table></form>");
	}
	
	function backShoesBrand(){
		$("#shoes").empty();
		$("#shoes").append("<form name='the'>" + "<table><tr><td>" + "<table><tr><td>" + "<h3>신발</h3>" + "</td></tr>" + 
						"<tr id='shoesBrand'>" + "</tr>" + "<tr><td id='showShoesBrand'>" + 
						"<label>" + "<input type='radio' name='workwearShoes_radio' value='닥터마틴' onclick='selectShoesBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/drmartens/shoes/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='workwearShoes_radio' value='레드윙' onclick='selectShoesBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/redwing/shoes/01.jpg' width='170' height='240'>" + "</label>" + 
						"</td></tr></table>" + "</td></tr></table></form>");
	}
	
	function backOuterBrand(){
		$("#outer").empty();
		$("#outer").append("<form name='home'>" + "<table><tr><td>" + "<table><tr><td>" + "<h3>겉옷</h3>" + "</td></tr>" + 
						"<tr id='outerBrand'>" + "</tr>" + "<tr><td id='showOuterBrand'>" + 
						"<label>" + "<input type='radio' name='workwearOuter_radio' value='러기드하우스' onclick='selectOuterBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/ruggedhouse/outer/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='workwearOuter_radio' value='벤데이비스' onclick='selectOuterBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/bendavis/outer/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='workwearOuter_radio' value='아웃스탠딩' onclick='selectOuterBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/outstanding/outer/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='workwearOuter_radio' value='칼하트' onclick='selectOuterBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/carhartt/outer/01.jpg' width='170' height='240'>" + "</label>" + 
						"<label>" + "<input type='radio' name='workwearOuter_radio' value='콘보이' onclick='selectOuterBrand(this)'>" + 
						"<img src='/sesoc/resources/img/brand/convoy/outer/01.jpg' width='170' height='240'>" + "</label>" + 
						"</td></tr></table>" + "</td></tr></table></form>");
	}
</script>
</head>
<body>
	<div id="workwear">
		<h1>워크웨어</h1>
		<table>
			<c:forEach items="${workwearList}" var="recommed">
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
									<label><input type='radio' name='workwearTop_radio' value='러기드하우스' onclick='selectTopBrand(this)'>
									<img src="/sesoc/resources/img/brand/ruggedhouse/inner/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='workwearTop_radio' value='벤데이비스' onclick='selectTopBrand(this)'>
									<img src="/sesoc/resources/img/brand/bendavis/inner/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='workwearTop_radio' value='아웃스탠딩' onclick='selectTopBrand(this)'>
									<img src="/sesoc/resources/img/brand/outstanding/inner/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='workwearTop_radio' value='칼하트' onclick='selectTopBrand(this)'>
									<img src="/sesoc/resources/img/brand/carhartt/inner/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='workwearTop_radio' value='콘보이' onclick='selectTopBrand(this)'>
									<img src="/sesoc/resources/img/brand/convoy/inner/01.jpg" width='170' height='240'></label>
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
									<label><input type='radio' name='workwearBottom_radio' value='벤데이비스' onclick='selectBottomBrand(this)'>
									<img src="/sesoc/resources/img/brand/bendavis/pants/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='workwearBottom_radio' value='스탠레이' onclick='selectBottomBrand(this)'>
									<img src="/sesoc/resources/img/brand/stanray/pants/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='workwearBottom_radio' value='아웃스탠딩' onclick='selectBottomBrand(this)'>
									<img src="/sesoc/resources/img/brand/outstanding/pants/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='workwearBottom_radio' value='칼하트' onclick='selectBottomBrand(this)'>
									<img src="/sesoc/resources/img/brand/carhartt/pants/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='workwearBottom_radio' value='콘보이' onclick='selectBottomBrand(this)'>
									<img src="/sesoc/resources/img/brand/convoy/pants/01.jpg" width='170' height='240'></label>
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
									<label><input type='radio' name='workwearShoes_radio' value='닥터마틴' onclick='selectShoesBrand(this)'>
									<img src="/sesoc/resources/img/brand/drmartens/shoes/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='workwearShoes_radio' value='레드윙' onclick='selectShoesBrand(this)'>
									<img src="/sesoc/resources/img/brand/redwing/shoes/01.jpg" width='170' height='240'></label>
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
									<label><input type='radio' name='workwearOuter_radio' value='러기드하우스' onclick='selectOuterBrand(this)'>
									<img src="/sesoc/resources/img/brand/ruggedhouse/outer/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='workwearOuter_radio' value='벤데이비스' onclick='selectOuterBrand(this)'>
									<img src="/sesoc/resources/img/brand/bendavis/outer/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='workwearOuter_radio' value='아웃스탠딩' onclick='selectOuterBrand(this)'>
									<img src="/sesoc/resources/img/brand/outstanding/outer/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='workwearOuter_radio' value='칼하트' onclick='selectOuterBrand(this)'>
									<img src="/sesoc/resources/img/brand/carhartt/outer/01.jpg" width='170' height='240'></label>
									<label><input type='radio' name='workwearOuter_radio' value='콘보이' onclick='selectOuterBrand(this)'>
									<img src="/sesoc/resources/img/brand/convoy/outer/01.jpg" width='170' height='240'></label>
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
			<a href="javascript:viewworkwear()">코디 완료</a>
	</div>
</body>
</html>