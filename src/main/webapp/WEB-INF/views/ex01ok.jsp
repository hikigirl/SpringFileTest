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
	<!-- ex01ok -->
	<h1>결과</h1>
	<div>txt: ${txt}</div>
	<div>
		<a href="/file/resources/files/${filename}" download>${filename}</a>
	</div>
	<c:if test="${filetype.startsWith('image')}">
	
	<div><img src="/file/resources/files/${filename}" alt="${filename}" style="max-width: 700px;" /></div>
	
	</c:if>
</body>
</html>