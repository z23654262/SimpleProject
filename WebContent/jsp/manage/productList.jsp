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
							class="glyphicon glyphicon-plus"></span> 新书上架</a>

						<div class="modal fade" id="modal-container-234446" role="dialog"
							aria-labelledby="myModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal"
											aria-hidden="true">×</button>
										<h4 class="modal-title" id="myModalLabel">添加图书</h4>
									</div>
									<div class="modal-body">

										<form class="form-horizontal"
											action="${pageContext.request.contextPath}/manage/productEdit" method="post">

											<div class="form-group">
												<label for="title" class="col-sm-3 control-label">分类</label>
												<div class="col-sm-7">
													<select class="form-control" name="categoryId"
														required="required">
														<option value=""></option>
														<c:forEach items="${categoryList}" var="category">
															<option value="${category.id }">${category.categoryName }</option>
														</c:forEach>
													</select>
												</div>
											</div>

											<div class="form-group">
												<label for="title" class="col-sm-3 control-label">书名</label>
												<div class="col-sm-7">
													<input required="required" type="text"
														class="form-control w300" name="name" />
												</div>
											</div>

											<div class="form-group" style="height:112px;">
												<label  for="price" class="col-sm-3 control-label">图片</label>
												<div class="col-sm-7">
													<div style="position: relative;">
														<img style="width: 112px;height: 112px;position: absolute;top:0;" src="${pageContext.request.contextPath}/img/upload.png"/>
														<input id="product-img" type="file" style="width: 112px;height: 112px;opacity: 0;z-index: 9999;position: absolute;" />
														<input type="hidden" name="imgUrl" required="required" />
													</div>
												</div>
											</div>

											<div class="form-group">
												<label for="price" class="col-sm-3 control-label">价格</label>
												<div class="col-sm-7">
													<input type="text" class="form-control w200" name="price"
														required="required" />
												</div>
											</div>

											<div class="form-group">
												<label for="author" class="col-sm-3 control-label">作者</label>
												<div class="col-sm-7">
													<input type="text" class="form-control w200" name="writer"
														required="required" />
												</div>
											</div>
											<div class="form-group">
												<label for="description" class="col-sm-3 control-label">简介</label>
												<div class="col-sm-7">
													<textarea class="form-control w200" name="description"
														style="resize: none;"></textarea>
												</div>
											</div>
											<div class="form-group">
												<label for="author" class="col-sm-3 control-label">库存数量</label>
												<div class="col-sm-7">
													<input type="text" class="form-control w200"
														name="storeNum" required="required" />
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
								<th>分类</th>
								<th>书名</th>
								<th>图片</th>
								<th>价格</th>
								<th>作者</th>
								<th>库存数量</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${productList}" var="product" varStatus="status">
							<tr>
								<td class="center">${status.count }</td>
								<td class="center">
									${product.category.categoryName}
								</td>
								<td class="center">${product.name}</td>
								<td class="center"><img class="cover"
									src="${pageContext.request.contextPath}${product.imgUrl}" style="width:auto;height:112px;" /></td>
								<td class="center">${product.price}</td>
								<td class="center">${product.writer}</td>
								<td class="center">${product.storeNum}</td>
								<td class="center"><a
									href="${pageContext.request.contextPath}/manage/productDelete?id=${product.id}"
									class="btn btn-danger btn-xs"
									onclick="if(confirm('确定删除?')==false)return false;">删除</a> <a
									href="${pageContext.request.contextPath}/manage/productEdit?id=${product.id}"
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