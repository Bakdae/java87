<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
 body {
    width:440px;
    border-radius: 10px;
 }
 .detailGrid {
    width:440px;
 }
 .detailHeader {
    border-radius: 15px;
    margin: 20px;
 }
 .detailHeader2 {
    float: left;
    margin-bottom: 20px;
 }
 .detailPhoto {
    margin: 20px;
 }
 .styleDesc {
    margin-left:20px;
 }
 
 .pTagPrice {
    padding: 3px;
    background: white;
    font-weight: bold;
    border-radius: 4px;
 }
 
 .pTagInfo {
    padding: 3px;
    background: white;
    font-weight: bold;
    border-radius: 4px;
 }

</style>

<link rel="stylesheet" href="../node_modules/bootstrap/dist/css/bootstrap.css">
<link rel="stylesheet" href="../node_modules/jquery-ui-1.12.1/jquery-ui.css">

<script src="../node_modules/jquery/dist/jquery.js"></script>
<script src="../node_modules/jquery-ui-1.12.1/jquery-ui.js"></script>
<script src="../main/js/eg.pkgd.min.js"></script>
<script src="../main/js/main.js"></script>
<script src="../node_modules/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="../node_modules/sweetalert2/dist/sweetalert2.js"></script>

</head>
<body>

    <div class="detailGrid">
        <div calss="detailHeader">
            <label class="col-sm-2 control-label"></label>
            <div class="col-sm-10">
            <input id="getStyleNo" type="hidden" value="${style.styleNo}"></input>
            </div>
        </div>
        
        <div class="detailHeader2">
            <label class="col-sm-1 control-label StyleDetail" style="margin-right:140px;">${style.styleTitle}</label>
            <button class="btn btn-default" id="showBtn" value="0" style="width:101px;">Show Price!</button>
            <button class="btn btn-default" id="showBtnTip" value="0" style="width:95.48px;">Show Tips!</button>
        </div>
        
        <div class="detailPhoto">
            <img style="width: 400px;" src="../fileUpload/${style.fileName}"/>
        </div>
        
        <div>
            <label class="col-sm-1 control-label">내용</label>
            <p class="styleDesc">${style.styleDesc}</p>
        </div>
        
        <div>
            <c:if test="${!empty style.position1x}"><div class="position1" id="position1" style="position:absolute; left:${style.position1x+20}px; top:${style.position1y+70}px;"><p class="pTagPrice">${style.priceInfo1}</p></div></c:if>
            <c:if test="${empty style.position1x}"><div class="position1" id="position1" style="position:absolute;"><p class="pTagPrice">${style.priceInfo1}</p></div></c:if>
            <c:if test="${!empty style.position2x}"><div class="position1" id="position2" style="position:absolute; left:${style.position2x+20}px; top:${style.position2y+70}px;"><p class="pTagPrice">${style.priceInfo2}</p></div></c:if>
            <c:if test="${!empty style.position3x}"><div class="position1" id="position3" style="position:absolute; left:${style.position3x+20}px; top:${style.position3y+70}px;"><p class="pTagPrice">${style.priceInfo3}</p></div></c:if>
            <c:if test="${!empty style.position4x}"><div class="position1" id="position4" style="position:absolute; left:${style.position4x+20}px; top:${style.position4y+70}px;"><p class="pTagPrice">${style.priceInfo4}</p></div></c:if>
            <c:if test="${!empty style.position5x}"><div class="position1" id="position5" style="position:absolute; left:${style.position5x+20}px; top:${style.position5y+70}px;"><p class="pTagPrice">${style.priceInfo5}</p></div></c:if>
            
            <c:if test="${!empty style.position1x}"><div class="position2" id="info1" style="position:absolute; left:${style.position1x+20}px; top:${style.position1y+70}px;"><p class="pTagInfo">${style.styleInfo1}</p></div></c:if>
            <c:if test="${!empty style.position2x}"><div class="position2" id="info2" style="position:absolute; left:${style.position2x+20}px; top:${style.position2y+70}px;"><p class="pTagInfo">${style.styleInfo2}</p></div></c:if>
            <c:if test="${!empty style.position3x}"><div class="position2" id="info3" style="position:absolute; left:${style.position3x+20}px; top:${style.position3y+70}px;"><p class="pTagInfo">${style.styleInfo3}</p></div></c:if>
            <c:if test="${!empty style.position4x}"><div class="position2" id="info4" style="position:absolute; left:${style.position4x+20}px; top:${style.position4y+70}px;"><p class="pTagInfo">${style.styleInfo4}</p></div></c:if>
            <c:if test="${!empty style.position5x}"><div class="position2" id="info5" style="position:absolute; left:${style.position5x+20}px; top:${style.position5y+70}px;"><p class="pTagInfo">${style.styleInfo5}</p></div></c:if>
       
            <%-- <c:if test="${!empty style.position1x}"><img class="position" id="position1" style="position:absolute; left:${style.position1x+20}px; top:${style.position1y+70}px;" src="/main/images/search.png"/></c:if> --%>
            <%-- <c:if test="${!empty style.position2x}"><img class="position" id="position2" style="position:absolute; left:${style.position2x+20}px; top:${style.position2y+70}px;" src="/main/images/search.png"/></c:if> --%>
            <%-- <c:if test="${!empty style.position3x}"><img class="position" id="position3" style="position:absolute; left:${style.position3x+20}px; top:${style.position3y+70}px;" src="/main/images/search.png"/></c:if> --%>
            <%-- <c:if test="${!empty style.position4x}"><img class="position" id="position4" style="position:absolute; left:${style.position4x+20}px; top:${style.position4y+70}px;" src="/main/images/search.png"/></c:if> --%>
            <%-- <c:if test="${!empty style.position5x}"><img class="position" id="position5" style="position:absolute; left:${style.position5x+20}px; top:${style.position5y+70}px;" src="/main/images/search.png"/></c:if> --%>
        </div>
        
        <c:if test="${currentUser.user_no==style.user_no}">
            <div calss="detailHeader1">
                <label class="col-sm-2 control-label" style="margin-right:280px;"></label>
                <button class="btn btn-default" id="updateBtn" style="width:50px;" onClick="fncUpdate(event)">수정</button>
                <button class="btn btn-default" id="deleteBtn" style="width:50px;" onClick="fncDelete(event)">삭제</button>
                <div class="col-sm-10">
                </div>
            </div>
        </c:if>
    </div>
			 <%--<jsp:include page="../comment/comment.jsp"></jsp:include> --%> 
			<c:import url="../comment/comment.jsp"></c:import>


	<script>
	   var styleNo = $("#getStyleNo").val();
	   console.log("값 가져 오나요 >>>>>@@ "+styleNo);
	   
	   function fncUpdate(event){
		 console.log("수정  >>> "+ styleNo);
		 
	   };
	   
	   /* function fncDelete(event){
		   console.log("삭제 >> styleNo >>"+styleNo);
		   $.ajax({
	             type: "GET",
	             url: "/style/deleteStyle?styleNo="+styleNo,
	             success: function(){
	            	 parent.$.colorbox.close();
	            	 location.reload();
	             }
	       });
	   } */
	   
	   function fncDelete(event){
           console.log("삭제셋팅 >> styleNo >>"+styleNo);
           $.ajax({
                 type: "GET",
                 url: "/style/prepareDelete?styleNo="+styleNo,
                 success: function(){
                     parent.$.colorbox.close();
                 }
           });
       }

		$(".position1").css("display", "none");
		$(".position1").draggable({
			cursor: "pointer",
			distance: 10
		});
		$(".position1").hover(function(){
			this.css("cursor","pointer");
		});
		
		$(".position2").css("display", "none");
		$(".position2").draggable({
            cursor: "pointer",
            distance: 10
        });
		
		$("#showBtn").on("click", function() {
			if( $("#showBtn").attr("value")==0 ){
				$("#showBtn").val("1");
				$("#showBtn").html("Hide Price!");
				$(".position1").slideDown();
			}else if( $("#showBtn").attr("value")==1 ){
				$("#showBtn").val("0");
                $("#showBtn").html("Show Price!");
                $(".position1").slideUp();
			}
		});
		
		$("#showBtnTip").on("click", function() {
            if( $("#showBtnTip").attr("value")==0 ){
                $("#showBtnTip").val("1");
                $("#showBtnTip").html("Hide Tips!");
                $(".position2").slideDown();
            }else if( $("#showBtnTip").attr("value")==1 ){
                $("#showBtnTip").val("0");
                $("#showBtnTip").html("Show Tips!");
                $(".position2").slideUp();
            }
        });
	
	</script>
    
</body>
</html>