<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="javax.servlet.http.HttpSession" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"  href="../node_modules/bootstrap/dist/css/bootstrap.min.css">
<style type="text/css">

/* 댓글창 오픈 버튼  */
#commentButton {
  margin-top: 7px;
  width: 400px;
  border: 1px solid #ccc;
  background-color: white;
  /* border-radius: 70px; */
}


/*  대글 입력창 (x)
input[id=content] {
  width: 273px;
  padding: 5px 10px 6px 10px;
  margin-top: 7px;
  margin-bottom: 7px;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
} */

/* 댓글입력시 보이는 이미지  */
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

/* 댓글 시간 */
#cmt_hrs{
font-size:2px;
width : 30px;
} 

/* 댓글입력창 textarea  */
 .form-control{
 width:348px;
 position: relative;
 top:10px;
} 

/* 댓글 입력 완료 버튼  */
#cmt_insert{
position:relative;
top:-24px;
left:353px;
margin-right:11px;

height:36px;
}

.delCmtBtn{
  float: right;
}

#cmt_nick{

}


#cmt_hrs{
font-face: Comic Sans MS;
text-align: right;
}

#comment_icon{
position: static;
}

</style>

</head>
<body style="overflow-x: hidden">

  <div class="container">
    <button type="button" class="commentButton" data-toggle="collapse" id="commentButton"
      data-target="#demo">
      서로의 의견을 주고 받아보세요 <img src='../comment/chat.png'></button>
    <div id="demo" class="collapse">
      <div class="commentInput">
              
        <form name="comment_input" action="/comment/addComment"
          method="POST" id="cmt_form">
          
            <input type="hidden" id="styleNo" name="styleNo" value="${style.styleNo}">
            <input type="hidden" id="hrs" name="hrs" value="${comment.hrs}">
             <input type="hidden" id="nick" name="nick" value="${style.user_no}"> 
          <br/>
          <div>
            <span id="cmt_image"><img  id="comment_icon"  src="../fileUpload/${user.phot_path}"></span>
            <span id="comment_user_nick">${user.nick}</span>
            <br/>
            <textarea class="form-control" name="content" id="content" rows="1" placeholder="댓글을 입력해주세요." ></textarea>
            <div>
            <input type="button" value="댓글" id="cmt_insert"  class="btn btn-default btn-sm">
            </div>
          </div>
          
        </form>
      </div>
      
      
      
      
      
      <div id="commentList"></div>
      
     </div>
  </div>

 <script type="text/javascript">
    $("#commentButton").click(function(){
          $("#commentList").html("");
              $.get('/comment/getCommentList?styleNo='+$("#styleNo").val(),function(map){
                         var row='';      
                 $.each(map.commentList,function(index,comment){
                      /*  row+="<div id='comment_block'><span id='cmtNo' style=visibility:hidden;'>"+comment.cmtNo+"</span>"+"<span id ='cmt_nick'> "+comment.nick+"</span>"+'&nbsp'+"<span id='cmt_content'> "+comment.content+"</span>"+'&nbsp<span id ="cmt_hrs">'+comment.hrs+"</span>"; */
                            row+="<table class='table table-striped'>"
                            row+="<tr>";
                           /*  row+="<td id='cmtNum;'>"+comment.cmtNo+"</td>"; */
                            /* row+="<input type='hidden' name='comment_cmtNo' value='${comment.cmtNo}'>"; */
                            
                            row+="<td id='cmt_nick'>"+comment.nick+"</td>";
                            row+="<td id='cmt_content'>"+comment.content+"</td>";
                            row+="<td id='cmt_hrs'>"+comment.hrs+"</td>";
                            
                            if(comment.userNo == map.user.user_no){
                            row+="<td class='delCmtBtn'><button    type='submit' class='btn btn-danger' name="+comment.cmtNo+">삭제</button></td>";
                            }
                            /* <a href='#' id='delCmt2' class='delCmt'><img src='../comment/delete-bin.png'></a> */
                            row+="</tr>";
                            row+="</table>";
                      /* row+="<div id='comment_block'><span id='cmtNo' style=visibility:hidden;'>"+comment.cmtNo+"</span>"
                             +"<span id ='cmt_nick'>"+comment.nick+"</span>"+'&nbsp'
                             +"<span id='cmt_content'> "+comment.content+"</span>"
                             +'&nbsp<span id ="cmt_hrs">'+comment.hrs+"</span>"; */
                       
                      /*  row+="<div id='com_delete'>";
                       if(comment.userNo==map.user.user_no){
                            row+="<a href='#'  id='delCmt2'>삭제</a>";
                       }
                       row+="</div></div>"; */
                }) 
                $("#commentList").append(row);
           });
        });
    
     $("#cmt_insert").click(function(){
        var form = new FormData($("#cmt_form")[0]);
        
         
        $.ajax({
            url:'/comment/addComment',
            processData : false,
            contentType:false,
            data:form,
            type:'POST',
            success: function(comment){
              $.get('/comment/getComment?cmtNo='+comment.cmtNo,function(cmt){
                $("#commentList").append("<table class='table table-striped'> <tr><td id ='cmt_nick2'> "+cmt.nick+"</td>"+"<td id='cmt_content2'>"+cmt.content+"</td>"+"<td id='cmt_hrs2'>"+cmt.hrs+"</td>"
                    +"<td class='delCmtBtn'><button    type='submit' class='btn btn-danger' name="+comment.cmtNo+">삭제</button></td></tr></table>");
                
                
  /* ("<div id='comment_block'> <span id ='cmt_nick'> "+cmt.nick+"</span>"+"<span id='cmt_content'>"+cmt.content+"</span>"
   "<span id='cmt_hrs'>"+cmt.hrs+"</span>"+"<div id='com_delete'><a href='#' id='delCmt2' class='delCmt'>삭제</a></div></div>"); */
                
                
              });             
            }
         });
         $("#content").val("");
     });
        ///댓글삭제
      $(document).on("click",".delCmtBtn",function(){
        alert("삭제실행");
        console.log($(this));
        console.log($(this).parent());
        console.log($(this).parent().parent());
        console.log($(this).children().attr("name"));
        var cmtNo=$(this).children().attr("name");
        alert(cmtNo);
       /*  var cmtNo = $(this).val();
        alert(cmtNo); */
        $(this).parent().parent().remove(); 
        $.post('/comment/deleteComment', {"cmtNo":cmtNo}, function(cmt){
          alert("댓글삭제했습니다."); 
        }); 
        });
       </script> 

        
    
</body>

</html>