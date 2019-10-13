<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>

<head>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="author" content="INSPIRO" />
<meta name="description" content="Themeforest Template Polo">

<title>kiru</title>

<link href="/sesoc/resources/css/plugins.css" rel="stylesheet">
<link href="/sesoc/resources/css/style.css" rel="stylesheet">
<link href="/sesoc/resources/css/responsive.css" rel="stylesheet">
<style>
	.col-lg-10 {
		border-top: 2px solid #ececec;
		border-right: 2px solid #ececec;
		border-bottom: 2px solid #ececec;
		border-left: 3px solid #2250fc;
		margin: 4px auto;
	}
	
	.col-lg-10 p {
		color: black;
	}
	
	div.col-lg-10 div.row {
		margin-top: 6px;
	}
	
	hr {
		border: 1px solid #ececec;
	}
	
</style>
<script>
	
</script>

</head>




<!-- <body data-animation-in="fadeIn"  data-animation-out="fadeOut" data-icon="12" data-icon-color="#76aa00" data-speed-in="1000" data-speed-out="500">
  -->
  <body>
 
    <!-- MAIN WRAPPER -->
    <!-- <div class="wrapper"> -->
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
									
									<c:if test="${ sessionScope.user_id == null }">
									<li class="dropdown"><a href="#">회원</a>
										<ul class="dropdown-menu" style="">
											<li><a href="/sesoc/member/signupForm">회원 가입</a></li>
										</ul>
									</li>
									<li><a href="/sesoc/member/loginForm">로그인</a></li>
									</c:if>
									
									<c:if test="${ sessionScope.user_id != null }">
									<li><a href="/sesoc/member/logout">로그아웃</a></li>
									</c:if>
									
								</ul>
							</nav>
						</div>
					</div>
		
				</div>
			</div>
		</header>
        <!-- END: HEADER -->

 
        <!-- Main wrapper -->
        <main id="main">
            <!-- Page title -->
            <section id="page-title" class="dark" style="background-image:url(/sesoc/resources/images/pattern/pattern10.png)">
                <div class="container">
                    <div class="breadcrumb">
                        <ul>
                            <li>KIRU</li>
                        </ul>
                    </div>
                    <div class="page-title">
                        <h1>게시판</h1>
                        <span>'ㅁ'!</span>
                    </div>
                </div>
            </section>
            <!-- end: Page title -->
            
            
            <section>
            <div class="col-lg-9 text-right">
            <form action="boardList" method="get">
			<input type="hidden" value="${navi.currentPage}">
			검색:<input type="text" name="searchWord" value="${searchWord}">
			<input type="submit" value="검색">
			</form>
			</div>
			<div class="col-lg-6	 text-center ">
				<!-- <a class="btn btn-light" href="/sesoc/board/goboardWrite">글쓰기</a> -->
				</div>
            <c:forEach items="${boardList}" var="boardList">
				<div class="container">
				
					<div class="col-lg-12 equalize" data-equalize-item=".text-box" id="list_here" >
					
						<div class="row">
							<div	class="col-lg-10 text-center p-2 text-box" >
								<div class="row" >
									<div class="col-lg-2"><p>${boardList.board_num}</p></div><div class="col-lg-7">
									<p><a href= "boardDetail2?board_num=${boardList.board_num}">${boardList.board_name}</a></p></div><div class="col-lg-3"><p>${boardList.user_id}</p></div>
								</div>
								<hr/>
								<div class="row" >
									<div class="col-lg-3"><p>
									<fmt:parseDate value="${boardList.board_date}" var="parsedInputdate" pattern="yyyy-MM-dd HH:mm:ss" />
									<fmt:formatDate value="${parsedInputdate}" pattern="yyyy-MM-dd" />
									</p></div><div class="col-lg-4"><p>${boardList.board_hit}</p></div><div class="col-lg-4"><p>${boardList.like_count}</p></div>
								</div>
							</div>
						</div>
						
				
						
						
					</div>
					
				</div>
				</c:forEach>
				
				<div class="col-lg-9 text-right text-small">
			<a href= "boardList?page=1">&lt;&lt;</a>
			&nbsp;<a href= "boardList?page=${navi.startPageGroup-1}&searchWord=${searchWord}">&lt;</a>
			<c:forEach var="counter" begin="${navi.startPageGroup}" end="${navi.endPageGroup}">
			<a href="boardList?page=${counter}&searchWord=${searchWord}">${counter}</a>
			</c:forEach>
			<a href= "boardList?page=${navi.endPageGroup+1}&searchWord=${searchWord}">&gt;</a>
			&nbsp; <a href= "boardList?page=${navi.totalRecordsCount}&searchWord=${searchWord}">&gt;&gt;</a>
            </div>
			</section>
			
        </main>
        <!-- end: main -->
         
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
    <!-- END: MAIN WRAPPER -->
    
    <!-- Scroll top 
    <a id="scrollTop"><i class="icon-chevron-up1"></i><i class="icon-chevron-up1"></i></a>-->
     
     <script src="/sesoc/resources/js/jquery.js"></script>
<script src="/sesoc/resources/js/plugins.js"></script>
<script src="/sesoc/resources/js/functions.js"></script>
     
     
</body>
</html>