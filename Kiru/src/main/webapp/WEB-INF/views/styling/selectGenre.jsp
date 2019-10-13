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
<title>스타일링</title>

<style>
	#selectForm div.col-lg-6 {
		margin: 0px auto;
		padding: 5px;
	}
	#selectForm div.col-lg-3, #selectForm div.col-lg-2 {
		margin: auto;
	}
	#selectForm a {
		font-size: large;
	}
	input.l {
		width:30px;
		height:30px;
	}
	
</style>

<script src="/sesoc/resources/js/jquery-3.4.1.js"></script>
<script>
	var selectRadio;
	
	function selectDel(temp) {
		selectRadio = temp;
	}

	function thin_styling() {
		if(selectRadio === undefined) {
			alert("장르를 선택해주세요");
			return false;
		}
		
		var thfa = $("[name=thin_fashion]:checked").val();
		
		if(thfa === "minimal") {
			var form = document.go;
			form.action = "/sesoc/styling/minimalBrand";
			form.method = "post";
			form.submit();
		}
		
		if(thfa === "street") {
			var form = document.go;
			form.action = "/sesoc/styling/streetBrand";
			form.method = "post";
			form.submit();
		}
	}
	
	function fit_styling() {
		if(selectRadio === undefined) {
			alert("장르를 선택해주세요");
			return false;
		}
		
		var ffa = $("[name=fit_fashion]:checked").val();
		
		if(ffa === "classic") {
			var form = document.go;
			form.action = "/sesoc/styling/classicBrand";
			form.method = "post";
			form.submit();
		}
		
		if(ffa === "classiccasual") {
			var form = document.go;
			form.action = "/sesoc/styling/classicCasualBrand";
			form.method = "post";
			form.submit();
		}
	}
	
	function chubby_styling() {
		if(selectRadio === undefined) {
			alert("장르를 선택해주세요");
			return false;
		}
		
		var chfa = $("[name=chubby_fashion]:checked").val();
		
		if(chfa === "amecaji") {
			var form = document.go;
			form.action = "/sesoc/styling/amecajiBrand";
			form.method = "post";
			form.submit();
		}
		
		if(chfa === "workwear") {
			var form = document.go;
			form.action = "/sesoc/styling/workwearBrand";
			form.method = "post";
			form.submit();
		}
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
											<li><a href="/sesoc/styling/bodychkForm">체형 입력</a></li>
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
                        <h1>장르 선택</h1>
                        <span>원하는 장르를 선택하세요</span>
                    </div>
                </div>
            </section>
            <!-- end: Page title -->
	
	
		<section id="page-content">
			<div class="container">
						<div class="carousel carousel-loaded owl-carousel owl-loaded owl-drag"
							data-items="3" data-dots="false">
						<div class="owl-stage-outer">
							<div class="owl-stage"
								style="transform: translate3d(0px, 0px, 0px); transition: all 0s ease 0s; width: 1591px;">
								<c:forEach items="${list}" var="list" begin="0" end="4">
									<div class="owl-item"
										style="width: 207.2px; margin-right: 20px;">
										<img src="${list.recommed_photo_name}">
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
						<div class="owl-dots disabled"></div>
						</div>






						<c:if test="${user.user_body_type eq 'I'}">
						<div class="col-lg-3 text-medium m-3" >
							<input type='radio' class="l" name='thin_fashion' value='minimal'
								onclick='selectDel(this)'>미니멀
						</div>
		</c:if>
						<c:if test="${user.user_body_type eq 'O'}">
						<div class="col-lg-3 text-medium m-3" >
							<input type='radio' class="l" name='chubby_fashion' value='amecaji'
								onclick='selectDel(this)'>아메카지
						</div>
		</c:if>
						<c:if test="${user.user_body_type eq 'V'}">
						<div class="col-lg-3 text-medium m-3" >
							<input type='radio' name='fit_fashion' value='classic'
								onclick='selectDel(this)'>클래식
						</div>
		</c:if>
						<br> <br>




<div
							class="carousel carousel-loaded owl-carousel owl-loaded owl-drag"
							data-items="3" data-dots="false">
						<div class="owl-stage-outer">
							<div class="owl-stage"
								style="transform: translate3d(0px, 0px, 0px); transition: all 0s ease 0s; width: 1591px;">
								<c:forEach items="${list}" var="list" begin="5" end="9">
									<div class="owl-item"
										style="width: 207.2px; margin-right: 20px;">
										<img src="${list.recommed_photo_name}">
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
						<div class="owl-dots disabled"></div>
						</div>
						<%-- <table>
							<c:forEach items="${list}" var="list" begin="5" end="9">
								<th id="fashion2"><img src="${list.recommed_photo_name}"
									width='280' height='280'></th>
							</c:forEach>
						</table> --%>
						<c:if test="${user.user_body_type eq 'I'}">
							<div class="col-lg-3 text-medium m-3" >
							<input type='radio' class="l" name='thin_fashion' value='street'
								onclick='selectDel(this)'>스트릿
							</div>
								<br>
							<br>
							<div id="selectForm">
								<div class="col-lg-6" >
									<div class="row" >
										<div class="col-lg-3" >
											<a class="btn btn-light" href="/sesoc">돌아가기</a>
										</div>
										<div class="col-lg-2" >
											<a class="btn btn-light" href='javascript:thin_styling()'>선택</a>
										</div>
									</div>
								</div>
							</div>
						</c:if>
						<c:if test="${user.user_body_type eq 'O'}">
							<input type='radio' name='chubby_fashion' value='workwear'
								onclick='selectDel(this)'>워크웨어<br>
							<br>
							<a href="/sesoc">돌아가기</a>
							<a href='javascript:chubby_styling()'>선택</a>
						</c:if>
						<c:if test="${user.user_body_type eq 'V'}">
							<input type='radio' name='fit_fashion' value='classiccasual'
								onclick='selectDel(this)'>클래식캐주얼<br>
							<br>
							<a href="/sesoc">돌아가기</a>
							<a href='javascript:fit_styling()'>선택</a>
						</c:if>


						<form name="go">
							<table id="bodycheck">

							</table>
						</form>
				</div>
				</section>
				
				
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
				
				
			</div>
		<!--Plugins-->
     <script src="/sesoc/resources/js/jquery.js"></script>
     <script src="/sesoc/resources/js/plugins.js"></script>

    <!--Template functions-->
     <script src="/sesoc/resources/js/functions.js"></script>
</body>
</html>