<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="../header/header.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- CSS -->
<link rel="stylesheet" href="../wardrobe/css/reset.css">
<link rel="stylesheet" href="../wardrobe/css/colorbox.css">
<link rel="stylesheet"
	href="../node_modules/bootstrap/dist/css/bootstrap.min.css">

<link rel="stylesheet" href="../wardrobe/css/fonts.css">
<link rel="stylesheet" href="../wardrobe/css/wardrobe.css">

<title>Wardrobe</title>

</head>

<body>

    <!-- 팔로워 리스트 Modal -->
    <!-- ---------------------------------------------------------------------------------------------------->
    <div class="modal fade" id="followerListModal" tabindex="-1" role="dialog"
        aria-labelledby="wdrModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <form name="wdr-name">
                <div class="modal-content">

                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"
                            aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                        <h4 class="modal-title">팔로워</h4>
                    </div>

                    <div class="modal-body" id="follow-modal-body">
                    <input type="hidden" name="cls_user_no" id="cls_user_no" value="${cls_user.user_no}">
                    <c:if test="${!empty user}">
                        <input type="hidden" name="user_no" id="user_no"
                            value="${user.user_no}">
                    </c:if>
                    <c:if test="${!empty faceUser}">
                        <input type="hidden" name="user_no" id="user_no"
                            value="${faceUser.user_no}">
                    </c:if>
                    <ul id="wdr-follower-ul">
                        <li>
                            <div class="followUserWrap">
                                <div class="followUserImgWrap">
                                   <a href="#">
                                        <img class="followUserImg" src="../fileUpload/${user.phot_path}">
                                   </a>
                               </div>
                               <div class="followUserInfo">
                                   <a href="#">
                                       nickname
                                   </a>
                               </div>
                           </div>
                        </li>
                        
                        <!-- 
                        <c:forEach var="followerList" items="${followerList}">
                            <li>
                                <img src="../fileUpload/${wardrobe.follow.phot_path}">
                            </li>
                        </c:forEach>
                         -->
                    </ul>
                    </div>

                </div>
                <!-- /.modal-content -->
            </form>
            <!-- /.form -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->
    <!-- ---------------------------------------------------------------------------------------------------->
    
    <!-- 팔로잉 리스트 Modal -->
    <!-- ---------------------------------------------------------------------------------------------------->
    <div class="modal fade" id="followingListModal" tabindex="-1" role="dialog"
        aria-labelledby="wdrModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <form name="wdr-name">
                <div class="modal-content">

                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"
                            aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                        <h4 class="modal-title">팔로잉</h4>
                    </div>

                    <div class="modal-body" id="follow-modal-body">
                        <input type="hidden" name="cls_user_no" id="cls_user_no" value="${cls_user.user_no}">
                        <c:if test="${!empty user}">
                            <input type="hidden" name="user_no" id="user_no"
                                value="${user.user_no}">
                        </c:if>
                        <c:if test="${!empty faceUser}">
                            <input type="hidden" name="user_no" id="user_no"
                                value="${faceUser.user_no}">
                        </c:if>
                        <ul id="wdr-following-ul">
                            <li>
                                <div class="followUserWrap">
                                    <div class="followUserImgWrap">
                                       <a href="#">
                                            <img class="followUserImg" src="../fileUpload/${user.phot_path}">
                                       </a>
                                   </div>
                                   <div class="followUserInfo">
                                       <a href="#">
                                           nickname
                                       </a>
                                   </div>
                               </div>
                            </li>
                            
                            <!-- 
                            <c:forEach var="followerList" items="${followerList}">
                                <li>
                                    <img src="../fileUpload/${wardrobe.follow.phot_path}">
                                </li>
                            </c:forEach>
                             -->
                        </ul>
                    </div>

                </div>
                <!-- /.modal-content -->
            </form>
            <!-- /.form -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->
    <!-- ---------------------------------------------------------------------------------------------------->


    <!-- 옷장 컨텐츠 시작 -->
	<div id="wdr-container">
		<!-- Wardrobe Header -->
        <!-- User Profile Picture -->
        <div id="wdr-user-row" class="row">
            <div id="wdr-user-col" class="col-xs-12 col-md-4">
                <div id="wdr-user">
                    <c:if test="${!empty cls_user.phot_path}">
                        <img src="../fileUpload/${cls_user.phot_path}" 
                                   alt="Responsive image">
                    </c:if>
                </div>
            </div>
            <!--//wardrobeUser -->

            <!-- User Profile Info -->
            <div class="wdr-userInfo col-xs-12 col-sm-5 col-md-7">
                <input type="hidden" name="cls_user_no" id="cls_user_no" value="${cls_user.user_no}">
                <h4 class="wdr-userId">${cls_user.nick}</h4>
                
                <input type="hidden" name="user_no" id="user_no" value="${user.user_no}">
                <c:if test="${getFollow == 0}">
	                <a id="wdr-user-follow" class="btn btn-default btn-sm" 
	                     href="#" role="button"> 팔로우 </a>
                </c:if>
                <c:if test="${getFollow != 0}"> 
	                <a id="wdr-user-unfollow" class="btn btn-primary btn-sm" 
	                     href="#" role="button"> 언팔로우 </a>
                </c:if>
                
                <ul class="wdr-follow">
                    <li class="wdr-wdrs">
                        <h5>옷장</h5>
                        <p class="wdr-wdr-cnt"></p>
                    </li>
                    <li class="wdr-followers">
                        <h5>팔로워</h5>
                        <p class="wdr-follower-cnt"></p>
                    </li>
                    <li class="wdr-followings">
                        <h5>팔로우</h5>
                        <p class="wdr-following-cnt"></p>
                    </li>
                </ul>
                
                <div id="wdr-exp-wrap">
                    <p class="wdr-exp">
                        안녕하세요. 많은 구독 부탁드려요. <br /> 
                        <a href="https://mycloset.link:8080">
                            https://mycloset.link/
                        </a>
                    </p>
                </div>
            </div>
            <!-- // wardrobeUserInfo -->
		</div>
		<!--// Wardrobe Header -->

		<!-- Wardrobe List Content / 리스트 반복문 -->
		<div class="row" id="wdr-list-wrap">
			<c:forEach var="wardrobe" items="${list}">
				<div class="wdr-content col-xs-12 col-sm-6  col-md-4"
					    id="wdr-list-box">
					<div class="wdr-grid">
						<div class="row" id="wdr-thumb-wrap">
							<div class="wdr-thumb col-xs-4 col-md-4"></div>
							<div class="wdr-thumb col-xs-4 col-md-4"></div>
							<div class="wdr-thumb col-xs-4 col-md-4"></div>
							<div class="wdr-thumb col-xs-4 col-md-4"></div>
							<div class="wdr-thumb col-xs-4 col-md-4"></div>
							<div class="wdr-thumb col-xs-4 col-md-4"></div>
						</div>
						<a href="#" class="wdr-title"> 
						    <input type="hidden" name="cls_no" id="cls_no" value="${wardrobe.cls_no}">
							<span class="wdr-cls-name">${wardrobe.cls_name}</span>
						</a>
						<p class="wdr-post-cnt">0 POSTS</p>
					</div>
				</div>
			</c:forEach>

			<!-- Default Wardrobe -->
			<div class="wdr-content col-xs-12 col-sm-6  col-md-4"
				id="wdr-list-box">
				<div class="wdr-grid">
					<div class="row" id="wdr-thumb-wrap">
						<div class="wdr-thumb col-xs-4 col-md-4"></div>
						<div class="wdr-thumb col-xs-4 col-md-4"></div>
						<div class="wdr-thumb col-xs-4 col-md-4"></div>
						<div class="wdr-thumb col-xs-4 col-md-4"></div>
						<div class="wdr-thumb col-xs-4 col-md-4"></div>
						<div class="wdr-thumb col-xs-4 col-md-4"></div>
					</div>
					<a href="#" class="wdr-title"> default wardrobe </a>
					<p class="wdr-post-cnt">0 POSTS</p>
				</div>
			</div>
		</div>
	</div>
	<!-- //wardrobeContainer -->

	<!-- Script -->
	<script src="../wardrobe/js/jquery.colorbox-min.js"></script>
	<script src="../wardrobe/js/wardrobe.js"></script>

</body>
</html>