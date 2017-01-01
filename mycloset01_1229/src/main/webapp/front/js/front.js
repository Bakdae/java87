/**
 * fullPage.js 기능구현 슬라이드 위아래 login validation check Ajax post 방식으로 로그인 구현
 */
var $header_top = $('.header-top');
var $nav = $('nav');
/*
 * $header_top.find('a').on('click', function () {
 * $(this).parent().toggleClass('open-menu'); });
 */

/*******************************************************************************
 * 
 * login facebook start
 ******************************************************************************/

// This is called with the results from from FB.getLoginStatus().
window.fbAsyncInit = function() {
	FB.init({
		appId : '1318879354818511', // 앱 ID
		status : true, // 로그인 상태를 확인
		cookie : false, // 쿠키허용
		xfbml : true
	// parse XFBML
	});

	FB.getLoginStatus(function(response) {

		if (response.status === 'connected') {
				
			FB.api('/me', {
				fields : [ "email", "name" ]
			}, function(user) {
				alert("로그인상태확인:"+user.email);
				if (user) {// 성공시

					var fbImage = 'http://graph.facebook.com/' + user.id
							+ '/picture';
					var facebookURL = 'www.facebook.com/' + user.id;
					var name = user.name;
				

					$.ajax({
						url : "user/facebook",
						type : 'POST',
						data : {
							email : facebookURL
						},
						success : function(user) {
						
							if (user.email != null) {
								location.href = "main/main.jsp"
							} else {
							
								$.post('user/fbaddUser', {
									nick : name,
									email : facebookURL,
									pwd : '0',
									phot_path : fbImage
								}, function(successAdd) {
								location.href = "main/main.jsp"

								});// $.post끝
							}// else끝
						}// suceess끝
					});// ajax끝

				}// if문끝
			});

		} else if (response.status === 'not_authorized') {

		} else {

		}
	});

	FB.Event.subscribe('auth.login', function(response) {
		document.location.reload();
	});
};

// Load the SDK Asynchronously
(function(d) {
	var js, id = 'facebook-jssdk', ref = d.getElementsByTagName('script')[0];
	if (d.getElementById(id)) {
		return;
	}
	js = d.createElement('script');
	js.id = id;
	js.async = true;
	js.src = "//connect.facebook.net/ko_KR/all.js";
	ref.parentNode.insertBefore(js, ref);
}(document));

/*******************************************************************************
 * login facebook end
 ******************************************************************************/

/*******************************************************************************
 * login js start
 ******************************************************************************/
function fncLogin() {
	var id = document.loginForm.email.value;
	var pw = document.loginForm.pwd.value;
	// 이메일 유효성체크

//	 if(e.keyCode==13) 
//		    return false;		
	
	if (  id== "" ||id == null || id == undefined || ( id != null && typeof id == "object" && !Object.keys(id).length)) {
		swal("이메일을 확인하세요.");
		document.loginForm.email.focus();
		return false;
	}

	if (pw== "" ||id == null || pw  == undefined || (pw  != null && typeof pw  == "object" && !Object.keys(pw ).length)) {
		swal("패스워드를 확인하세요.");
		document.loginForm.pwd.focus();
		return false;
	}

	$.post("user/login", {
		"email" : $("#emailBtn").val(),
		"pwd" : $("#pwdBtn").val()
	}, function (user) {

		console.log($("#emailBtn").val());
		console.log($("#pwdBtn").val());
		var dbemail = user.email;
		var dbpwd = user.pwd;
		console.log(dbemail);
		console.log(dbpwd);

		if ($("#emailBtn").val() != dbemail) {
			swal("이메일확인하십시오.")
			return false;
		}
		if ($("#pwdBtn").val() != dbpwd) {
			swal("비밀번호가 다릅니다.")
			return false;
		}
		if ($("#emailBtn").val() == dbemail && $("#pwdBtn").val() == dbpwd) {
			location.href = "main/main.jsp";
		} else {
			swal("로그인실패");
			return false;
		}
		return false;
	});

	return false;
}

$(document).ready(function() {
	$("#myBtn").click(function() {
		$("#myModal").modal();
	})
});
$(document).ready(function() {
	$("#myBtn2").click(function() {
		$("#myModal").modal();
	})
});
/*******************************************************************************
 * login js end
 ******************************************************************************/

var emailBtn;
var dbemail;
var dbpwd ;
/*****************************************Login/register validation**/


