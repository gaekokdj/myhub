<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>

<head>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="author" content="INSPIRO" />
<meta name="description" content="Themeforest Template Polo">

<title>kiru</title>

<link href="resources/css/plugins.css" rel="stylesheet">
<link href="resources/css/style.css" rel="stylesheet">
<link href="resources/css/responsive.css" rel="stylesheet">
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

<script src="resources/js/jquery.js"></script>
<script src="resources/js/plugins.js"></script>
<script src="resources/js/functions.js"></script>
<script>
	
</script>

</head>




<body data-animation-in="fadeIn"  data-animation-out="fadeOut" data-icon="12" data-icon-color="#76aa00" data-speed-in="1000" data-speed-out="500">
 
 
    <!-- MAIN WRAPPER -->
    <div class="wrapper">
 
        <!-- HEADER -->
        <header id="header" data-transparent="true" data-fullwidth="true"  class="">
			<div class="header-inner">
				<div class="container">
				
					<div id="logo">
						<a href="./" class="logo" data-src-dark="resources/images/logo-dark.png">
							<img src="resources/images/logo.png" alt="Polo Logo">
						</a>
					</div>
		
					<div id="mainMenu-trigger">
						<button class="lines-button x"> <span class="lines"></span> </button>
					</div>
		
					<div id="mainMenu">
						<div class="container">
							<nav>
								<ul>
								
									<li><a href="./">메인화면</a></li>
									<li class="dropdown"><a href="#">추천 의상</a>
										<ul class="dropdown-menu" style="">
											<li><a href="#">체형 입력</a></li>
											<li><a href="#">추천 의상 선택</a></li>
										</ul>
									</li>
									<li><a href="#">게시판</a></li>
									<li><a href="#">찜 의상</a></li>
									<li><a href="./">로그아웃</a></li>
									
									<li class="dropdown"><a href="#">회원</a>
										<ul class="dropdown-menu" style="">
											<li><a href="#">회원 가입</a></li>
										</ul>
									</li>
									
								</ul>
							</nav>
						</div>
					</div>
		
				</div>
			</div>
		</header>
        <!-- END: HEADER -->
        
        
        <!-- Page title -->
        <section id="page-title" class="dark" style="background: url(resources/images/pattern/pattern10.png)">
            <div class="container">
                <div class="page-title">
                    <h1>게시글 작성</h1>
                    <span>Simple page title with pattern background</span>
                </div>
            </div>
        </section>
        <!-- end: Page title -->
        
 
		<!-- Section -->
			<section>
			  <div class="container"> 
			  
				<div class="heading-text heading-line text-center">
					<h3>Title</h3>
				</div>
			  
			    <div class="row" style="color: red;" >
			    	<div class="col-lg-2">
			    		<p class="text-small text-center" style="">글 등록일</p>
			    		<p class="text-small text-center" style="">2019-11-11</p>
			    	</div>
			    	<div class="col-lg-2">
			    		<p class="text-small text-center" style="">조회수</p>
			    		<p class="text-small text-center" style="">123</p>
			    	</div>
			    	<div class="col-lg-2">
			    		<div class="icon-box effect small center">
			    			<div class="icon"> <a href="#"><i class="fa fa-heart" ></i></a> </div>
			    		</div>
			    	</div>
			    </div>
			    
			    <div class="row">
			    	<div class="col-lg-10">
			    		<div class="blockquote">
							<pre id="context">내용</pre>
						</div>
			    	</div>
			    </div>
			    
			    <!--Images -->
			    <div class="row">
			      <div class="col-lg-3">
			        <h4>Thumbnail</h4>
			        <img src="resources/images/other/400x250.png" class="img-fluid img-thumbnail" alt="" > </div>
			      <div class="col-lg-3">
			        <h4>Thumbnail</h4>
			        <img src="resources/images/other/400x250.png" class="img-fluid img-thumbnail" alt="" > </div>
			      <div class="col-lg-3">
			        <h4>Thumbnail</h4>
			        <img src="resources/images/other/400x250.png" class="img-fluid img-thumbnail" alt=""> </div>
			        <div class="col-lg-3">
			        <h4>Thumbnail</h4>
			        <img src="resources/images/other/400x250.png" class="img-fluid img-thumbnail" alt="" > </div>
			    </div>
			    <!--END: Images -->
			    <hr class="space">
			    
			    
			    <!-- Comments -->
					<div class="comments" id="comments">
					    <div class="comment_number">
					        Comments <span>(2)</span>
					    </div>
					    <div class="comment-list">
					        <!-- Comment -->
					        <div class="comment" id="comment-1">
					            <div class="text">
					                <h5 class="name">아이뒤</h5>
					                <span class="comment_date">게시 날짜</span>
					                <div class="text_holder">
					                    <p>블라블라블라</p>
					                </div>
					            </div>
					        </div>
					        <!-- end: Comment -->
					        <!-- Comment -->
					        <div class="comment" id="comment-2">
					            <div class="text">
					                <h5 class="name">아이뒤</h5>
					                <span class="comment_date">게시 날짜</span>
					                <div class="text_holder">
					                    <p>블라블라블라</p>
					                </div>
					            </div>
					        </div>
					        <!-- end: Comment -->
					    </div>
					</div>
					<!-- end: Comments -->
			    
			    
			    	<div class="respond-form" id="respond">
	                    <div class="respond-comment">
	                        Leave a <span>Comment</span></div>
	                    <form class="form-gray-fields">
	                        <div class="row">
	                            <div class="col-lg-12">
	                                <div class="form-group">
	                                    <label class="upper" for="comment">Your comment</label>
	                                    <textarea class="form-control required" name="comment" rows="9" placeholder="Enter comment" id="comment" aria-required="true"></textarea>
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