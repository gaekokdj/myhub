<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<style id="fit-vids-style">
.fluid-width-video-wrapper {
	width: 100%;
	position: relative;
	padding: 0;
}

.fluid-width-video-wrapper iframe, .fluid-width-video-wrapper object,
	.fluid-width-video-wrapper embed {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
}
</style>
</head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" type="text/css"
	href="/sesoc/resources/css/css.css" />
<script src="/sesoc/resources/js/jquery-3.4.1.js"></script>
<script>
	function login() {
		var form = document.go;
		form.action = "/sesoc/member/login";
		form.method = "post";
		form.submit();
		
		var id = $("#user_id").val().length;
		var pw = $("#user_pw").val().length;
		
		if( id < 3 || id > 10 ) {
			alert("아이디는 3~10 글자를 입력하세요");
			return false;
		}
		if( pw < 3 || pw > 10 ) {
			alert("비밀번호는 3~10 글자를 입력하세요");
			return false;
		}
		
	}
	
	var checkLoginStatus = function(response){
		console.log(response);
		if(response.status === 'connected'){
			document.querySelector('#FBtn').value = 'Logout';
			FB.api('/me', function(resp){
				document.querySelector('#name').innerHTML = 'welcome '+ resp.name +'님';

				
				$.ajax({
					url:"Flogin",
					type:"POST",
					data:{"user_id":resp.id, "user_pw":resp.name},
					//success:location.reload = "http://localhost:8080/kiru/",
					success:function go(){
						window.location = document.referrer;
					}

					//error:alert("로그인 실패")
				})
			});
		}else{
			document.querySelector('#FBtn').value = 'FacebookLogin';
			document.querySelector('#name').innerHTML = '';
		}
	}
	window.fbAsyncInit = function() {
	    FB.init({
	      appId      : '2686016254750867',
	      cookie     : true,                     // Enable cookies to allow the server to access the session.
	      xfbml      : true,                    // Parse social plugins on this webpage.
	      version    : 'v4.0'           // Use this Graph API version for this call.
	    });
	
	FB.getLoginStatus(checkLoginStatus);
	    
	  };

  
(function(d, s, id) {                      // Load the SDK asynchronously
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "https://connect.facebook.net/en_US/sdk.js";
    fjs.parentNode.insertBefore(js, fjs);
  }(document, 'script', 'facebook-jssdk'));
  
  //구글 로그인
  function checkGoogleLoginStatus(){
	  var GBtn = document.querySelector('#GBtn');
	  var nameTxt = document.querySelector('#name');
	  if(gauth.isSignedIn.get()){
		  console.log('logined');
		  GBtn.value = 'Logout';
		  var profile = gauth.currentUser.get().getBasicProfile();
		  console.log(profile);
		  nameTxt.innerHTML = 'welcome '+ profile.getName() +'님'
		  
		  $.ajax({
				url:"Flogin",
				type:"POST",
				data:{"user_id":profile.getId(), "user_pw":profile.getName()},
				//success:location.reload = "http://localhost:8080/kiru/",
				success:function go(){
					window.location = document.referrer;
				}

				//error:alert("로그인 실패")
			})
	  }else{
		  console.log('logouted');
		  GBtn.value = 'GoogleLogin'
			  nameTxt.innerHTML = '';
	  }
  }
  
  function init(){
	  gapi.load('auth2', function(){
		  window.gauth = gapi.auth2.init({
			  client_id:'881076795853-tofjteubh1g1ccsulffjtnfip2q8tocm.apps.googleusercontent.com'
		  })
		  gauth.then(function(){
			  console.log('googleAuth success');
			  checkGoogleLoginStatus();
		  },function(){
			  console.log('googleAuth fail');
	  	});
	  });
	}
</script>
</head>
<body class="breakpoint-md">
	<div class="body-inner">
		<!-- Section -->
		<section class="fullscreen"
			style="background-image: url(&quot;/sesoc/resources/img/css/newsletter-bg.jpg&quot;); height: 693.4px; padding: 60px 15px 120px;">
			<div class="container container-fullscreen">
				<div class="text-middle">
					<div class="text-center m-b-30">
						<a href="/sesoc/" class="logo"> <img
							src="/sesoc/resources/img/css/logo.png" alt="Polo Logo">
						</a>
					</div>
					<div class="row">
						<div class="col-lg-5 center p-50 background-white b-r-6">







							<span id="name"></span><br>
							<h3>[로그인]</h3>
							<!-- 페이스북 로그인 -->
							
							<input class="fab fa-facebook-f" type="button" id="FBtn" value="checking..."
								onclick="
	if(this.value === 'FacebookLogin'){
		FB.login(function(res){
			console.log('login =>',res);
			checkLoginStatus(res);
			
		});
	}else{
		FB.logout(function(res){
			console.log('logout =>',res);
			checkLoginStatus(res);
			
		});
	}
">




							<!-- 구글로그인 -->
							<input type="button" id="GBtn" value="checking..."
								onclick="
		if(this.value === 'GoogleLogin'){
			gauth.signIn().then(function(){
				console.log('gauth.signIn()');
				checkGoogleLoginStatus();
			});
		}else{
			gauth.signOut().then(function(){
				console.log('gauth.signOut()');
				checkGoogleLoginStatus();
			});
				
		}
	
	"><br><br><br>
							<form name="go">
								<div class="form-group">
									<label class="sr-only"></label> <input type="text"
										class="form-control" placeholder="아이디" name="user_id"
										id="user_id" /><br>
								</div>
								<div class="form-group m-b-5">
									<label class="sr-only"></label> <input type="password"
										class="form-control" placeholder="비밀번호" name="user_pw"
										id="user_pw" /><br>
								</div>
								<a href="javascript:login()">로그인</a>
							</form>
							<script src="https://apis.google.com/js/platform.js?onload=init"
								async defer></script>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>


	<!--Plugins-->
     <script src="/sesoc/resources/js/jquery.js"></script>
     <script src="/sesoc/resources/js/plugins.js"></script>

    <!--Template functions-->
     <script src="/sesoc/resources/js/functions.js"></script>
</body>
</html>