$("#pwdBtn").keyup(
		function() {

			pwdBtn = $("#pwdBtn").val();
			emailBtn = $("#emailBtn").val();
			console.log(emailBtn);
			console.log(pwdBtn);
			$.post("user/loginCheck", {
				"email" : $("#emailBtn").val()
				}, function(user) {
				dbemail = user.email;
				dbpwd=user.pwd;			
				console.log(dbemail);
				console.log(dbpwd);
			});
		
			if (emailBtn != dbemail) {
				$("#addCheck").attr("style", "display:none").attr("style",
						"color:red");
			}
			if (emailBtn == dbemail) {
				$("#add2Check").attr("style", "display:none").attr("style",
						"color:green");
			}
});

$("#emailBtn1").keyup(
		function() {
	        var regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	        	
	   
	        
			emailBtn = $("#emailBtn1").val();
			
			
		     if(!regEmail.test(emailBtn)) {
		    	 $("#add2Check").attr("style", "display:none");
		    	 $("#emailcheck").attr("style","display:block");
	               $("#emailBtn1").focus();
	                return false;
	            }
		     	if(regEmail.test(emailBtn)){
	            	$("#addCheck").attr("style", "display:none");
	            	$("#emailcheck").attr("style","display:none");
	            }
	           	
	            
		     
			console.log(emailBtn);
			$.post("user/loginCheck", {
				"email" : emailBtn
				}, function(user) {
				console.log("실행");	
				dbemail = user.email;
				dbpwd=user.pwd;			
				console.log(dbemail);
				console.log(dbpwd);
				if (emailBtn != dbemail) {
					$("#addCheck").attr("style", "display:none");
					$("#add2Check").attr("style", "display:none").attr("style","color:green");
							
				}
				if (emailBtn == dbemail) {
					$("#add2Check").attr("style", "display:none");
					$("#addCheck").attr("style", "display:block").attr("style","color:red");
									
				}
			});
});


$("#pwdBtn2").keyup(
		function() {

			pwdBtn1 = $("#pwdBtn1").val();
			pwdBtn2 = $("#pwdBtn2").val();
			
				console.log();	
			if (pwdBtn1 != pwdBtn2) {
				$("#pwdcheck").attr("style", "display:block").attr("style","color:red");
			}
			if (pwdBtn1 == pwdBtn2) {
				$("#pwdcheck").attr("style", "display:none");
			}
 	});
/** ******************************************************************** */

$('#fullpage').fullpage(
		{
			sectionsColor : [ '#F2AE72', '#56bc8a', '#a77dc2', '#36465d',
					'#f2992e' ],
			sectionSelector : '.vertical-scrolling',
			slideSelector : '.horizontal-scrolling',
			navigation : true,
			slidesNavigation : true,
			controlArrows : false,
			anchors : [ 'firstSection', 'secondSection', 'thirdSection',
					'fourthSection', 'fifthSection' ],
			menu : '#menu',
			afterLoad : function(anchorLink, index) {
				
				$header_top.css('background', 'rgba(0, 47, 77, .3)');
				$nav.css('background', 'rgba(0, 47, 77, .25)');
				if (index == 5) {
					$('#fp-nav').hide();
				}
			},
			onLeave : function(index, nextIndex, direction) {
				
				if (index == 5) {
					$('#fp-nav').show();
				}
			},
			afterSlideLoad : function(anchorLink, index, slideAnchor,
					slideIndex) {
				if (anchorLink == 'fifthSection' && slideIndex == 1) {
					$.fn.fullpage.setAllowScrolling(false, 'up');
					$header_top.css('background', 'transparent');
					$nav.css('background', 'transparent');
					$(this).css('background', '#374140');
					$(this).find('h2').css('color', 'white');
					$(this).find('h3').css('color', 'white');
					$(this).find('p').css({
						'color' : '#DC3522',
						'opacity' : 1,
						'transform' : 'translateY(0)'
					});
				}
			},
			onSlideLeave : function(anchorLink, index, slideIndex, direction) {
				if (anchorLink == 'fifthSection' && slideIndex == 1) {
					$.fn.fullpage.setAllowScrolling(true, 'up');
					$header_top.css('background', 'rgba(0, 47, 77, .3)');
					$nav.css('background', 'rgba(0, 47, 77, .25)');
				}
			}
		});
/*
 * 
 * 로그인폼 회원가입폼
 */

$(function() {

	$('#login-form-link').click(function(e) {
		$("#login-form").fadeIn(100);
		$("#register-form").fadeOut(100);
		$('.faceBookBtn').attr('style', 'display:bolck');
		$('#register-form-link').removeClass('active');
		$(this).addClass('active');
		e.preventDefault();
	});
	$('#register-form-link').click(function(e) {
		$("#register-form").fadeIn(100);
		$("#login-form").fadeOut(100);
		$('.faceBookBtn').attr('style', 'display:none');
		$('#login-form-link').removeClass('active');
		$('#addCheck').attr('style', 'display:none');
		$('#add2Check').attr('style', 'display:none');
		$(this).addClass('active');
		e.preventDefault();
	});
});
