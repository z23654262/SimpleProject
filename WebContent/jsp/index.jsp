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
	<jsp:include page="commen/commen.jsp" />

	<div class="main-container">
	<div class="container-fluid no-margin">
		<div class="jumbotron"
			style="background-size: cover; background: url(img/back.jpg); border-radius: 10px;">
			<h2 class="noselect" style="color: #fff; text-align: center;">让阅读更简单!</h2>
		</div>
		<div class="product-list-container">

			<c:forEach items="${categoryList}" var="category">
				<div style="height: 80px;">
					<h3 class="product pull-left">${category.categoryName}</h3>
					<a href="#" class="pull-right"
						style="display: block; margin-top: 30px;">查看更多<span
						style="margin-left: 10px;"
						class="glyphicon glyphicon-circle-arrow-right"></span></a>
					<div class="clearfix"></div>
				</div>
				<c:choose>
					<c:when test="${fn:length(category.products)==0}">
						<img alt="空空如也" width="100" height="auto" class="center-block"
							src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz4KPHN2ZyB3aWR0aD0iMTQwcHgiIGhlaWdodD0iMTQwcHgiIHZpZXdCb3g9IjAgMCAxNDAgMTQwIiB2ZXJzaW9uPSIxLjEiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiPgogICAgPCEtLSBHZW5lcmF0b3I6IFNrZXRjaCA1NSAoNzgwNzYpIC0gaHR0cHM6Ly9za2V0Y2hhcHAuY29tIC0tPgogICAgPHRpdGxlPmltZ19kZWZhdWx0X3BpYzwvdGl0bGU+CiAgICA8ZGVzYz5DcmVhdGVkIHdpdGggU2tldGNoLjwvZGVzYz4KICAgIDxkZWZzPgogICAgICAgIDxmaWx0ZXIgeD0iLTEzLjklIiB5PSItMTMuOSUiIHdpZHRoPSIxMjcuOSUiIGhlaWdodD0iMTI3LjklIiBmaWx0ZXJVbml0cz0ib2JqZWN0Qm91bmRpbmdCb3giIGlkPSJmaWx0ZXItMSI+CiAgICAgICAgICAgIDxmZUdhdXNzaWFuQmx1ciBzdGREZXZpYXRpb249IjMiIGluPSJTb3VyY2VHcmFwaGljIj48L2ZlR2F1c3NpYW5CbHVyPgogICAgICAgIDwvZmlsdGVyPgogICAgICAgIDxsaW5lYXJHcmFkaWVudCB4MT0iNTAlIiB5MT0iMTAwJSIgeDI9IjUwJSIgeTI9IjMuMDYxNjE3ZS0xNSUiIGlkPSJsaW5lYXJHcmFkaWVudC0yIj4KICAgICAgICAgICAgPHN0b3Agc3RvcC1jb2xvcj0iI0U0RTRFNCIgb2Zmc2V0PSIwJSI+PC9zdG9wPgogICAgICAgICAgICA8c3RvcCBzdG9wLWNvbG9yPSIjRTBFMEUwIiBvZmZzZXQ9IjEwMCUiPjwvc3RvcD4KICAgICAgICA8L2xpbmVhckdyYWRpZW50PgogICAgICAgIDxsaW5lYXJHcmFkaWVudCB4MT0iNTAlIiB5MT0iMCUiIHgyPSI1MCUiIHkyPSIxMDAlIiBpZD0ibGluZWFyR3JhZGllbnQtMyI+CiAgICAgICAgICAgIDxzdG9wIHN0b3AtY29sb3I9IiNGQkZCRkIiIG9mZnNldD0iMCUiPjwvc3RvcD4KICAgICAgICAgICAgPHN0b3Agc3RvcC1jb2xvcj0iI0Y1RjVGNSIgb2Zmc2V0PSIxMDAlIj48L3N0b3A+CiAgICAgICAgPC9saW5lYXJHcmFkaWVudD4KICAgIDwvZGVmcz4KICAgIDxnIGlkPSLpobXpnaIxIiBzdHJva2U9Im5vbmUiIHN0cm9rZS13aWR0aD0iMSIgZmlsbD0ibm9uZSIgZmlsbC1ydWxlPSJldmVub2RkIj4KICAgICAgICA8ZyBpZD0i6K6i5Y2V5Lit5b+DLee8uuecgemhtSIgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoLTY1MS4wMDAwMDAsIC0zNDQuMDAwMDAwKSI+CiAgICAgICAgICAgIDxnIGlkPSJpbWdfZGVmYXVsdF9waWMiIHRyYW5zZm9ybT0idHJhbnNsYXRlKDY0NS4wMDAwMDAsIDMzOS4wMDAwMDApIj4KICAgICAgICAgICAgICAgIDxwb2x5Z29uIGlkPSLnn6nlvaIiIGZpbGw9IiNFREVERUQiIG9wYWNpdHk9IjAuNSIgZmlsdGVyPSJ1cmwoI2ZpbHRlci0xKSIgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoNzUuMTcyMTkwLCAxMDguMzA1MTQ1KSByb3RhdGUoLTMxNS4wMDAwMDApIHRyYW5zbGF0ZSgtNzUuMTcyMTkwLCAtMTA4LjMwNTE0NSkgIiBwb2ludHM9IjQyLjg4NTE5NDcgMTQwLjU5MjE0MSA4Ni41NjEwODg4IDExOS42OTQwNDQgMTA3LjQ1OTE4NiA3Ni4wMTgxNDk1IDQzLjg5NTkxMzUgNzcuMDI4ODY4MyI+PC9wb2x5Z29uPgogICAgICAgICAgICAgICAgPHBvbHlnb24gaWQ9IuefqeW9oiIgZmlsbD0iI0Q4RDhEOCIgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoNzUuMTcyMTkwLCA0NS43Mzk5MTApIHJvdGF0ZSgtMzE1LjAwMDAwMCkgdHJhbnNsYXRlKC03NS4xNzIxOTAsIC00NS43Mzk5MTApICIgcG9pbnRzPSI2My43ODMyOTE3IDM0LjM1MTAxMTggMTA3LjQ1OTE4NiAxMy40NTI5MTQ4IDg2LjU2MTA4ODggNTcuMTI4ODA4OCA0Mi44ODUxOTQ3IDc4LjAyNjkwNTgiPjwvcG9seWdvbj4KICAgICAgICAgICAgICAgIDxwb2x5Z29uIGlkPSLnn6nlvaIiIGZpbGw9InVybCgjbGluZWFyR3JhZGllbnQtMikiIG9wYWNpdHk9IjAuODk4MDQyMjI1IiB0cmFuc2Zvcm09InRyYW5zbGF0ZSg2MC4zOTUwMDQsIDQ1LjczOTkxMCkgcm90YXRlKC0zMTUuMDAwMDAwKSB0cmFuc2xhdGUoLTYwLjM5NTAwNCwgLTQ1LjczOTkxMCkgIiBwb2ludHM9IjU5LjQ1NTE1NDEgMjMuOTAxOTYzMyA4Mi4yMzI5NTEyIDQ2LjY3OTc2MDMgMzguNTU3MDU3MSA2Ny41Nzc4NTczIj48L3BvbHlnb24+CiAgICAgICAgICAgICAgICA8cG9seWdvbiBpZD0i55+p5b2iIiBmaWxsPSIjRURFREVEIiB0cmFuc2Zvcm09InRyYW5zbGF0ZSg1Mi4zNDE4MzcsIDgyLjczMTk0NSkgcm90YXRlKC0zMTUuMDAwMDAwKSB0cmFuc2xhdGUoLTUyLjM0MTgzNywgLTgyLjczMTk0NSkgIiBwb2ludHM9IjUwLjk2Njc1OTEgMTEzLjY0Mzg2MyA5NC42NDI2NTMxIDkyLjc0NTc2NTkgNTMuNzE2OTE0NSA1MS44MjAwMjcyIDEwLjA0MTAyMDQgNzIuNzE4MTI0MiI+PC9wb2x5Z29uPgogICAgICAgICAgICAgICAgPHBvbHlnb24gaWQ9IuefqeW9oiIgZmlsbD0iI0Q4RDhEOCIgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoOTcuOTA3NDIzLCA4Mi43NjUxMzUpIHNjYWxlKC0xLCAxKSByb3RhdGUoLTMxNS4wMDAwMDApIHRyYW5zbGF0ZSgtOTcuOTA3NDIzLCAtODIuNzY1MTM1KSAiIHBvaW50cz0iOTYuNTMyMzQ1OCAxMTMuNjkxNDY1IDE0MC4yMDgyNCA5Mi43OTMzNjc4IDk5LjI1MzY3NjUgNTEuODM4ODA0NSA1NS42MDY2MDcxIDcyLjc2NTcyNjEiPjwvcG9seWdvbj4KICAgICAgICAgICAgICAgIDxwb2x5Z29uIGlkPSLnn6nlvaIiIGZpbGw9InVybCgjbGluZWFyR3JhZGllbnQtMykiIHRyYW5zZm9ybT0idHJhbnNsYXRlKDQwLjc2NDExMCwgNjUuMTUxOTUxKSByb3RhdGUoLTMxNS4wMDAwMDApIHRyYW5zbGF0ZSgtNDAuNzY0MTEwLCAtNjUuMTUxOTUxKSAiIHBvaW50cz0iNjIuMjEwOTk5NyA3My43NjA5OTY2IDYyLjc1NjgwOTQgMzguNDg0Mjc3IDE5LjA4MDkxNTQgNTkuMzgyMzc0IDE4Ljc3MTQxIDkxLjgxOTYyNTkiPjwvcG9seWdvbj4KICAgICAgICAgICAgICAgIDxwb2x5Z29uIGlkPSLnn6nlvaIiIGZpbGw9IiNFREVERUQiIHRyYW5zZm9ybT0idHJhbnNsYXRlKDExMC4yOTQwNzQsIDY0Ljg4NTQyMCkgcm90YXRlKC0zMTUuMDAwMDAwKSB0cmFuc2xhdGUoLTExMC4yOTQwNzQsIC02NC44ODU0MjApICIgcG9pbnRzPSIxMzcuMjc4MDE3IDQyLjE5OTUxODQgMTA0LjIwODIyOCA0My44OTU0MjY2IDgzLjMxMDEzMDkgODcuNTcxMzIwNiAxMTkuMzU5NTQ1IDg2LjI1MjgxNjkiPjwvcG9seWdvbj4KICAgICAgICAgICAgPC9nPgogICAgICAgIDwvZz4KICAgIDwvZz4KPC9zdmc+">
						<p class="center-block" style="text-align: center;">空空如也~</p>
					</c:when>
					<c:otherwise>
						<c:forEach items="${category.products}" var="product">
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
					</c:otherwise>
				</c:choose>
				<div class="clearfix"></div>
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