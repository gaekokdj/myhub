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
<title>체형분석</title>
<link rel="stylesheet" type="text/css" href="/sesoc/resources/css/css.css" />
<script src="/sesoc/resources/js/jquery-3.4.1.js"></script>
<script>

function showList() {
	var height = $("#height").val();
	var shoulder = $("#shoulder").val();
	var weist = $("#weist").val();
	
	if(height <= 167 && shoulder <= 46 && weist <= 80) {
		$("#user_body_type").empty();
		document.getElementById("user_body_type").value = "I";
	}
	if(height <= 167 && shoulder > 46 && weist > 80) {
		$("#user_body_type").empty();
		document.getElementById("user_body_type").value = "O";
	}
	if(height <= 167 && shoulder > 46 && weist <= 80) {
		$("#user_body_type").empty();
		document.getElementById("user_body_type").value = "V";
	}
	if(height <= 167 && shoulder <= 46 && weist > 80) {
		$("#user_body_type").empty();
		document.getElementById("user_body_type").value = "O";
		
	}
	
	if(height > 167 && height <= 179 && shoulder <= 48 && weist <= 83) {
		$("#user_body_type").empty();
		document.getElementById("user_body_type").value = "I";
	}
	if(height > 167 && height <= 179 && shoulder > 48 && weist > 83) {
		$("#user_body_type").empty();
		document.getElementById("user_body_type").value = "O";
	}
	if(height > 167 && height <= 179 && shoulder > 48 && weist <= 83) {
		$("#user_body_type").empty();
		document.getElementById("user_body_type").value = "V";
	}
	if(height > 167 && height <= 179 && shoulder <= 48 && weist > 83) {
		$("#bodycheck").empty();
		document.getElementById("user_body_type").value = "O";
	}
	
	if(height > 179 && height <= 191 && shoulder <= 50 && weist <= 85) {
		$("#bodycheck").empty();
		document.getElementById("user_body_type").value = "I";
	}
	if(height > 179 && height <= 191 && shoulder > 50 && weist > 85) {
		$("#bodycheck").empty();
		document.getElementById("user_body_type").value = "O";
	}
	if(height > 179 && height <= 191 && shoulder > 50 && weist <= 85) {
		$("#bodycheck").empty();
		document.getElementById("user_body_type").value = "V";
	}
	if(height > 179 && height <= 191 && shoulder <= 50 && weist > 85) {
		$("#bodycheck").empty();
		document.getElementById("user_body_type").value = "O";
	}
	
	if(height > 191 && shoulder <= 52 && weist <= 88) {
		$("#bodycheck").empty();
		document.getElementById("user_body_type").value = "I";
		
	}
	if(height > 191 && shoulder > 52 && weist > 88) {
		$("#bodycheck").empty();
		document.getElementById("user_body_type").value = "O";
	}
	if(height > 191 && shoulder > 52 && weist <= 88) {
		$("#bodycheck").empty();
		document.getElementById("user_body_type").value = "V";
	}
	if(height > 191 && shoulder <= 52 && weist > 88) {
		$("#bodycheck").empty();
		document.getElementById("user_body_type").value = "O";
	}
}

function submitbody() {
	var form = document.go;
	form.action = "/sesoc/member/insertBody";
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
						<a href="/sesoc" class="logo"> <img
							src="/sesoc/resources/img/css/logo.png" alt="Polo Logo">
						</a>
					</div>
					<div class="row">
						<div class="col-lg-5 center p-50 background-white b-r-6">

							<h3>체형분석</h3>
							<div>
								<form name="go">
									<div class="form-group">
										<label class="sr-only"></label> 키 <input class="form-control"
											type="text" id="height">
									</div>

									<div class="form-group">
										<label class="sr-only"></label> 어깨너비 <input
											class="form-control" type="text" id="shoulder">
									</div>

									<div class="form-group">
										<label class="sr-only"></label> 허리둘레 <input
											class="form-control" type="text" id="weist">
									</div>
									<div class="form-group">
										<label class="sr-only"></label> 체형 <input class="form-control"
											type="text" name="user_body_type" id="user_body_type"
											readonly="readonly">
									</div>


									<a href="javascript:showList()">체형분석</a> <a
										href="javascript:submitbody()">적용</a>


								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
</body>
</html>