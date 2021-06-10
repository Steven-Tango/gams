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
				<form class="form-inline" id="condationForm" action="" method="post">
					<div class="input-group mb-3">
						<input type="text" class="form-control" id="name" name="name"
							placeholder="请输入用户名或登录名">
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
				<a class="btn btn-primary"
					href="${pageContext.request.contextPath}/app/user/add.html"
					title="添加"> <i class="fas fa-plus"></i>&nbsp;添加
				</a> <a class="btn btn-success" href="" title="刷新"> <i
					class="fas fa-sync-alt"></i>&nbsp;刷新
				</a> <a class="btn btn-secondary float-right"
					href="${pageContext.request.contextPath}/app/main.html" title="返回">
					<i class="fas fa-reply"></i>&nbsp;返回
				</a>
			</div>
		</div>

		<div class="row">
			<div class="col-md-12">
				<table id="table"></table>
			</div>
		</div>
	</div>

	<%@include file="../../../include/js.jsp"%>
	<script
		src="${pageContext.request.contextPath}/lib/bootstrap-table/1.18.3/bootstrap-table.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/lib/bootstrap-table/1.18.3/locale/bootstrap-table-zh-CN.min.js"></script>
	<script type="text/javascript">
		$('#table')
				.bootstrapTable(
						{
							url : "${pageContext.request.contextPath}/api/user/list",
							pageList : [ 2, 10, 50, 100 ],
							smartDisplay : false,
							pageSize : 2,
							queryParamsType : '',
							sidePagination : 'server',
							pagination : true,
							columns : [
									{
										field : 'id',
										title : '#',
										formatter : function(value, row, index,
												field) {
											return ($('#table').bootstrapTable(
													'getOptions').pageNumber - 1)
													* $('#table')
															.bootstrapTable(
																	'getOptions').pageSize
													+ index + 1;
										}
									},
									{
										field : 'name',
										title : '姓名'
									},
									{
										field : 'loginName',
										title : '登录名'
									},
									{
										field : 'disabled',
										title : '禁用',
										formatter : function(value, row, index,
												field) {
											return value?"禁用":"未禁用";
										}
									},
									{
										field : 'id',
										title : '操作',
										align : 'center',
										formatter : function(value, row, index,
												field) {
											code = "${pageContext.request.contextPath}/app/user/edit.html?id="
													+ value;
											return '<a class="btn btn-info btn-sm" href="'+code+'" title="编辑"> <i class="fas fa-edit"></i> </a>&nbsp;&nbsp;<a class="btn btn-danger btn-sm" href="javascript:del(\''
													+ value
													+ '\')" title="删除"><i class="fas fa-trash-alt"></i> </a>'
										}
									} ]
						});

		function del(id) {
			if (confirm("此操作将永久性的删除数据不可恢复，是否继续？")) {
				window.location.href = "${pageContext.request.contextPath}/app/user/delete.html?id="
						+ id;
			}
		}
	</script>
</body>
</html>