<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

<script>
	
</script>

</head>




<!-- <body data-animation-in="fadeIn"  data-animation-out="fadeOut" data-icon="12" data-icon-color="#76aa00" data-speed-in="1000" data-speed-out="500">
  -->
  <body>
 <c:choose>
	<c:when test="${addResult == true}">
		<script>alert("마이 리스트에 추가되었습니다.")</script>
	</c:when>
</c:choose>
    <!-- MAIN WRAPPER -->
    <!-- <div class="wrapper"> -->
 	<div class="body-inner">
		
		
		<!-- HEADER -->
        <header id="header" data-transparent="true" data-fullwidth="true" class="dark">
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
            <section id="page-title" class="text-light" style="background-image:url(/sesoc/resources/homepages/shop-v3/images/1.jpg); background-size: cover; background-position: center center;">
                <div class="container">
                    <div class="breadcrumb">
                        <ul>
                            <li>KIRU</li>
                        </ul>
                    </div>
                    <div class="page-title">
                        <h1>의상 추천</h1>
                        <span>'ㅁ'!</span>
                    </div>
                </div>
            </section>
            <!-- end: Page title -->
            
            
            <section>
				<div class="container">
					<div class="row">
						<div class="col-lg-3">
							<div class="heading-text heading-section">
								<h2>의상 추천</h2>
								
							</div>
						</div>
						<div class="col-lg-9">
			                <div class="row">
			                	<div class="col-lg-6">이 곳은 이용자의 체형에 어울리는 특정 장르의 의상을 추천해주며 그 안에서 이용자가 원하는 취향의 의상을 선택하여 저장해두는 것이 가능합니다.</div>
								<div class="col-lg-6">그리고 저장한 의상의 정보를 게시판에 올려 다른 이용자들과 의견을 나누며 인기있는 의상의 조합을 올려보세요!</div>
							</div>
						</div>
			
					</div>
				</div>
			</section>


			<section class="box-fancy section-fullwidth text-light p-b-0">
					<div class="row">
						<div style="background-color:#917d5d" class="col-lg-4">
							<h1 class="text-lg text-uppercase">01.</h1>
			                <h3>Crawling/Web Scraping</h3>
							<span>Web에 존제하는 Contents를 수집하는 작업으로써 HTML/CSS등을 파싱한 후 필요한 데이터만 추출, Open API를 호출해서 받은 데이터중 필요한 데이터만 추출하는 기법, Selenium등 브라우저를 프로그래밍을 조작해서 필요 데이터만 추출하는 기법이라고 한다</span>
						</div>
			
						<div style="background-color:#a08c6c" class="col-lg-4">
							<h1 class="text-lg text-uppercase">02.</h1>
			                <h3>OAuth Google Login</h3>
							<span>구글 페이스북등 타 계정을 통한 로그인 서비스 제공 사용자들에게 보다 나은 접근성을 제공 가능 서로 다른 두 집단이 정보와 리소스를 안전하고 신뢰할 수 있는 방법으로 공유 가능 OAuth 표준 인증 절찰 </span>
						</div>
			
						<div style="background-color:#ad9979" class="col-lg-4">
							<h1 class="text-lg text-uppercase">03.</h1>
			                <h3>Base Board</h3>
							<span>Sc IT Smart Master 과정의 IT분야의 하이라이트인 Spring을 사용한 게시판 만들기 수업과정의 충실하게 들었다면 누구나 만들 수 있는 그런 게시판이다 </span>
						</div>
					</div>
			</section>
			
			<section class="background-grey">
				<div class="container">
					<div class="heading-text heading-section text-center">
						<h2>イフクTEAM</h2>
						<span class="lead">Create amaThe most happiest time of the day!.</span>
					</div>
					<div class="row team-members team-members-shadow m-b-40">
			                    <div class="col-lg-3">
			                        <div class="team-member">
			                            <div class="team-image">
			                                
			                            </div>
			                            <div class="team-desc">
			                                <h3>권 동 준</h3>
			                                <span>직급: 대리</span>
			                                <p>프로젝트 만들어질 당시 팀내 마지막으로 합류. 프로젝트 초기에는 말수가 적고 적극적인 의견을 표하지 않음 그러나 현재 프로젝트를 진행할려면 우선 동준상, 동준아 , 동준씨 라는 수식어 무조건 들어간다 실재로 가장 많이 불리고 있다 그 이유는 혼자 케이 페어 불참가선언 때문에 사실상 일을 독박하고 있었다....풍문에는 박모씨가 동준씨가 퇴근한줄 알고 도망갔다가 밀고자에 의해 걸렸다는 풍문이 있다</p>
			                            </div>
			                        </div>
			                    </div>
			                    <div class="col-lg-3">
			                        <div class="team-member">
			                            <div class="team-image">
			                                
			                            </div>
			                            <div class="team-desc">
			                                <h3>권 지 연</h3>
			                                <span>직급:대리</span>
			                                <p>권지연 양은 우선 인재다 그 이유는 혼자 케이페어에 합격했다 그로 인해 프로젝트 독박의 위기에 처했지만 다행이 정보처리기사라는 자격증 실드로 인하여 프로젝트 독박은 면하였다. 그녀읭 뒷자리에 있는 과자통은 박모씨것이나 실제로는 권지연 양의 과자통인다 그리고 과자통에 양식을 받치는 2명인 있다고 한다. 우선 취직이 되었기 때문에 마음이 편한것으로 보이나 정보처리 기사 시험과 프로젝트가 같이 있어 힘든 상태이다. 그래서 건들면 안될거 같다....</p>
			                            </div>
			                        </div>
			                    </div>
			                    <div class="col-lg-3">
			                        <div class="team-member">
			                            <div class="team-image">
			                                
			                            </div>
			                            <div class="team-desc">
			                                <h3>박 승 주</h3>
			                                <span>직급:????</span>
			                                <p>팀내 맡은 역활이 지갑이라고 한다. 그의 자리에 있는 과자통은 본인이 체우지 않아도 누군가가 체운다 하지만 동시에 타인에 의하여 과자들이 없어진다. 항상 피곤한 기색이 영력하며 항상 피곤에 찌들어 있다 공군체련복을 주로 입고 출몰한다. 느낌이 회사에 있는 만년 대리의 느낌이다. 타팀 정모씨와 권대리에게 장난치는 일을 맡고 있는 듯 하다 처음에는 팀내 최약 먹이감이었으나 요즘 팀장을 갈구는 기귀한 현상이 일어나고 있다 참고로 지 일은 끝내지 못한 상태라고 한다.</p>
			                            </div>
			                        </div>
			                    </div>
			                    <div class="col-lg-3">
			                        <div class="team-member">
			                            <div class="team-image">
			                                
			                            </div>
			                            <div class="team-desc">
			                                <h3>박 주 영</h3>
			                                <span>직급: 팀장(과장)</span>
			                                <p>이 팀을 만든 장본인 특징은 출근을 일찍한다. 팀내에서 항상 먼저 출근을 한다. 동시에 퇴근도 빠르다. 이 팀의 밸런스를 위해 박모씨를 들인거 같지만 잘못된 선택으로 보인다. 컨디션에 따라 능률이 크게 차이 나는 타입이다. 체력과 정신건강이 좋을때는 일을 열심히 하지만 뇌 정지가 오면 바로 일을 멈추고 잠을 잔다. 그리고 퇴근 후 자택에서 안자고 일한다(그래서 박모씨가 지속적으로 갈구는 이상한 현상이 일어난다.) 그는 아이티에 지나치도록 집착하는 현상이 있다 아이티는 무조건 원하는 선까지 마무리를 지어야 다음 일을 진행한다 그러나 이상하게도 일본어 실력도 장난아니다 심지어 화도 안내고 욕도 안한다 사실상 보살캐릭으로 생각되었지만 이번 케에 페어 때 취직이 안되는 모습을 보며 격한 모습이 보여지고 있다 그로 인해 저자도 사람이군아라는 생각이 들게만들어진다.</p>
			                            </div>
			                        </div>
			                    </div>
			                </div>
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
								<br>09:00 AM - 08:00 PM</p>
								<p><strong>Saturday - Sunday</strong>
								<br>주말은 우리도 좀 쉬자고!!!</p>
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
 
    </div>
    <!-- END: MAIN WRAPPER -->
    
    <!-- Scroll top -->
    <a id="scrollTop"><i class="icon-chevron-up1"></i><i class="icon-chevron-up1"></i></a>
     
     <script src="/sesoc/resources/js/jquery.js"></script>
<script src="/sesoc/resources/js/plugins.js"></script>
<script src="/sesoc/resources/js/functions.js"></script>
     
     
</body>
</html>