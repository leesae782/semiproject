<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="utf-8">
<head>
	<meta charset="uft-8" />
	<title>summernote</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css" />
	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
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
<jsp:include page="/include/navbar.jsp">
	<jsp:param value="index" name="thisPage"/>
</jsp:include>
	<div style="width: 60%; margin: auto;">
	<h1 style="text-align: left: ;">summernote</h1>
	<form action="${pageContext.request.contextPath }/writepage/insert.jsp" method="post">
		
		<input type="text" name="title" id="title" style="width: 40%;" placeholder="제목"/>
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