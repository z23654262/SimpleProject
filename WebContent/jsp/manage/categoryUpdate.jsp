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
	<jsp:include page="../commen/manageCommen.jsp" />

	<div class="main-container">
		<div class="container-fluid no-margin">
			<form class="form-horizontal" action="${pageContext.request.contextPath}/manage/categoryEdit"
			method="post">
			<input value="${category.id}" type="hidden"
				class="form-control w300" name="id" />

			<div class="form-group">
				<label for="categoryName" class="col-sm-3 control-label">类别名</label>
				<div class="col-sm-7">
					<input value="${category.categoryName}" required="required"
						type="text" class="form-control w300" name="categoryName" />
				</div>
			</div>


			<div class="modal-footer">
				<button type="submit" class="btn btn-primary">
					<span class="glyphicon glyphicon-floppy-disk"></span> 保存
				</button>
				<a href="${pageContext.request.contextPath}/manage/categoryList" class="btn btn-default">返回</a>
			</div>
		</form>
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