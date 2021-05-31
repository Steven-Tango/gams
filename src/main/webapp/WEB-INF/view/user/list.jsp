<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="../../../include/meta.jsp"%>
<title>通用权限管理系统</title>
<%@include file="../../../include/css.jsp"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/lib/bootstrap-table/1.18.3/bootstrap-table.min.css">
<style type="text/css">
.row {
	margin-bottom: 10px;
}
</style>
</head>
<body>
	<%@include file="../include/header.jsp"%>

	<nav aria-label="breadcrumb">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a
				href="${pageContext.request.contextPath}/app/main.html"><i
					class="fas fa-home"></i>主页</a></li>
			<li class="breadcrumb-item"><a
				href="${pageContext.request.contextPath}/app/user/list.html">用户管理</a></li>
			<li class="breadcrumb-item active" aria-current="page">用户列表</li>
		</ol>
	</nav>

	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<table id="table"></table>
			</div>
		</div>
	</div>

	<div class="modal fade" id="addRoleModal" data-backdrop="static"
		tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel"
		aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel">添加用户</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form id="addForm">
						<div class="form-group row">
							<label for="code"
								class="col-sm-2 col-md-2 col-form-label text-danger">用户编码</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="code" name="code"
									required autofocus>
							</div>
						</div>
						<div class="form-group row">
							<label for="name"
								class="col-sm-2 col-md-2 col-form-label text-danger">用户名称</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="roleName"
									name="name" required>
							</div>
						</div>
						<div class="form-group row">
							<label for="mnemonic" class="col-sm-2 col-md-2 col-form-label">助记码</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="mnemonic"
									name="mnemonic" required>
							</div>
						</div>
						<div class="form-group row">
							<label for="disabled" class="col-sm-2 col-md-2 col-form-label"></label>
							<div class="col-sm-10">
								<div class="custom-control custom-checkbox mr-sm-2">
									<input type="checkbox" class="custom-control-input"
										id="disabled" name="disabled"> <label
										class="custom-control-label" for="disabled">禁用</label>
								</div>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" onclick="save()">保存</button>
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">取消</button>
				</div>
			</div>
		</div>
	</div>

	<%@include file="../../../include/js.jsp"%>
	<script
		src="${pageContext.request.contextPath}/lib/bootstrap-table/1.18.3/bootstrap-table.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/lib/bootstrap-table/1.18.3/locale/bootstrap-table-zh-CN.min.js"></script>
	<script type="text/javascript">
		$('#table').bootstrapTable({
			url : "${pageContext.request.contextPath}/api/user/list/all",
			pagination : true,
			columns : [ {
				field : 'id',
				title : '#'
			}, {
				field : 'name',
				title : '姓名'
			}, {
				field : 'loginName',
				title : '登录名'
			}, {
				field : 'disabled',
				title : '禁用'
			}, {
				field : 'id',
				title : '操作'
			} ]
		});
	</script>
</body>
</html>