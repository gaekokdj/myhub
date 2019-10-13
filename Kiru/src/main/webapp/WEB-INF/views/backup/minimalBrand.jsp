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
	var bottom = $("[name=garmentpants_radio]:checked").val();
	var top = $("[name=garmentinner_radio]:checked").val();
	var outer = $("[name=garmentouter_radio]:checked").val();
	var shoes = $("[name=novestashoes_radio]:checked").val();
	
	var bottom_num;
	var top_num;
	var outer_num;
	var shoes_num;
	

	function backgenre() {
		location.href = "/sesoc/styling/selectGenre";
	}
	
	function backcoor() {
		window.location.reload(true);
	}
	
	function selectPan(temp) {
		bottom_num = temp.value;
	}
	
	function selectInn(temp) {
		top_num = temp.value;
	}
	
	function selectOut(temp) {
		outer_num = temp.value;
	}
	
	function selectSho(temp) {
		shoes_num = temp.value;
	}
	
	function minimalinner() {
		if(bottom_num === undefined) {
			alert("바지를 선택해주세요.");
			return false;
		}
		$("#clothes").empty();
		$("#clothes").append("<h2>상의</h2>" + "<form name='to'>" + "<table>" + "<tr><td>" + "<table>" + "<tr><td>" + "<h3>브랜드</h3>" + "</td></tr>" + 
							"<tr><td>" + "<a href='javascript:garmentlableinner()'>" + "가먼트레이블" + "</a>" + "</td></tr>" + 
							"<tr><td>" + "꼼데가르송" + "</td></tr>" + 
							"<tr><td>" + "던스트" + "</td></tr>" + "</table>" + "</td>" + 
							"<td>" + "<table id='brandinner'>" + "<tr><td>" + "</td></tr>" + "</table>" + "</td></tr>" + "</table>" + "</form>");
	}

	function minimalouter() {
		if(top_num === undefined) {
			alert("상의를 선택해주세요.");
			return false;
		}
		$("#clothes").empty();
		$("#clothes").append("<h2>겉옷</h2>" + "<form name='the'>" + "<table>" + "<tr><td>" + "<table>" + "<tr><td>" + "<h3>브랜드</h3>" + "</td></tr>" + 
				"<tr><td>" + "<a href='javascript:garmentlableouter()'>" + "가먼트레이블" + "</a>" + "</td></tr>" + 
				"<tr><td>" + "꼼데가르송" + "</td></tr>" + 
				"<tr><td>" + "던스트" + "</td></tr>" + "</table>" + "</td>" + 
				"<td>" + "<table id='brandouter'>" + "<tr><td>" + "</td></tr>" + "</table>" + "</td></tr>" + "</table>" + "</form>");
	}
	
	function minimalshoes() {
		if(outer_num === undefined) {
			alert("겉옷를 선택해주세요.");
			return false;
		}
		$("#clothes").empty();
		$("#clothes").append("<h2>신발</h2>" + "<form name='home'>" + "<table>" + "<tr><td>" + "<table>" + "<tr><td>" + "<h3>브랜드</h3>" + "</td></tr>" + 
				"<tr><td>" + "<a href='javascript:novestashoes()'>" + "노베스타" + "</a>" + "</td></tr>" + 
				"<tr><td>" + "돔바" + "</td></tr>" + 
				"<tr><td>" + "로스코" + "</td></tr>" + "</table>" + "</td>" + 
				"<td>" + "<table id='brandshoes'>" + "<tr><td>" + "</td></tr>" + "</table>" + "</td></tr>" + "</table>" + "</form>");
	}
	
	function viewminimal() {
		if(shoes_num === undefined) {
			alert("신발을 선택해주세요.");
			return false;
		}
		$.ajax({
			url:"viewminimal",
			type:"GET",
			dataType:"json",
			data: {"bottom_num":bottom_num, "top_num":top_num, "outer_num":outer_num, "shoes_num":shoes_num},
			success: function(result) {
				$("#minimal").empty();
				$("#clothes").empty();
				$(result).each(function(index,item) {
					$("#clothes").append("<img src=" + item + " width='250' height='350' >");
				})
				$("#clothes").append("<form name='mylist'>" + "<input type='hidden' name='top_num' value='" + top_num + "'>" + 
									"<input type='hidden' name='bottom_num' value='" + bottom_num + "'>" + 
									"<input type='hidden' name='outer_num' value='" + outer_num + "'>" + 
									"<input type='hidden' name='shoes_num' value='" + shoes_num + "'>" + 
									"<br>" + "<input type='button' value='코디 다시하기' onclick='backcoor()'>" +  
									"<input type='button' value='마이리스트 등록' onclick='minimalmylist()'>" + "</form>");
			},
			error: function() {
				alert("error");
			}
		})
	}
	
	function minimalmylist() {
		var form = document.mylist;
		form.action = "/sesoc/styling/addMyList";
		form.method = "POST";
		form.submit();
	}

	function garmentlablepants() {
		$.ajax({
			url:"garmentpantsList", 
			type:"GET", 
			dataType:"json", 
			success: function(result) {
				$("#brandpants").empty();
				$(result).each(function(index, item) {
					var num = 0;
					for(var i = 0 ; i < $(result).length ; i++) {
						num += 5;
						if(index == num) {
							$("#brandpants").append("<br>");
						}
					}
					$("#brandpants").append(
							"<label><input type='radio' name='garmentpants_radio' value='" + item.bottom_num + "' onclick='selectPan(this)'>" +
							"<img src=" + item.bottom_photo_name + " width='250' height='350' >" + "</label>"
					);
				});
				$("#brandpants").append("<tr><td>" + "<input type='button' value='리셋(장르 선택 페이지로)' onclick='backgenre()'>" +  
										"<input type='button' value='선택' onclick='minimalinner()'>" + "</td></tr>");
			},
			error: function() {
				alert("error");
			}
		});
	}
	
	function garmentlableinner() {
		$.ajax({
			url:"garmentinnerList", 
			type:"GET", 
			dataType:"json", 
			success: function(result) {
				$("#brandinner").empty();
				$(result).each(function(index, item) {
					var num = 0;
					for(var i = 0 ; i < $(result).length ; i++) {
						num += 5;
						if(index == num) {
							$("#brandinner").append("<br>");
						}
					}
					$("#brandinner").append(
							"<label><input type='radio' name='garmentinner_radio' value='" + item.top_num + "' onclick='selectInn(this)'>" +
							"<img src=" + item.top_photo_name + " width='250' height='350' >" + "</label>"
					);
				});
				$("#brandinner").append("<tr><td>" + "<input type='button' value='리셋(장르 선택 페이지로)' onclick='backgenre()'>" +  
										"<input type='button' value='선택' onclick='minimalouter()'>" + "</td></tr>");
			},
			error: function() {
				alert("error");
			}
		});
	}
	
	function garmentlableouter() {
		$.ajax({
			url:"garmentouterList", 
			type:"GET", 
			dataType:"json", 
			success: function(result) {
				$("#brandouter").empty();
				$(result).each(function(index, item) {
					var num = 0;
					for(var i = 0 ; i < $(result).length ; i++) {
						num += 5;
						if(index == num) {
							$("#brandouter").append("<br>");
						}
					}
					$("#brandouter").append(
							"<label><input type='radio' name='garmentouter_radio' value='" + item.outer_num + "' onclick='selectOut(this)'>" +
							"<img src=" + item.outer_photo_name + " width='250' height='350' >" + "</label>"
					);
				});
				$("#brandouter").append("<tr><td>" + "<input type='button' value='리셋(장르 선택 페이지로)' onclick='backgenre()'>" +  
										"<input type='button' value='선택' onclick='minimalshoes()'>" + "</td></tr>");
			},
			error: function() {
				alert("error");
			}
		});
	}
	
	function novestashoes(){
		$.ajax({
			url:"novestashoesList", 
			type:"GET", 
			dataType:"json", 
			success: function(result) {
				$("#brandshoes").empty();
				$(result).each(function(index, item) {
					var num = 0;
					for(var i = 0 ; i < $(result).length ; i++) {
						num += 5;
						if(index == num) {
							$("#brandshoes").append("<br>");
						}
					}
					$("#brandshoes").append(
							"<label><input type='radio' name='novestashoes_radio' value='" + item.shoes_num + "' onclick='selectSho(this)'>" +
							"<img src=" + item.shoes_photo_name + " width='250' height='350' >" + "</label>"
					);
				});
				$("#brandshoes").append("<tr><td>" + "<input type='button' value='리셋(장르 선택 페이지로)' onclick='backgenre()'>" +  
										"<input type='button' value='코디 완료' onclick='viewminimal()'>" + "</td></tr>");
			},
			error: function() {
				alert("error");
			}
		});
	}
</script>
</head>
<body>
	<div id="minimal">
		<h1>미니멀</h1>
		<table>
			<c:forEach items="${list}" var="list" begin="0" end="4">
				<th id="fashion1">
					<img src="${list.recommed_photo_name}" width='280' height='280'>
				</th>
			</c:forEach>
		</table>
	</div>
	
	<div id="clothes">	
		<h2>하의</h2>
		<form name="go">
		<table>
			<tr>
				<td>
					<table>
						<tr>
							<td><h3>브랜드</h3></td>
						</tr>
						<tr>
							<td><a href="javascript:garmentlablepants()">가먼트레이블</a></td>
						</tr>
						<tr>
							<td>꼼데가르송</td>
						</tr>
						<tr>
							<td>던스트</td>
						</tr>
					</table>
				</td>
				<td>
					<table id="brandpants">
						<tr>
							<td>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		</form>
	</div>
</body>
</html>