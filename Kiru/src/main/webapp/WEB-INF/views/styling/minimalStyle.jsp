<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="content-type" content="text/html; charset=utf-8">
    <meta name="author" content="INSPIRO">
    <meta name="description" content="Themeforest Template Polo">
    <!-- Document title -->
    <!-- Stylesheets & Fonts -->
    <link href="/sesoc/resources/css/plugins.css" rel="stylesheet">
    <link href="/sesoc/resources/css/style.css" rel="stylesheet">
    <link href="/sesoc/resources/css/responsive.css" rel="stylesheet">
    <link href="/sesoc/resources/css/css.css" rel="stylesheet"/>
<style id="fit-vids-style">.fluid-width-video-wrapper{width:100%;position:relative;padding:0;}.fluid-width-video-wrapper iframe,.fluid-width-video-wrapper object,.fluid-width-video-wrapper embed {position:absolute;top:0;left:0;width:100%;height:100%;}</style></head>
<meta charset="UTF-8">
<title>미니멀 스타일링</title>
<style>
	div.marg div {
		margin: auto;
	}
	
	#complete div.col-lg-6 {
		margin: 0px auto;
		padding: 5px;
	}
	#complete div.col-lg-3, #complete div.col-lg-2 {
		margin: auto;
	}
	#complete a {
		font-size: large;
	}
	
</style>

