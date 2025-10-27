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
	
	<script>
		document.querySelector('form').onsubmit=((event) => {
			//폼이 전송되기 직전에 발생하는 이벤트
			//파일 크기 or 파일 형식 -> 유효성 검사
			//- 유효함 -> 아무것도 x
			//- 유효하지 않음 -> return false, event.preventDefault()
			const attach = document.querySelector('input[name=attach]');
			//alert(attach.value); //C:\fakepath\필기.txt
			//console.log(attach.files[0]);
			//alert(attach.files[0].size);
			const filename = attach.files[0].name;
			const filesize = attach.files[0].size;
			
			if(checkFile(filename, filesize)) {
				//전송 금지
				
				event.preventDefault();
				return false;
			}
			
			//if문에 안걸리면 전송 진행
			
		});
		
		function checkFile(filename, filesize) {
			const maxsize = 10485760;
			const regex = /(.*?)\.(exe|sh)$/gi;
			
			if(filesize>maxsize) {
				alert('단일 파일은 10MB를 초과할 수 없습니다.');
				return true;
			}
			
			if(regex.test(filename)) {
				alert('해당 파일은 업로드할 수 없습니다.');
				return true;
			}
			
			return false;
		}
	
	</script>
	
</body>
</html>