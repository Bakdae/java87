<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- CSS -->
<link rel="stylesheet" href="../node_modules/sweetalert2/dist/sweetalert2.css">
<link rel="stylesheet" href="../account/css/reset.css">
<link rel="stylesheet"
	href="../node_modules/bootstrap/dist/css/bootstrap.css">
<link rel="stylesheet" href="../account/css/fonts.css">
<link rel="stylesheet" href="../account/css/account.css">
<link rel="stylesheet" href="../account/css/jquery.nailthumb.1.1.min.css">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>account</title>
</head>

<body>

	<form name="updateUserForm" id="updateUserForm"
		enctype="multipart/form-data">
		<div id="accountWrap" class="container">
			<div class="row">
				<c:if test="${!empty user.phot_path}">
			     	<div id="acnt-profile" class="form-group text-center">
					   <div id="acntUserImgWrap">
							<img src="../fileUpload/${user.phot_path}" 
								id="acnt-user-img" alt="Responsive image">
						</div>
						<label for="acnt-input-file">프로필 사진 변경</label>
						<input type="file" id="acnt-input-file" name="testFile"
							onchange="readURL(this);">
					</c:if>
					<c:if test="${!empty faceUser.phot_path}">
				<div id="acnt-profile" class="form-group text-center">
					   <div id="acntUserImgWrap">
							<img src="${faceUser.phot_path}" 
								id="acnt-user-img" alt="Responsive image">
							<p>페이스북 로그인 사용자</p>
							<input type="hidden" id="acnt-input-file" name="testFile" >
						</div>
					</c:if>
				</div>
			</div>
			<!-- //row 1 -->

			<div class="row ">
				<div class="form-group">
					<h3 class="text-center acnt-title">MY ACCOUNT</h3>
				</div>
			</div>
			<!-- //row 2 -->
			<c:if test="${!empty user }">
				<div id="acnt-info-box" class="row">
				<input type="hidden" name="user_no" id="user_no"
							value="${user.user_no}">
					<div id="acnt-info" class="form-group ">
						<label for="exampleInputEmail1"> Email </label> <input
							type="email" class="form-control" id="inputEmail" name="email"
							value="${user.email}">
					</div>
					<div id="acnt-nick" class="form-group">
						<label for="exampleInputName2">Name</label> <input type="text"
							class="form-control" id="inputName" name="nick"
							value="${user.nick}">
					</div>
					<div id="acnt-pwd" class="form-group">
						<label for="InputPassword1">Password</label> <input
							type="password" class="form-control" id="inputPwd" name="pwd"
							value="${user.pwd}" placeholder="Password">
					</div>
					<div id="acnt-con-pwd" class="form-group">
						<label for="InputPassword1">Confirm-Password</label> <input
							type="password" class="form-control" id="inputConPwd"
							placeholder="Confirm-Password">
					</div>
				</div>
				<!-- //row 3 -->
				<input type="submit" id="acnt-btn" class="btn btn-default btn-sm"
					value="Submit">
			</c:if>

			<c:if test="${!empty faceUser}">
				<div id="acnt-info-box" class="row">
					<div id="acnt-info" class="form-group ">
						<input type="hidden" class="form-control" id="inputEmail"
							name="email" value="${faceUser.email}">
					</div>
					<div id="acnt-nick" class="form-group">
						<label for="exampleInputName2">Name</label> <input type="text"
							class="form-control" id="inputName" name="nick"
							value="${faceUser.nick}">
					</div>
					<div id="acnt-pwd" class="form-group">
						<input type="hidden" class="form-control" id="inputPwd" name="pwd"
							value="${faceUser.pwd}" placeholder="Password">
					</div>
					<div id="acnt-con-pwd" class="form-group">
						<input type="hidden" class="form-control" id="inputConPwd"
							placeholder="Confirm-Password">
					</div>
				</div>
				<!-- //row 3 -->
				<input type="submit" id="acnt-btn" class="btn btn-default btn-sm"
					value="Submit">
			</c:if>


		</div>
		<!-- //accountWrap -->
	</form>

	<!--JS-->
	<script src="../node_modules/jquery/dist/jquery.js"></script>
	<script src="../node_modules/bootstrap/dist/js/bootstrap.min.js"></script>
	<script src="../account/js/account.js"></script>
	<script src="../node_modules/jquery-form/jquery.form.js"></script>
	<script src="../node_modules/sweetalert2/dist/sweetalert2.js"></script>
	 <script src="../account/js/jquery.nailthumb.1.1.min.js"></script>

	<script type="text/javascript">
	 $(document).ready(function() {
		    $('#acntUserImgWrap').nailthumb({width:150, height:150, fitDirection:'top center'});
		}); 
	
		$("#acnt-btn").click(function() {
			
			 	var inputEmail = $("#inputEmail").val();
	        	var inputPwd = $("#inputPwd").val();
	        	var inputConPwd = $("#inputConPwd").val();
	        	var inputName = $("#inputName").val();
				
					
			if(inputEmail==null ){
        		alert("이메일입력해주세요.")
        		$("#emailBtn1").focus();
        		return false;
        	}else if(inputEmail==null || inputEmail==""){
        		alert("패스워드 입력해주세요.")
        		return false;
        	}else  	if(inputConPwd==null || inputConPwd ==""){
        		alert("패스워드 확인입력해주세요.")
        		return false;
        	}else 	if(inputName==null ||inputName =="") {
        		alert("닉네임 입력해주세요.")
        		return false;
        	}else if(inputPwd != inputConPwd){
        		alert("비밀번호확인이 틀립니다.")
        		return false;
        	} 	
        	else {
        		
        		 var form = new FormData($("#updateUserForm")[0]);
        		 var pwdsize = $("#inputPwd").val();
        		if (pwdsize.length > 2) {
    				$.ajax({
    					url : '/user/updateUser',
    					processData : false,
    					contentType : false,
    					data : form,
    					type : 'POST',
    					error: function (jqXHR, textStatus, errorThrown) {
    				        swal(errorThrown);
    				    },
    				    success: function (data, textStatus, jqXHR) {
    				    	swal("수정완료");
    				    	
    				    	
    			  	    },
    				    beforeSend: function (jqXHR, settings) {
    				    

    				    },
    				    complete: function (jqXHR, settings) {
    				    	window.location.reload();
    				    }
    				});//end ajax
    			} else {
    				$.post("/user/faceupdateUser", {
    					"email" : email,
    					"nick" : nick
    				}, function (user) {
    					window.location.reload();
    					window.location.reload();
    				});//end post
    			}//end else
        	}//end else
        		return true;
		});//end click
		
			
	</script>
</body>
</html>