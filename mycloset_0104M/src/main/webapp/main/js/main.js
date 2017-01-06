
	var ig;
	
	$(function infinite() {
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
					//location.href("/main/main.jsp");
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
		
	});


// 서버에서 보낸 메인화면에 카드 각각의 이미지 데이터 가져오기 
function getData(currentPageNo, groupNo, type) {
	$.ajax({
			type : "POST",
			//url : "data.jsp", // ***데이터를 내려주는 page URL
			url : "/style/getStyleList",
			data : "pageNo=" + currentPageNo,
			dataType : "json",
			success : function(list) {
				// 서버에서 응답받으면 화면처리 메소드 호출
				var retHtml = '';
				$.each(list,function(i, obj) {
					
					
					
					retHtml += '<div class="item" id="itemID">'
							+ '<div class="thbnl" onClick="fncDetailStyle(event, '+obj.styleNo+')" id="tnID">'
							+ '<div class="profile"><img class="imgProfile" src="../fileUpload/'+ obj.imgProfile +'"/></div>'
							+ '<div class="hanger"><img id="imgHanger" src="images/hang_bl.svg" onClick="saveModal(event, '+obj.styleNo+')"/></div>'
							+ '<div class="imgContent"><img id="imgCnt" class="img-rounded" src="../fileUpload/'+obj.tnFileName+'"/></div>'
							+ '<p class="postText">궁금하다면? 클릭해서 자세히보세요.</p>'
							+ '<div class=bottom_caption>'
							+ '<div class="postTitle">'+obj.styleTitle+'</div>'
							+ '<div class="postDesc">'+obj.hashTagString+'</div>'
							+ '</div>' + '</div></div>';
				});
				
				if (type == 'append') {
					ig.append(retHtml, groupNo);
				} else {
					ig.prepend(retHtml, groupNo);
				}
			},
			error : function(e) {
				alert("에러났을시"+e.responseText);
			}
		});
}

// 스타일 옷장에 저장하는 펑션
function saveModal(event, styleNo) {
	$('#saveModal').modal('show')
	//구현해야되는부분
	event.stopPropagation();
}

// 상세 스타일 보는 펑션
function fncDetailStyle(event, styleNo){
	var height = "";
	$.ajax({
		type : "POST",
		url : "/style/getStyle",
		data : "styleNo=" + styleNo,
		dataType : "text",
		success : function(obj){
			
			var height = Number(obj)+300;
			$.colorbox({
				iframe:true,
				innerWidth:'440px',
		        innerHeight: height,
				href:"/style/getStyle?styleNo="+styleNo,
				opcity:'0.7'
			});
		}
	}); 
	event.stopPropagation();
}

//컬러박스 제어
$(document).bind('cbox_open', function () {
    //$('html').css({ overflow: 'hidden' });
}).bind('cbox_closed', function () {
	//딜릿 넘버 셋팅
	console.log("#delStr 디버깅 ~~!!! "+$("#delStr").text());
	console.log("#delStr 디버깅 ~~!!! "+$("#delStr").val());
    if($("#delStr").val() != "" ){
    	if($("#delStr").val()=="delete"){
    		console.log("이것만해도 성공");
    	}
    }
   // $('html').css({ overflow: 'auto' });
});




//해더에 채팅 누르면 나오는 창
function openChat(userNo){
    console.log("유저 넘버 디버깅 : "+userNo);
}