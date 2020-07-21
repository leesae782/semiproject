<%@page import="test.dao.bulletin_dao"%>
<%@page import="test.dto.bulletin_dto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//GET 방식 파라미터로 전달되는 수정할 글 번호를 읽어온다. ?num=xx
	int num=Integer.parseInt(request.getParameter("num"));
 	//BoardDao 객체를 이용해서 수정할 글 정보를 얻어온다.
 	bulletin_dto dto=bulletin_dao.getInstance().bulletin_getData(num);
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	<div style="width: 60%; margin: auto;">
	<h1 style="text-align: left: ;">summernote</h1>
	<form action="update.jsp" method="post">
		<input type="hidden" name="num" value="<%=dto.getNum()%>"/>
		<input type="text" id="num" value="<%=dto.getNum() %>" disabled/>
		<input type="text" id="name" name="name" value="<%=dto.getName() %>" disabled/>
		<input type="text" name="title" id="title" style="width: 40%;" value="<%=dto.getBulletin_title() %>"/>
		<textarea id="summernote" name="summernote"><%=dto.getBulletin_content()%></textarea>
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
		<button type="submit">수정확인</button>
		<button type="reset"><a href="${pageContext.request.contextPath }/board/detail.jsp?num=<%=dto.getNum() %>">취소</a></button>
	</div> 
</body>
</html>