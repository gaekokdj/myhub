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
	pre {
		white-space: pre-wrap;
		font-size: 1em;
	    font-style: normal;
	    font-weight: 400;
	    text-transform: none;
	    line-height: 1.6;
	    letter-spacing: 0;
	    font-family: "Open Sans", "Helvetica", "Arial", sans-serif;
	}
	
</style>

<script src="/sesoc/resources/js/jquery.js"></script>
<script src="/sesoc/resources/js/plugins.js"></script>
<script src="/sesoc/resources/js/functions.js"></script>
<script>
	function go() {
		var form = document.go;
		form.action = "insert_like_check";
		form.method = "POST";
		form.submit();
	}
	
	function to() {
		var form = document.to;
		form.action = "delete_like_check";
		form.method = "POST";
		form.submit();
	}
	function listback() {
		location.href = "/sesoc/board/boardList";
	}
</script>

</head>




<body data-animation-in="fadeIn"  data-animation-out="fadeOut" data-icon="12" data-icon-color="#76aa00" data-speed-in="1000" data-speed-out="500">
 
 
    <!-- MAIN WRAPPER -->
    <div class="wrapper">
 
        <!-- HEADER -->
        <header id="header" class="">
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
										<ul class="dropdown-menu" style="#">
											<li><a href="/sesoc/member/bodychkForm">체형 입력</a></li>
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
        
        
        <!-- Page title -->
        <section id="page-title" class="dark" style="background: url(/sesoc/resources/images/pattern/pattern10.png)">
            <div class="container">
                <div class="page-title">
                    <h1>게시글</h1>
                    <span>Simple page title with pattern background</span>
                </div>
            </div>
        </section>
        <!-- end: Page title -->
        
 
		<!-- Section -->
			<section>
			
			  <div class="container"> 
			  
				<div class="heading-text heading-line text-center">
				
					<h3>${board.board_name}</h3>
				</div>
			  
			    <div class="row" style="color: red;" >
			    	<div class="col-lg-2">
			    		<p class="text-small text-center" style="">글 등록일</p>
			    		<p class="text-small text-center" style="">
			    			<fmt:parseDate value="${board.board_date}" var="parsedInputdate" pattern="yyyy-MM-dd HH:mm:ss" />
							<fmt:formatDate value="${parsedInputdate}" pattern="yyyy-MM-dd" />
			    		</p>
			    	</div>
			    	<div class="col-lg-2">
			    		<p class="text-small text-center" style="">조회수</p>
			    		<p class="text-small text-center" style="">${board.board_hit}</p>
			    	</div>
			    	<div class="col-lg-2">
			    		<div class="icon-box effect small center">
			    		<c:if test="${LiketoVo==null}">
			    		<form name="go">
			    			<input type="hidden" name="board_num" value="${board.board_num}">
			    			<div class="icon"> <a href="javascript:go()"><i class="fa fa-heart" ></i></a> </div>
			    		</form>
			    		</c:if>
			    		<c:if test="${LiketoVo!=null}">
			    		<form name="to">
			    			<input type="hidden" name="like_num" value="${LiketoVo.like_num}">
							<input type="hidden" name="board_num" value="${board.board_num}">
			    			<div class="icon"> <a href="javascript:to()"><i class="fa fa-heart" ></i></a> </div>
			    		</form>
			    		</c:if>
			    		</div>
			    	</div>
			    </div>
			    
			    <div class="row">
			    	<div class="col-lg-10">
			    		<div class="blockquote">
							<pre id="context"></pre>
							${board.board_content}
						</div>
			    	</div>
			    </div>
			    
			   
			    
			    
			    <!-- Comments -->
			    
					<div class="comments" id="comments">
					    <div class="comment_number">
					        Comments <span></span>
					    </div>
					    <div class="comment-list">
					        <!-- Comment -->
					        <c:forEach items="${commentsVo}" var="HashMap">
					        <div class="comment" id="comment-1">
					            <div class="text">
					                <h5 class="name">${HashMap.USER_ID}</h5>
					                <span class="comment_date">
					                <fmt:parseDate value="${HashMap.COMMENTS_DATE}" var="parsedInputdate" pattern="yyyy-MM-dd HH:mm:ss" />
									<fmt:formatDate value="${parsedInputdate}" pattern="yyyy-MM-dd HH:mm" />
					                </span>
					                <div class="text_holder">
					                    <p>${HashMap.COMMENTS_CONTENT}</p>
					                    <c:if test="${HashMap.USER_ID==sessionScope.user_id}">
	<form action="deleteOneComments" method="post">
		<input type="hidden" name="board_num" value="${board.board_num}">
		<input type="hidden" name="comment_num" value="${HashMap.COMMENT_NUM}">
		<br><button class="btn btn-light" type="submit">삭제</button>
	</form>
	</c:if>
					                </div>
					            </div>
					        </div>
					        
					        <!-- end: Comment -->
					        </c:forEach>
					        
					    </div>
					</div>
					
					<!-- end: Comments -->
			    
			    
			    	<div class="respond-form" id="respond">
	                    <div class="respond-comment">
	                        Leave a <span>Comment</span></div>
	                    <form class="form-gray-fields" action="insertComments" method="post">
	                    	<input type="hidden" value="${board.board_num}" name="board_num">
	                        <div class="row">
	                            <div class="col-lg-12">
	                                <div class="form-group">
	                                    <label class="upper" for="comment">Your comment</label>
	                                    <textarea class="form-control required" name="comments_content" rows="9" placeholder="Enter comment" id="comment" aria-required="true"></textarea>
	                                </div>
	                            </div>
	                        </div>
	                        <div class="row">
	                            <div class="col-lg-12">
	                                <div class="form-group text-center">
	                                    <button class="btn" type="submit">Submit Comment</button>
	                                </div>
	                            </div>
	                        </div>
	                    </form>
	                    <div class="row">
	                    	<input type="button" class="btn m-2" value="목록" onclick="listback()">
	                    	<c:if test="${sessionScope.user_id==board.user_id}">
									<form action="deleteBoard" method="post">
									<input type="hidden" name="board_num"  value="${board.board_num}">
									<button class="btn m-2" type="submit">삭제</button></form>
									
									<form action="goUpdateBoard" method="get">
									<input type="hidden" name="board_num"  value="${board.board_num}">
									<button class="btn m-2" type="submit">수정</button></form>
								</c:if>
						</div>
	                </div>
			    
			    
			  </div>
			</section>
			<!-- end: Section -->        

         
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
     
     
</body>
</html>