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

.wdr-delete-msg {
	font-size: 24px;
	font-weight: 400;
	color: #666;
	text-shadow: 1px 1px #fff;
	margin-bottom: 24px;
}

.delete-btn {
    width: 140px !important;
    height: 45px !important;
    font-size: 18px !important;
    color: #fff !important;
    border-radius: 3px !important;
    box-shadow: none !important;
    border: none;
}

.delete-btn:active,
.delete-btn:hover {
    border: none;
    border-style: none;
}

.wdr-delete-reset {
}

.wdr-delete-submit {
    background: #85bbdb;
}


</style>

</head>
<body>

	<div class="wdr-delete-wrap">
		<h4 class="wdr-delete-msg">옷장을 삭제할까요?</h4>
		<div class="wdr-delete-btn-group">
			<button class="delete-btn wdr-delete-reset" data-btn-id="0">
				<span>취소</span>
			</button>
			<button class="delete-btn wdr-delete-submit" data-btn-id="1">
				<span>확인</span>
			</button>
		</div>
	</div>


</body>
</html>