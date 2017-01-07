<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../header/header.jsp"></jsp:include>
<html lang="ko">
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<title>card UI</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">

<!-- CSS -->
<!-- <link rel="stylesheet" href="bootflat_main.css"> -->
<link rel="stylesheet" href="../node_modules/bootflat/bootflat/css/bootflat.css">
<link rel="stylesheet" href="../node_modules/bootstrap/dist/css/bootstrap.css">
<link rel="stylesheet" href="../main/css/fonts.css">
<link rel="stylesheet" href="../main/css/main.css">

</head>

<body>
    
	<!--  card post start  -->
	<div class="container">
		<div class="grid" id="grid" style="opacity: '1';"></div>
	</div>

	<!--  SaveModal -->
	<div id="saveModal" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Modal Header</h4>
				</div>
				<div class="modal-body">
					<p>Some text in the modal.</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div>
	
	<c:if test="${!empty style}"><input id="delStr">${style.styleLike}</input></c:if>
	
	<!-- JS -->
	<script src="../node_modules/jquery/dist/jquery.js"></script>
	<script src="../node_modules/bootstrap/dist/js/bootstrap.min.js"></script>
	<script src="../node_modules/bootstrap/js/modal.js"></script>
	<script src="../main/js/eg.pkgd.min.js"></script>
	<script src="../main/js/main.js"></script>
	<script src="../main/js/jquery.colorbox-min.js"></script>

	<script>
	
	//챗봇 호출할때 안되면..
	/* document.onLoad(function(){
		   var param = '${param.autoLoadSeq}'';
		   if (  ) {
			   //팝업 호출
		   }
	}); */
	
	$(function(){
	    $("#imgHanger").hover(function() {
	        $(this).attr("src", "css/images/hang_line_bl.svg");
	    }, function() {
	        $(this).attr("src", "css/images/hang_bl.svg");
	    });
	});
	
	</script>

</body>
</html>