<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글</title>
</head>
<body>
<h1>게시글 페이지 입니다</h1>
<h3>목록</h3><br>
	<form action="boardList" method="get">
	<input type="hidden" value="${navi.currentPage}">
	검색:<input type="text" name="searchWord" value="${searchWord}">
	<input type="submit" value="검색">
	</form>
<table>
<tr>
	<td>글 번호</td>
	<td>작성자</td>
	<td>글 제목</td>
	<td>날짜</td>
	<td>조회수</td>
	<td>좋아요수</td>
</tr>
<c:forEach items="${boardList}" var="boardList">
<tr>
	<td>${boardList.board_num}</td>
	<td>${boardList.user_id}</td>
	<td><a href= "boardDetail?board_num=${boardList.board_num}">${boardList.board_name}</a></td>
	<td>
		<fmt:parseDate value="${boardList.board_date}" var="parsedInputdate" pattern="yyyy-MM-dd HH:mm:ss" />
		<fmt:formatDate value="${parsedInputdate}" pattern="yyyy-MM-dd" />
	</td>
	<td>${boardList.board_hit}</td>
	<td>${boardList.like_count}</td>
	
</tr>

</c:forEach>
</table>

<a href= "boardList?page=1">&lt;&lt;</a>
&nbsp;<a href= "boardList?page=${navi.startPageGroup-1}&searchWord=${searchWord}">&lt;</a>

<c:forEach var="counter" begin="${navi.startPageGroup}" end="${navi.endPageGroup}">
	
	<a href="boardList?page=${counter}&searchWord=${searchWord}">${counter}</a>
	
</c:forEach>
<a href= "boardList?page=${navi.endPageGroup+1}&searchWord=${searchWord}">&gt;</a>
&nbsp; <a href= "boardList?page=${navi.totalRecordsCount}&searchWord=${searchWord}">&gt;&gt;</a>


<h3><a href="/sesoc/board/goboardWrite">글쓰기</a></h3>
<h3><a href="/sesoc">개인 페이지</a></h3>
</body>
</html>