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
			<div class="row clearfix">
			<div class="col-md-12 column">
				<div class="addBook">
					<a id="modal-234446" href="#modal-container-234446" role="button"
						class="btn btn-sm btn-primary" data-toggle="modal"><span
						class="glyphicon glyphicon-plus"></span> 添加类别</a>

					<div class="modal fade" id="modal-container-234446" role="dialog"
						aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-hidden="true">×</button>
									<h4 class="modal-title" id="myModalLabel">添加类别</h4>
								</div>
								<div class="modal-body">

									<form class="form-horizontal"
										action="${pageContext.request.contextPath}/manage/categoryEdit" method="post">

										<div class="form-group">
											<label for="categoryName" class="col-sm-3 control-label">分类名</label>
											<div class="col-sm-7">
												<input required="required" type="text"
													class="form-control w300" name="categoryName"
													id="categoryName" />
											</div>
										</div>

										<div class="modal-footer">
											<button type="submit" class="btn btn-primary">
												<span class="glyphicon glyphicon-floppy-disk"></span> 保存
											</button>
										</div>
									</form>
								</div>
							</div>

						</div>

					</div>

				</div>
				<table class="table">
					<thead>
						<tr>
							<th>序号</th>
							<th>分类名</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${categoryList}" var="category" varStatus="status">
						<tr>
							<td class="center">${status.count}</td>
							<td class="center">${category.categoryName}</td>
							<td class="center"><a
								href="${pageContext.request.contextPath}/manage/categoryDelete?id=${category.id}"
								class="btn btn-danger btn-xs"
								onclick="if(confirm('确定删除?')==false)return false;">删除</a> <a
								href="${pageContext.request.contextPath}/manage/categoryEdit?id=${category.id}"
								class="btn btn-xs btn-primary">编辑</a></td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
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
	<script src="${pageContext.request.contextPath}/js/product.js"
		type="text/javascript" charset="utf-8"></script>
</body>
</html>