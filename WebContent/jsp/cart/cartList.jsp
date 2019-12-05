<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${sessionScope.User.username}-购物车</title>
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/img/favicon.ico"
	type="image/x-icon" />
<link rel="icon"
	href="${pageContext.request.contextPath}/img/favicon.ico"
	type="image/gif">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap-theme.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/index.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/cart.css" />
</head>
<body>
	<jsp:include page="../commen/commen.jsp" />

	<!-- 购物车 -->
	<div class="main-container">
		<div class="container-fluid no-margin">
			<div class="cart-container center-block">
				<div class="cart-header">
					<div class="cart-header-username">🍃${sessionScope.User.username}</div>
					<div class="cart-header-userid">ID:${sessionScope.User.id}</div>
				</div>
				<div class="cart-content">
					<div class="cart-content-header">
						<span class="cart-content-header-select cart-content-header-text">
							<input type="checkbox" id="checkAll" />
						</span> <span class="cart-content-header-no cart-content-header-text">序号</span>
						<span class="cart-content-header-preview cart-content-header-text">图片</span>
						<span
							class="cart-content-header-base_info cart-content-header-text">商品信息</span>
						<span class="cart-content-header-price cart-content-header-text">单价</span>
						<span class="cart-content-header-num cart-content-header-text">数量</span>
						<span class="cart-content-header-payment cart-content-header-text">实付款</span>
						<span class="cart-content-header-action cart-content-header-text">操作</span>
					</div>
					<form action="${pageContext.request.contextPath}/user/cartToOrder" method="post">
						<div class="cart-content-list">
							<c:forEach items="${cartItemList}" var="cartItem" varStatus="status">
								<div class="cart-content-item">
									<div class="cart-content-item-select cart-content-item-distance">
										<input type="checkbox" class="checkCart" />
									</div>
									<div class="cart-content-item-no cart-content-item-distance">
										${status.count}</div>
									<div
										class="cart-content-item-preview cart-content-item-distance">
										<a href="#"><img
											src="${pageContext.request.contextPath}${cartItem.product.imgUrl}"
											style="width: auto; height: 80px;" /></a>
									</div>
									<div
										class="cart-content-item-base_info cart-content-item-distance">
										<span
											class="order-list-card-header-time order-list-header-text">${cartItem.product.name}</span>
									</div>
									<div class="cart-content-item-price cart-content-item-distance">
										${cartItem.product.price}</div>
									<div class="cart-content-item-num cart-content-item-distance">
										<input type="hidden" class="id" name="id" value="${cartItem.product.id}"/>
										<input type="hidden" class="num" name="num" value="${cartItem.num}"/>
										<span style="cursor: pointer;" class="label label-default" onclick="count_minus(this)">
											<span class="glyphicon glyphicon-minus"></span>
										</span> 
										<span class="count" value="${cartItem.id}">${cartItem.num}</span> 
										<span style="cursor: pointer;" class="label label-default" onclick="count_plus(this)">
											<span class="glyphicon glyphicon-plus"></span>
										</span>
									</div>
									<div
										class="cart-content-item-payment cart-content-item-distance">
										<span style="color: #de415c !important;"
											class="cart-content-header-text">
											<fmt:formatNumber value="${cartItem.product.price*cartItem.num}" pattern="#.00" type="number" />
											</span>
									</div>
									<div class="cart-content-item-action cart-content-item-distance">
										<a href="${pageContext.request.contextPath}/user/deleteCart?id=${cartItem.id}" onclick="if(confirm('确定删除商品?')==false)return false;" class="g-btn g-btn--delete"> <span>删除</span>
										</a>
									</div>
								</div>
							</c:forEach>
						</div>
						<div class="cart-content-footer">
							<div class="cart-content-footer-payment">
								<span id="totalPrice">总价</span>
								<input type="hidden" name="money"/>
							</div>
							<div class="cart-content-footer-submit">
								<button class="g-btn g-btn--primary" type="submit" onclick="return pass()">
									<span>结算</span>
								</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>



	<script src="${pageContext.request.contextPath}/js/jquery.js"
		type="text/javascript" charset="utf-8"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.js"
		type="text/javascript" charset="utf-8"></script>
	<script src="${pageContext.request.contextPath}/js/index.js"
		type="text/javascript" charset="utf-8"></script>
	<script src="${pageContext.request.contextPath}/js/cart.js"
		type="text/javascript" charset="utf-8"></script>
</body>
</html>