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

	<!-- ============================== Add Wardrobe Modal ============================== -->
	<div class="modal fade" id="addWdrModal" tabindex="-1" role="dialog"
		aria-labelledby="wdrModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<form name="wdr-name">
				<div class="modal-content">

					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title">CREATE WARDROBE</h4>
					</div>

					<div class="modal-body">
					<c:if test="${!empty user}">
						<input type="hidden" name="user_no" id="user_no"
							value="${user.user_no}">
					</c:if>
					<c:if test="${!empty faceUser}">
						<input type="hidden" name="user_no" id="user_no"
							value="${faceUser.user_no}">
					</c:if>
						 <input type="text" name="cls_name" id="addWdr-input" class="form-control"
							placeholder="옷장 이름을 입력해주세요.">
							<p class="wdrNameValidate"></p>
					</div>

					<div class="modal-footer">
						<button type="submit" id="wdr-create-btn" 
						               class="btn btn-default" disabled="disabled">CREATE</button>
					</div>
					
					<div id></div>

				</div>
				<!-- /.modal-content -->
			</form>
			<!-- /.form -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->
	<!-- ---------------------------------------------------------------------------------------------------->

	<!-- ============================== update Wardrobe Modal ============================== -->
	<div class="modal fade" id="updateWdrModal" tabindex="-1" role="dialog"
		aria-labelledby="wdrModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<form name="wdr-update">
				<div class="modal-content">

					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title">옷장 수정</h4>
					</div>

					<div class="modal-body">
                    <c:if test="${!empty user}">
                        <input type="hidden" name="user_no" id="user_no"
                            value="${user.user_no}">
                    </c:if>
                    <c:if test="${!empty faceUser}">
                        <input type="hidden" name="user_no" id="user_no"
                            value="${faceUser.user_no}">
                    </c:if>
						 <input type="text" name="cls_name" id="updateWdr-input" class="form-control"
							placeholder="옷장 이름을 입력해주세요.">
							<p class="wdrUpdateValidate"></p>
					</div>

					<div class="modal-footer">
						<button type="submit" id="wdr-modify-btn" 
						               class="btn btn-default" disabled="disabled">MODIFY</button>
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

	<!-- ============================== delete Wardrobe Modal ============================== -->
 	<div class="modal fade bs-example-modal-sm" id="deleteWdrModal" tabindex="-1" role="dialog"
		aria-labelledby="wdrModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<form name="wdr-update">
				<div class="modal-content">

					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true"> &times; </span>
						</button>
						<h4 class="modal-title"> 옷장을 삭제할까요? </h4>
					</div>

					<div class="modal-body">
                    <c:if test="${!empty user}">
                        <input type="hidden" name="user_no" id="user_no"
                            value="${user.user_no}">
                    </c:if>
                    <c:if test="${!empty faceUser}">
                        <input type="hidden" name="user_no" id="user_no"
                            value="${faceUser.user_no}">
                    </c:if>
							<p class="wdrDeleteMsg"> 삭제한 후에는 이 작업을 실행 취소할 수 없습니다! </p>
					</div>

					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal"> 취소 </button>
	                    <button type="submit" class="wdr-del-submit btn btn-primary"> 확인 </button>
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


	<div id="wdr-container">
		<!-- Wardrobe Header -->
		<!-- User Profile Picture -->
		<div id="wdr-user-row" class="row">
	       	<div id="wdr-user-col" class="col-xs-12 col-md-4">
				<div id="wdr-user">
	                <c:if test="${!empty user.phot_path}">
	                    <img src="../header/upload/${user.phot_path}" 
	                               alt="Responsive image">
	                </c:if>
	                <c:if test="${!empty faceUser.phot_path}">
	                    <img src="${faceUser.phot_path}" 
	                               alt="Responsive image">
	                </c:if>
				</div>
			</div>
			<!--//wardrobeUser -->

			<!-- User Profile Info -->
			<div class="wdr-userInfo col-xs-12 col-sm-5 col-md-7">
				<h4 class="wdr-userId">${cls_user.nick}</h4>
<!-- 				<a id="wdr-user-modify" 
				    class="btn btn-default btn-sm" href="#" role="button">프로필수정</a> -->
				
				<ul class="wdr-follow">
					<li class="wdr-wdrs">
						<h5>옷장</h5>
						<p class="wdr-wdr-cnt"></p>
					</li>
					<li class="wdr-follwers">
						<h5>팔로워</h5>
						<p class="wdr-follower-cnt">21,321</p>
					</li>
					<li class="wdr-followings">
						<h5>팔로우</h5>
						<p class="wdr-following-cnt">1,834</p>
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

			<!-- Setting Button -->
			<div class="wdr-btn col-xs-12 col-sm-4 col-md-1">
				<ul>
					<li class="create-wdr">
					   <a href="#" data-toggle="modal" 
					        data-target="#addWdrModal" role="button">
					        <img class="wdr-icon-add" 
					                   src="../wardrobe/css/images/icon-add_b.svg" alt="add" />
				       </a>
			        </li>
					
					<li class="wdr-update-user">
					   <a href="#">
					       <img class="wdr-icon-setting" 
					                  src="../wardrobe/css/images/icon-setting_b.svg" alt="setting" />
					   </a>
    				 
					<li class="wdr-user-logout">
					   <a href="#">
					       <img class="wdr-icon-logout"
					                  src="../wardrobe/css/images/icon-logout_b.svg" alt="logout" />
					   </a>
				   </li>
				</ul>
			</div>
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
						<div class="wdr-btn-group">
							<button data-toggle="modal" data-target="#updateWdrModal" 
							               class="wdr-modify btn btn-default btn-sm" type="submit"> 수정 </button>
							<button  data-toggle="modal" data-target="#deleteWdrModal" 
							                type="button" class="wdr-delete btn btn-danger btn-sm"> 삭제 </button>
						</div>
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
	<script src="../node_modules/jquery/dist/jquery.js"></script>
	<script src="../wardrobe/js/jquery.colorbox-min.js"></script>
	<script src="../wardrobe/js/wardrobe.js"></script>

</body>
</html>