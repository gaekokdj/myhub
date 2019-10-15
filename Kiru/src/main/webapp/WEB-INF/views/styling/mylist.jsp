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

<title>My List</title>
<link rel="stylesheet" type="text/css" href="/sesoc/resources/css/css.css" />
<!-- <script src="/sesoc/resources/js/jquery-3.4.1.js"></script> -->
	<link href="/sesoc/resources/css/plugins.css" rel="stylesheet">
    <link href="/sesoc/resources/css/style.css" rel="stylesheet">
    <link href="/sesoc/resources/css/responsive.css" rel="stylesheet">
    <link href="/sesoc/resources/css/css.css" rel="stylesheet"/>
<script>
	var selectRadio;
	
	function selectDel(temp) {
		selectRadio = temp;
	}
	
	function deleteStyle() {
		if(selectRadio === undefined) {
			alert("삭제할 항목을 선택해주세요");
			return false;
		}
		else {
			if(confirm("삭제하시겠습니까?")) {
				var select_num = selectRadio.value;
				
				$.ajax({
					url: "styleDelete",
					type: "get",
					data: {"select_num":select_num},
					success: function() {
						selectRadio = undefined;
						location.href = "/sesoc/styling/myList";
					},
					error: function() {
						alert("error");
					}
				});
			}
		}
	}
	
	function boardWrite() {
		var select_num = selectRadio.value;
		$("#board").append("<input type='hidden' name='select_num' value='" + select_num + "'>");
		
		if(selectRadio === undefined) {
			alert("작성할 항목을 선택해주세요");
			return false;
		}
		else {
			if(confirm("작성하시겠습니까?")) {
				var form = document.go;
				form.action = "/sesoc/board/goboardList2";
				form.method = "POST";
				form.submit();
			}
		}
	}
</script>
</head>
<body>
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
                        <h1>My List</h1>
                        <span></span>
                    </div>
                </div>
            </section>
            <!-- end: Page title -->


	<section id="page-content">
		<div class="container">
		<table>
			<c:forEach items="${list}" var="list">
				<tr>
					<td>
						<input type="radio" name="deleteRadio" value="${list.select_num}" onclick="selectDel(this)">
					</td>
					<td>
						<img src="${list.outer_photo_name}" width='180' height='250'>
					</td>
					<c:choose>
						<c:when test="${list.genre_name eq 'classic'}">
							
						</c:when>
						<c:otherwise>
							<td>
								<img src="${list.top_photo_name}" width='180' height='250'>
							</td>
							<td>
								<img src="${list.bottom_photo_name}" width='180' height='250'>
							</td>
						</c:otherwise>
					</c:choose>
					<td>
						<img src="${list.shoes_photo_name}" width='180' height='250'>
					</td>
				</tr>
			</c:forEach>
		</table>
		<br><hr><br>
		<div class="col-lg-10">
		<div class="row">
		<a href="/sesoc" class="btn m-2">돌아가기</a>
		<form id="board" name="go">
			<a href="javascript:boardWrite()" class="btn m-2">게시판 등록</a>
		</form>
		<a href="javascript:deleteStyle()" class="btn m-2">삭제</a>
		</div>
		</div>
		</div>
		</section>
		</div>
		
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
								<br>09:00 AM - 08:00 PM</p>
								<p><strong>Saturday - Sunday</strong>
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
		                  <li class="social-facebook"><a href="https://ko-kr.facebook.com/FacebookKorea/"><i class="fab fa-facebook-f"></i></a></li>
		                  <li class="social-twitter"><a href="https://twitter.com/?lang=ko"><i class="fab fa-twitter"></i></a></li>
		                  <li class="social-vimeo"><a href="https://vimeo.com/ko/"><i class="fab fa-vimeo"></i></a></li>
		                  <li class="social-youtube"><a href="https://www.youtube.com/?gl=KR"><i class="fab fa-youtube"></i></a></li>
		                  <li class="social-pinterest"><a href="https://www.pinterest.co.kr/"><i class="fab fa-pinterest"></i></a></li>
		                  <li class="social-gplus"><a href="https://gpluseurope.com/"><i class="fab fa-google-plus-g"></i></a></li>
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