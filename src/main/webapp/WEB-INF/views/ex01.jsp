<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="http://bit.ly/3WJ5ilK" />
</head>
<body>
	<!-- ex01.jsp -->
	<h1>파일업로드 <small>단일 파일</small></h1>
	<form action="/file/ex01ok.do" method="post" enctype="multipart/form-data">
	<table class="vertical">
		<tr>
			<th>텍스트</th>
			<td><input type="text" name="txt" value="홍길동" /></td>
		</tr>
		<tr>
			<th>파일</th>
			<td><input type="file" name="attach"/></td>
		</tr>
	</table>
	<div>
		<button>보내기</button>
	</div>
	</form>
	
</body>
</html>