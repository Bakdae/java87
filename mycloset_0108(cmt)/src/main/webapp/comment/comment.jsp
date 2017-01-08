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
<link rel="stylesheet" href="../comment/css/comment.css">

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
             <input type="hidden" id="nick" name="nick" value="${user.nick}">
             <%-- <input type="hidden" id="nick" name="nick" value="${style.user_no}">  --%>
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


<script src="../node_modules/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="../comment/js/comment.js"></script> 

        
    
</body>

</html>