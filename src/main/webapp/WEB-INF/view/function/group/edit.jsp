<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="../../../../include/meta.jsp"%>
<title>通用权限管理系统</title>
<%@include file="../../../../include/css.jsp"%>
<style type="text/css">
.row {
	margin-bottom: 10px;
}
</style>
</head>
<body>
	<%@include file="../../include/header.jsp"%>

	<nav aria-label="breadcrumb">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a
				href="${pageContext.request.contextPath}/app/main.html"><i
					class="fas fa-home"></i>主页</a></li>
			<li class="breadcrumb-item"><a
				href="${pageContext.request.contextPath}/app/role/list.html">功能管理</a></li>
			<li class="breadcrumb-item active" aria-current="page">编辑功能组</li>
		</ol>
	</nav>

	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<form action="${pageContext.request.contextPath}/"
					method="post">
					<input type="hidden" name="id" value="">
					<div class="form-group row">
						<label for="name" class="col-sm-2 col-md-2 col-form-label">功能组名称</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="name" name="name"
								value="" required>
						</div>
					</div>
					
					<div class="form-gorup row">
						<div class="col-sm-6">
							<button type="submit" class="btn btn-primary btn-block">保存</button>
						</div>
						<div class="col-sm-4">
							<button type="reset" class="btn btn-danger btn-block">重置</button>
						</div>
						<div class="col-sm-2">
							<a class="btn btn-secondary btn-block"
								href="${pageContext.request.contextPath}/app/function/list.html">返回</a>
						</div>
					</div>
				</form>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<!-- 操作消息 -->
			</div>
		</div>
	</div>

	<%@include file="../../../../include/js.jsp"%>
</body>
</html>