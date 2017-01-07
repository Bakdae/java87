$(function() {
	
	wdrValidate();
	wdrPostCount();
	wdrIcon();
	wdrThumbnail();
	wdrBtnGroup();
	wdrAccount();
	wdrModal();
	
	fncAddWardrobe();
	fncUpdateWardrobe();
	fncDeleteWardrobe();
	
	fncFollowWardrobe();
	fncFollowerList();
	fncFollowingList();
	
});

/* 옷장명 공백, 중복체크 function */
function wdrValidate() {

	$("#addWdr-input").on("keyup", function() {

		var wdrName = $("#addWdr-input").val();
		var userNo = $("#user_no").val();

		$.ajax({
			url : "/wardrobe/wardrobeValidate",
			type : "post",
			data : {
				"cls_name" : wdrName,
				"user_no" : userNo
			},
			success : function(wardrobe) {
				
				var dbWdrName = wardrobe.cls_name;
				var dbUserNo = wardrobe.user_no;

				console.log("::: DB wardrobe_name : "+ dbWdrName);
				console.log("::: DB user_no : "+dbUserNo);

				/* 옷장이름 null 체크 if문 */
				if (wdrName.trim() == null || wdrName.length < 1
						|| wdrName.trim() == '') {
					$(".wdrNameValidate").css('display', 'block')
							.text("옷장 이름을 지정하세요!");
					$("#addWdr-input").css('border', '1px solid #bd081c');
					$("#wdr-create-btn").attr("disabled", "disabled");

				} else {
					/* 옷장이름이 null이 아닐 때, 중복체크 if문 */
					if (dbWdrName != undefined) {
						$(".wdrNameValidate").css('display', 'block')
								.text("같은 옷장이 이미 있습니다. 다른 이름을 입력하세요!");
						$("#addWdr-input").css('border', '1px solid #bd081c');
						$("#wdr-create-btn").attr("disabled", "disabled")

					} else if (dbWdrName == undefined) {
						$(".wdrNameValidate").css('display', 'none');
						$("#addWdr-input").css('border', '1px solid #ccc');
						$("#wdr-create-btn").removeAttr("disabled");
					}
				}
			}// end of callBack function
		});// end of ajax
	}); //end of keyup function
	
	
	$("#updateWdr-input").on("keyup", function() {
		
		var wdrName = $("#updateWdr-input").val();
		var userNo = $("#user_no").val();
		
		$.ajax({
			url : "/wardrobe/wardrobeValidate",
			type : "post",
			data : {
				"cls_name" : wdrName,
				"user_no" : userNo
			},
			success : function(wardrobe) {
				
				var dbWdrName = wardrobe.cls_name;
				var dbUserNo = wardrobe.user_no;
				
				console.log("::: DB wardrobe_name : "+ dbWdrName);
				console.log("::: DB user_no : "+dbUserNo);
				
				/* 옷장이름 null 체크 if문 */
				if (wdrName.trim() == null || wdrName.length < 1
						|| wdrName.trim() == '') {
					$(".wdrUpdateValidate").css('display', 'block')
					.text("옷장 이름을 지정하세요!");
					$("#updateWdr-input").css('border', '1px solid #bd081c');
					$("#wdr-modify-btn").attr("disabled", "disabled")
					
				} else {
					/* 옷장이름이 null이 아닐 때, 중복체크 if문 */
					if (dbWdrName != undefined) {
						$(".wdrUpdateValidate").css('display', 'block')
						.text("같은 옷장이 이미 있습니다. 다른 이름을 입력하세요!");
						$("#updateWdr-input").css('border', '1px solid #bd081c');
						$("#wdr-modify-btn").attr("disabled", "disabled")
						
					} else if (dbWdrName == undefined) {
						$(".wdrUpdateValidate").css('display', 'none');
						$("#updateWdr-input").css('border', '1px solid #ccc');
						$("#wdr-modify-btn").removeAttr("disabled");
					}
				}
			}// end of callBack function
		});// end of ajax
	}); //end of keyup function

}


/* 옷장 수 카운트 function */
function wdrPostCount() {
	
	var wdrCount = $("#wdr-list-wrap>#wdr-list-box").length;
	$(".wdr-wdr-cnt").text(wdrCount);

	
	var followerCnt = $("#wdr-follower-ul>li").length;
	var followingCnt = $("#wdr-following-ul>li").length;

	$(".wdr-follower-cnt").text(followerCnt);
	$(".wdr-following-cnt").text(followingCnt);
	
}


/* 옷장 썸네일이미지 hover 이벤트 function */
function wdrThumbnail() {

	$(".wdr-thumb").hover(function() {
		$(this).stop().animate({
			backgroundSize : "130%"}, 300) 
	}, function() {
		$(this).stop().animate({
			backgroundSize : "120%"}, 300);
	});

}

/* 옷장버튼 호버 이벤트*/
function wdrIcon() {
	
	$(".wdr-icon-add").hover(function() {
		$(this).attr("src", "../wardrobe/css/images/icon-add_b_hover.svg");
	}, function() {
		$(this).attr("src", "../wardrobe/css/images/icon-add_b.svg");
	});
	
	$(".wdr-icon-setting").hover(function() {
		$(this).attr("src", "../wardrobe/css/images/icon-setting_b_hover.svg");
	}, function() {
		$(this).attr("src", "../wardrobe/css/images/icon-setting_b.svg");
	});
	
	$(".wdr-icon-logout").hover(function() {
		$(this).attr("src", "../wardrobe/css/images/icon-logout_b_hover.svg");
	}, function() {
		$(this).attr("src", "../wardrobe/css/images/icon-logout_b.svg");
	});
	
}

