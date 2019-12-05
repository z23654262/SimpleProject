<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首页</title>
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
	href="${pageContext.request.contextPath}/css/productList.css" />
</head>
<body>
	<jsp:include page="../commen/commen.jsp" />

	<!-- 搜索结果 -->
	<div class="main-container">
		<div class="container-fluid no-margin">
			<ol class="breadcrumb">
			  <li class="active">搜索词:${keyword}</li>
			</ol>
			<div class="product-list-container">
				<c:forEach items="${productList}" var="product">
					<div class="product-item pull-left"
								style="width: calc(( 100% - 120px)/7);">
								<div class="product-item-preview">
									<a href="#"> <img class="center-block" src="${pageContext.request.contextPath}${product.imgUrl}" width="auto"
										height="160px" />
									</a>
									<div class="product-item-dark opacity-0"></div>
									<a role="button" data-toggle="modal"
										href="#cart-container${product.id}"
										class="product-item-cart opacity-0"><span
										class="glyphicon glyphicon-check"></span><span
										style="margin-left: 6px;">购物车</span></a> <a role="button"
										data-toggle="modal" href="#order-container${product.id}"
										class="product-item-detail opacity-0"><span
										class="glyphicon glyphicon-jpy"></span><span
										style="margin-left: 6px;">购买</span></a>
								</div>
								<a href="#" class="product-item-title center-block">${product.name}</a>
								<div class="modal fade" id="cart-container${product.id}"
									role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal"
													aria-hidden="true">×</button>
												<h4 class="modal-title" id="myModalLabel">购物车</h4>
											</div>
											<div class="modal-body">
												<form action="${pageContext.request.contextPath}/user/addCart"  class="form-horizontal" method="post">
													<input type="hidden" class="form-control w200"
														name="product_id" value="${product.id}" required="required" />
													<div class="form-group">
														<img
															style="max-height: 200px; width: auto; height: 120px;"
															src="${pageContext.request.contextPath}${product.imgUrl}" alt="..." class="center-block" />
													</div>
													<div class="form-group">
														<label class="col-sm-3 control-label">书名：</label> <label
															style="text-align: left;" class="col-sm-7 control-label">${product.name}</label>
													</div>
													<div class="form-group">
														<label class="col-sm-3 control-label">价格：</label> <label
															style="text-align: left;" class="col-sm-7 control-label">${product.price}</label>
													</div>

													<div class="form-group">
														<label class="col-sm-3 control-label">简介：</label> <label
															style="text-align: left;" class="col-sm-7 control-label">${product.description}</label>
													</div>
													<div class="form-group">
														<label for="num" class="col-sm-3 control-label">添加数量</label>
														<div class="col-sm-2">
															<input type="hidden" value="${product.price}" /> <input
																type="text" class="form-control w200 num" name="num"
																required="required" />
														</div>
														<label class="col-sm-5 control-label" style="text-align:left;">totalPrice</label>
													</div>
													<div class="modal-footer">
														<button type="submit" class="btn btn-primary">
															<span class="glyphicon glyphicon-shopping-cart"></span>
															添加到购物车
														</button>
													</div>
												</form>
											</div>
										</div>
									</div>
								</div>
								<div class="modal fade" id="order-container${product.id}"
									role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal"
													aria-hidden="true">×</button>
												<h4 class="modal-title" id="myModalLabel">购买</h4>
											</div>
											<div class="modal-body">
												<form action="${pageContext.request.contextPath}/user/singleProductToOrder" class="form-horizontal" method="post"
													>
													<input type="hidden" name="id"  value="${product.id}"/>
													<div class="form-group">
														<img
															style="max-height: 200px; width: auto; height: 120px;"
															src="${pageContext.request.contextPath}${product.imgUrl}" alt="..." class="center-block" />
													</div>
													<div class="form-group">
														<label class="col-sm-3 control-label">书名：</label> <label
															style="text-align: left;" class="col-sm-7 control-label">${product.name}</label>
													</div>
													<div class="form-group">
														<label class="col-sm-3 control-label">价格：</label> <label
															style="text-align: left;" class="col-sm-7 control-label">${product.price}</label>
													</div>
													<div class="form-group">
														<label class="col-sm-3 control-label">简介：</label> <label
															style="text-align: left;" class="col-sm-7 control-label">${product.description}</label>
													</div>
													<div class="form-group">
														<label class="col-sm-3 control-label">购买数量</label>
														<div class="col-sm-2">
															<input type="hidden" value="${product.price}" /> <input
																type="text" class="form-control w200 num" name="num"
																required="required" />
														</div>
														<label class="col-sm-5 control-label" style="text-align:left;">totalPrice</label>
														<input type="hidden" name="money"/>
													</div>
													<div class="modal-footer">
														<button type="submit" class="btn btn-primary">
															<span class="glyphicon glyphicon-check"></span> 支付
														</button>
													</div>
												</form>
											</div>
										</div>
									</div>
								</div>
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
	<script src="${pageContext.request.contextPath}/js/product.js"
		type="text/javascript" charset="utf-8"></script>
</body>
</html>