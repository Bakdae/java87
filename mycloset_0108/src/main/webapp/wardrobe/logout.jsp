<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%response.setHeader("Refresh", "0; URL=index.jsp");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>my Closet</title>

<style type="text/css">
.wdr-delete-wrap {
	text-align: center !important;
}

.wdr-logout-msg {
	font-size: 24px !important;
	font-weight: 400 !important;
	color: #666 !important;
	text-shadow: 1px 1px #fff !important;
	margin-bottom: 24px !important;
	text-align: center !important;
}

.logout-btn {
	float: left !important;
	margin: 4px !important;
	width: 140px !important;
	height: 45px !important;
	font-size: 18px !important;
	color: #fff !important;
	border-radius: 3px !important;
	box-shadow: none !important;
	border: none !important;
}

.logout-btn:active, .logout-btn:hover {
	border: none !important;
	border-style: none !important;
}

.wdr-logout-reset {
	
}

.wdr-logout-submit {
	background: #85bbdb !important;
}
</style>

</head>
<body>

	<div class="wdr-logout-wrap">
		<h4 class="wdr-logout-msg">로그아웃할까요?</h4>
		<div class="wdr-logout-btn-group">
			<button class="logout-btn wdr-logout-reset" data-btn-id="0">
				<span>취소</span>
			</button>
			<button class="logout-btn wdr-logout-submit" data-btn-id="1">
				<c:if test="${!empty user}">
					<span class="logoutUser" onclick="logout();"> 확인 </span>
				</c:if>
				<c:if test="${!empty faceUser}">
					<span class="logoutFBUser" onclick="logout();"> 확인 </span>
				</c:if>
			</button>
		</div>
	</div>

	
	<script type="text/javascript">
		function logout() {
			location.href = "/index.jsp";
		}
	</script>


</body>
</html>