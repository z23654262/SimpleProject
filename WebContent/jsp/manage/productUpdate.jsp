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
			<form class="form-horizontal" action="${pageContext.request.contextPath}/manage/productEdit"
			method="post">
			<input value="${product.id}" type="hidden"
				class="form-control w300" name="id" />
			<div class="form-group">
				<label for="title" class="col-sm-3 control-label">分类</label>
				<div class="col-sm-7">
					<select class="form-control" name="categoryId"
						required="required">
						<option value=""></option>
						<c:forEach items="${categoryList}" var="category">
							<option value="${category.id }" selected="${category.categoryName==product.category.categoryName}">${category.categoryName }</option>
						</c:forEach>
					</select>
				</div>
			</div>

			<div class="form-group">
				<label for="title" class="col-sm-3 control-label">书名</label>
				<div class="col-sm-7">
					<input value="${product.name}" required="required" type="text"
						class="form-control w300" name="name" />
				</div>
			</div>

			<div class="form-group" style="height:112px;">
				<label  for="price" class="col-sm-3 control-label">图片</label>
				<div class="col-sm-7">
					<div style="position: relative;">
						<img style="width: 112px;height: 112px;position: absolute;top:0;" src="${pageContext.request.contextPath}${product.imgUrl}"/>
						<input id="product-img" type="file" style="width: 112px;height: 112px;opacity: 0;z-index: 9999;position: absolute;" />
						<input type="hidden" name="imgUrl" required="required" />
						<p class="help-block"style="position: absolute;left: 120px;">不更改图片就不用选择</p>
					</div>
				</div>
			</div>

			<div class="form-group">
				<label for="price" class="col-sm-3 control-label">价格</label>
				<div class="col-sm-7">
					<input type="text" value="${product.price}"
						class="form-control w200" name="price" required="required" />
				</div>
			</div>

			<div class="form-group">
				<label for="author" class="col-sm-3 control-label">作者</label>
				<div class="col-sm-7">
					<input type="text" value="${product.writer}"
						class="form-control w200" name="writer" required="required" />
				</div>
			</div>
			
			<div class="form-group">
				<label for="author" class="col-sm-3 control-label">简介</label>
				<div class="col-sm-7">
					<textarea
						class="form-control w200" name="description" style="resize:none;" required="required" >${product.description}
					</textarea>
				</div>
			</div>

			<div class="modal-footer">
				<button type="submit" class="btn btn-primary">
					<span class="glyphicon glyphicon-floppy-disk"></span> 保存
				</button>
				<a href="${pageContext.request.contextPath}/manage/productList" class="btn btn-default">返回</a>
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
	<script type="text/javascript" charset="utf-8">
		function getRootPath() {
		    // 1、获取当前全路径，如： http://localhost:8080/springmvc/page/frame/test.html
		    var curWwwPath = window.location.href;
		    // 获取当前相对路径： /springmvc/page/frame/test.html
		    var pathName = window.location.pathname;    // 获取主机地址,如： http://localhost:8080
		    var local = curWwwPath.substring(0,curWwwPath.indexOf(pathName));  
		    // 获取带"/"的项目名，如：/springmvc  
		    var projectName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);  
		    var rootPath = local + projectName;  
		    return rootPath; 
		}
		
		$('#product-img').on('propertychange input', function(event) {
			var img = $(this).prev()
			var imgValue = $(this).next()
			var formData = new FormData()
			formData.append("file",$(this)[0].files[0])
			$.ajax({
				type:'POST',
				url:getRootPath()+"/manage/uploadProductImg",
				data:formData,
				contentType: false,// 注意：让jQuery不要处理数据
				processData: false,// 注意：让jQuery不要设置contentType
				success:function (msg) {
					$(img).attr('src',getRootPath()+msg)
					$(imgValue).attr('value',msg)
				},
				error:function (mag) {
					console.log("上传失败，请重试")
					alert("上传失败，请重试")
					// window.location.reload();
				}
			});
		});
	</script>
</body>
</html>