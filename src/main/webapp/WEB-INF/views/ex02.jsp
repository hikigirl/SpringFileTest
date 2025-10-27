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
	<!-- ex02.jsp -->
	<h1>파일업로드 <small>다중 파일 + multiple 속성</small></h1>
	<form action="/file/ex02ok.do" method="post" enctype="multipart/form-data">
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
		<button>보내기</button>
	</div>
	</form>
	
	<script>
		document.querySelector('form').onsubmit=((event) => {

			const files = document.querySelector('input[name=attach]').files;
			//alert(files.length);
			let totalsize = 0;
			Array.from(files).forEach(file => {
				//alert(file.name);
			
				if(checkFile(file.name,file.size)) {
					event.preventDefault();
					return false;
				}
				totalsize += file.size;
				if(totalsize > 52428800) {
					alert('파일 크기의 합은 50MB를 초과할 수 없습니다.');
					event.preventDefault();
					return false;
				}
				
			});
			
			//전송 진행
			
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