<%@page import="test.memberdto.MemberDto"%>
<%@page import="test.memberdao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="utf-8">
<head>
	<meta charset="uft-8" />
	<title>/writepage/insertform</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>

</head>

<style>
	#content{
		width: 99.5%;
		height: 300px;
	}
</style>
	
	
	
 <%
 	String id = (String)session.getAttribute("id");
 	MemberDao dao = MemberDao.getInstance();
 	MemberDto dto =dao.getData(id);
 	String name = dto.getNick();
 	String url = request.getParameter("url");
 	String kinds = request.getParameter("kinds");
 %>

<body>
<jsp:include page="/include/navbar.jsp">
	<jsp:param value="<%=kinds %>" name="thisPage"/>
</jsp:include>
<div class="container">
	<h2 style="background-color: #fbf2ffc4;">게시글 작성</h2>
	<hr style="clear:left;"/>

	<form action="insert.jsp?url=<%=url %>" method="post">	
	<input type="hidden"  name ="name" value ="<%=name %>"/>
<div class="form-inline">
	<select class="form-control" name='kinds' >
	  <option <%if(kinds.equals("funny")){ %>selected <%} %> value='funny'>유머</option>
	  <option <%if(kinds.equals("issue")){ %>selected <%} %>value='issue'>이슈</option>
	  <option <%if(kinds.equals("infor")){ %>selected <%} %>value='infor'>정보</option>
	  <option <%if(kinds.equals("lol")){ %>selected <%} %>value='lol'>LOL</option>
	  <option <%if(kinds.equals("bag")){ %>selected <%} %>value='bag'>배틀 그라운드</option>
	  <option <%if(kinds.equals("fifa")){ %>selected <%} %>value='fifa'>FIFA Online</option>
	  <option <%if(kinds.equals("soccer")){ %>selected <%} %>value='soccer'>축구</option>
	  <option <%if(kinds.equals("basketball")){ %>selected <%} %>value='basketball'>농구</option>
	  <option <%if(kinds.equals("baseball")){ %>selected <%} %>value='baseball'>야구</option>
	  <option <%if(kinds.equals("free")){ %>selected <%} %>value='free'>자유</option>
	  <option <%if(kinds.equals("question")){ %>selected <%} %>value='question'>QnA</option>
	  
	</select>
		<label for="title"></label>
		<input class="form-control"  type="text" name = "title" id = "title" style="width: 70%" placeholder="제목" />
</div>
	
	<div class="form-group">
		<label for="content"></label>
		<textarea name = "content" id = "content" cols="30" rows="10" /></textarea>
	</div>
	
	<button type="submit" class="btn btn-success" onclick="submitContents(this);">글쓰기</button>
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