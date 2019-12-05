<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${sessionScope.User.username}-订单</title>
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
	href="${pageContext.request.contextPath}/css/order.css" />
</head>
<body>
	<jsp:include page="../commen/commen.jsp" />

	<!-- 结算界面 -->
	<div class="main-container">
		<div class="container-fluid no-margin">
			<div class="order-list-container center-block">
				<div class="order-list-header">
					<span class="order-list-header-base_info order-list-header-text">商品信息</span>
					<span class="order-list-header-price order-list-header-text">单价</span>
					<span class="order-list-header-num order-list-header-text">数量</span>
					<span class="order-list-header-payment order-list-header-text">实付款</span>
				</div>
				<div class="order-list-card">
					<c:forEach items="${order.orderItemList}" var="cartItem">
						<div class="order-list-card-content">
							<div class="order-list-card-content-preview">
								<a href="#">
									<img src="${pageContext.request.contextPath}${cartItem.product.imgUrl}" style="width: auto;height: 112px;"class="center-block" />
								</a>
							</div>
							<div class="order-list-card-content-base_info order-list-card-content-distance">
								<span class="order-list-card-header-time order-list-header-text">${cartItem.product.name}</span>
							</div>
							<div class="order-list-card-content-price order-list-card-content-distance">
								<span>￥${cartItem.product.price}</span>
							</div>
							<div class="order-list-card-content-num order-list-card-content-distance">
								<span>${cartItem.buyNum}</span>
							</div>
							<div class="order-list-card-content-payment order-list-card-content-distance">
								<span style="color: #de415c !important;" class="order-list-header-text">￥<fmt:formatNumber value="${cartItem.buyNum*cartItem.product.price}" pattern="#.00" type="number" /></span>
							</div>
						</div>
					</c:forEach>
					<form action="${pageContext.request.contextPath}/user/payOrder" method="post">
						<input type="hidden" name="id" value="${order.id}" />
						<div class="address-container">
							<div class="address-box">
								<label>地址</label>
								<input type="text" name="receiveAddress" required="required" autocomplete="off"/>
								<label>收货人</label>
								<input type="text" name="receiveName" required="required" autocomplete="off"/>
								<label>收货电话</label>
								<input type="text" name="receivePhone" required="required" autocomplete="off"/>
							</div>
						</div>
						<div class="order-content-footer" style="padding: 0 40px;">
							<div class="order-content-footer-payment">
								<span>总价:${order.money}</span>
							</div>
							<div class="order-content-footer-submit">
								<button type="submit" class="g-btn g-btn--primary">
									<span>支付</span>
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
</body>
</html>