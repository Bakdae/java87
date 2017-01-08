
    $("#commentButton").click(function(){
          $("#commentList").html("");
              $.get('/comment/getCommentList?styleNo='+$("#styleNo").val(),function(map){
                         var row='';      
                         $.each(map.commentList,function(index,comment){
                      
                            row+="<table id='cmt_tab' class='table table-striped'>"
                            row+="<tr>";
                            row+="<td id='cmt_all2'><div id='cmt_all'><span id='cmt_nick'>  "+comment.nick+"</span>"+"<span id='cmt_hrs'>"+comment.hrs+"</span>";
                            
                            if(comment.userNo == map.user.user_no){
                        	  row+="<span class='delCmtBtn'><button type='submit' id='delBtn' class='btn btn-danger btn-xs' name="+comment.cmtNo+">삭제</button></span>";
                            }
                            
                            row+="<div id='cmt_content'>" +comment.content+ "</div></div></td></tr></table>";
                                              
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
                $("#commentList").append("<table id='cmt_tab' class='table table-striped'> <tr> <td id ='cmt_all2'><div id='cmt_all'> <span id='cmt_nick'>"+cmt.nick+"</span>"+"<span id='cmt_hrs'>"+cmt.hrs+"</span>"
                    +"<span class='delCmtBtn'><button type='submit' id='delBtn' class='btn btn-danger btn-xs'name="+comment.cmtNo+">삭제</button></span>"
                    +"<div id='cmt_content'>"+comment.content+"</div></td></tr></table>");
                
                
  /* ("<div id='comment_block'> <span id ='cmt_nick'> "+cmt.nick+"</span>"+"<span id='cmt_content'>"+cmt.content+"</span>"
   "<span id='cmt_hrs'>"+cmt.hrs+"</span>"+"<div id='com_delete'><a href='#' id='delCmt2' class='delCmt'>삭제</a></div></div>"); */
                
                
              });             
            }
         });
         $("#content").val("");
     });
     
     
  
     
        ///댓글삭제
      $(document).on("click",".delCmtBtn",function(){
        
        console.log($(this).children().attr("name"));
        var cmtNo=$(this).children().attr("name");
        /* alert(cmtNo); */
        
        $("#commentList").children().remove(); 
        $.post('/comment/deleteComment', {"cmtNo":cmtNo}, function(cmt){
            /* alert("댓글삭제했습니다."); */
            });
        
        $("#commentList").empty();
        $.get('/comment/getCommentList?styleNo='+$("#styleNo").val(),function(map){
            var row='';      
            $.each(map.commentList,function(index,comment){
         
               row+="<table id='cmt_tab' class='table table-striped'>"
               row+="<tr>";
               row+="<td id='cmt_all2'><div id='cmt_all'><span id='cmt_nick'>  "+comment.nick+"</span>"+"<span id='cmt_hrs'>"+comment.hrs+"</span>";
               
               if(comment.userNo == map.user.user_no){
               row+="<span class='delCmtBtn'><button type='submit' id='delBtn' class='btn btn-danger btn-xs' name="+comment.cmtNo+">삭제</button></span>";
               }
               
               row+="<div id='cmt_content'>" +comment.content+ "</div></div></td></tr></table>";
                                 
   }) 
   $("#commentList").append(row);
});
        
     });
        
