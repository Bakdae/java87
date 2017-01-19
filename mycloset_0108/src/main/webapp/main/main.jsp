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
<link rel="stylesheet" href="../main/css/jquery.nailthumb.1.1.min.css">


</head>

<body>
    <!-- 수정할때 아이프레임에서 보낼 값 셋팅 -->
    <input id="updateProtocol" type="hidden" value="0"></input>
    <input type="hidden" id="parentPageName" value="main"/>
    <input type="hidden" id="reload" value="0"/>
    
    
	<!--  card post start  -->
	<div class="container">
		<div class="grid" id="grid" style="opacity: '1';"></div>
	</div>

	<!--  SaveModal -->
	<div id="saveModal"  class="modal fade modal fade bs-example-modal-sm"   role="dialog">
		<div class="modal-dialog modal-sm">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">이 옷을옷장에 걸까요?</h4>
				</div>
				<div class="modal-body">
					<div id="cls_name"></div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div>

    <!-- Update Modal -->
    <form name="updateForm" id="updateForm" method="post">
    
    <input id="updateProtocol" type="hidden" value="0"></input>
    <input id="height" type="hidden" value="0"></input>
    
    
    <div class="modal fade" id="updateModal" tabindex="-1" role="dialog" on>
     <div class="modal-dialog" role="document">
      <div class="modal-content" style="width: 440px; margin-left:87px;">

       <div class="modal-header" style="width: 440px;">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">수정하기</h4>
       </div>

       <div class="modal-body" style="width: 440px;">
        <form>
         <div class="form-group">
          <label for="recipient-name" class="control-label" style="margin-bottom:10px; margin-left:3px;">제목</label>
           <input type="text" class="form-control" id="updateTitle" name=styleTitle style="width:400px; margin-left:3px; margin-bottom: -10px;" value=""/>
         </div>
         
        <div class="preview-image" id="previewImage">
         
          <img class="imgBox" id="updateOutput" src="" width="400px" style="margin-left:3px;">
           
          <div class="styleTagBox" style="margin-bottom: 50px;">
            <img class="updateTagNumber" id="updateTagNumber1" src="../header/img/number1.png">
            <img class="updateTagNumber" id="updateTagNumber2" src="../header/img/number2.png">
            <img class="updateTagNumber" id="updateTagNumber3" src="../header/img/number3.png">
            <img class="updateTagNumber" id="updateTagNumber4" src="../header/img/number4.png">
            <img class="updateTagNumber" id="updateTagNumber5" src="../header/img/number5.png">
          </div>

          <hr style="margin-top: 50px;">

        <div class="addStyleToolBox">
            <p class="addStylePTag" style="margin-right: 270px; margin-left:6px; font-weight:bold;">스타일 정보</p>
            <img id="updatePlusButton" class="styleButton" type="button" src="../header/img/plus-button.svg" style="margin-left: 30px;" />

            <div id="formGroup6" class="form-group">
                <input type="text" class="form-control ck" id="styleInfo6" name="styleInfo6" value="" style="width: 250px; margin-right:5px; margin-bottom:5px; float:left;" placeholder="1.옷 정보"/> 
                <input type="text" class="form-control" id="priceInfo6" name="priceInfo6" value="" placeholder="1.가격 정보"/>
                <button type="button" class="close small2" id="close1" style="width: 20px;">&times;</button>
                <input type="hidden" id="input_updateTagNumber1" name="tagPosition1">
            </div>

            <div id="formGroup7" class="form-group">
                <input type="text" class="form-control ck" id="styleInfo7" name="styleInfo7" placeholder="2.옷 정보" value="" style="width: 250px; margin-right:5px; margin-bottom:5px; float:left;"/> 
                <input type="text" class="form-control" id="priceInfo7" name="priceInfo7" placeholder="2.가격 정보" value=""/>
                <button type="button" class="close small2" id="close2" style="width: 20px;">&times;</button>
                <input type="hidden" id="input_updateTagNumber2" name="tagPosition2" value="">
            </div>

            <div id="formGroup8" class="form-group">
                <input type="text" class="form-control ck" id="styleInfo8" name="styleInfo8" placeholder="3.옷 정보" value="" style="width: 250px; margin-right:5px; margin-bottom:5px; float:left;"/> 
                <input type="text" class="form-control" id="priceInfo8" name="priceInfo8" placeholder="3.가격 정보" value=""/>
                <button type="button" class="close small2" id="close3" style="width: 20px;">&times;</button>
                <input type="hidden" id="input_updateTagNumber3" name="tagPosition3" value="">
            </div>

            <div id="formGroup9" class="form-group">
                <input type="text" class="form-control ck" id="styleInfo9" name="styleInfo9" placeholder="4.옷 정보" value="" style="width: 250px; margin-right:5px; margin-bottom:5px; float:left;"/> 
                <input type="text" class="form-control" id="priceInfo9" name="priceInfo9" placeholder="4.가격 정보" value=""/>
                <button type="button" class="close small2" id="close4" style="width: 20px;">&times;</button>
                <input type="hidden" id="input_updateTagNumber4" name="tagPosition4" value="">
            </div>

            <div id="formGroup10" class="form-group">
                <input type="text" class="form-control ck" id="styleInfo10" name="styleInfo10" placeholder="5.옷 정보" value="" style="width: 250px; margin-right:5px; margin-bottom:5px; float:left;"/> 
                <input type="text" class="form-control" id="priceInfo10" name="priceInfo10" placeholder="5.가격 정보" value=""/>
                <button type="button" class="close small2" id="close5" style="width: 20px;">&times;</button>
                <input type="hidden" id="input_updateTagNumber5" name="tagPosition5" value="">
            </div>

        </div>

        <hr>
        
        </div>
         
        <div class="form-group">
          <label for="message-text" class="control-label" style="margin-left:5px;">내용</label>
          <textarea class="form-control" name="styleDesc" id="updateMemo" rows="5" value="" style="width:400px; margin-bottom:-20px; margin-left:3px;"></textarea>
        </div>
        
    </div>

    <div class="modal-footer" style="width: 440px;">
        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary" id="updateBtnMain">수정</button>
    </div>

      </div>
     </div>
    </div>
    </form>	
	<c:if test="${!empty style}"><input type="hidden" id="styleNo" value="${style.styleNo}"></input></c:if>
	<c:if test="${!empty user}"><input type="hidden" id="userNo" value="${user.user_no}"></input></c:if>
	<!-- JS -->
	
	<script src="../node_modules/jquery/dist/jquery.js"></script>
	<script src="../node_modules/bootstrap/dist/js/bootstrap.min.js"></script>
	<script src="../node_modules/bootstrap/js/modal.js"></script>
	<script src="../main/js/eg.pkgd.min.js"></script>
	<script src="../main/js/main.js"></script>
	<script src="../main/js/jquery.nailthumb.1.1.min.js"></script>
	<script src="../main/js/jquery.colorbox-min.js"></script>
	<script src="../node_modules/jquery-ui-1.12.1/jquery-ui.js"></script>

