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
<link rel="stylesheet" href="../node_modules/bootflat/bootflat/css/bootflat.css">
<link rel="stylesheet" href="../node_modules/bootstrap/dist/css/bootstrap.css">
<link rel="stylesheet" href="../node_modules/jquery-ui-1.12.1/jquery-ui.css">
<link rel="stylesheet" href="../main/css/fonts.css">
<link rel="stylesheet" href="../main/css/mainS.css">
<link rel="stylesheet" href="../main/css/jquery.nailthumb.1.1.min.css">

</head>

<body>

    <input type="hidden" id="keyword" value="${keyword}"/>
    <input type="hidden" id="parentPageName" value="mainS"/>
    
	<!--  card post start  -->
	<div class="container">
		<div class="grid" id="grid" style="opacity: '1';"></div>
	</div>

	<!--  SaveModal -->
	<div id="saveModal" class="modal fade modal fade modal fade bs-example-modal-sm" role="dialog">
		<div class="modal-dialog modal-sm">

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

    <!-- Update Modal -->
    <form name="updateForm" id="updateForm" method="post">
    
    <input id="updateProtocol" name="styleNo" type="hidden" value="0"></input>
    <input id="height" name="height" type="hidden" value="0"></input>
    
    
    <div class="modal fade" id="updateModal" tabindex="-1" role="dialog">
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
           <input type="text" class="form-control" id="updateTitle" name="styleTitle" style="width:400px; margin-left:3px; margin-bottom: -10px;" value=""/>
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
                <input type="hidden" id="input_updateTagNumber1" name="tagPosition1" value="">
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
        <button type="button" class="btn btn-primary" id="updateBtnMainS">수정</button>
    </div>

      </div>
     </div>
    </div>
    </form>
	
	<!--     스크립트 시작     -->
	<script>

		//챗봇 호출할때 안되면..
		/* document.onLoad(function(){
			   var param = '${param.autoLoadSeq}'';
			   if (  ) {
				   //팝업 호출
			   }
		}); */

	    $(function() {
            
			var keyword = $("#keyword").val();
			var styleNo = $("#updateProtocol").val();

			$("#imgHanger").hover(function() {
				$(this).attr("src", "css/images/hang_line_bl.svg");
			}, function() {
				$(this).attr("src", "css/images/hang_bl.svg");
			});

			infinite();

			var ig;

			function infinite() {
				var $grid = $("#grid");

				ig = new eg.InfiniteGrid("#grid", {
					count : 120
				// pagePerCnt 배수로 가야함 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<
				}).on({
					"append" : function(e) {
						var gk = this.getGroupKeys();
						var lastGk = gk[gk.length - 1];
						lastGk++;
						getData(lastGk, lastGk, 'append');
					},
					"prepend" : function(e) {
						var firstGk = this.getGroupKeys()[0];
						firstGk--;
						if (firstGk >= 0) {
							getData(firstGk, firstGk, 'prepend');
							// location.href("/main/main.jsp");
						}
					},
					"layoutComplete" : function(e) {
						$grid.css("opacity", 1);
					}
				});

				// 이 아래는 링크 눌러서 다른 화면갔다가 다시 돌아왔을때 위치를 가지고 있도록 하는 부분
				if ("scrollRestoration" in history) {
					history.scrollRestoration = "manual";
				}
				$grid.on("click", "a", function(e) {
					$.persist("GRID_PERSIST", {
						"scrollPos" : $(document).scrollTop(),
						"grid" : ig.getStatus()
					});
				});
				var persistData = $.persist("GRID_PERSIST");
				if ($.isEmptyObject(persistData)) {
					getData(0, 0, 'append');
				} else {
					ig.setStatus(persistData.grid);
					window.scrollTo(0, persistData.scrollPos);
				}

			}

			// 서버에서 보낸 메인화면에 카드 각각의 이미지 데이터 가져오기

			function getData(currentPageNo, groupNo, type) {
				
				$.ajax({
							type : "POST",
							// url : "data.jsp", // ***데이터를 내려주는 page URL
							url : "/style/getSearchedStyleList",
							data : "pageNo="+currentPageNo+"&keyword="+keyword,
							dataType : "json",
							success : function(list) {
								// 서버에서 응답받으면 화면처리 메소드 호출
								var retHtml = '';
								$
										.each(
												list,
												function(i, obj) {

													console
															.log("main.js > $.ajax속 디버깅 : "
																	+ obj.styleNo);

													retHtml += '<div class="item" id="itemID">'
															+ '<div class="thbnl" onClick="fncDetailStyle(event, '
															+ obj.styleNo
															+ ')" id="tnID">'
															+ '<div class="profile"><img class="imgProfile" src="../fileUpload/'+ obj.imgProfile+'" onClick="goWardrobe(event,'+obj.user_no+')"/></div>'
															+ '<div class="hanger"><img id="imgHanger" src="../main/images/hang_bl.svg" onClick="saveModal(event, '
															+ obj.styleNo
															+ ')"/></div>'
															+ '<div class="imgContent"><img id="imgCnt" class="img-rounded" src="../fileUpload/'
	                                                    + obj.tnFileName
	                                                    + '"/></div>'
															+ '<p class="postText">궁금하다면? 클릭해서 자세히보세요.</p>'
															+ '<div class=bottom_caption>'
															+ '<div class="postTitle">'
															+ obj.styleTitle
															+ '</div>'
															+ '<div class="postDesc">'
															+ obj.hashTagString
															+ '</div>'
															+ '</div>'
															+ '</div></div>';
												});
								console.log(groupNo);
								if (type == 'append') {
									ig.append(retHtml, groupNo);
								} else {
									ig.prepend(retHtml, groupNo);
								}
							},
							error : function(e) {
								alert("에러났을시" + e.responseText);
							}
						});
			}
			
			//개인 옷장으로 날아가는 펑션
			function goWardrobe(event, user_no){
	            location.href="../wardrobe/getWardrobeList?user_no="+user_no;
	        }
			
			// 상세 스타일 보는 펑션
			function fncDetailStyle(event, styleNo){
				
				var height = $("#height").text();
			    
				height = Number(height);
			   
			    //alert("height : "+height);
			    //alert("styleNo : "+styleNo);
			    
			    $("#updateModal").modal("hide");
			    
			    $.colorbox({
			        iframe:true,
			        innerWidth:'440px',
			        innerHeight: height,
			        href:"/style/getStyle?styleNo="+styleNo,
			        opcity:'0.7'
			    });
			    event.stopPropagation();
			}
			
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
	        
	        $("button[class='close small2']").each(function(index){
	        	
	        	
                $(this).click(function(e){
                    
                	 //alert("췌킹췌킹"+Number(Number(index)+Number(1)));
                    if((Number(index)==1)){
                        changeCloseBtn2((Number(index)+Number(1)));
                    }else if((Number(index)==2)){
                        changeCloseBtnSlideUp2((Number(index)+Number(1)));
                    }else if((Number(index)==3)){
                        changeCloseBtnSlideUp2((Number(index)+Number(1)));
                    }else if((Number(index)==4)){
                        changeCloseBtnSlideUp2((Number(index)+Number(1)));
                    }else if((Number(index)==5)){
                        changeCloseBtnSlideUp2((Number(index)+Number(1)));
                    }
                    
                    e.preventDefault();
                });
            });
	        
	        function changeCloseBtn2(index){
	        	//alert("췤췤"+index);
                $("#formGroup"+Number(Number(index)+Number(5))).find("input").eq(0).val("");
                $("#formGroup"+Number(Number(index)+Number(5))).find("input").eq(1).val("");
                $("#formGroup"+Number(Number(index)+Number(5))).hide();
                $("#updateTagNumber"+index).hide();
            }
            
            function changeCloseBtnSlideUp2(index){
            	//alert("췤췤"+Number(Number(index)+Number(5)));
                $("#formGroup"+Number(Number(index)+Number(5))).find("input").eq(0).val("");
                $("#formGroup"+Number(Number(index)+Number(5))).find("input").eq(1).val("");
                $("#formGroup"+Number(Number(index)+Number(5))).slideUp();
                $("#updateTagNumber"+index).slideUp();
            }
            
            $("#input_updateTagNumber1").val();
            $("#input_updateTagNumber2").val();
            $("#input_updateTagNumber3").val();
            $("#input_updateTagNumber4").val();
            $("#input_updateTagNumber5").val();
            
            $(".updateTagNumber").draggable({
                cursor : "pointer",
                containment : "#updateOutput",
                stop : function( event, ui ){ 
                    //alert( (Number(ui.offset.left)-$("#updateOutput").offset().left) + "," + (Number(ui.offset.top)-$("#updateOutput").offset().top) );
                    $("#input_" + $(this).attr('id')).val( (Number(ui.offset.left)-$("#updateOutput").offset().left) + "," + (Number(ui.offset.top)-$("#updateOutput").offset().top) )
                }
            });
            
            var x = "";
            var y = "";
            var position = "";
            
            $(".styleTagNumber").hover().css("cursor", "pointer");

            $("#updateOutput").droppable({});
            
            ///////////////////////////////////////////////////////////
            //진탱 업데이트
            $("#updateBtnMainS").click(function(){
                
                var fromData =$("#updateForm").serialize();
                
                if ($("#updateTitle").val() == "") {
                    alert("제목을 입력해주세요.")
                    return false;
                } else {
                    //alert("업로드 완료!")
                }
              
                $.ajax({
                    type : "POST",
                    url : "/style/updateStyle",
                    data : fromData,
                    contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
                    success : function(styleNo) {
                        fncDetailStyle(event, styleNo);
                    },
                    error: function(){
                        alert("업데이트 에이작스에서 에러리턴");
                    }
                })
             });
	    
		});//끝
	</script>
	
    <!-- JS -->
    <script src="../node_modules/jquery/dist/jquery.js"></script>
    <script src="../node_modules/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="../node_modules/bootstrap/js/modal.js"></script>
    <script src="../main/js/eg.pkgd.min.js"></script>
    <script src="../main/js/mainS.js"></script>
    <script src="../main/js/jquery.colorbox-min.js"></script>
    <script src="../node_modules/jquery-ui-1.12.1/jquery-ui.js"></script>
    <script src="../main/js/jquery.nailthumb.1.1.min.js"></script>

</body>
</html>