/*  옷장페이지 모달 */
function wdrModal() {
	
	$("li.create-wdr").on("click", function() {
		$('#addWdrModal').modal('show');
	});
	$("button.wdr-modify").on("click", function() {
		$('#updateWdrModal').modal('show');
	});
	$("button.wdr-delete").on("click", function() {
		$('#deleteWdrModal').modal('show');
	});
	
	
	$("li.wdr-followers").on("click", function() {
		$('#followerListModal').modal('show');
	});
	$("li.wdr-followings").on("click", function() {
		$('#followingListModal').modal('show');
	});
};


/* 옷장 수정, 삭제 버튼 */
function wdrBtnGroup() {

	$("div.wdr-btn-group").hide();

	$(".wdr-grid").hover(function() {
		$(this).children("div.wdr-btn-group").fadeIn("fast");
	}, function() {
		$("div.wdr-btn-group").fadeOut("fast");
	});

}

/* 프로필 편집 버튼 클릭시 account colorbox 호출 */
function wdrAccount() {
	
	$(".wdr-icon-setting").colorbox({href:"../account/account.jsp", scrolling:"false"});
	$(".wdr-icon-logout").colorbox({href:"../wardrobe/logout.jsp", scrolling:"false"});

}


/* 옷장 insert function */
function fncAddWardrobe() {

	$("#wdr-create-btn").on("click", function() {
		
		var wdrName = $("#addWdr-input").val();
		var userNo = $("#user_no").val();
		
		$.ajax({
			url : "/wardrobe/addWardrobe",
			data : {
				"cls_name" : wdrName,
				"user_no" : userNo
			},
			type : "post",
			success : function(wardrobe) {
				console.log(wardrobe.cls_name);
				console.log(wardrobe.user_no);
			}
		});
	});
}


/* 옷장 이름 변경 function */
function fncUpdateWardrobe() {
	
	/* 수정 버튼 클릭시 input value에 기존 옷장 이름 출력 */
	$(".wdr-modify").on("click", function() {
		var beforeWdrName= $(this).parent().prev().prev().children(".wdr-cls-name").text().trim();
		$("#updateWdr-input").val(beforeWdrName);	
		var wdrNo = $(this).parent().prev().prev().children("#cls_no").val();
		
		/* 수정 submit 버튼 클릭시 ajax로 데이터 전송 */
		$("#wdr-modify-btn").on("click", function(){

			var wdrName = $("#updateWdr-input").val();
			
			$.ajax({
				url : "/wardrobe/updateWardrobe",
				data : {
					"cls_name" : wdrName,
					"cls_no" : wdrNo
				}, 
				type : "post",
				success : function(wardrobe) {
					console.log(wardrobe.cls_name);
					console.log(wardrobe.cls_no);
				}
			});
		});
	});	
}


function fncDeleteWardrobe() {
	
	/* 삭제 버튼 클릭시 cls_no value 값 가져오기*/
	$(".wdr-delete").on("click", function() {
		var wdrNo = $(this).parent().prev().prev().children("#cls_no").val();
		
		$(".wdr-del-submit").on("click", function(){
			$.ajax({
				url: "/wardrobe/deleteWardrobe",
				data: {
					"cls_no" : wdrNo
				},
				type: "post",
				success : function(wardrobe) {
					console.log(wardrobe.cls_no);
				}
				
			});//end of ajax
		});//end of click fundtion

	});
}

function fncFollowWardrobe() {
	
	var follower = $("#user_no").val();
	var following = $("#cls_user_no").val();

	$("#wdr-user-follow").on("click", function() {
		
		alert("[DEBUG] follow를 누른 유저번호 : "+follower+"	follow가 눌러진 해당 옷장의 유저번호 : "+following);
		
		$.ajax({
			url: "/wardrobe/addFollow",
			data: {
				"follower" : follower,
				"following" : following
			},
			success : function(wardrobe) {
				window.location.reload();
			}
		});//end of ajax
	});//end of follow click function
	
	$("#wdr-user-unfollow").on("click", function() {
		alert("[DEBUG] unfollow를 누른 유저번호 : "+follower+"	unfollow가 눌러진 해당 옷장의 유저번호 : "+following);
		
		$.ajax({
			url: "/wardrobe/deleteFollow",
			data: {
				"follower" : follower,
				"following" : following
			},
			success : function(wardrobe) {
				window.location.reload();
			}
		});//end of ajax
	});//end of unfollow click function
	
}


function fncFollowerList() {
	
	var following = $("#cls_user_no").val();
	
	$("li.wdr-followers").on("click", function() {
		
		alert("ajaxt실행");
		
		$.ajax({
			url: "/wardrobe/getFollowerList",
			data: {
				"following" : following
			},
			success : function(map) {	
					var row='';
					$.each(map.followerList,function(index,wardrobe){
						row += "<li><div class='followUserWrap'><div class='followUserImgWrap'><a href='#'><img class='followUserImg' src='../fileUpload/"+wardrobe.follow.phot_path+"'/>"
						row += "</a> </div><div class='followUserInfo><a href='#'>"+wardrobe.follow.nick+"</a></div></div></li>"
					});
					
					$('#wdr-follower-ul>li').remove();
					$("#wdr-follower-ul").append(row);
				 }
			});//end of ajax
	});//end of click function
}

function fncFollowingList() {
	var follower = $("#cls_user_no").val();
	
	$("li.wdr-follwings").on("click", function() {
		
		$.ajax({
			url: "/wardrobe/getFollowingList",
			data: {
				"follower" : follower
			},
			success : function(wardrobe) {
			}
		});//end of ajax
		
	});
	
	
}




