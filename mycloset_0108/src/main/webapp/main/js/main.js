var ig;
var sessionNo=$("#userNo").val();	

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
							+ '<div class="profile"><img class="imgProfile" src="../fileUpload/'+ obj.imgProfile +'" onClick="goWardrobe(event,'+obj.user_no+')"/></div>'
							+ '<div class="hanger"><img id="imgHanger" src="images/hang_bl.svg" onClick="saveModal(event,'+obj.styleNo+','+ sessionNo+')"/></div>'
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

function getWardrobe(styleNo,userNo){
	$.get('/wardrobe/getWardrobe?user_no='+userNo,function(map){
		$("#cls_name").html("");
		var row="";
		$.each(map.list,function(index,wardrobe){
			row+='<br><a href="/Cls/addCls?styleNo='+styleNo+'&cls_no='+wardrobe.cls_no+'">'+wardrobe.cls_name+'</div>';			
		});
		$("#cls_name").append(row);
			$("#save_cls").click(function(){
		});

	});
}

// 스타일 옷장에 저장하는 펑션
function saveModal(event,styleNo,userNo) {
	$('#saveModal').modal('show')
	getWardrobe(styleNo,userNo);
	//클릭저장
	//구현해야되는부분
	event.stopPropagation();
}


 
//개인 옷장으로 날아가는 펑션
function goWardrobe(event, user_no){
    location.href="../wardrobe/getWardrobeList?user_no="+user_no;
}

//컬러박스 제어
$(document).bind('cbox_open', function () {
    //$('html').css({ overflow: 'hidden' });
}).bind('cbox_closed', function () {
	if( $("#reload").val()=="RE" ){
		//$("colorbox").close();
		//location.reload;
	}
});

//진탱 업데이트
$("#updateBtnMain").click(function(){
    
	//alert("떠랑!!");
	
	var styleNo = $("#updateProtocol").val();
	var height = $("#height").text();
	
	var styleTitle = $("#updateTitle").val();
	
	var styleInfo6 = $("#styleInfo6").val();
	var styleInfo7 = $("#styleInfo7").val();
	var styleInfo8 = $("#styleInfo8").val();
	var styleInfo9 = $("#styleInfo9").val();
	var styleInfo10 = $("#styleInfo10").val();
	
	var priceInfo6 = $("#priceInfo6").val();
	var priceInfo7 = $("#priceInfo7").val();
	var priceInfo8 = $("#priceInfo8").val();
	var priceInfo9 = $("#priceInfo9").val();
	var priceInfo10 = $("#priceInfo10").val();
	
	var tagPosition1 = $("#input_updateTagNumber1").val();
	var tagPosition2 = $("#input_updateTagNumber2").val();
	var tagPosition3 = $("#input_updateTagNumber3").val();
	var tagPosition4 = $("#input_updateTagNumber4").val();
	var tagPosition5 = $("#input_updateTagNumber5").val();
	
	var styleDesc =$("#updateMemo").val();
	
	var formData = "styleNo="+styleNo+"&height="+height+"&styleTitle="+styleTitle+"&styleInfo6="+styleInfo6+"&styleInfo7="+styleInfo7+"&styleInfo8="+styleInfo8+"&styleInfo9="+styleInfo9+"&styleInfo10="+styleInfo10+"&priceInfo6="+priceInfo6+"&priceInfo7="+priceInfo7+"&priceInfo8="+priceInfo8+"&priceInfo9="+priceInfo9+"&priceInfo10="+priceInfo10+"&tagPosition1="+tagPosition1+"&tagPosition2="+tagPosition2+"&tagPosition3="+tagPosition3+"&tagPosition4="+tagPosition4+"&tagPosition5="+tagPosition5+"&styleDesc="+styleDesc;    	
    
	//alert("스타일 넘버 : "+$("#updateProtocol").val() );
    //alert(" 높이 : "+$("#height").text() );
    
    //alert("formData : "+formData);
    console.log(formData);
    
    if ($("#updateTitle").val() == "") {
        alert("제목을 입력해주세요.")
        return false;
    } else {
        //alert("업로드 완료!")
    }
  
    $.ajax({
        type : "POST",
        url : "/style/updateStyle",
        data : formData,
        contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
        success : function(styleNo) {
            fncDetailStyle(event, styleNo);
        },
        error: function(){
            alert("업데이트 에이작스에서 에러리턴");
        }
    })
 });

//상세 스타일 보는 펑션
function fncDetailStyle(event, styleNo){
	var height = "";
	$("#updateModal").modal("hide");
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
	//event.stopPropagation();
}

//해더에 채팅 누르면 나오는 창
function openChat(userNo){
    console.log("유저 넘버 디버깅 : "+userNo);
}