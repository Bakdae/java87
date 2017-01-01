<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%
 int cntPerPage = 60; //페이지당 표시수 
 int pageNo = Integer.parseInt(request.getParameter("pageNo"));
 int offSet = pageNo * cntPerPage;
 
 System.out.println("pageNo=" + pageNo);
 
List<Map<String, String>> list = new ArrayList<Map<String, String>>(); //dao.getList(offset, cntPerPage);
for(int i = 0; i < cntPerPage ; i++){
	Map<String, String> dataStr = new HashMap<String, String>();
	dataStr.put("styleNo",""+i);
	dataStr.put("imgSrc","http://naver.github.io/egjs-experiment/infiniteGridService/demo/img/" + (((offSet + i) % 60) + 1) + ".jpg");
	dataStr.put("imgProfile","css/images/profile00.png");
	dataStr.put("styleTitle","포스트제목");
	dataStr.put("hashTagString","포스트내용요약");
	dataStr.put("imgHanger","css/images/hang_bl.svg");
	list.add(dataStr);
}
/* 14 ~ 20라인은 디비에서 가져오는 영역*/

String retJsonStr = "[";
for (int i = 0; i < list.size(); i++) {
	Map<String, String> data = list.get(i);
	
	retJsonStr += "{";
	retJsonStr += "\"cardSeq\": \"" + data.get("cardSeq")  +"\",";
	retJsonStr += "\"imgSrc\": \"" + data.get("imgSrc")  +"\",";
	retJsonStr += "\"imgHanger\" : \"" + data.get("imgHanger")  +"\",";	
	retJsonStr += "\"imgProfile\": \"" + data.get("imgProfile")  +"\",";
	retJsonStr += "\"postTitle\" : \"" + data.get("postTitle")  +"\",";
	retJsonStr += "\"postDesc\" : \"" + data.get("postDesc")  +"\"}";
	if ( i < (list.size()-1) ) {
		retJsonStr += ",";
	}
}
retJsonStr += "]";

%>
<%= retJsonStr %>