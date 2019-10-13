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
<title>회원가입</title>
<link rel="stylesheet" type="text/css" href="/sesoc/resources/css/css.css" />
<script src="/sesoc/resources/js/jquery-3.4.1.js"></script>
<script>
	function join() {
		
		var form = document.go;
		
		if ($("#user_id").val().length < 3 || $("#user_id").val().length > 10) {
			alert("아이디는 3~10 글자를 입력하세요");
			return false;
		}
		if ($("#user_pw").val().length < 3 || $("#user_pw").val().length > 10) {
			alert("비밀번호는 3~10 글자를 입력하세요");
			return false;
		}
		if ($("#user_pw").val() != $("#user_pw1").val()) {
			alert("비밀번호가 일치하지 않습니다");
			return false;
		}
		
		form.action = "/sesoc/member/signup";
		form.method = "post";
		form.submit();
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






							<h1>회원가입</h1>
							<!-- 내용제목 -->
							<div class="login_area">
								<form name="go">
									<div class="form-group">
										<label class="sr-only"></label>아이디<input type="text"
											class="form-control" placeholder="아이디" name="user_id"
											id="user_id" required="required" /><br>
									</div>
									<div class="form-group m-b-5">
										<label class="sr-only"></label>비밀번호<input type="password"
											class="form-control" placeholder="비밀번호" name="user_pw"
											id="user_pw" required="required" /><br>
									</div>
									<div class="form-group m-b-5">
										<label class="sr-only"></label> 비밀번호확인<input type="password"
											class="form-control" placeholder="비밀번호 확인" id="user_pw1" name="user_pw1" required="required" /> <br>
									</div>
									<div class="form-group">
										<label class="sr-only"></label> 이메일<input type="email"
											class="form-control" placeholder="이메일주소@도메인" name="user_mail"
											required="required" /><br>
									</div>
									<a href="javascript:join()">회원가입</a>


								</form>
							</div>
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