<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="../../include/meta.jsp"%>
<title>通用权限管理系统</title>
<%@include file="../../include/css.jsp"%>
<style type="text/css">
.function-group {
	color: #CCC;
	padding: 0px 5px;
	border-bottom: 1px solid #ccc;
	margin: 10px 0px;
}

.container-fluid .row a {
	margin-bottom: 10px;
}
</style>
</head>
<body>
	<%@include file="include/header.jsp"%>

	<div class="container-fluid">
		<div class="row">
			<div class="col-12 function-group">
				<i class="fas fa-th-list"></i>&nbsp;用户管理
			</div>
		</div>
		<div class="row">
			<div class="col-sm-12 col-md-2 col-lg-2 col-xl-1">
				<a class="btn btn-outline-primary btn-block"
					href="${pageContext.request.contextPath}/app/user/list.html"><i
					class=""></i><br />用户列表</a>
			</div>
			<div class="col-sm-12 col-md-2 col-lg-2 col-xl-1">
				<a class="btn btn-outline-primary btn-block"
					href="${pageContext.request.contextPath}/app/user/add.html"><i
					class=""></i><br />添加用户</a>
			</div>
		</div>

		<div class="row">
			<div class="col-12 function-group">
				<i class="fas fa-th-list"></i>&nbsp;角色管理
			</div>
		</div>
		<div class="row">
			<div class="col-sm-12 col-md-2 col-lg-2 col-xl-1">
				<a class="btn btn-outline-primary btn-block"
					href="${pageContext.request.contextPath}/app/role/list.html"><i
					class=""></i><br />角色列表</a>
			</div>
			<div class="col-sm-12 col-md-2 col-lg-2 col-xl-1">
				<a class="btn btn-outline-primary btn-block"
					href="${pageContext.request.contextPath}/app/role/add.html"><i
					class=""></i><br />添加角色</a>
			</div>
		</div>

		<div class="row">
			<div class="col-12 function-group">
				<i class="fas fa-th-list"></i>&nbsp;功能管理
			</div>
		</div>
		<div class="row">
			<div class="col-sm-12 col-md-2 col-lg-2 col-xl-1">
				<a class="btn btn-outline-primary btn-block"
					href="${pageContext.request.contextPath}/app/function/list.html"><i
					class=""></i><br />功能列表</a>
			</div>
			<div class="col-sm-12 col-md-2 col-lg-2 col-xl-1">
				<a class="btn btn-outline-primary btn-block"
					href="${pageContext.request.contextPath}/app/function/add.html"><i
					class=""></i><br />添加功能</a>
			</div>
		</div>
	</div>

	<%@include file="../../include/js.jsp"%>
</body>
</html>