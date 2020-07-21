<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="utf-8">
<head>
	<meta charset="uft-8" />
	<title>summernote</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css" />
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script> 
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
	
	
	<link href="${pageContext.request.contextPath }/css/summernote-lite.css" rel="stylesheet">
	<script src="${pageContext.request.contextPath }/css/summernote-lite.js"></script>
    
	<script type="text/javascript">
        /* summernote에서 이미지 업로드시 실행할 함수 */
	 	function sendFile(file, editor) {
            // 파일 전송을 위한 폼생성
	 		data = new FormData();
	 	    data.append("uploadFile", file);
	 	    $.ajax({ // ajax를 통해 파일 업로드 처리
	 	        data : data,
	 	        type : "POST",
	 	        url : "./summernote_imageUpload.jsp",
	 	        cache : false,
	 	        contentType : false,
	 	        processData : false,
	 	        success : function(data) { // 처리가 성공할 경우
                    // 에디터에 이미지 출력
	 	        	$(editor).summernote('editor.insertImage', data.url);
	 	        }
	 	    });
	 	}
	</script>
</head>
<body>
<%
String kinds=request.getParameter("kinds");
%>
<jsp:include page="/include/navbar.jsp">
	<jsp:param value="index" name="thisPage"/>
</jsp:include>
	<div style="width: 60%; margin: auto;">
	<h1 style="text-align: left: ;">글쓰기</h1>
	<form class="form-group">
	<form action="${pageContext.request.contextPath }/writepage/insert.jsp" method="post">
				<label for="kinds"></label>
		<select name="kinds" id="kinds">
			<option value="funny" selected>유머</option>
			<option value="issue" >이슈</option>
			<option value="infor" >정보</option>
			<option value="soccer" >축구</option>
			<option value="baseball" >야구</option>
			<option value="basketball" >농구</option>
			<option value="lol" >롤</option>
			<option value="bag" >배그</option>
			<option value="fifa" >피파</option>
			<option value="free" >자유</option>
			<option value="question" >질문</option>
		</select>
		<input type="text" name="title" id="title" style="width: 60%;" placeholder="제목" />	
		<textarea id="summernote" name="summernote"></textarea>
		<input type="submit" value="글 작성" style="float: right;" onclick="goWrite(this.form)"/>
        <script>
            $(document).ready(function() {
                $('#summernote').summernote({ // summernote를 사용하기 위한 선언
                    height: 400,
					callbacks: { // 콜백을 사용
                        // 이미지를 업로드할 경우 이벤트를 발생
					    onImageUpload: function(files, editor, welEditable) {
						    sendFile(files[0], this);
						}
					}
				});
			});
		</script>
	</div>

  <jsp:include page="/include/footer.jsp">
	<jsp:param value="index" name="thisPage"/>
  </jsp:include>
</body>
</html>