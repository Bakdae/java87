<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%
 int cardSeq = Integer.parseInt(request.getParameter("cardSeq"));
 
 System.out.println("cardSeq=" + cardSeq);
 
  Map<String, String> data = new HashMap<String, String>();
  data.put("cardSeq",""+cardSeq);
  data.put("userNickname","백대현");
  data.put("imgSrc","http://naver.github.io/egjs-experiment/infiniteGridService/demo/img/" + (((cardSeq) % 60) + 1) + ".jpg");
  data.put("imgProfile","images/profile00.png");
  data.put("postTitle","포스트제목");
  data.put("postDesc","포스트내용요약");
  data.put("imgHanger","images/hanger_red_white.png");

String retJsonStr = "";
  
  retJsonStr += "{";
  retJsonStr += "\"cardSeq\": \"" + data.get("cardSeq")  +"\",";
  retJsonStr += "\"userNickname\": \"" + data.get("userNickname")  +"\",";
  retJsonStr += "\"imgSrc\": \"" + data.get("imgSrc")  +"\",";
  retJsonStr += "\"imgHanger\" : \"" + data.get("imgHanger")  +"\","; 
  retJsonStr += "\"imgProfile\": \"" + data.get("imgProfile")  +"\",";
  retJsonStr += "\"postTitle\" : \"" + data.get("postTitle")  +"\",";
  retJsonStr += "\"postDesc\" : \"" + data.get("postDesc")  +"\"}";

%>
<%= retJsonStr %>