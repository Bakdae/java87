<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>

<head>

<!-- CSS -->
<link rel="stylesheet" href="../header/css/reset.css">
<link rel="stylesheet" href="../node_modules/jquery-ui-1.12.1/jquery-ui.css">
<link rel="stylesheet" href="../header/css/fonts.css">
<link rel="stylesheet" href="../header/css/colorbox.css">
<link rel="stylesheet"
	href="../node_modules/bootstrap/dist/css/bootstrap.css">
<link rel="stylesheet" href="../header/css/header.css">
<link rel="stylesheet"
	href="../wardrobe/css/jquery.nailthumb.1.1.min.css">
	
	
	
</head>

<body>
	<div id="headerWrap">
		<header id="header">
			<!-- logo -->
			<h1 class="hd-logo">
				<a id="hd-logo-link" href="../main/main.jsp"> <img id="hd-logo-svg"
					src="../header/css/images/logo_pk.svg" alt="logo">
				</a>
			</h1>

			<!-- Search -->
			<form method="POST" action="/style/getSearch" onsubmit="searchFormFnc()">
			<div id="hd-search">
				<span id="hd-icon-search" class="glyphicon glyphicon-search"
					aria-hidden="true"></span> <input type="text" class="hd-searchBox" name="searchKeyword"
					placeholder="Search" required /><input type="submit" style="display:none;"/>
			</div>
			</form>

			<!-- Navigation -->
			<nav id="hd-nav">
				<h2 class="hide">메인메뉴</h2>

				<!-- global navigation bar -->
				<ul id="hd-gnb">

					<!-- 업로드 -->
					<li><img id="fileUpload" class="hd-icon-upload"
						src="../header/css/images/icon-upload.svg" alt="upload"></li>

					<!-- 메세지/채팅 -->
					<li>
						<!-- 아이콘 링크 --> <a href="#" class="hd-gnb-message"> <img
							class="hd-icon-chat" src="../header/css/images/icon-chat.svg"
							alt="chat">
					</a> <!-- 메세지 서브메뉴 -->
						<ul class="hd-gnb-sub hd-msg">
							<!-- Message/Chatbot 버튼 -->
							<div class="hd-msg-tab">

								<span class="hd-tab-msg"> <a href="#"
									onclick="openChat('${user.user_no}')"> Chat Bot </a>
								</span> <span class="hd-tab-bot"> <span id="chatbot">
										<div class="fb-messengermessageus"
											messenger_app_id='1222628424496492'
											page_id='1270710446313254' color="blue" size="standard">
										</div>
								</span>
								</span>
							</div>

							<!-- 최근 메세지 리스트 -->
							<!-- <span class="hd-msg-txt"> recent message </span>
							<li class="hd-receive-msg-list01">
								<div class="hd-msgList firstMsgList">
									<img class="msgUserPic"
										src="../header/css/images/profile01.png" alt="msgUser" />
									  <p class="msgUserPic"></p>
									<span class="msgUserId"> PopEye00 </span> <span class="userMsg">
										안녕하세요. </span>
								</div>
							</li> -->

							<!-- 페이스북 체크 버튼 -->
							<li class="hd-receive-msg-list02">
								<div class="hd-msgList">
									<div class="fb-send-to-messenger"
										messenger_app_id='1222628424496492' page_id='1270710446313254'
										data-ref="PASS_THROUGH_PARAM" color="blue" size="standard">
									</div>
								</div>
							</li>
						</ul> <!-- //receiveMessageBox -->
					</li>
					<!-- //gnb02 Message -->

					<!-- gnb03 my account modify-->
					<li><c:if test="${!empty user }">
							<a href="/wardrobe/getWardrobeList?user_no=${user.user_no}"
								class="" draggable="false"> <!-- 일반 유저 로그인 --> <!-- 프로필 사진이 null일 때 -->
								<span class="hd-img-box"> <c:if
										test="${empty user.phot_path}">
										<img class="hd-my-img" alt=""
											src="../header/upload/images.png" draggable="false"
											data-pin-nopin="true">
									</c:if> <!-- 프로필 사진이 업로드되어 있을 때  --> <c:if
										test="${!empty user.phot_path}">
										<img class="hd-my-img" alt=""
											src="../fileUpload/${user.phot_path}">
									</c:if>
							</span> <span class="hd-my-nick"> ${user.nick} </span> <!-- <span class="hd-my-email"> ${user.email} </span>  -->
							</a>
						</c:if> <!-- facebook으로 로그인 시 --> <c:if test="${!empty  faceUser}">
							<a href="/wardrobe/getWardrobeList?user_no=${faceUser.user_no}"
								class="" draggable="false"> <span class="hd-img-box">
									<!-- facebook 프로필 사진이 null일 때 --> <c:if
										test="${empty   faceUser.phot_path}">
										<img class="hd-my-img" alt=""
											src="../header/upload/images.png" draggable="false"
											data-pin-nopin="true">
									</c:if> <!-- facebook 프로필 사진이 업로드되어 있을 때 --> <c:if
										test="${!empty faceUser.phot_path}">
										<img class="hd-my-img" alt="" src="${faceUser.phot_path}"
											draggable="false" data-pin-nopin="true">
									</c:if>
							</span> <span class="hd-my-nick"> ${ faceUser.nick} </span> <!--  <span class="hd-my-email"> ${ faceUser.email} </span> -->
							</a>
						</c:if></li>
				</ul>
				<!--//hd-gnb-->
			</nav>
			<!--//navigation-->
		</header>
		<!--//header-->
	</div>
	<!--//headerWrap-->
	<form method="POST" id="frm" enctype="multipart/form-data"
		action="/style/addStyle">

		<!-- fileUploadModal -->
		<div id="uploadModal" class="modal fade" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h3 class="modal-title">스타일 업로드</h3>
						<p>당신의 스타일을 올려 전세계 사람들과 공유하세요!</p>
					</div>
					<div class="modal-body">

						<div class="filebox bs3-primary preview-image">
							<input id="upload-name" class="form-control" value="파일선택"
								disabled="disabled"
								style="margin-right: 5px; width: 270px; margin-bottom: 6px; float: left;">
							<label class="btn btn-default" for="input_file">사진찾기</label> <input
								type="file" onchange="openFile(event)" id="input_file"
								class="upload-hidden" name="fileUpload" style="display: none;">
						</div>

					</div>
				</div>

			</div>
		</div>

		<!-- 2번째 모달 사진 태그openUploadModal 창 -->
		<div id="openUploadModal" class="modal fade" role="dialog">
			<div class="modal-dialog2">

				<!-- Modal content-->
				<div class="modal-content2">
					<div class="modal-header2">
						<button type="button" class="close" id="modal2Close"
							data-dismiss="modal" style="width: 20px;">&times;</button>
						<h4 class="modal-title">스타일 업로드</h4>
						<hr>

						<div class="modal-body2">

							<input type="text" style="width: 400px;" class="form-control"
								placeholder="제목을 입력하세요." id="styleTitle" name="styleTitle">

							<div class="preview-image2" id="previewImage2">
								<img class="imgBox" id="output" src="" width="400px">

								<div class="styleTagBox" style="margin-bottom: 50px;">
									<img class="styleTagNumber" id="styleTagNumber1"
										name="styleTagNumber1" src="../header/img/number1.png">
									<img class="styleTagNumber" id="styleTagNumber2"
										name="styleTagNumber2" src="../header/img/number2.png">
									<img class="styleTagNumber" id="styleTagNumber3"
										name="styleTagNumber3" src="../header/img/number3.png">
									<img class="styleTagNumber" id="styleTagNumber4"
										name="styleTagNumber4" src="../header/img/number4.png">
									<img class="styleTagNumber" id="styleTagNumber5"
										name="styleTagNumber5" src="../header/img/number5.png">
								</div>



								<hr style="margin-top: 50px;">

								<div class="addStyleToolBox">
									<p class="addStylePTag">스타일 정보 추가하기 (최대 5개)</p>
									<img id="stylePlusButton" class="styleButton" type="button"
										src="../header/img/plus-button.svg" style="margin-left: 30px;" />
									<!-- <img id="styleDeleteButton" class="styleButton" type="button" src="../header/img/delete-button.svg" /> -->

									<div id="formGroup1" class="form-group">
										<!-- <pre class="descInfo">옷정보                                  가격정보</pre> -->
										<input type="text" class="form-control" id="styleInfo"
											name="styleInfo1" placeholder="1.옷 정보"> <input
											type="text" class="form-control" id="priceInfo"
											name="priceInfo1" placeholder="1.가격 정보">
										<button type="button" class="close small" id="close1"
											style="width: 20px;">&times;</button>
										<input type="hidden" id="input_styleTagNumber1"
											name="styleTagPosition1">
									</div>

									<div id="formGroup2" class="form-group">
										<input type="text" class="form-control" id="styleInfo"
											name="styleInfo2" placeholder="2.옷 정보"> <input
											type="text" class="form-control" id="priceInfo"
											name="priceInfo2" placeholder="2.가격 정보">
										<button type="button" class="close small" id="close2"
											style="width: 20px;">&times;</button>
										<input type="hidden" id="input_styleTagNumber2"
											name="styleTagPosition2">
									</div>

									<div id="formGroup3" class="form-group">
										<input type="text" class="form-control" id="styleInfo"
											name="styleInfo3" placeholder="3.옷 정보"> <input
											type="text" class="form-control" id="priceInfo"
											name="priceInfo3" placeholder="3.가격 정보">
										<button type="button" class="close small" id="close3"
											style="width: 20px;">&times;</button>
										<input type="hidden" id="input_styleTagNumber3"
											name="styleTagPosition3">
									</div>

									<div id="formGroup4" class="form-group">
										<input type="text" class="form-control" id="styleInfo"
											name="styleInfo4" placeholder="4.옷 정보"> <input
											type="text" class="form-control" id="priceInfo"
											name="priceInfo4" placeholder="4.가격 정보">
										<button type="button" class="close small" id="close4"
											style="width: 20px;">&times;</button>
										<input type="hidden" id="input_styleTagNumber4"
											name="styleTagPosition4">
									</div>

									<div id="formGroup5" class="form-group">
										<input type="text" class="form-control" id="styleInfo"
											name="styleInfo5" placeholder="5.옷 정보"> <input
											type="text" class="form-control" id="priceInfo"
											name="priceInfo5" placeholder="5.가격 정보">
										<button type="button" class="close small" id="close5"
											style="width: 20px;">&times;</button>
										<input type="hidden" id="input_styleTagNumber5"
											name="styleTagPosition5">
									</div>

								</div>

								<hr>

								<label
									style="float: left; margin-left: -340px; margin-top: 10px;">내용</label>
								<textarea name="styleDesc" id="memo" style="width: 400px;"
									class="form-control" rows="5"
									placeholder="#을 이용하여 해시태그를 등록 해보세요!                                 예)  #청바지 랑 #셔츠 새로 샀어요!"></textarea>

								<hr>

								<button class="btn btn-default submitbuttom"
									id="uploadSubmitBtn"
									style="margin-top: 10px; margin-left: 84%;">업로드</button>

							</div>

						</div>

					</div>
				</div>

			</div>
		</div>

	</form>
	<!-- JS -->
	<script src="../node_modules/jquery/dist/jquery.js"></script>
	<script src="../node_modules/bootstrap/dist/js/bootstrap.min.js"></script>
	<script src="../header/js/jquery.colorbox-min.js"></script>
	<script src="../node_modules/bootstrap/js/modal.js"></script>
	<script src="../node_modules/jquery-ui-1.12.1/jquery-ui.js"></script>
	<script src="../header/js/jquery.nailthumb.1.1.min.js"></script>
	<script src="../header/js/header.js"></script>
	<script src="../front/js/front.js"></script>
	
	<script type="text/javascript">
		function logout() {
			location.href = "/index.jsp";
		}
	</script>
	<script>
	var elemArray = new Object();   //Array가 아닌 Object임에 주의
	/* $.each($(".styleTagNumber"), function( index, value ) {
		var obj = { left : -1 , top : -1 }
		elemArray[$(this).attr('id')] = obj;
	}); */
	
		$(".form-group").hide();
		$(".styleTagNumber").hide();

		$("#stylePlusButton").mousedown(function(e) {

			$(this).attr("src", "../header/img/plus-button-active.svg");

			if ($("#formGroup1").is(":visible")) {
				if ($("#formGroup2").is(":visible")) {
					if ($("#formGroup3").is(":visible")) {
						if ($("#formGroup4").is(":visible")) {
							if ($("#formGroup5").is(":visible")) {
							} else {
								$("#formGroup5").slideDown();
								$("#styleTagNumber5").slideDown();
							}
						} else {
							$("#formGroup4").slideDown();
							$("#styleTagNumber4").slideDown();
						}
					} else {
						$("#formGroup3").slideDown();
						$("#styleTagNumber3").slideDown();
					}
				} else {
					$("#formGroup2").slideDown();
					$("#styleTagNumber2").slideDown();
				}
			} else {
				$("#formGroup1").show();
				$("#styleTagNumber1").show();
			}

			e.preventDefault();

		});

		$("#stylePlusButton").mouseup(function(e) {
			$(this).attr("src", "../header/img/plus-button.svg");
			e.preventDefault();
		});
		$("#stylePlusButton").mouseout(function(e) {
			$(this).attr("src", "../header/img/plus-button.svg");
		});
		
	    
	        $("button[class='close small']").each(function(index){
	        	$(this).click(function(e){
	        		
	        		if((Number(index)==0)){
	        			changeCloseBtn((Number(index)+1));
	        		}else if((Number(index)==1)){
	        		    changeCloseBtnSlideUp((Number(index)+1));
	        		}else if((Number(index)==2)){
	        		    changeCloseBtnSlideUp((Number(index)+1));
	        		}else if((Number(index)==3)){
	        		    changeCloseBtnSlideUp((Number(index)+1));
	        		}else if((Number(index)==4)){
	        			changeCloseBtnSlideUp((Number(index)+1));
	        		}
	        		
	        		e.preventDefault();
	        	});
			});
	        
	        var changeCloseBtn = function(index){
	        	$("#formGroup"+index).find("input").eq(0).val("");
                $("#formGroup"+index).find("input").eq(1).val("");
                $("#formGroup"+index).hide();
                $("#styleTagNumber"+index).hide();
	        }
	        
	        var changeCloseBtnSlideUp = function(index){
                $("#formGroup"+index).find("input").eq(0).val("");
                $("#formGroup"+index).find("input").eq(1).val("");
                $("#formGroup"+index).slideUp();
                $("#styleTagNumber"+index).slideUp();
            }

		$(".styleTagNumber").draggable({
			cursor : "pointer",
			containment : "#output",
			stop : function( event, ui ){ 
				
		        $("#input_" + $(this).attr('id')).val( (Number(ui.offset.left)-$("#output").offset().left) + "," + (Number(ui.offset.top)-$("#output").offset().top) )
			}
		});

		//좌표 가져오는 변수
		var x = "";
		var y = "";
		var position = "";

		$("#output").droppable({});

		//폼태그 전송 펑션
		$("#uploadSubmitBtn").click(function() {
			$("#frm").submit(function() {

				if ($("#styleTitle").val() == "") {
					alert("제목을 입력해주세요.")
					return false;
				} else {
					alert("업로드 완료!")
				}
			});
		});

		$(".styleTagNumber").hover().css("cursor", "pointer");
		
		  $(document).ready(function() {
		        $('.hd-img-box').nailthumb();
		      });
	</script>
</body>

</html>