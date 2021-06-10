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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/lib/jquery-treegrid/0.3.0/css/jquery.treegrid.css">
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
				href="${pageContext.request.contextPath}/app/function/list.html">功能管理</a></li>
			<li class="breadcrumb-item active" aria-current="page">功能列表</li>
		</ol>
	</nav>

	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<a class="btn btn-primary"
					href="${pageContext.request.contextPath}/app/function/group/add.html"
					title="添加功能组"> <i class="fas fa-plus"></i>&nbsp;添加功能组
				</a> <a class="btn btn-primary"
					href="${pageContext.request.contextPath}/app/function/module/add.html"
					title="添加功能模块"> <i class="fas fa-plus"></i>&nbsp;添加功能模块
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
	<script
		src="${pageContext.request.contextPath}/lib/jquery-treegrid/0.3.0/js/jquery.treegrid.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/lib/bootstrap-table/1.18.3/extensions/treegrid/bootstrap-table-treegrid.min.js"></script>
	<script type="text/javascript">
		var table = $('#table');
		table
				.bootstrapTable({
					url : "${pageContext.request.contextPath}/api/function/list/all",
					columns : [
							{
								field : 'name',
								title : '功能名称'
							},
							{
								field : 'type',
								title : '类型',
								formatter : function(value, row, index, field) {
									if (value == 1) {
										return "功能组";
									} else {
										return "功能模块";
									}
								}
							},
							{
								field : 'code',
								title : '代码'
							},
							{
								field : 'id',
								title : '操作',
								align : 'center',
								formatter : function(value, row, index, field) {
									if (row.type == 1) {
										code = "${pageContext.request.contextPath}/app/function/group/edit.html?id="
												+ value;
									} else {
										code = "${pageContext.request.contextPath}/app/function/module/edit.html?id="
												+ value;
									}
									return '<a class="btn btn-info btn-sm" href="'+code+'" title="编辑"> <i class="fas fa-edit"></i> </a>&nbsp;&nbsp;<a class="btn btn-danger btn-sm" href="" title="删除"><i class="fas fa-trash-alt"></i> </a>'
								}
							} ],
					treeShowField : 'name',
					parentIdField : 'parent',
					onPostBody : function() {
						var columns = table.bootstrapTable('getOptions').columns

						if (columns && columns[0][1].visible) {
							table.treegrid({
								treeColumn : 0,
								onChange : function() {
									table.bootstrapTable('resetView')
								}
							})
						}
					}
				});
	</script>
</body>
</html>