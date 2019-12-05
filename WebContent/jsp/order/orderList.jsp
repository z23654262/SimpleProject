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

	<!-- 订单 -->
	<div class="main-container">
		<div class="container-fluid no-margin">
			<div class="order-list-container center-block">
				<div class="order-list-header">
					<span class="order-list-header-base_info order-list-header-text">商品信息</span>
					<span class="order-list-header-price order-list-header-text">单价</span>
					<span class="order-list-header-num order-list-header-text">数量</span>
					<span class="order-list-header-payment order-list-header-text">实付款</span>
					<span class="order-list-header-action order-list-header-text">交易操作</span>
				</div>
				<c:forEach items="${orderList}" var="order">
					<div class="order-list-card">
						<div class="order-list-card-header">
							<div>
								<span class="order-list-card-header-time order-list-header-text">
								<fmt:formatDate value="${order.createDate}" pattern="yyyy-MM-dd HH:mm:ss" />
								</span> 
								<span class="order-list-card-header-id order-list-header-text">
									订单号:${order.id}
								</span> 
								<span style="color: #de415c !important; margin-left: 20px;" class="order-list-header-text">
									总价：￥${order.money}
								</span> 
								<span style="color: #de415c !important; margin-left: 20px;" class="order-list-header-text">
									<c:choose>
										<c:when test="${order.payStatus==1}">
											已支付
										</c:when>
										<c:otherwise>
											未支付
										</c:otherwise>
									</c:choose>
								</span>
							</div>
						</div>
						<c:forEach items="${order.orderItemList}" var="orderItem" varStatus="status">
							<div class="order-list-card-content">
								<div class="order-list-card-content-preview">
									<a href="#"> <img src="${pageContext.request.contextPath}${orderItem.product.imgUrl}"
										class="center-block" style="width: auto; height: 112px;" />
									</a>
								</div>
								<div
									class="order-list-card-content-base_info order-list-card-content-distance">
									<span class="order-list-card-header-time order-list-header-text">${orderItem.product.name}</span>
								</div>
								<div
									class="order-list-card-content-price order-list-card-content-distance">
									<span>￥${orderItem.product.price}</span>
								</div>
								<div
									class="order-list-card-content-num order-list-card-content-distance">
									<span>${orderItem.buyNum}</span>
								</div>
								<div
									class="order-list-card-content-payment order-list-card-content-distance">
									<span style="color: #de415c !important;"
										class="order-list-header-text">￥<fmt:formatNumber value="${orderItem.buyNum*orderItem.product.price}" pattern="#.00" type="number" /></span>
								</div>
								<c:if test="${status.count==1}">
									<div class="order-list-card-content-action order-list-card-content-distance">
										<c:choose>
											<c:when test="${order.payStatus==1}">
												<a onclick="if(confirm('确定删除订单?')==false)return false;" href="${pageContext.request.contextPath}/user/deleteOrder?id=${order.id}" class="g-btn g-btn--text">
													<span>删除订单</span>
												</a>
											</c:when>
											<c:otherwise>
												<a href="${pageContext.request.contextPath}/user/payOrder?id=${order.id}" class="g-btn g-btn--primary">
													<span>支付订单</span>
												</a>
												<a onclick="if(confirm('确定取消订单?')==false)return false;" href="${pageContext.request.contextPath}/user/deleteOrder?id=${order.id}" class="g-btn g-btn--text">
													<span>取消订单</span>
												</a>
											</c:otherwise>
										</c:choose>
									</div>
								</c:if>
							</div>
						</c:forEach>
					</div>
				</c:forEach>
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