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
    width: 440px;
    border-radius: 10px;
}

.detailGrid {
    width: 440px;
}

.detailHeader {
    border-radius: 15px;
    margin: 20px;
}

/* .detailHeader2 {
    float: left;
    margin-bottom: 20px;
} */

.detailPhoto {
    margin: 20px;
}

.styleDesc {
    margin-left: 20px;
}

.pTagPrice {
    padding: 3px;
    color:white;
    background: black;
    opcity:0.8;
    font-weight: bold;
    border-radius: 4px;
}

.pTagInfo {
    padding: 3px;
    color:white;
    background: black;
    opcity:0.8;
    font-weight: bold;
    border-radius: 4px;
}

.hangImg {
    position: absolute;
    left: 300px;
    top: 80px;
    width: 112px;
    display: none;
}
</style>

<link rel="stylesheet" href="../node_modules/bootstrap/dist/css/bootstrap.css">
<link rel="stylesheet" href="../node_modules/jquery-ui-1.12.1/jquery-ui.css">

<script src="../node_modules/jquery/dist/jquery.js"></script>
<script src="../node_modules/jquery-ui-1.12.1/jquery-ui.js"></script>
<script src="../node_modules/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="../node_modules/bootstrap/js/modal.js"></script>


</head>
<body>

    <!-- detailView -->

    <div class="detailGrid">
        <div calss="detailHeader">
            <label class="col-sm-2 control-label"></label>
            <div class="col-sm-10">
                <input id="getStyleNo" type="hidden" value="${style.styleNo}"></input>
            </div>
        </div>

        <div class="detailHeader2">
            <h3 id="styleTitle" style="width: 362px; margin-left: 20px; float: left; margin-top: 5px;">${style.styleTitle}</h3>
            <button class="btn btn-default" id="showBtnTip" value="0"><img src="../main/images/information.png" style="margin: -6px; width: 24px;"/></button>
        </div>

        <div class="detailPhoto">
            <img id="styleImg" style="width: 400px;" src="../fileUpload/${style.fileName}" />
            <img class="hangImg" id="hangImg" src="../main/images/hang_sq_bl.svg" />
            
            <c:if test="${!empty style.position1x}">
                <div class="position1" id="position1"
                    style="position:absolute; left:${style.position1x+20}px; top:${style.position1y+73.22}px;">
                    <p class="pTagPrice" id="pTagPrice1">${style.priceInfo1}</p>
                </div>
            </c:if>

            <c:if test="${!empty style.position2x}">
                <div class="position1" id="position2"
                    style="position:absolute; left:${style.position2x+20}px; top:${style.position2y+73.22}px;">
                    <p class="pTagPrice" id="pTagPrice2">${style.priceInfo2}</p>
                </div>
            </c:if>

            <c:if test="${!empty style.position3x}">
                <div class="position1" id="position3"
                    style="position:absolute; left:${style.position3x+20}px; top:${style.position3y+73.22}px;">
                    <p class="pTagPrice" id="pTagPrice3">${style.priceInfo3}</p>
                </div>
            </c:if>

            <c:if test="${!empty style.position4x}">

                <div class="position1" id="position4"
                    style="position:absolute; left:${style.position4x+20}px; top:${style.position4y+73.22}px;">
                    <p class="pTagPrice" id="pTagPrice4">${style.priceInfo4}</p>
                </div>
            </c:if>

            <c:if test="${!empty style.position5x}">

                <div class="position1" id="position5"
                    style="position:absolute; left:${style.position5x+20}px; top:${style.position5y+73.22}px;">
                    <p class="pTagPrice" id="pTagPrice5">${style.priceInfo5}</p>
                </div>

            </c:if>

            <c:if test="${!empty style.position1x}">

                <div class="position2" id="info1"
                    style="position:absolute; left:${style.position1x+20}px; top:${style.position1y+73.22}px;">
                    <p class="pTagInfo" id="pTagInfo1">${style.styleInfo1}</p>
                </div>

            </c:if>

            <c:if test="${!empty style.position2x}">

                <div class="position2" id="info2"
                    style="position:absolute; left:${style.position2x+20}px; top:${style.position2y+73.22}px;">
                    <p class="pTagInfo" id="pTagInfo2">${style.styleInfo2}</p>
                </div>

            </c:if>

            <c:if test="${!empty style.position3x}">

                <div class="position2" id="info3"
                    style="position:absolute; left:${style.position3x+20}px; top:${style.position3y+73.22}px;">
                    <p class="pTagInfo" id="pTagInfo3">${style.styleInfo3}</p>
                </div>

            </c:if>

            <c:if test="${!empty style.position4x}">

                <div class="position2" id="info4"
                    style="position:absolute; left:${style.position4x+20}px; top:${style.position4y+73.22}px;">
                    <p class="pTagInfo" id="pTagInfo4">${style.styleInfo4}</p>
                </div>

            </c:if>

            <c:if test="${!empty style.position5x}">

                <div class="position2" id="info5"
                    style="position:absolute; left:${style.position5x+20}px; top:${style.position5y+73.22}px;">
                    <p class="pTagInfo" id="pTagInfo5">${style.styleInfo5}</p>
                </div>

            </c:if>

    </div>

    <div><hr></div>

    <div>
        <label class="col-sm-1 control-label">내용</label>
        <p class="styleDesc" id="styleDesc">${style.styleDesc}</p>
    </div>
        
    <c:if test="${currentUser.user_no==style.user_no}">
        
        <div calss="detailHeader1">
            <label class="col-sm-2 control-label" style="margin-right: 280px;"></label>
            <button class="btn btn-default" id="updateBtn" style="width: 50px;"
                onClick="fncUpdate(event)">수정</button>
            <button class="btn btn-default" id="deleteBtn" style="width: 50px;"
                onClick="fncDelete(event)">삭제</button>
        </div>
            
    </c:if>
    
    <div><hr></div>
    
    <!-- 댓글 임포트 -->
    <c:import url="../comment/comment.jsp"></c:import>
    
    </div>

    <script>
    ///////////////////보낼 값 셋팅////////////////////////////    
    ///////////////////////////////////////////////////////
    
    var height = $(document).height();
    var width = $(document).width();
    
    
    //alert("높이 넓이 : " + height + " : " + width);

    var styleNo = $("#getStyleNo").val();
    console.log("값 가져 오나요 >>>>>@@ " + styleNo);
    
    var styleTitle = $("#styleTitle").text();
    
    var styleImg = $("#styleImg").attr("src");
    
    var defaultPosition = $("#styleImg").offset();
   // alert("디벅"+defaultPosition.left+" : "+defaultPosition.top);
    
    var position1 = $("#position1").offset();
    if ( typeof position1 != "undefined" )  {
        var position1x = Number(Number(position1.left)-Number(20));
        var position1y = Number(Number(position1.top)-Number(73));
        var img1x = position1.left
        var img1y = position1.top
        var tagPosition1 = position1x+","+position1y;
    }
    
    var position2 = $("#position2").offset();
    if ( typeof position2 != "undefined" )  {
    	var position2x = Number(Number(position2.left)-Number(20));
        var position2y = Number(Number(position2.top)-Number(73));
        var img2x = position2.left
        var img2y = position2.top
        var tagPosition2 = position2x+","+position2y;
    }

    var position3 = $("#position3").offset();
    if ( typeof position3 != "undefined" )  {
    	var position3x = Number(Number(position3.left)-Number(20));
        var position3y = Number(Number(position3.top)-Number(73));
        var img3x = position3.left
        var img3y = position3.top
        var tagPosition3 = position3x+","+position3y;
    }
    
    var position4 = $("#position4").offset();
    if ( typeof position4 != "undefined" )  {
    	var position4x = Number(Number(position4.left)-Number(20));
        var position4y = Number(Number(position4.top)-Number(73));
        var img4x = position4.left
        var img4y = position4.top
        var tagPosition4 = position4x+","+position4y;
    }
    
    var position5 = $("#position5").offset();
    if ( typeof position5 != "undefined" )  {
    	var position5x = Number(Number(position5.left)-Number(20));
        var position5y = Number(Number(position5.top)-Number(73));
        var img5x = position5.left
        var img5y = position5.top
        var tagPosition5 = position5x+","+position5y;
    }
    
    var styleInfo1 = $("#pTagInfo1").text();
    var styleInfo2 = $("#pTagInfo2").text();
    var styleInfo3 = $("#pTagInfo3").text();
    var styleInfo4 = $("#pTagInfo4").text();
    var styleInfo5 = $("#pTagInfo5").text();
    
    var priceInfo1 = $("#pTagPrice1").text();
    var priceInfo2 = $("#pTagPrice2").text();
    var priceInfo3 = $("#pTagPrice3").text();
    var priceInfo4 = $("#pTagPrice4").text();
    var priceInfo5 = $("#pTagPrice5").text();
    
    var styleDesc = $("#styleDesc").text();
    
    /////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////////
        
        //이미지 호버시
    $(".detailPhoto").mouseenter(function(event){
        $(".hangImg").css("display","block");
        event.stopPropagation();
    });
    $(".detailPhoto").mouseleave(function(event){
        $(".hangImg").css("display","none");
        event.stopPropagation();
    });
        
        
    $("#pTagPrice1").css("display", "none");
    $("#pTagPrice2").css("display", "none");
    $("#pTagPrice3").css("display", "none");
    $("#pTagPrice4").css("display", "none");
    $("#pTagPrice5").css("display", "none");
        
    $("#pTagInfo1").css("display", "none");
    $("#pTagInfo2").css("display", "none");
    $("#pTagInfo3").css("display", "none");
    $("#pTagInfo4").css("display", "none");
    $("#pTagInfo5").css("display", "none");
        

    $(".position1").draggable({
        cursor : "pointer",
        distance : 10
    });

    $(".position2").draggable({
        cursor : "pointer",
        distance : 10
    });

    $("#showBtnTip").on("click", function() {
        if ($("#showBtnTip").attr("value") == 0) {
            $("#showBtnTip").val("1");
                
            $("#pTagInfo1").slideDown();
            $("#pTagInfo2").slideDown();
            $("#pTagInfo3").slideDown();
            $("#pTagInfo4").slideDown();
            $("#pTagInfo5").slideDown();
                
                
        } else if ($("#showBtnTip").attr("value") == 1) {
            $("#showBtnTip").val("0");
                
            $("#pTagInfo1").slideUp();
            $("#pTagInfo2").slideUp();
            $("#pTagInfo3").slideUp();
            $("#pTagInfo4").slideUp();
            $("#pTagInfo5").slideUp();
                
            $("#pTagPrice1").slideUp();
            $("#pTagPrice2").slideUp();
            $("#pTagPrice3").slideUp();
            $("#pTagPrice4").slideUp();
            $("#pTagPrice5").slideUp();
                
        }
    });
        
    $("#pTagInfo1").click(function(){
        $("#pTagInfo1").slideUp();
        $("#pTagPrice1").slideDown();
    });
    $("#pTagPrice1").click(function(){
        $("#pTagInfo1").slideDown();
        $("#pTagPrice1").slideUp();
    });
        
    $("#pTagInfo2").click(function(){
        $("#pTagInfo2").slideUp();
        $("#pTagPrice2").slideDown();
    });
    $("#pTagPrice2").click(function(){
        $("#pTagInfo2").slideDown();
        $("#pTagPrice2").slideUp();
    });
        
    $("#pTagInfo3").click(function(){
        $("#pTagInfo3").slideUp();
        $("#pTagPrice3").slideDown();
    });
    $("#pTagPrice3").click(function(){
        $("#pTagInfo3").slideDown();
        $("#pTagPrice3").slideUp();
    });
        
    $("#pTagInfo4").click(function(){
        $("#pTagInfo4").slideUp();
        $("#pTagPrice4").slideDown();
    });
    $("#pTagPrice4").click(function(){
        $("#pTagInfo4").slideDown();
        $("#pTagPrice4").slideUp();
    });
        
    $("#pTagInfo5").click(function(){
        $("#pTagInfo5").slideUp();
        $("#pTagPrice5").slideDown();
    });
    $("#pTagPrice5").click(function(){
        $("#pTagInfo5").slideDown();
        $("#pTagPrice5").slideUp();
    });
        
    ////////////////////////업데이트////////////////////////////

    //업데이트 모달창 띄움
    function fncUpdate() {
    	
    	if(parent.$("#parentPageName").val()=="mainS"){
    	
    	  parent.$("#updateProtocol").val(styleNo);
    	  parent.$("#height").text(height);
    	
       	  parent.$.colorbox.close();
    	
    	  parent.$("#updateTitle").val(styleTitle);
    	  parent.$("#updateOutput").attr("src",styleImg);
    	
    	  parent.$("#updateTagNumber1").css("position","absolute").css("left",position1x).css("top",position1y);
    	  parent.$("#updateTagNumber2").css("position","absolute").css("left",position2x).css("top",position2y);
    	  parent.$("#updateTagNumber3").css("position","absolute").css("left",position3x).css("top",position3y);
    	  parent.$("#updateTagNumber4").css("position","absolute").css("left",position4x).css("top",position4y);
    	  parent.$("#updateTagNumber5").css("position","absolute").css("left",position5x).css("top",position5y);
    	
    	  parent.$("#styleInfo6").val(styleInfo1);
    	  parent.$("#styleInfo7").val(styleInfo2);
    	  parent.$("#styleInfo8").val(styleInfo3);
    	  parent.$("#styleInfo9").val(styleInfo4);
    	  parent.$("#styleInfo10").val(styleInfo5);
    	
    	  parent.$("#priceInfo6").val(priceInfo1);
    	  parent.$("#priceInfo7").val(priceInfo2);
    	  parent.$("#priceInfo8").val(priceInfo3);
    	  parent.$("#priceInfo9").val(priceInfo4);
    	  parent.$("#priceInfo10").val(priceInfo5);
    	
    	  if ( typeof position1 != "undefined" )  { 
    		  parent.$("#input_updateTagNumber1").val(tagPosition1);
    		  parent.$("#updateTagNumber1").css("position","absolute").css("top",img1y).css("left",img1x);
    	  }else{
    		  parent.$("#updateTagNumber1").css("position","absolute").css("left","250px");
    	  }
          if ( typeof position2 != "undefined" )  {
        	  parent.$("#input_updateTagNumber2").val(tagPosition2);
        	  parent.$("#updateTagNumber2").css("position","absolute").css("top",img2y).css("left",img2x);
          }else{
        	  parent.$("#updateTagNumber2").css("position","absolute").css("left","285px");  
          }
          if ( typeof position3 != "undefined" )  { 
        	  parent.$("#input_updateTagNumber3").val(tagPosition3);
        	  parent.$("#updateTagNumber3").css("position","absolute").css("top",img3y).css("left",img3x);
          }else{
        	  parent.$("#updateTagNumber3").css("position","absolute").css("left","320px");  
          }
          if ( typeof position4 != "undefined" )  { 
        	  parent.$("#input_updateTagNumber4").val(tagPosition4);
        	  parent.$("#updateTagNumber4").css("position","absolute").css("top",img4y).css("left",img4x);
          }else{
        	  parent.$("#updateTagNumber4").css("position","absolute").css("left","355px");  
          }
          if ( typeof position5 != "undefined" )  { 
        	  parent.$("#input_updateTagNumber5").val(tagPosition5); 
        	  parent.$("#updateTagNumber5").css("position","absolute").css("top",img5y).css("left",img5x);
          }else{
        	  parent.$("#updateTagNumber5").css("position","absolute").css("left","390px");  
          }
    	
    	  parent.$("#updateMemo").val(styleDesc);
    	
    	  if(parent.$("#styleInfo6").val()==""){ parent.$("#updateTagNumber1").hide(); parent.$("#formGroup6").hide(); }
    	  if(parent.$("#styleInfo7").val()==""){ parent.$("#updateTagNumber2").hide(); parent.$("#formGroup7").hide(); }
    	  if(parent.$("#styleInfo8").val()==""){ parent.$("#updateTagNumber3").hide(); parent.$("#formGroup8").hide(); }
    	  if(parent.$("#styleInfo9").val()==""){ parent.$("#updateTagNumber4").hide(); parent.$("#formGroup9").hide(); }
    	  if(parent.$("#styleInfo10").val()==""){ parent.$("#updateTagNumber5").hide(); parent.$("#formGroup10").hide(); }
    	
          parent.$("#updateModal").modal("show");
          
    	}else if(parent.$("#parentPageName").val()=="main"){
    		
    		parent.$("#updateProtocol").val(styleNo);
            parent.$("#height").text(height);
            
            parent.$("#updateTitle").val(styleTitle);
            parent.$("#updateOutput").attr("src",styleImg);
          
            parent.$("#styleInfo6").val(styleInfo1);
            parent.$("#styleInfo7").val(styleInfo2);
            parent.$("#styleInfo8").val(styleInfo3);
            parent.$("#styleInfo9").val(styleInfo4);
            parent.$("#styleInfo10").val(styleInfo5);
          
            parent.$("#priceInfo6").val(priceInfo1);
            parent.$("#priceInfo7").val(priceInfo2);
            parent.$("#priceInfo8").val(priceInfo3);
            parent.$("#priceInfo9").val(priceInfo4);
            parent.$("#priceInfo10").val(priceInfo5);
          
            
            if ( typeof position1 != "undefined" )  { 
                parent.$("#input_updateTagNumber1").val(tagPosition1);
                parent.$("#updateTagNumber1").css("position","absolute").css("top",img1y).css("left",img1x);
            }else{
                parent.$("#updateTagNumber1").css("position","absolute").css("left","250px");
            }
            if ( typeof position2 != "undefined" )  {
                parent.$("#input_updateTagNumber2").val(tagPosition2);
                parent.$("#updateTagNumber2").css("position","absolute").css("top",img2y).css("left",img2x);
            }else{
                parent.$("#updateTagNumber2").css("position","absolute").css("left","285px");  
            }
            if ( typeof position3 != "undefined" )  { 
                parent.$("#input_updateTagNumber3").val(tagPosition3);
                parent.$("#updateTagNumber3").css("position","absolute").css("top",img3y).css("left",img3x);
            }else{
                parent.$("#updateTagNumber3").css("position","absolute").css("left","320px");  
            }
            if ( typeof position4 != "undefined" )  { 
                parent.$("#input_updateTagNumber4").val(tagPosition4);
                parent.$("#updateTagNumber4").css("position","absolute").css("top",img4y).css("left",img4x);
            }else{
                parent.$("#updateTagNumber4").css("position","absolute").css("left","355px");  
            }
            if ( typeof position5 != "undefined" )  { 
                parent.$("#input_updateTagNumber5").val(tagPosition5); 
                parent.$("#updateTagNumber5").css("position","absolute").css("top",img5y).css("left",img5x);
            }else{
                parent.$("#updateTagNumber5").css("position","absolute").css("left","390px");  
            }
          
            parent.$("#updateMemo").val(styleDesc);
          
            if(parent.$("#styleInfo6").val()==""){ parent.$("#updateTagNumber1").hide(); parent.$("#formGroup6").hide(); }
            if(parent.$("#styleInfo7").val()==""){ parent.$("#updateTagNumber2").hide(); parent.$("#formGroup7").hide(); }
            if(parent.$("#styleInfo8").val()==""){ parent.$("#updateTagNumber3").hide(); parent.$("#formGroup8").hide(); }
            if(parent.$("#styleInfo9").val()==""){ parent.$("#updateTagNumber4").hide(); parent.$("#formGroup9").hide(); }
            if(parent.$("#styleInfo10").val()==""){ parent.$("#updateTagNumber5").hide(); parent.$("#formGroup10").hide(); }
          
            parent.$.colorbox.close();
            
            parent.$("#reload").val("RE");
            parent.$("#updateModal").modal("show");
    		
    	}
    	
    };

    function fncDelete(event) {
        console.log("삭제 >> styleNo >>" + styleNo);
        $.ajax({
            type : "GET",
            url : "/style/deleteStyle?styleNo="+styleNo,
            success : function(response) {
                if (response == 'OK') {
                    parent.location.reload();
                    }
                }
        });
    }
    
    </script>

</body>
</html>