<script>

	var styleNo = $("#styleNo").val();
	if (styleNo != null || styleNo != '' || styleNo != "") {
		$(function() {
			$.ajax({
				type : "POST",
				url : "/style/getStyle",
				data : "styleNo=" + styleNo,
				dataType : "text",
				success : function(obj) {

					var height = Number(obj) + 300;
					$.colorbox({
						iframe : true,
						width : '440px',
						height : '1000px',
						href : "/style/getStyle?styleNo=" + styleNo,
						opcity : '0.9'
					});
				}
			});
		});
	}
	//챗봇 호출할때 안되면..
	/* document.onLoad(function(){
	       var param = '${param.autoLoadSeq}'';
	       if (  ) {
	           //팝업 호출
	       }
	}); */

	$(function() {

		var keyword = $("#keyword").val();

		$("#imgHanger").hover(function() {
			$(this).attr("src", "css/images/hang_line_bl.svg");
		}, function() {
			$(this).attr("src", "css/images/hang_bl.svg");
		});

		////// 수정 페이지에서 기능 동작 하도록 하는 javascript /////
		//스타일 플러스 버튼
		$("#updatePlusButton").mousedown(function(e) {

			$(this).attr("src", "../header/img/plus-button-active.svg");

			if ($("#formGroup6").is(":visible")) {
				if ($("#formGroup7").is(":visible")) {
					if ($("#formGroup8").is(":visible")) {
						if ($("#formGroup9").is(":visible")) {
							if ($("#formGroup10").is(":visible")) {
							} else {
								$("#formGroup10").slideDown();
								$("#updateTagNumber5").slideDown();
							}
						} else {
							$("#formGroup9").slideDown();
							$("#updateTagNumber4").slideDown();
						}
					} else {
						$("#formGroup8").slideDown();
						$("#updateTagNumber3").slideDown();
					}
				} else {
					$("#formGroup7").slideDown();
					$("#updateTagNumber2").slideDown();
				}
			} else {
				$("#formGroup6").show();
				$("#updateTagNumber1").show();
			}

			e.preventDefault();

		});

		$("#updatePlusButton").mouseup(function(e) {
			$(this).attr("src", "../header/img/plus-button.svg");
			e.preventDefault();
		});
		$("#updatePlusButton").mouseout(function(e) {
			$(this).attr("src", "../header/img/plus-button.svg");
		});

		$("button[class='close small2']").each(function(index) {

			$(this).click(function(e) {

				if ((Number(index) == 1)) {
					changeCloseBtn2((Number(index) + Number(1)));
				} else if ((Number(index) == 2)) {
					changeCloseBtnSlideUp2((Number(index) + Number(1)));
				} else if ((Number(index) == 3)) {
					changeCloseBtnSlideUp2((Number(index) + Number(1)));
				} else if ((Number(index) == 4)) {
					changeCloseBtnSlideUp2((Number(index) + Number(1)));
				} else if ((Number(index) == 5)) {
					changeCloseBtnSlideUp2((Number(index) + Number(1)));
				}

				e.preventDefault();
			});
		});

		function changeCloseBtn2(index) {
			
			$("#formGroup" + Number(Number(index) + Number(5))).find("input")
					.eq(0).val("");
			$("#formGroup" + Number(Number(index) + Number(5))).find("input")
					.eq(1).val("");
			$("#formGroup" + Number(Number(index) + Number(5))).hide();
			$("#updateTagNumber" + index).hide();
		}

		function changeCloseBtnSlideUp2(index) {

			$("#formGroup" + Number(Number(index) + Number(5))).find("input")
					.eq(0).val("");
			$("#formGroup" + Number(Number(index) + Number(5))).find("input")
					.eq(1).val("");
			$("#formGroup" + Number(Number(index) + Number(5))).slideUp();
			$("#updateTagNumber" + index).slideUp();
		}

		$(".updateTagNumber").draggable(
				{
					cursor : "pointer",
					containment : "#updateOutput",
					stop : function(event, ui) {
						$("#input_" + $(this).attr('id')).val(
								(Number(ui.offset.left) - $("#updateOutput")
										.offset().left)
										+ ","
										+ (Number(ui.offset.top) - $(
												"#updateOutput").offset().top))
					}
				});

		var x = "";
		var y = "";
		var position = "";

		$(".styleTagNumber").hover().css("cursor", "pointer");

		$("#updateOutput").droppable({});

		///////////////////////////////////////////////////////////
		
		
		
	});//끝
</script>

</body>
</html>