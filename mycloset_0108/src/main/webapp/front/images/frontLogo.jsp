<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.frontLogo {
  position: absolute;
  margin-top: 20%;
  margin-left: 50%;
  margin-right: 50%;
  display:none;
}
</style>
<script src="../js/jquery-3.1.1.js"></script>
</head>
<body>
    <img class="frontLogo" id="logoOn" src="front_logo_on.svg"></img>
    <img class="frontLogo" id="logoOff" src="front_logo_off.svg"></img>
    
    <script>
        $(function(){
        	setInterval(function(){
            $("#logoOn").css("display","block");
			    }, 200);
        	setInterval(function(){
        		$("#logoOn").css("display","none");
        	}, 400);
        	setInterval(function(){
                $("#logoOff").css("display","block");
              }, 400);
        });
        setInterval(function(){
            $("#logoOff").css("display","none");
          }, 200);
    </script>
</body>
</html>