<script src="/sesoc/resources/js/jquery-3.4.1.js"></script>
<script>
	var top_brand_name;
	var bottom_brand_name;
	var shoes_brand_name;
	var outer_brand_name;
		
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
	
	function viewminimal() {
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
			url:"viewminimal",
			type:"GET",
			dataType:"json",
			data: {"bottom_num":bottom_num, "top_num":top_num, "outer_num":outer_num, "shoes_num":shoes_num},
			success: function(result) {
				$("#minimal").empty();
				$("#top").empty();
				$("#bottom").empty();
				$("#shoes").empty();
				$("#outer").empty();
				$("#complete").empty();
				$(result).each(function(index,item) {
					$("#minimal").append("<img src=" + item + " width='170' height='240' >" + "<br>");
				})
				$("#minimal").append("<form name='mylist'>" + "<input type='hidden' name='top_num' value='" + top_num + "'>" + 
									"<input type='hidden' name='bottom_num' value='" + bottom_num + "'>" + 
									"<input type='hidden' name='outer_num' value='" + outer_num + "'>" + 
									"<input type='hidden' name='shoes_num' value='" + shoes_num + "'>" + 
									"<br>" + "<a href='javascript:backcoor()'>" + "코디 다시하기" + "</a>" + "&nbsp" +
									"<a href='javascript:minimalmylist()'>" + "마이리스트 등록" + "</a>" + "</form>");
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

	function selectTopBrand(temp) {
		top_brand_name = temp.value;
		
		$("#topBrand").empty();
		$("#topBrand").append("<a href='javascript:brandInner()'>" + "<input type='hidden' name='brand_name' value='" + top_brand_name + "'>" + top_brand_name + "</a>");
	}
	
	function selectBottomBrand(temp) {
		bottom_brand_name = temp.value;
		
		$("#bottomBrand").empty();
		$("#bottomBrand").append("<a href='javascript:brandBottom()'>" + "<input type='hidden' name='brand_name' value='" + bottom_brand_name + "'>" + bottom_brand_name + "</a>");
	}
	
	function selectShoesBrand(temp) {
		shoes_brand_name = temp.value;
		
		$("#shoesBrand").empty();
		$("#shoesBrand").append("<a href='javascript:brandShoes()'>" + "<input type='hidden' name='brand_name' value='" + shoes_brand_name + "'>" + shoes_brand_name + "</a>");
	}
	
	function selectOuterBrand(temp) {
		outer_brand_name = temp.value;
		
		$("#outerBrand").empty();
		$("#outerBrand").append("<a href='javascript:brandOuter()'>" + "<input type='hidden' name='brand_name' value='" + outer_brand_name + "'>" + outer_brand_name + "</a>");
	}
	
	function brandInner(){
		$.ajax({
			url:"minimalTopBrandList",
			type:"GET",
			dataType:"json",
			data:{"brand_name":top_brand_name},
			success: function(result) {
				var temp = 0.0;
				$("#topBrand").empty();
				$("#topBrand").append("<a href='javascript:backBrandList(\"상의\");'>뒤로</a>&nbsp&nbsp" + top_brand_name);
				
				$("#top-owl-stage-div").empty();
				$(result).each(function(index,item) {
					temp += 250.2;
					$("#top-owl-stage-div").append("<div class='owl-item' style='width: 250.2px;'>" +
							"<label><input type='radio' name='top_radio' value='" + item.top_num + "' onclick='selectTop(this)'>" +
									"<img src=" + item.top_photo_name + " >" + "</label>" + 
									"</div>");
				});
				$("#top-owl-stage-div").css("width",temp);
				$("#top-owl-stage-div").css("transform","translate3d(0px, 0px, 0px)");
				$("#top-owl-stage-div").css("transition","all 0s ease 0s");
			},
			error: function() {
				alert("error");
			}
		})
	}
	
	function brandBottom(){
		$.ajax({
			url:"minimalBottomBrandList",
			type:"GET",
			dataType:"json",
			data:{"brand_name":bottom_brand_name},
			success: function(result) {
				var temp = 0.0;
				$("#bottomBrand").empty();
				$("#bottomBrand").append("<a href='javascript:backBrandList(\"하의\");'>뒤로</a>&nbsp&nbsp" + bottom_brand_name);
				
				$("#bottom-owl-stage-div").empty();
				$(result).each(function(index,item) {
					temp += 250.2;
					$("#bottom-owl-stage-div").append("<div class='owl-item' style='width: 250.2px;'>" +
							"<label><input type='radio' name='bottom_radio' value='" + item.bottom_num + "' onclick='selectBottom(this)'>" +
										"<img src=" + item.bottom_photo_name + " >" + "</label>" + 
										"</div>");
				});
				$("#bottom-owl-stage-div").css("width",temp);
				$("#bottom-owl-stage-div").css("transform","translate3d(0px, 0px, 0px)");
				$("#bottom-owl-stage-div").css("transition","all 0s ease 0s");
			},
			error: function() {
				alert("error");
			}
		})
	} 
	
	function brandShoes(){
		$.ajax({
			url:"minimalShoesBrandList",
			type:"GET",
			dataType:"json",
			data:{"brand_name":shoes_brand_name},
			success: function(result) {
				var temp = 0.0;
				$("#shoesBrand").empty();
				$("#shoesBrand").append("<a href='javascript:backBrandList(\"신발\");'>뒤로</a>&nbsp&nbsp" + shoes_brand_name);
				
				$("#shoes-owl-stage-div").empty();
				$(result).each(function(index,item){
					temp += 250.2;
					$("#shoes-owl-stage-div").append("<div class='owl-item' style='width: 250.2px;'>" + 
							"<label><input type='radio' name='shoes_radio' value='" + item.shoes_num + "' onclick='selectShoes(this)'>" +
											"<img src=" + item.shoes_photo_name + " >" + "</label>" +
											"</div>");
				});
				$("#shoes-owl-stage-div").css("width",temp);
				$("#shoes-owl-stage-div").css("transform","translate3d(0px, 0px, 0px)");
				$("#shoes-owl-stage-div").css("transition","all 0s ease 0s");
			},
			error: function() {
				alert("error");
			}
		})
	}
	
	function brandOuter(){
		$.ajax({
			url:"minimalOuterBrandList",
			type:"GET",
			dataType:"json",
			data:{"brand_name":outer_brand_name},
			success: function(result) {
				var temp = 0.0;
				$("#outerBrand").empty();
				$("#outerBrand").append("<a href='javascript:backBrandList(\"겉옷\");'>뒤로</a>&nbsp&nbsp" + outer_brand_name);
				
				$("#outer-owl-stage-div").empty();
				$(result).each(function(index,item) {
					temp += 250.2;
					$("#outer-owl-stage-div").append("<div class='owl-item' style='width: 250.2px;'>" + 
							"<label><input type='radio' name='outer_radio' value='" + item.outer_num + "' onclick='selectOuter(this)'>" +
											"<img src=" + item.outer_photo_name + "  >" + "</label>" +
											"</div>");
				});
				$("#outer-owl-stage-div").css("width",temp);
				$("#outer-owl-stage-div").css("transform","translate3d(0px, 0px, 0px)");
				$("#outer-owl-stage-div").css("transition","all 0s ease 0s");
			},
			error: function() {
				alert("error");
			}
		})
	}
	
	function backTopBrand(){
		$("#top").empty();
		$("#top").append("<h3>상의</h3>" +
						"<div id='topBrand'>" + "</div>" + "<div id='showTopBrand'>" + 
						"<c:forEach items='${topList}' var='list'>" + 
						"<label>" + "<input type='radio' name='minimalTop_radio' value='${list.brand_name}' onclick='selectTopBrand(this)'>" + 
						"<img src='${list.top_photo_name}' width='170' height='240'>" + "</label>" + "</c:forEach>" + 
						"</div>");
	}
	
	function backBottomBrand(){
		$("#bottom").empty();
		$("#bottom").append("<h3>하의</h3>" +
						"<div id='bottomBrand'>" + "</div>" + "<div id='showBottomBrand'>" + 
						"<c:forEach items='${bottomList}' var='list'>" + 
						"<label>" + "<input type='radio' name='minimalBottom_radio' value='${list.brand_name}' onclick='selectBottomBrand(this)'>" + 
						"<img src='${list.bottom_photo_name}' width='170' height='240'>" + "</label>" + "</c:forEach>" + 
						"</div>");
	}
	
	function backShoesBrand(){
		$("#shoes").empty();
		$("#shoes").append("<h3>신발</h3>" +
						"<div id='shoesBrand'>" + "</div>" + "<div id='showShoesBrand'>" + 
						"<c:forEach items='${shoesList}' var='list'>" + 
						"<label>" + "<input type='radio' name='minimalShoes_radio' value='${list.brand_name}' onclick='selectShoesBrand(this)'>" + 
						"<img src='${list.shoes_photo_name}' width='170' height='240'>" + "</label>" + "</c:forEach>" + 
						"</div>");
	}
	
	function backBrandList( parts ){
		
		switch ( parts ) {
		case "상의" :
			$("#topBrand").empty();
			$("#top-owl-stage-div").empty();
			$("#top-owl-stage-div").append(
				"<c:forEach items='${topList}' var='list'>" + 
					"<div class='owl-item' style='width: 250.2px;'>" + 
					"<label><input type='radio' name='minimalTop_radio' value='${list.brand_name}' onclick='selectTopBrand(this)'> <img src='${list.top_photo_name}'></label>" + 
					"</div>" +
				"</c:forEach>"
			);
			$("#top-owl-stage-div").css("transform","translate3d(0px, 0px, 0px)");
			$("#top-owl-stage-div").css("transition","all 0s ease 0s");
			$("#top-owl-stage-div").css("width","6260");
			break;
		
		case "하의" :
			$("#bottomBrand").empty();
			$("#bottom-owl-stage-div").empty();
			$("#bottom-owl-stage-div").append(
				"<c:forEach items='${bottomList}' var='list'>" + 
					"<div class='owl-item' style='width: 250.2px;'>" + 
					"<label><input type='radio' name='minimalBottom_radio' value='${list.brand_name}' onclick='selectBottomBrand(this)'> <img src='${list.bottom_photo_name}'></label>" + 
					"</div>" +
				"</c:forEach>"
			);
			$("#bottom-owl-stage-div").css("transform","translate3d(0px, 0px, 0px)");
			$("#bottom-owl-stage-div").css("transition","all 0s ease 0s");
			$("#bottom-owl-stage-div").css("width","6010");
			break;
		
		case "신발" :
			$("#shoesBrand").empty();
			$("#shoes-owl-stage-div").empty();
			$("#shoes-owl-stage-div").append(
				"<c:forEach items='${shoesList}' var='list'>" + 
					"<div class='owl-item' style='width: 250.2px;'>" + 
					"<label><input type='radio' name='minimalShoes_radio' value='${list.brand_name}' onclick='selectShoesBrand(this)'> <img src='${list.shoes_photo_name}'></label>" + 
					"</div>" +
				"</c:forEach>"
			);
			$("#shoes-owl-stage-div").css("transform","translate3d(0px, 0px, 0px)");
			$("#shoes-owl-stage-div").css("transition","all 0s ease 0s");
			$("#shoes-owl-stage-div").css("width","3758");
			break;
		
		case "겉옷" :
			var temp = 0.0;
			$("#outerBrand").empty();
			$("#outer-owl-stage-div").empty();
			$("#outer-owl-stage-div").append(
				"<c:forEach items='${outerList}' var='list'>" +
					"<div class='owl-item' style='width: 250.2px;'>" +
					"<label><input type='radio' name='minimalOuter_radio' value='${list.brand_name}' onclick='selectOuterBrand(this)'> <img src='${list.outer_photo_name}'></label>" +
					"</div>" +
				"</c:forEach>"
			);
			$("#outer-owl-stage-div").css("transform","translate3d(0px, 0px, 0px)");
			$("#outer-owl-stage-div").css("transition","all 0s ease 0s");
			$("#outer-owl-stage-div").css("width", "6010" );
			break;
		};
	}
</script>
</head>
<body class="breakpoint-xs">
	<div class="body-inner">
		
		
		<!-- HEADER -->
        <header id="header" data-fullwidth="true" class="header-disable-fixed">
			<div class="header-inner">
				<div class="container">
				
					<div id="logo">
						<a href="/sesoc/" class="logo" data-src-dark="/sesoc/resources/img/css/logo.png">
							<img src="/sesoc/resources/img/css/logo.png" alt="Polo Logo">
						</a>
					</div>
		
					<div id="mainMenu-trigger">
						<button class="lines-button x"> <span class="lines"></span> </button>
					</div>
		
					<div id="mainMenu">
						<div class="container">
							<nav>
								<ul>
								
									<li><a href="/sesoc/">메인화면</a></li>
									<li class="dropdown"><a href="#">추천 의상</a>
										<ul class="dropdown-menu" style="">
											<li><a href="/sesoc/member/bodychkForm">체형 입력</a></li>
											<li><a href="/sesoc/styling/selectGenre">추천 의상 선택</a></li>
										</ul>
									</li>
									<li><a href="/sesoc/board/boardList">게시판</a></li>
									<li><a href="/sesoc/styling/myList">찜 의상</a></li>
									
									<li><a href="/sesoc/member/logout">로그아웃</a></li>
									
								</ul>
							</nav>
						</div>
					</div>
		
				</div>
			</div>
		</header>
        <!-- END: HEADER -->
        
        
        <!-- Page title -->
            <section id="page-title" class="dark" style="background-image:url(/sesoc/resources/images/pattern/pattern10.png)">
                <div class="container">
                    <div class="breadcrumb">
                        <ul>
                            <li>KIRU</li>
                        </ul>
                    </div>
                    <div class="page-title">
                        <h1>미니멀 의상</h1>
                        <span>원하는 의상을 선택하여 My List에 추가해 보세요!</span>
                    </div>
                </div>
            </section>
            <!-- end: Page title -->
		
		
		<!-- SECTION -->
		<section id="page-content">
		<div class="row marg">
 		<div class="content col-lg-10">
				<div id="minimal">
					<div>
					<div
						class="carousel carousel-loaded owl-carousel owl-loaded owl-drag"
						data-items="5" data-dots="false">
						<div class="owl-stage-outer">
							<div class="owl-stage"
								style="transform: translate3d(0px, 0px, 0px); transition: all 0s ease 0s; width: 800px;">
									<c:forEach items="${minimalList}" var="recommed">
										<div class="owl-item"
												style="width: 207.2px; margin-right: 20px;">
												<label><img src="${recommed.recommed_photo_name}" width="170" height="240"></label>
											</div>
									</c:forEach>
							</div>
						</div>
						<div class="owl-nav">
							<button type="button" role="presentation" class="owl-prev">
								<i class="icon-chevron-left1"></i>
							</button>
							<button type="button" role="presentation" class="owl-next">
								<i class="icon-chevron-right1"></i>
							</button>
						</div>
					</div>
					</div>
					<div class="owl-dots disabled"></div>
				</div>
				</div>

				
				<div class="content col-lg-10">
					<div id="top">
						<h3>상의</h3>
						<div id="topBrand"></div>
							<div id="showTopBrand">
								<div class="carousel carousel-loaded owl-carousel owl-loaded owl-drag"
									data-items="5" data-dots="false">
									<div class="owl-stage-outer">
										<div class="owl-stage" id="top-owl-stage-div" style="transform: translate3d(0px, 0px, 0px); transition: all 0s ease 0s; width: 800px;">
											<c:forEach items="${topList}" var="list">
												<div class="owl-item" style="width: 207.2px; margin-right: 20px;">
													<label><input type='radio' name='minimalTop_radio' value='${list.brand_name}' onclick='selectTopBrand(this)'>
														<img src="${list.top_photo_name}" ></label>
												</div>
											</c:forEach>
										</div>
									</div>
									<div class="owl-nav">
										<button type="button" role="presentation" class="owl-prev">
											<i class="icon-chevron-left1"></i>
										</button>
										<button type="button" role="presentation" class="owl-next">
											<i class="icon-chevron-right1"></i>
										</button>
									</div>
								</div>
							</div>
							<div class="owl-dots disabled"></div>
						</div>
					</div>

					<div class="content col-lg-10">
						<div id="bottom">
							<h3>하의</h3>
							<div id="bottomBrand"></div>
							<div id="showBottomBrand">
								<div class="carousel carousel-loaded owl-carousel owl-loaded owl-drag"
									data-items="5" data-dots="false">
									<div class="owl-stage-outer">
										<div class="owl-stage" id="bottom-owl-stage-div" style="transform: translate3d(0px, 0px, 0px); transition: all 0s ease 0s; width: 800px;">
											<c:forEach items="${bottomList}" var="list">
												<div class="owl-item" style="width: 207.2px; margin-right: 20px;">
													<label><input type='radio' name='minimalBottom_radio' value='${list.brand_name}' onclick='selectBottomBrand(this)'>
														<img src="${list.bottom_photo_name}"></label>
												</div>
											</c:forEach>
										</div>
									</div>
									<div class="owl-nav">
										<button type="button" role="presentation" class="owl-prev">
											<i class="icon-chevron-left1"></i>
										</button>
										<button type="button" role="presentation" class="owl-next">
											<i class="icon-chevron-right1"></i>
										</button>
									</div>
								</div>
							</div>
							<div class="owl-dots disabled"></div>
						</div>
					</div>

					<div class="content col-lg-10">
						<div id="shoes">
							<h3>신발</h3>
							<div id="shoesBrand"></div>
							<div id="showShoesBrand">
								<div class="carousel carousel-loaded owl-carousel owl-loaded owl-drag"
									data-items="5" data-dots="false">
									<div class="owl-stage-outer">
										<div class="owl-stage" id="shoes-owl-stage-div" style="transform: translate3d(0px, 0px, 0px); transition: all 0s ease 0s; width: 800px;">
											<c:forEach items="${shoesList}" var="list">
												<div class="owl-item" style="width: 207.2px; margin-right: 20px;">
													<label><input type='radio' name='minimalShoes_radio' value='${list.brand_name}' onclick='selectShoesBrand(this)'>
														<img src="${list.shoes_photo_name}"></label>
												</div>
											</c:forEach>
										</div>
									</div>
									<div class="owl-nav">
										<button type="button" role="presentation" class="owl-prev">
											<i class="icon-chevron-left1"></i>
										</button>
										<button type="button" role="presentation" class="owl-next">
											<i class="icon-chevron-right1"></i>
										</button>
									</div>
								</div>
							</div>
							<div class="owl-dots disabled"></div>
						</div>
					</div>

					<div class="content col-lg-10">
						<div id="outer">
							<h3>겉옷</h3>
							<div id="outerBrand"></div>
							<div id="showOuterBrand">
								<div class="carousel carousel-loaded owl-carousel owl-loaded owl-drag"
									data-items="5" data-dots="false">
									<div class="owl-stage-outer">
										<div class="owl-stage" id="outer-owl-stage-div" style="transform: translate3d(0px, 0px, 0px); transition: all 0s ease 0s; width: 800px;">
											<c:forEach items="${outerList}" var="list">
												<div class="owl-item" style="width: 207.2px; margin-right: 20px;">
													<label><input type='radio' name='minimalOuter_radio' value="${list.brand_name}" onclick='selectOuterBrand(this)'>
													<img src="${list.outer_photo_name}"></label>
												</div>
											</c:forEach>
										</div>
									</div>
									<div class="owl-nav">
										<button type="button" role="presentation" class="owl-prev">
											<i class="icon-chevron-left1"></i>
										</button>
										<button type="button" role="presentation" class="owl-next">
											<i class="icon-chevron-right1"></i>
										</button>
									</div>
								</div>
							</div>
							<div class="owl-dots disabled"></div>
						</div>
					</div>
					
					
				</div>
				
					<div id="complete">
						<div class="col-lg-6" >
							<div class="row" >
								<div class="col-lg-3" >
									<a class="btn btn-light" href="/sesoc/styling/selectGenre">장르선택으로 돌아가기</a>
								</div>
								<div class="col-lg-2" >
									<a class="btn btn-light" href="javascript:viewminimal()">코디 완료</a>
								</div>
							</div>
						</div>
					</div>
				</section>
			</div>
			<!-- SECTION:END -->
			
			
			<!-- Footer -->
		<footer id="footer">
			<div class="footer-content">
				<div class="container">
					<div class="row">
						<div class="col-md-4">
							<div class="icon-box effect small clean">
								<div class="icon">
								<a href="#"><i class="far fa-clock"></i></a>
								</div>
								<h3>Working Days</h3>
								<p><strong>Monday - Friday</strong>
								<br>09:00 AM - 10:00 PM</p>
								<p><strong>Saturday - Sunday</strong>
								<br>10:00 AM - 06:00 PM</p>
							</div>
						</div>
						<div class="col-md-4">
							<div class="icon-box effect small clean">
								<div class="icon">
									<a href="#"><i class="fas fa-map-marker-alt"></i></a>
								</div>
								<h3>Caffe Location</h3>
								<p><strong>Caffe Address:</strong>
									<br> 795 Folsom Ave, Suite 600
									<br> San Francisco, CA 94107
									<br>
									<br>
								</p>
							</div>
						</div>
						<div class="col-md-4">
							<div class="icon-box effect small clean">
								<div class="icon">
								<a href="#"><i class="fa fa-phone"></i></a>
								</div>
								<h3>Caffe Contact</h3>
									<p><strong>Phone:</strong>
										<br> (123) 456-7890
										<br> (987) 654-3210
										<br>
									</p>
							</div>
						</div>
					</div>
      			</div>
    		</div>
		    <div class="copyright-content">
		      <div class="container">
         
		         <div class="row">
		            <div class="col-lg-6">
		              <!-- Social icons -->
		              <div class="social-icons social-icons-colored float-left">
		                <ul>
		                    <li class="social-rss"><a href="#"><i class="fa fa-rss"></i></a></li>
		                  <li class="social-facebook"><a href="#"><i class="fab fa-facebook-f"></i></a></li>
		                  <li class="social-twitter"><a href="#"><i class="fab fa-twitter"></i></a></li>
		                  <li class="social-vimeo"><a href="#"><i class="fab fa-vimeo"></i></a></li>
		                  <li class="social-youtube"><a href="#"><i class="fab fa-youtube"></i></a></li>
		                  <li class="social-pinterest"><a href="#"><i class="fab fa-pinterest"></i></a></li>
		                  <li class="social-gplus"><a href="#"><i class="fab fa-google-plus-g"></i></a></li>
		                </ul>
		              </div>
		              <!-- end: Social icons --> 
		          </div>

					<div class="col-lg-6">
				<div class="copyright-text text-center">&copy; 2019 POLO -  Responsive Multi-Purpose HTML5 Template. All Rights Reserved.<a href="http://www.inspiro-media.com" target="_blank">INSPIRO</a> </div>
			</div>
		</div>
      </div>
    </div>
  </footer>
  <!-- end: Footer -->
			
			
	<!--Plugins-->
	<script src="/sesoc/resources/js/jquery.js"></script>
	<script src="/sesoc/resources/js/plugins.js"></script>

	<!--Template functions-->
	<script src="/sesoc/resources/js/functions.js"></script>
</body>
</html>