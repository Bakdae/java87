<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="../node_modules/bootstrap/dist/css/bootstrap.min.css">
<style type="text/css">
.commentButton {
	width: 50%;
	border: 1px solid black;
	border-radius: 70px;
}

#demo {
	width: 50%;
}
}
</style>

</head>
<body>

	<div class="container">
		<h2>댓글 만들기</h2>
		<p>Click on the button to toggle between showing and hiding
			content.</p>
		<button type="button" class="commentButton" data-toggle="collapse"
			data-target="#demo">댓글</button>
		<div id="demo" class="collapse">
			ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut
			aliquip ex ea commodo consequat dididididi ummmmm................
			<div class="commentInput">


				<!-- /////////////////////////////////////// -->
				<!-- /////////////////////////////////////// -->

				<form name="comment_input" action="/comment/addComment"
					method="POST">
					<div>
						<input type="hidden" id="styleNo" name="styleNo" value="41">
						<input type="hidden" id="hrs" name="hrs" value="101">
						<input type="text" name="content" id="content">
					</div>
					<input type="submit" value="전송">
				</form>
			</div>

		</div>
	</div>

	<script ="type="text/javascript">
		$(function() {

			var cmtStr = "";
			cmtStr += '<div class="ok"></div>'

		});
	</script>



	<script src="../node_modules/jquery/dist/jquery.js"></script>
	<script src="../node_modules/bootstrap/dist/js/bootstrap.min.js"></script>
	<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->

</body>

</html>