<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 페이지</title>
</head>
<body>
	<h1>게시글 상세</h1>
	
	<c:if test="${sessionScope.user_id==board.user_id}">
	<form action="deleteBoard" method="post">
	<input type="hidden" name="board_num"  value="${board.board_num}">
	<button type="submit">삭제</button></form>
	
	<form action="goUpdateBoard" method="get">
	<input type="hidden" name="board_num"  value="${board.board_num}">
	<button type="submit">수정</button></form>
	
	</c:if>
	<br>
	제목:${board.board_name}<br>
	작성자:${board.user_id}<br>
	작성일:${board.board_date}<br>
	내용:${board.board_content}<br>
	<br>
	
	<form action="insertComments" method="post">
	<input type="hidden" value="${board.board_num}" name="board_num">
		댓글:<input type="text" name="comments_content">
			<input type="submit" value="댓글 등록">
	</form>
	
	
	<br>좋아요 기능<br>
	<c:if test="${LiketoVo==null}">
	<form action="insert_like_check" method="post">
	<input type="hidden" name="board_num" value="${board.board_num}">
	<button type="submit">좋아요</button>
	</c:if>
	<c:if test="${LiketoVo!=null}">
	<form action="delete_like_check" method="post">
	<input type="hidden" name="like_num" value="${LiketoVo.like_num}">
	<input type="hidden" name="board_num" value="${board.board_num}">
	<button type="submit">좋아요 취소</button>
	</form>
	</c:if>
	
	<br>댓글목록<br>
	<c:forEach items="${commentsVo}" var="HashMap">
	${HashMap.USER_ID} : ${HashMap.COMMENTS_CONTENT} - ${HashMap.COMMENTS_DATE}
	
	<c:if test="${HashMap.USER_ID==sessionScope.user_id}">
	<form action="deleteOneComments" method="post">
		<input type="hidden" name="board_num" value="${board.board_num}">
		<input type="hidden" name="comment_num" value="${HashMap.COMMENT_NUM}">
		<br><button type="submit">X</button>
	</form>
	</c:if>
	<br>
	</c:forEach>
	
	<a href="/sesoc/board/boardList"><input type="button" value="게식판으로 돌아가기"></a>
</body>
</html>