<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="../node_modules/bootstrap/dist/css/bootstrap.min.css">

<style type="text/css">

#commentButton {
	margin-top: 7px;
	width: 400px;
	border: 1px solid #ccc;
	background-color: white;
	/* border-radius: 70px; */
}

 #com_delete {
	float: right;
	margin-right: 15px;
} 

input[id=content] {
	width: 273px;
	padding: 5px 10px 6px 10px;
	margin-top: 7px;
	margin-bottom: 7px;
	display: inline-block;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

#comment_icon {
	width: 30px;
	height: 30px;
	margin-bottom: 2px;
	border: 1px solid gold;
	border-radius: 7px;
	-moz-border-radius: 7px;
	-khtml-border-radius: 7px;
	-webkit-border-radius: 7px;
}


#comment_block {
	height: 40px;
	margin: 5px;
	outline: 3px;
}


#cmt_hrs{
font-size:2px;
} 

.cmtLine{
width:390px;
margin-top:-10px;
margin-bottom:5px;
border: solid 1px #DCDCDC;
}

</style>

</head>

<body style="overflow-x: hidden">

	<div class="container">
		<button type="button" class="commentButton" data-toggle="collapse"
			id="commentButton" data-target="#demo">
			서로의 의견을 주고 받아보세요 <img src='../comment/chat.png'>
		</button>
		<div id="demo" class="collapse">
			<div class="commentInput">

				<!-- /////////////////////////////////////// -->
				<!-- /////////////////////////////////////// -->

				<form name="comment_input" action="/comment/addComment"
					method="POST" id="cmt_form">

					<input type="hidden" id="styleNo" name="styleNo"
						value="${style.styleNo}"> <input type="hidden" id="hrs"
						name="hrs" value="${comment.hrs}"> <input type="hidden"
						id="nick" name="nick" value="${style.user_no}">
					<div>
						<span id="cmt_image"><img id="comment_icon"	src="../fileUpload/${user.phot_path}"></span> 
						<span	 id="comment_user_nick">${user.nick}</span>&nbsp&nbsp
						<input type="text" name="content" id="content" maxleng="2000">
						<input type="button" value="전송" id="cmt_insert" 	class="btn btn-default btn-sm">
					</div>

				</form>
			</div>

			<br />

			<div id="commentList">
			<table class="table-striped"></table>
			</div>

		</div>
	</div>

	<!-- <script src="../node_modules/jquery/dist/jquery.js"></script>-->
	<!-- <script src="../node_modules/bootstrap/dist/js/bootstrap.min.js"> -->


	<script type="text/javascript">
    $("#commentButton").click(function(){
    			
              $.get('/comment/getCommentList?styleNo='+$("#styleNo").val(),function(map){
                   	     var row='';  	 
                   	  $("#commentList").html("");
            	   $.each(map.commentList,function(index,comment){
                  		 row+="<div id='comment_block'><span id ='cmt_nick'> "+comment.nick+"</span>"+'&nbsp'+"<span id='cmt_content'> "+comment.content+"</span>"+'&nbsp<span  id ="cmt_hrs">'+comment.hrs+"</span>";
                  		 row+="<div id='com_delete'>";
                  		 if(comment.userNo==map.user.user_no){
                  			  	row+="<span id='delCmt2_"+ comment.cmtNo+"'><img src='../comment/delete-bin.png' style='float:right;'></span>";
                  		 }
                  		 
                  		 row+="</div></div><hr class='cmtLine'>";
            	  }) 
            	  $("#commentList").append(row);
           });
        });
    
     $("#cmt_insert").click(function(){
    	  var form = new FormData($("#cmt_form")[0]);
    	  console.log( $( this ).serialize());
    	   
    	  $.ajax({
    		    url:'/comment/addComment',
    		    processData : false,
    		    contentType:false,
    		    data:form,
    		    type:'POST',
    		    success: function(comment){
    		    	
    		    	$("#commentList").append(
    		    			"<div id='comment_block'>  <span id ='cmt_nick'> "+comment.nick+"</span>"+'&nbsp'+"<span id='cmt_content'>"+comment.content+"</span><span id='cmt_hrs'>"+comment.hrs+"</span>"
    		    			+"<div id='com_delete'><span id='delCmt2_"+comment.cmtNo+"' class='delCmt'><img src='../comment/delete-bin.png' style='float:right;'></span></div></div>");
    		    	    
    		    }
    	   });
    	   $("#content").val("");
     });
    		///댓글삭제
    
    $(document).on("click","div[id^='delCmt2_']",function(){
    	
    	  $(this).parent().parent().remove();
      var cmtNo = $(this).attr("id").replace("delCmt2_","");
      $.ajax({
        type : "get",
        url : "/comment/deleteComment/"+cmtNo
      });
    
    });
       </script>



</body>

</html>