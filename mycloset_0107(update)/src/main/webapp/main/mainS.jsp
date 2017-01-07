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
<link rel="stylesheet" href="../main/css/mainS.css">

</head>

<body>
    
    <input type="hidden" id="keyword" value="${keyword}"/>
    
	<!--  card post start  -->
	<div class="container">
		<div class="grid" id="grid" style="opacity: '1';"></div>
	</div>

	<!--  SaveModal -->
	<div id="saveModal" class="modal fade" role="dialog">
		<div class="modal-dialog">

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
	
	<!-- JS -->
	<script src="../node_modules/jquery/dist/jquery.js"></script>
	<script src="../node_modules/bootstrap/dist/js/bootstrap.min.js"></script>
	<script src="../node_modules/bootstrap/js/modal.js"></script>
	<script src="../main/js/eg.pkgd.min.js"></script>
	<script src="../main/js/mainS.js"></script>
	<script src="../main/js/jquery.colorbox-min.js"></script>

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
															+ '<div class="profile"><img class="imgProfile" src="../fileUpload/'
	                                                    + obj.imgProfile
	                                                    + '"/></div>'
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

		});
	</script>

</body>
</html>