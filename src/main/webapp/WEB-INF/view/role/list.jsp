<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
				<form class="form-inline"
					action="${pageContext.request.contextPath}/app/role/list.html"
					method="post">
					<div class="input-group mb-3">
						<input type="text" class="form-control" id="name" name="name"
							placeholder="请输入角色名称" value="${name}">
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
					href="${pageContext.request.contextPath}/app/role/add.html?page=${page}&size=${size}"
					title="添加"> <i class="fas fa-plus"></i>&nbsp;添加
				</a> <a class="btn btn-success"
					href="${pageContext.request.contextPath}/app/role/list.html?page=${page}&size=${size}${name==null?"
					":"&name=".concat(name)}" title="刷新"> <i
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
							<th scope="col">操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="obj" varStatus="vs">
							<tr>
								<th scope="row">${(page-1)*size+vs.count}</th>
								<td>${obj.name}</td>
								<td><a class="btn btn-info btn-sm"
									href="${pageContext.request.contextPath}/app/role/edit.html?id=${obj.id}"
									title="编辑"> <i class="fas fa-edit"></i>
								</a>&nbsp;&nbsp;<a class="btn btn-danger btn-sm"
									href="javascript:del('${obj.id}')" title="删除"> <i
										class="fas fa-trash-alt"></i>
								</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<div class="row">
			<div class="col-md-6">第&nbsp;${page}&nbsp;页，共&nbsp;${pages}&nbsp;页（每页显示&nbsp;${size}&nbsp;条，总共&nbsp;${total}&nbsp;条记录）</div>
			<div class="col-md-6 text-right">
				<nav class="text-right float-right">
					<ul class="pagination">
						<c:choose>
							<c:when test="${pages==0 || pages==1}">
								<li class="page-item disabled"><a class="page-link">第一页</a></li>
								<li class="page-item disabled"><a class="page-link">上一页</a></li>
								<li class="page-item disabled"><a class="page-link">下一页</a></li>
								<li class="page-item disabled"><a class="page-link">最后一页</a></li>
							</c:when>
							<c:when test="${page==1 && pages>1}">
								<li class="page-item disabled"><a class="page-link">第一页</a></li>
								<li class="page-item disabled"><a class="page-link">上一页</a></li>
								<li class="page-item"><a class="page-link"
									href='${pageContext.request.contextPath}/app/role/list.html?page=${page+1}&size=${size}${name==null?"":"&name=".concat(name)}'>下一页</a></li>
								<li class="page-item"><a class="page-link"
									href='${pageContext.request.contextPath}/app/role/list.html?page=${pages}&size=${size}${name==null?"":"&name=".concat(name)}'>最后一页</a></li>
							</c:when>
							<c:when test="${page==pages}">
								<li class="page-item"><a class="page-link"
									href='${pageContext.request.contextPath}/app/role/list.html?page=1&size=${size}${name==null?"":"&name=".concat(name)}'>第一页</a></li>
								<li class="page-item"><a class="page-link"
									href='${pageContext.request.contextPath}/app/role/list.html?page=${page-1}&size=${size}${name==null?"":"&name=".concat(name)}'>上一页</a></li>
								<li class="page-item disabled"><a class="page-link">下一页</a></li>
								<li class="page-item disabled"><a class="page-link">最后一页</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link"
									href='${pageContext.request.contextPath}/app/role/list.html?page=1&size=${size}${name==null?"":"&name=".concat(name)}'>第一页</a></li>
								<li class="page-item"><a class="page-link"
									href='${pageContext.request.contextPath}/app/role/list.html?page=${page-1}&size=${size}${name==null?"":"&name=".concat(name)}'>上一页</a></li>
								<li class="page-item"><a class="page-link"
									href='${pageContext.request.contextPath}/app/role/list.html?page=${page+1}&size=${size}${name==null?"":"&name=".concat(name)}'>下一页</a></li>
								<li class="page-item"><a class="page-link"
									href='${pageContext.request.contextPath}/app/role/list.html?page=${pages}&size=${size}${name==null?"":"&name=".concat(name)}'>最后一页</a></li>
							</c:otherwise>
						</c:choose>
					</ul>
				</nav>
			</div>
		</div>
	</div>

	<%@include file="../../../include/js.jsp"%>

	<script type="text/javascript">
		function del(id) {
			if (confirm("此操作将永久性的删除数据不可恢复，是否继续？")) {
				window.location.href = "${pageContext.request.contextPath}/app/role/delete.html?page=${page}&size=${size}&id="
						+ id;
			}
		}
	</script>
</body>
</html>