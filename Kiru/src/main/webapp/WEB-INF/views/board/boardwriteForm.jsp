<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여기는 게!!!! 식!!!! 빵!!!!</title>
</head>
<body>
<h1>완전 개판이네!!!!!</h1>

<h1>[글쓰기]</h1>

<c:if test="${board.board_num!=null}">
<form action="updateBoard" method="post">
	<input type="hidden" name="board_num" value="${board.board_num}">

</c:if>

<c:if test="${board.board_num==null}">
<form action="boardwrite" method="post">
</c:if>


	<table>
		<tr>
			<th>작성자</th>
				<td>${sessionScope.user_id}</td>
		</tr>
		<tr>
			<th>제목</th>
				<td><input type="text" name="board_name" value="${board.board_name}"></td>
		</tr>
		<tr>
			<th>첨부 파일</th>
				<!--<td><input type="file" name="uploadFile"></td>-->
		</tr>
		<tr>
			<th>내용</th>
				<td><textarea rows="20" cols="20" name="board_content">${board.board_content}
				</textarea></td>
		</tr>
		<tr>
			<td class="right" colspan="2">
				<input type="submit" value="등to_the_록" onclick="return boardList()">
				<a href="/sesoc/board/boardList"><input type="button" value="취소"></a>
			</td>
		</tr>	
	</table>
	</form>


</body>
</html>