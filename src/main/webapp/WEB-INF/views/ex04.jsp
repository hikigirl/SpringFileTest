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
	<!-- ex04.jsp -->
	<h1>파일업로드 <small>Ajax(단일, 다중)</small></h1>
	<form id="form1">
	<table class="vertical">
		<tr>
			<th>텍스트</th>
			<td><input type="text" name="txt" value="홍길동" /></td>
		</tr>
		<tr>
			<th>파일</th>
			<td><input type="file" name="attach" multiple/></td>
		</tr>
	</table>
	<div>
		<button type="button" id="btnSend">보내기</button>
	</div>
	</form>
	
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script>
		$('#btnSend').click(()=>{
			//Ajax 객체 + 파일업로드 -> formdata 객체 사용
			const formData = new FormData();
			const files = $('input[name=attach]')[0].files;
			
			//전송할 데이터 담기
			formData.append('txt', $('input[name=txt]').val());
			for (let i=0; i<files.length; i++){
				formData.append('attach', files[i]);
			}
			
			$.ajax({
				type:'POST',
				url: '/file/ex04ok',
				data: formData,
				processData:false,
				contentType: false,
				success: function(result){
					
				},
				error: function(a,b,c) {
					console.log(a,b,c)
				}
			})
			
			
		});
	
	</script>
	
</body>
</html>