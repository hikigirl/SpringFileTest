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
	<!-- ex02ok -->
	<h1>결과</h1>
	<div>txt: ${txt}</div>
	<c:forEach items="${attach}" var="file">
	<div>
		<a href="/file/resources/files/${file.originalFilename}" download>${file.originalFilename}</a>
	</div>
	</c:forEach>
</body>
</html>