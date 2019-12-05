<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${sessionScope.User.username}-信息</title>
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
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/usermsg.css" />
</head>
<body>
	<jsp:include page="../commen/commen.jsp" />

	<!-- 用户信息 -->
			<div class="main-container">
				<div class="container-fluid no-margin">
					<div class="user-msg-container center-block">
						<div class="user-msg-header">
							<div style="display: flex;">
								<div class="user-msg-header-avatar">
									<c:choose>
										<c:when test="${sessionScope.User.imgUrl==null}">
											<img class="user-msg-img" src="${pageContext.request.contextPath}/img/default-user.jpg" style="position: absolute;"/>
											<input type="file"  id="update-user-img" style="opacity: 0;width: 112px;height:112px"/>
										</c:when>
										<c:otherwise>
											<img class="user-msg-img" src="${pageContext.request.contextPath}${sessionScope.User.imgUrl}" style="position: absolute;"/>
											<input type="file"  id="update-user-img" style="opacity: 0;width: 112px;height:112px"/>
										</c:otherwise>
									</c:choose>
								</div>
								<div class="user-msg-header-user">
									<div class="user-msg-header-username">
										${sessionScope.User.username}
										<a role="button" data-toggle="modal" href="#editusername"><span class="glyphicon glyphicon-edit" style="font-size: 16px;"></span></a>
									</div>
									<div class="user-msg-header-userid">
										ID: ${sessionScope.User.id}
									</div>
								</div>
							</div>
						</div>
						<div class="modal fade" id="editusername" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
										<h4 class="modal-title" id="myModalLabel">修改用户名</h4>
									</div>
									<div class="modal-body">
										<form action="${pageContext.request.contextPath}/user/editUser" class="form-horizontal" method="post">
											<input type="hidden" class="form-control w200" name="id" value="${sessionScope.User.id}" required="required" />
											<div class="form-group">
												<label for="num" class="col-sm-3 control-label">用户名</label>
												<div class="col-sm-6">
													 <input type="text"
														class="form-control w200 num" name="username"
														required="required" value="${sessionScope.User.username}"/>
												</div>
											</div>
											<div class="modal-footer">
												<button type="submit" class="btn btn-primary">
													<span class="glyphicon glyphicon-edit"></span>
													修改
												</button>
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
						<div class="user-msg-content">
							<div class="user-msg-setting">
								<div class="user-msg-setting-label">
									<span>密码</span>
								</div>
								<div class="user-msg-setting-status">
									<c:choose>
										<c:when test="${sessionScope.User.password==null}">
											<img src="${pageContext.request.contextPath}/img/wrong.png" style="width: 24px; height: 24px;border-radius: 50%;">
										</c:when>
										<c:otherwise>
											<img src="${pageContext.request.contextPath}/img/right.png" style="width: 24px; height: 24px;border-radius: 50%;">
										</c:otherwise>
									</c:choose>
								</div>
								<div class="user-msg-setting-desc">
									<c:choose>
										<c:when test="${sessionScope.User.email==null}">
											未设置
										</c:when>
										<c:otherwise>
											已设置（修改密码后需重新登录）
										</c:otherwise>
									</c:choose>
								</div>
								<div class="user-msg-setting-action">
									<c:choose>
										<c:when test="${sessionScope.User.password==null}">
											<button class="user-button user-button-primary" role="button" data-toggle="modal" href="#editpassword">
												<span>更换密码</span>
											</button>
										</c:when>
										<c:otherwise>
											<button class="user-button user-button-text" role="button" data-toggle="modal" href="#editpassword">
												<span>更换密码</span>
											</button>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</div>
						<div class="modal fade" id="editpassword" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
										<h4 class="modal-title" id="myModalLabel">修改密码</h4>
									</div>
									<div class="modal-body">
										<form action="${pageContext.request.contextPath}/user/editUser" class="form-horizontal" method="post">
											<input type="hidden" class="form-control w200" name="id" value="${sessionScope.User.id}" required="required" />
											<div class="form-group">
												<label for="num" class="col-sm-3 control-label">新密码</label>
												<div class="col-sm-6">
													<input type="password"
														class="form-control w200 num" name="password"
														required="required" />
												</div>
											</div>
											<div class="modal-footer">
												<button type="submit" class="btn btn-primary">
													<span class="glyphicon glyphicon-edit"></span>
													修改
												</button>
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
						<div class="user-msg-content">
							<div class="user-msg-setting">
								<div class="user-msg-setting-label">
									<span>邮箱</span>
								</div>
								<div class="user-msg-setting-status">
									<c:choose>
										<c:when test="${sessionScope.User.email==null}">
											<img src="${pageContext.request.contextPath}/img/wrong.png" style="width: 24px; height: 24px;border-radius: 50%;">
										</c:when>
										<c:otherwise>
											<img src="${pageContext.request.contextPath}/img/right.png" style="width: 24px; height: 24px;border-radius: 50%;">
										</c:otherwise>
									</c:choose>
								</div>
								<div class="user-msg-setting-desc">
									<c:choose>
										<c:when test="${sessionScope.User.email==null}">
											未绑定
										</c:when>
										<c:otherwise>
											${sessionScope.User.email}
										</c:otherwise>
									</c:choose>
									
								</div>
								<div class="user-msg-setting-action">
									<c:choose>
										<c:when test="${sessionScope.User.email==null}">
											<button class="user-button user-button-primary" role="button" data-toggle="modal" href="#editemail">
												<span>绑定邮箱</span>
											</button>
										</c:when>
										<c:otherwise>
											<button class="user-button user-button-text" role="button" data-toggle="modal" href="#editemail">
												<span>更换邮箱</span>
											</button>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</div>
						<div class="modal fade" id="editemail" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
										<h4 class="modal-title" id="myModalLabel">修改邮箱</h4>
									</div>
									<div class="modal-body">
										<form action="${pageContext.request.contextPath}/user/editUser" class="form-horizontal" method="post">
											<input type="hidden" class="form-control w200" name="id" value="${sessionScope.User.id}" required="required" />
											<div class="form-group">
												<label for="num" class="col-sm-3 control-label">邮箱</label>
												<div class="col-sm-6">
													<input type="text" value="${sessionScope.User.email}"
														class="form-control w200 num" name="email"
														required="required" />
												</div>
											</div>
											<div class="modal-footer">
												<button type="submit" class="btn btn-primary">
													<span class="glyphicon glyphicon-edit"></span>
													修改
												</button>
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
						<div class="user-msg-content">
							<div class="user-msg-setting">
								<div class="user-msg-setting-label">
									<span>电话</span>
								</div>
								<div class="user-msg-setting-status">
									<c:choose>
										<c:when test="${sessionScope.User.phone==null}">
											<img src="${pageContext.request.contextPath}/img/wrong.png" style="width: 24px; height: 24px;border-radius: 50%;">
										</c:when>
										<c:otherwise>
											<img src="${pageContext.request.contextPath}/img/right.png" style="width: 24px; height: 24px;border-radius: 50%;">
										</c:otherwise>
									</c:choose>
								</div>
								<div class="user-msg-setting-desc">
									<c:choose>
										<c:when test="${sessionScope.User.phone==null}">
											未绑定
										</c:when>
										<c:otherwise>
											${sessionScope.User.phone}
										</c:otherwise>
									</c:choose>
								</div>
								<div class="user-msg-setting-action">
									<c:choose>
										<c:when test="${sessionScope.User.phone==null}">
											<button class="user-button user-button-primary" role="button" data-toggle="modal" href="#editphone">
												<span>绑定手机</span>
											</button>
										</c:when>
										<c:otherwise>
											<button class="user-button user-button-text" role="button" data-toggle="modal" href="#editphone">
												<span>更换手机</span>
											</button>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</div>
						<div class="modal fade" id="editphone" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
										<h4 class="modal-title" id="myModalLabel">修改手机</h4>
									</div>
									<div class="modal-body">
										<form action="${pageContext.request.contextPath}/user/editUser" class="form-horizontal" method="post">
											<input type="hidden" class="form-control w200" name="id" value="${sessionScope.User.id}" required="required" />
											<div class="form-group">
												<label for="num" class="col-sm-3 control-label">手机</label>
												<div class="col-sm-6">
													 <input type="text" value="${sessionScope.User.phone}"
														class="form-control w200 num" name="phone"
														required="required" />
												</div>
											</div>
											<div class="modal-footer">
												<button type="submit" class="btn btn-primary">
													<span class="glyphicon glyphicon-edit"></span>
													修改
												</button>
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
						<div class="user-msg-content">
							<div class="user-msg-setting">
								<div class="user-msg-setting-label">
									<span>用户级别</span>
								</div>
								<div class="user-msg-setting-status">
									<img src="${pageContext.request.contextPath}/img/right.png" style="width: 24px; height: 24px;border-radius: 50%;">
								</div>
								<div class="user-msg-setting-desc">
									<c:if test="${sessionScope.User.role=='normal'}">普通用户</c:if>
									<c:if test="${sessionScope.User.role=='admin'}">管理员</c:if>
								</div>
							</div>
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
	<script src="${pageContext.request.contextPath}/js/usermsg.js"
		type="text/javascript" charset="utf-8"></script>
</body>
</html>