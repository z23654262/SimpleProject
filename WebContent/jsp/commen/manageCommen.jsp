<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<div class="container-fluid no-margin no-padding">
	<div class="sidebar-container">
		<div class="sidebar-logo">
			<a href="${pageContext.request.contextPath}/manage/productList"> <img src="${pageContext.request.contextPath}/img/logo.png" />
			</a>
		</div>
		<div class="sidebar-navigator">

			<div class="sidebar-navigator-link" style="margin-top:20px;">
				<a href="${pageContext.request.contextPath}/manage/productList" class="${sign=='product'?'sidebar-navigator-link-item-active':'sidebar-navigator-link-item'}"> <span
					class="glyphicon glyphicon-tasks sidebar-navigator-link-item-icon"></span>
					<span>商品管理</span>
				</a> 
				<a href="${pageContext.request.contextPath}/manage/categoryList" class="${sign=='category'?'sidebar-navigator-link-item-active':'sidebar-navigator-link-item'}"> <span
					class="glyphicon glyphicon-th-list sidebar-navigator-link-item-icon"></span>
					<span>分类管理</span>
				</a> 
			</div>
		</div>
	</div>
	<div class="main-header">
		<c:choose>
			<c:when test="${sessionScope.User == null}">
				<div class="main-header-user pull-right">
					<img class="main-header-user-img" src="${pageContext.request.contextPath}/img/default-user.jpg" /> <a
						role="button" data-toggle="modal" href="#modal-container-login">登录</a>
					<em>/</em> <a role="button" data-toggle="modal"
						href="#modal-container-register">注册</a>
				</div>
			</c:when>
			<c:otherwise>
				<div id="main-header-user" class="main-header-user pull-right">
					<div class="pointer">
						<c:choose>
							<c:when test="${sessionScope.User.imgUrl==null}">
								<img class="main-header-user-img" src="${pageContext.request.contextPath}/img/default-user.jpg" />
							</c:when>
							<c:otherwise>
								<img class="main-header-user-img" src="${pageContext.request.contextPath}${sessionScope.User.imgUrl}" />
							</c:otherwise>
						</c:choose>
						 <a
							href="#" style="font-weight:700;">${sessionScope.User.username}</a> <span
							class="glyphicon glyphicon-triangle-bottom main-header-user-span"></span>
					</div>
					<ul id="main-header-user-operation-list"
						class="main-header-user-operation-list display_none">
						<li class="main-header-user-info-main">
							<div class="main-header-user-info-name">${sessionScope.User.username}</div>
							<div class="main-header-user-info-id">ID：${sessionScope.User.id}</div>
						</li>
						<ul class="main-header-user-operation-menu">
							<a href="${pageContext.request.contextPath}/user/editUser">
								<li><span
									class="glyphicon glyphicon-user main-header-user-operation-menu-icon"></span>
									<span>账号设置</span></li>
							</a>
							<a href="${pageContext.request.contextPath}/userLogout">
								<li><span
									class="glyphicon glyphicon-log-out main-header-user-operation-menu-icon"></span>
									<span>退出登录</span></li>
							<c:if test="${sessionScope.User.role=='admin'}">
							<a href="${pageContext.request.contextPath}/manage/productList">
								<li><span
									class="glyphicon glyphicon-cog main-header-user-operation-menu-icon"></span>
									<span>后台管理界面</span></li>
							</c:if>
							</a>
						</ul>
					</ul>
				</div>
			</c:otherwise>
		</c:choose>
		<!--  -->
	</div>
</div>
