<%@page import="test.dao.BulletinDao"%>
<%@page import="test.dto.BulletinDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//GET 방식 파라미터로 전달되는 수정할 글 번호를 읽어온다. ?num=xx
	int num=Integer.parseInt(request.getParameter("num"));
 	//BoardDao 객체를 이용해서 수정할 글 정보를 얻어온다.
 	BulletinDto dto=BulletinDao.getInstance().bulletin_getData(num);
 	String url = request.getParameter("url");
 	String kinds =request.getParameter("kinds");
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>updateform.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/make.css" />
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>

	<style>
	#content{
		width: 99.5%;
		height: 500px;
	}
</style>
</head>
<body>
<jsp:include page="/include/navbar.jsp">
	<jsp:param value="<%=kinds %>" name="thisPage"/>
</jsp:include>
<div class="container">
	<h1>수정 글 페이지.</h1>
	<hr style="clear:left;"/>
		<form action="update.jsp?url=<%=url %>" method="post">
	<div class="form-inline">
		<input type="hidden" name="num" value="<%=dto.getNum()%>"/>
		<input type="hidden" name="name" value="<%=dto.getName()%>"/>
		<input class="form-control" type="text" id="num" style="width: 8%" value="<%=dto.getNum() %>" disabled/>
		<input class="form-control" type="text" id="name" style="width: 10%"  value="<%=dto.getName() %>" disabled/>
		<input class="form-control" type="text" name="title" id="title" style="width: 40%;" value="<%=dto.getTitle() %>"/>	
	</div>
		<div class="form-group">
			<label for="content"></label>
			<textarea name = "content" id = "content" cols="30" rows="10" value="" /><%=dto.getContent() %></textarea>
		</div>
		<button type="submit" class="btn btn-success" onclick="submitContents(this);">수정</button>
		<button class="btn btn-danger" type ="reset"> 취소</button>
		</form>
</div> 

		
		<%--
	[ SmartEditor 를 사용하기 위한 설정 ]
	
	1. WebContent 에 SmartEditor  폴더를 복사해서 붙여 넣기
	2. WebContent 에 upload 폴더 만들어 두기
	3. WebContent/WEB-INF/lib 폴더에 
	   commons-io.jar 파일과 commons-fileupload.jar 파일 붙여 넣기
	4. <textarea id="content" name="content"> 
	   content 가 아래의 javascript 에서 사용 되기때문에 다른 이름으로 바꾸고 
	      싶으면 javascript 에서  content 를 찾아서 모두 다른 이름으로 바꿔주면 된다. 
	5. textarea 의 크기가 SmartEditor  의 크기가 된다.
	6. 폼을 제출하고 싶으면  submitContents(this) 라는 javascript 가 
	      폼 안에 있는 버튼에서 실행되면 된다.
 --%>
<!-- SmartEditor 에서 필요한 javascript 로딩  -->
<script src="${pageContext.request.contextPath }/SmartEditor/js/HuskyEZCreator.js"></script>
<script>
	var oEditors = [];
	
	//추가 글꼴 목록
	//var aAdditionalFontSet = [["MS UI Gothic", "MS UI Gothic"], ["Comic Sans MS", "Comic Sans MS"],["TEST","TEST"]];
	
	nhn.husky.EZCreator.createInIFrame({
		oAppRef: oEditors,
		elPlaceHolder: "content",
		sSkinURI: "${pageContext.request.contextPath}/SmartEditor/SmartEditor2Skin.html",	
		htParams : {
			bUseToolbar : true,				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseVerticalResizer : true,		// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseModeChanger : true,			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
			//aAdditionalFontList : aAdditionalFontSet,		// 추가 글꼴 목록
			fOnBeforeUnload : function(){
				//alert("완료!");
			}
		}, //boolean
		fOnAppLoad : function(){
			//예제 코드
			//oEditors.getById["ir1"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
		},
		fCreator: "createSEditor2"
	});
	
	function pasteHTML() {
		var sHTML = "<span style='color:#FF0000;'>이미지도 같은 방식으로 삽입합니다.<\/span>";
		oEditors.getById["content"].exec("PASTE_HTML", [sHTML]);
	}
	
	function showHTML() {
		var sHTML = oEditors.getById["content"].getIR();
		alert(sHTML);
	}
		
	function submitContents(elClickedObj) {
		oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);	// 에디터의 내용이 textarea에 적용됩니다.
		
		// 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("content").value를 이용해서 처리하면 됩니다.
		
		try {
			elClickedObj.form.submit();
		} catch(e) {}
	}
	
	function setDefaultFont() {
		var sDefaultFont = '궁서';
		var nFontSize = 24;
		oEditors.getById["content"].setDefaultFont(sDefaultFont, nFontSize);
	}
</script>
<jsp:include page="/include/footer.jsp">
	<jsp:param value="index" name="thisPage"/>
</jsp:include>
</body>
</html>