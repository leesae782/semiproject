<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/writepage/insertform.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
</head>
<body>

<jsp:include page="/include/navbar.jsp">
	<jsp:param value="index" name="thisPage"/>
</jsp:include>


	<div class="container">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote-lite.min.js"></script>
<script src="/summernote-master/lang/summernote-ko-KR.js"></script>

<section id="bbs_write">
	<h3>글쓰기</h3>
	<form method="post" id = "write" name="write" action="insert.jsp" onsubmit="return check_submit();" enctype=multipart/form-data>
		<input type="hidden" name="page" value="1">
		<input type="hidden" name="id" value="openbbs">
		<input type="hidden" name="no" value="">
		<input type="hidden" name="select_arrange" value="headnum">
		<input type="hidden" name="desc" value="asc">
		<input type="hidden" name="page_num" value="">
		<input type="hidden" name="keyword" value="">
		<input type="hidden" name="category" value="">
		<input type="hidden" name="sn" value="off">
		<input type="hidden" name="ss" value="on">
		<input type="hidden" name="sc" value="off">
		<input type="hidden" name="mode" value="write">

		<div class="form-group">
			<input class="form-control" type="text" name="subject" id="subject" placeholder="제목" class="form-control" value="" />
			<textarea name="memo" id="memo"  cols=55.8  rows="20"></textarea>
		</div>
		<button type="submit" class="btn btn-primary">완료</button>
		<button type="reset" class="btn btn-primary">취소</button>
	</form>
	<!--
	<div class="done">
		<input type="submit" value="완료" accesskey="s" class="btn btn-primary btn-lg" />
					<input type="checkbox" class="cb" id="make_this_notice" name=notice  value=1><label for="make_this_notice"><i class="material-icons-round">check_box</i><span>공지 올리기</span></label>
				
					<input type="checkbox" name=use_html value=2 checked style="visibility: hidden;">
		
	</div>-->

</section>
<script>
	
	$('#memo').summernote({
		placeholder: '내용을 입력해주세요.<br>- shift + enter: 한 줄 내리기<br>- enter: 단락 나누기',
		tabsize: 2,
		height: 300,
		disableDragAndDrop: false,
		toolbar: [
			['font', ['bold', 'underline', 'clear']],
			['color', ['color']],
			['table', ['table']],
			['insert', ['link', 'picture', 'video']],
			['view', ['codeview']]
		]
});
	
	$('div.note-group-select-from-files').remove();

	
</script>
	</div>
	
	<jsp:include page="/include/footer.jsp">
	<jsp:param value="index" name="thisPage"/>
  </jsp:include>
</body>
</html>