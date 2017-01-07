<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <%-- <%@ page ="false" %> --%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%	
	if(session.getAttribute("user") !=null|| session.getAttribute("faceUser") !=null){
  	 	session.invalidate();
	} 

%>
	
	
<!-- 실제 맨처음 index화면 로그인 안했을 경우. -->
<!DOCTYPE html>
<html class=''>
<META http-equiv="Expires" content="-1"> 
<META http-equiv="Pragma" content="no-cache"> 
<META http-equiv="Cache-Control" content="No-Cache"> 
<head>

<!-- CSS -->
<link rel="stylesheet" href="node_modules/sweetalert2/dist/sweetalert2.css">
<link rel="stylesheet" href="node_modules/bootstrap/dist/css/bootstrap.css"> 
 <link rel="stylesheet" href="front/css/jquery.fullpage.css">
<link rel="stylesheet" href="front/css/front.css">
<link rel="stylesheet" href="front/css/animate.css">
<link rel="stylesheet" href="wardrobe/css/colorbox.css">



</head>

<body>
	<header>
	<div class="frontHeader">
			<h1 id="frontLogo">
                <img src="front/css/images/logo_wh.svg" alt="logo"/>
            </h1>
			<!--<a class="l-right toggle-menu" href="#"> <i></i> <i></i> <i></i></a>-->
			
		</div>
	</header>
	
	<!-- Modal -->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">
			<!-- Modal Content-->
			<div class="container1">
				<div class="row">
					<div class="colmiddle">
						<div class="panel panel-login">
							<div class="panel-heading">
								<div class="row">
									<div class="col-xs-6">
										<a href="#" class="active" id="login-form-link">Login</a>
									</div>
									<div class="col-xs-6">
										<a href="#" id="register-form-link">Register</a>
									</div>
								</div>
								<hr>
							</div>
							<div class="panel-body">
								<div class="row">
									<div class="col-lg-12">
										<form id="login-form"  onsubmit="return fncLogin();"
											action="/user/login" name="loginForm" method="post"
											role="form" style="display: block;">
											<div class="form-group">
												<input type="email" name="email" id="emailBtn" tabindex="1"
													class="form-control" placeholder="Email" >
													
											</div>
											<div class="form-group">
												<input type="password" name="pwd" id="pwdBtn" tabindex="2"
													class="form-control" placeholder="password">
													<div  id="logCheck"  style="display:none"  >패스워드가 틀립니다.</div>
											</div>
											<div class="form-group text-center">
												<div><a href="#" style="color:blue" class="pwdCheck">비밀번호를 잃어버리셨습니까?</a></div>
											</div>
											<div class="form-group">
												<div class="row">
													<div class="col-sm-6 col-sm-offset-3">
														<input type="submit" name="login-submit" id="login-submit"
															tabindex="4" class="form-control btn btn-login"
															value="Log In">
													</div>
												</div>
											</div>
											<!-- 	<div class="form-group">
												<div class="row">
													<div class="col-lg-12">
														<div class="text-center">
															<a href="http://phpoll.com/recover" tabindex="5"
																class="forgot-password">Forgot Password?</a>
														</div>
													</div>
												</div>
											</div> -->
										</form>
										<div class="faceBookBtn" style="display: block">
											<button class="loginBtn loginBtn--facebook"
												onclick="FB.login();">Login with Facebook</button>
											<!-- <fb:login-button scope="public_profile,email" onlogin="checkLoginState();"> </fb:login-button> -->


										</div>
										<form id="register-form" action="user/addUser" method="post"
											role="form" style="display: none;">
											<div class="form-group">
												<input type="email" name="email" id="emailBtn1" tabindex="1"
													class="form-control" placeholder="Email" value=""  autocomplete=off>
													<div  id="emailcheck"  style="display:none"  >이메일입력하세요</div>
													<div  id="addCheck"  style="display:none"  >이메일중복</div>
													<div  id="add2Check"  style="display:none"  >이메일사용가능.</div>
													<a href="#" id="echeck" style='color: black' >인증하기</a>
													<input type="text" id="ekey" placeholder="인증번호 입력하세오." style="display: none">
													<input type="button" value="확인" id="ekeySubmit" style="display: none">
													<div id="resultDIV">
														  <!-- Ajax 로딩시 이미지 출력 영역 -->
														  <div id="ajax_indicator" style="display:none">
														   <p style="text-align:center; padding:16px 0 0 0; left:50%; top:10%; position:absolute;"><img src="/front/images/ajax-loader.gif" /></p>
														  </div>﻿
														</div>
																</div>
											
											<div class="form-group">
												<input type="password" name="pwd" id="pwdBtn1" tabindex="1"
													class="form-control" placeholder="Password" value="">
											</div>
											<div class="form-group">
												<input type="password" name="confirm-password" id="pwdBtn2"
													tabindex="2" class="form-control"
													placeholder="Confirm-Password">
													<div  id="pwdcheck"  style="display:none"  >패스워드가 일치하지 않습니다.</div>
											</div>
											<div class="form-group">
												<input type="text" name="nick" id="nickName"
													tabindex="2" class="form-control" placeholder="nickName">
											</div>
											<div class="form-group">
												<div class="row">
													<div class="col-sm-6 col-sm-offset-3">
														<input type="submit" name="register-submit"
															id="register-submit" tabindex="4"
															class="form-control btn btn-register"
															value="Register Now">
													</div>
												</div>
											</div>
										</form>
										<button class="btn btn-danger btn-default pull-right"
											data-dismiss="modal" style="margin-top: 30px;">
											<span class=glyphicon-remove"></span> Cancel
										</button>

									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
	<!-- modal content 끝 -->

	<!-- 각 화면 섹션 나눈곳 -->
	<div id="fullpage">
		<section class="vertical-scrolling">
			<article>
				<h2 class="y">myCloset.</h2>
				<h3>잠깐 구경하러 왔다가</h3>
				<h4>눌러앉게 될걸요.</h4>

				<!-- Trigger the modal with a button -->
				<button type="button" class="btnfirst" id="myBtn" style="color:#F2AE72" >시작하기</button>
				<!-- <div scope="public_profile,email"  onlogin="checkLoginState();"   class="fb-login-button" data-max-rows="1" data-size="xlarge" data-show-faces="false" data-auto-logout-link="true"></div> -->



				<div class="scroll-icon">
					<!-- <a href="#fifthSection/1" class="icon-up-open-big"></a> -->
				</div>
			</article>
		</section>
		<section class="vertical-scrolling">
			<article>
							
				<div>
				<h2 class="c">MyCloset은 너무 쉬워 </h2></br>
				<h2 class="c">설명이 따로 필요없어요.</h2>
				</div>
					<p class="sec2"> 손쉽게 뚝딱 옷장을 만들어 어떤 스타일이든 넣을 수 있습니다.</p>
					<p class="sec2"> 빈티지,댄디,힙합,캐쥬얼 등 코믹한 스타일까지 뭐든지요.</p>
					<p class="sec2"> 다양한 개성이 모인 myCloset, 없는 거 없이 다 있답니다.</p>
			
				<div>
				<img class="frontLogo" id="logoOn" src="front/images/front_logo_on.svg" style="display:block;"></img>
    			<img class="frontLogo" id="logoOff" src="front/images/front_logo_off.svg" style="display:none;"></img>
				</div>
			</article>
		</section>


		<section class="vertical-scrolling">
			<h2 class="a">Mycloset은 다른사람의 패션을 가져옵니다.</h2>
			<h3 class="a">알고 보니 모두 이렇게 간단하게 재미난 포스팅을 하고 있었다고요? 친구들이 공유하던 수많은
				기발한 블로그, 그게 모두 Mycloset 블로 그였다는 사실. 이제, 멋진 블로그를 쉽게 찾아 팔로우하세요. 전 세계
				블로거 들을 찾아 서로 팔로우하는 재미를 맛보세요.</h3>
			<img class="a" src="front/images/background_3.png" />
		</section>
		<section class="vertical-scrolling">
			<img class="b" src="front/images/wordrobe_profile.png" /> <img
				class="b" src="front/images/wordrobe_status.png" />
			<h2>어떻게 하시는지 아시죠?</h2>
			<h3>팔로우하는 블로그의 모든 포스트가 대시보드에 나타납니다. 멋진 포스트가 있다면 리블로그하세요. 리블로그해서
				내 블로그로 가져올 수도 있고, 댓글도 달 수 있답니다. 요게 바로 패셔니스타 친구를 만드는 방법!</h3>
		</section>
		<section class="vertical-scrolling">
			<article>
			<div class="horizontal-scrolling">
			<h2 class="y">myCloset.</h2>
				<h3>잠깐 구경하러 왔다가</h3>
				<h4>눌러앉게 될걸요.</h4>

				<!-- Trigger the modal with a button -->
				<button type="button" class="btnfirst" id="myBtn2" style="color:#F2AE72">시작하기</button>
			</div>
			<!-- <div class="horizontal-scrolling">
      <h2>fullPage.js</h2>
      <h3>This is the second slide</h3> 
      <p class="end">Thank you!</p>
    </div> -->
    </article>
		</section>
	</div>

	<!-- JS -->
	<script src="node_modules/jquery/dist/jquery.js"></script>
	<script src="node_modules/bootstrap/dist/js/bootstrap.min.js"></script>
	<script src="node_modules/sweetalert2/dist/sweetalert2.js"></script>
	<!-- JS CDN -->
	<script
		src='//production-assets.codepen.io/assets/common/stopExecutionOnTimeout-58d22c749295bca52f487966e382a94a495ac103faca9206cbd160bdf8aedf2a.js'></script>
	<script
		src='https://cdnjs.cloudflare.com/ajax/libs/fullPage.js/2.6.6/jquery.fullPage.min.js'></script>
	<script src="front/js/front.js"></script>
	<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.13.1/jquery.validate.js"></script>
    <script src="http://cdn.ckeditor.com/4.4.7/standard/ckeditor.js"></script>
	<script src="../wardrobe/js/jquery.colorbox-min.js"></script>
	<script type="text/javascript">
		
				
		//애니메이션효과
		 $(".y").animate({
		    width: "100%",
		    marginCenter: "15in",
		    fontSize: "10em",
		    borderWidth: "40px"
		  }, 1500 ); 
		
		$(".form-control btn btn-login").click(function() {
			fncLogin();
		});
		
  
        setInterval(function(){
          $("#logoOff").css("display","block");
        }, 370);
        setInterval(function(){
          $("#logoOff").css("display","none");
        }, 470);
        
        //인증번호 이메일 발송기능
        $("#echeck").on("click", function(){
        	   var email = $("#emailBtn1").val();
        	  
        	$("#ekeySubmit").attr("style", "display:block");
        	$("#ekey").attr("style", "display:block");
        	$('#contents').empty().html('<img src="/front/images/ajax-load.gif" />');
			
        	
        	$.get("user/emailok", {"email" : email}, function (user) {
        		
        	    var dbemail = user.email;
               	   
        	    if(email == dbemail){
 					swal("이메일 중복");
 					return false;
        		}else{
        			
        			$.ajax({
    				    type: "post",
    				    global: true,
    				    async: true,
    				    url: "/user/emailCheck",
    				    dataType : "html",
    				    timeout: 30000,
    				    cache: true,
    				    data: {"emailBtn1":email},
    				    contentType : "application/x-www-form-urlencoded; charset=utf-8",
    				    error: function (jqXHR, textStatus, errorThrown) {
    				        swal(errorThrown);
    				    },
    				    success: function (data, textStatus, jqXHR) {
    				        if(data=='success'){
    				        	swal("인증번호를 메일로 발송하였습니다.");
    				        }else{
    				        	swal("발송실패, 이메일 확인하세요.");
    				        }
    			  	    },
    				    beforeSend: function (jqXHR, settings) {
    				    	 $('#ajax_indicator').show().fadeIn('fast'); 

    				    },
    				    complete: function (jqXHR, settings) {
    				    	$('#ajax_indicator').fadeOut();
    				    }
    				});
        		}
        	    return false;
        	});
        	
        	
       });
        ///이메일 인증번호 확인 기능
        $("#ekeySubmit").click(function(){
        		var ekey=$("#ekey").val();
        		$.post('/user/emailKey',{"emailNum":ekey},function(checkResult){
            		if(checkResult){
            		
            		$("#ekeySubmit").attr("style", "display:none");
                	$("#ekey").attr("style", "display:none");
                	$("#echeck").attr("style", "display:none");
                	$("#add2Check").append("<div style='color: red' id='ekeyok'>인증완료</div>");
                	
            		}
            		else{
            		swal("인증번호가 일치하지않습니다.");            		       	
            		}
            	});
        });
        
        ///findpassword
        $(".pwdCheck").click(function(){
        	$.colorbox(
        		{
        		href:"/front/Password.jsp",
        		width:'400px',
        		height:'333px',
        		scrolling:false,
        		iframe:true}
        		);
        });
        ///////회원가입vailidation
        
        $("#register-submit").click(function(){
        	var ekeyok= $("#ekeyok").val();
        	var emailBtn1 = $("#emailBtn1").val();
        	var pwdBtn1 = $("#pwdBtn1").val();
        	var pwdBtn2 = $("#pwdBtn2").val();
        	var nickName = $("#nickName").val();
                    
         
         /*    if(ekeyok==null ){
        		swal("이메일 인증을 완료해주십시오.")
        		$("#emailBtn1").focus();
        		return false;
        	}  */
            if(pwdBtn1==null || pwdBtn1==""){
        		swal("패스워드 입력해주세요.")
        		$("#pwdBtn1").focus();
        		return false;
        	}if(pwdBtn2==null || pwdBtn2 ==""){
        		swal("패스워드 확인해주세요.")
        		$("#pwdBtn2").focus();
        		return false;
        	}if(nickName==null ||nickName =="") {
        		swal("닉네임 입력해주세요.")
        		$("#nickName").focus();
        		return false;
        	}
        	
        	
        	return true;
        });
    	///회원가입 이메일중복 방지기능
    	
    	
    	</script>
    	
</body>
</html>