<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>my Closet</title>

<style type="text/css">

.wdr-delete-wrap {
	text-align: center;
}

.wdr-logout-msg {
	font-size: 24px;
	font-weight: 400;
	color: #666;
	text-shadow: 1px 1px #fff;
	margin-bottom: 24px;
	text-align: center;
}

.logout-btn {
    float: left;
    margin: 4px;
    width: 140px;
    height: 45px;
    font-size: 18px;
    color: #fff;
    border-radius: 3px;
    box-shadow: none;
    border: none;
}

.logout-btn:active,
.logout-btn:hover {
    border: none;
    border-style: none;
}

.wdr-logout-reset {
}

.wdr-logout-submit {
    background: #85bbdb;
}


</style>

</head>
<body>

	<div class="wdr-logout-wrap">
		<h4 class="wdr-logout-msg"> 로그아웃할까요? </h4>
		<div class="wdr-logout-btn-group">
			<button class="logout-btn wdr-logout-reset" data-btn-id="0">
				<span>취소</span>
			</button>
			<button class="logout-btn wdr-logout-submit" data-btn-id="1">
				<span  onclick="logout();">확인</span>
			</button>
		</div>
	</div>
	
	<script src="../front/js/facebooklogout.js"></script>
    <script type="text/javascript">
        
    function logout() {
      location.href = "/index.jsp";
    };

    </script>


</body>
</html>