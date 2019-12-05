<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="modal fade " id="modal-container-login"
	role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog ">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">×</button>
				<h4 class="modal-title" id="myModalLabel">登录</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" role="form"
					action="${pageContext.request.contextPath}/userLogin" method="post">
					<div class="form-group">
						<label for="id" class="col-sm-3 control-label">用户名</label>
						<div class="col-sm-6">
							<input type="text" name="phone" placeholder="请输入手机号"
								class="form-control w100" required="required" />
						</div>
					</div>

					<div class="form-group">
						<label for="title" class="col-sm-3 control-label">密码</label>
						<div class="col-sm-6">
							<input type="password" name="password" placeholder="请输入密码"
								class="form-control w300" required="required" />
						</div>
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-primary">登录</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<div class="modal fade "
	id="modal-container-register" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog ">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">×</button>
				<h4 class="modal-title" id="myModalLabel">注册</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" role="form" action="${pageContext.request.contextPath}/userRegister" method="post">
					<div class="form-group">
						<label for="id" class="col-sm-3 control-label">头像</label>
						<div class="col-sm-6">
							<img src="${pageContext.request.contextPath}/img/default-user.jpg" class="register-user-upload"/>
							<input type="file" class="register-user-img"/>
							<input type="hidden" name="imgUrl"/>
						</div>
					</div>
					<div class="form-group">
						<label for="id" class="col-sm-3 control-label">昵称</label>
						<div class="col-sm-6">
							<input type="text" name="username" placeholder="请输入昵称"
								class="form-control w100" required="required" />
						</div>
					</div>
					<div class="form-group">
						<label for="title" class="col-sm-3 control-label">密码</label>
						<div class="col-sm-6">
							<input type="password" name="password" placeholder="请输入密码"
								class="form-control w300" required="required" />
						</div>
					</div>
					<div class="form-group">
						<label for="id" class="col-sm-3 control-label">邮箱</label>
						<div class="col-sm-6">
							<input type="text" name="email" placeholder="请输入邮箱"
								class="form-control w100" required="required" />
						</div>
					</div>
					<div class="form-group">
						<label for="id" class="col-sm-3 control-label">电话</label>
						<div class="col-sm-6">
							<input type="text" name="phone" placeholder="请输入手机号"
								class="form-control w100" required="required" />
						</div>
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-primary">注册</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<div class="container-fluid no-margin no-padding">
	<div class="sidebar-container">
		<div class="sidebar-logo">
			<a href="${pageContext.request.contextPath}/index"> <img src="${pageContext.request.contextPath}/img/logo.png" />
			</a>
		</div>
		<div class="sidebar-navigator">
			<div class="sidebar-navigator-search">
				<form action="${pageContext.request.contextPath}/searchProduct" method="get">
					<div class="input-group">
						<input value="${keyword}" type="text" name="keyword" class="form-control"
							placeholder="输入商品名称" autocomplete="off"> <span
							class="input-group-btn">
							<button class="btn" type="submit">
								<span class="glyphicon glyphicon-search"></span>
							</button>
						</span>
					</div>
				</form>
			</div>

			<div class="sidebar-navigator-link">
				<a href="${pageContext.request.contextPath}/index" class="${sign=='found'?'sidebar-navigator-link-item-active':'sidebar-navigator-link-item'}"> <span
					class="glyphicon glyphicon-home sidebar-navigator-link-item-icon"></span>
					<span>发现</span>
				</a> 
			</div>
			<div class="sidebar-navigator-link">
				<span class="sidebar-navigator-link-title">我的</span> 
				<a href="${pageContext.request.contextPath}/user/cartList"
					class="${sign=='cart'?'sidebar-navigator-link-item-active':'sidebar-navigator-link-item'}"> <span
					class="glyphicon glyphicon-shopping-cart sidebar-navigator-link-item-icon"></span>
					<span>我的购物车</span>
				</a> 
				<a href="${pageContext.request.contextPath}/user/orderList" 
					class="${sign=='order'?'sidebar-navigator-link-item-active':'sidebar-navigator-link-item'}"> <span
					class="glyphicon glyphicon-briefcase sidebar-navigator-link-item-icon"></span>
					<span>我的订单</span>
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
