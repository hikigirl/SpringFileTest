<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="http://bit.ly/3WJ5ilK" />
	<style>
		#attach-zone {
			borer: 1px solid #CCC;
			background: #EFEFEF;
			width: 300px;
			height: 100px;
			overflow: auto;
		}
		#attach-zone .item {
			font-size: 12px;
			margin: 5px 10px;
		}
	
	</style>
</head>
<body>
	<!-- ex03.jsp -->
	<h1>파일업로드 <small>다중 파일 + file drop</small></h1>
	<form action="/file/ex02ok.do" method="post" enctype="multipart/form-data">
	<table class="vertical">
		<tr>
			<th>텍스트</th>
			<td><input type="text" name="txt" value="홍길동" /></td>
		</tr>
		<tr>
			<th>파일</th>
			<td>
				<div id="attach-zone"></div>
				<input type="file" name="attach" style="display: none;"/>
			</td>
		</tr>
	</table>
	<div>
		<button>보내기</button>
	</div>
	</form>
	
	<script>
		const attachZone = document.getElementById('attach-zone');
		
		attachZone.ondragenter = (e) => {
			e.preventDefault();
			e.stopPropagation();
		};
		attachZone.ondragover = (e) => {
			e.preventDefault();
			e.stopPropagation();
		};
		attachZone.ondragleave = (e) => {
			e.preventDefault();
			e.stopPropagation();
		};
		
		attachZone.ondrop = (e) => {
			
			e.preventDefault();
			
			const files = e.dataTransfer.files;
			
			//console.log(files);
			
			if (files != null && files != undefined) {
				
				let temp = '';
				
				for (let i=0; i<files.length; i++) {
					let filename = files[i].name;
					let filesize = files[i].size/1024/1024;
					filesize = filesize < 1 ? filesize.toFixed(2) : filesize.toFixed(1);
					temp += `
						<div class="item">
							<span>\${filename}</span>
							<span>\${filesize}MB</span>
						</div>
					
					`;
					
				}
				
				attachZone.innerHTML = temp;
				document.querySelector('input[name=attach]').files = files;
				
			}
			
		};
	
	</script>
	
</body>
</html>