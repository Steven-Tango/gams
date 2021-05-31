<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="../../../include/meta.jsp"%>
<title>通用权限管理系统</title>
<%@include file="../../../include/css.jsp"%>
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
				href="${pageContext.request.contextPath}/app/role/list.html">角色管理</a></li>
			<li class="breadcrumb-item active" aria-current="page">角色列表</li>
		</ol>

	</nav>

	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<form class="form-inline" id="condationForm" action="" method="post">
					<div class="input-group mb-3">
						<input type="text" class="form-control" id="name" name="name"
							placeholder="请输入角色名称">
						<div class="input-group-append">
							<button type="submit" class="btn btn-primary">
								<i class="fas fa-search"></i>&nbsp;查询
							</button>
						</div>
					</div>
				</form>
				<hr style="border: 1px solid #ccc;" />
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<a class="btn btn-primary" href="" title="添加" data-toggle="modal"
					data-target="#addRoleModal"> <i class="fas fa-plus"></i>&nbsp;添加
				</a> <a class="btn btn-primary"
					href="${pageContext.request.contextPath}/app/role/add.html"
					title="添加"> <i class="fas fa-plus"></i>&nbsp;批量添加
				</a> <a class="btn btn-success" href="" title="刷新"> <i
					class="fas fa-sync-alt"></i>&nbsp;刷新
				</a> <a class="btn btn-secondary float-right"
					href="${pageContext.request.contextPath}/app/main.html" title="返回">
					<i class="fas fa-reply"></i>&nbsp;返回
				</a>
			</div>
		</div>
		<div class="row">
			<div class="col-12">
				<table class="table table-hover table-sm">
					<thead>
						<tr>
							<th scope="col">#</th>
							<th scope="col">角色名称</th>
							<th scope="col">禁用否</th>
							<th scope="col">创建时间</th>
							<th scope="col">操作</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row"></th>
							<td></td>
							<td>
								<div class="custom-control custom-checkbox mr-sm-2">
									<input type="checkbox" class="custom-control-input" onchange="">
									<label class="custom-control-label" for="" id="">禁用/未禁用</label>
								</div>
							</td>
							<td></td>
							<td><a class="btn btn-info btn-sm"
								href="${pageContext.request.contextPath}/app/role/edit.html"
								title="编辑"> <i class="fas fa-edit"></i>
							</a>&nbsp;&nbsp;<a class="btn btn-danger btn-sm" href="" title="删除">
									<i class="fas fa-trash-alt"></i>
							</a></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div class="row">
			<div class="col-md-6">第&nbsp;x&nbsp;页，共&nbsp;xx&nbsp;页（每页显示&nbsp;xx&nbsp;条，总共&nbsp;xx&nbsp;条记录）</div>
			<div class="col-md-6 text-right">
				<nav class="text-right float-right">
					<ul class="pagination">
						<li class="page-item"><a class="page-link" href="">第一页</a></li>

						<li class="page-item"><a class="page-link" href="">上一页</a></li>


						<li class="page-item"><a class="page-link" href="">下一页</a></li>

						<li class="page-item"><a class="page-link" href="">最后一页</a></li>
					</ul>
				</nav>
			</div>
		</div>
	</div>

	<div class="modal fade" id="addRoleModal" data-backdrop="static"
		tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel"
		aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel">添加角色</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form id="addForm">
						<div class="form-group row">
							<label for="code"
								class="col-sm-2 col-md-2 col-form-label text-danger">角色编码</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="code" name="code"
									required autofocus>
							</div>
						</div>
						<div class="form-group row">
							<label for="name"
								class="col-sm-2 col-md-2 col-form-label text-danger">角色名称</label>
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
</body>
</html>