<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="../../include/meta.jsp"%>
<title>登录-通用权限管理系统</title>
<%@include file="../../include/css.jsp"%>
<style type="text/css">
html, body {
	height: 100%;
}

body {
	display: flex;
	justify-content: center;
	align-items: center;
	background-image:
		url(${pageContext.request.contextPath}/resources/images/login_bg.jpg);
	background-position: center;
	background-size: cover;
}
</style>
</head>
<body>
	<div class="card" style="width: 450px; opacity: 0.85;">
		<div class="card-header text-center">
			<h3>欢迎登录通用权限管理系统</h3>
		</div>
		<div class="card-body">

			<form action="${pageContext.request.contextPath}/user/singin.html"
				method="post">
				<div class="input-group input-group-lg mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text"><i class="fas fa-user"></i></span>
					</div>
					<input type="text" class="form-control" name="name"
						placeholder="请输入用户名" value="${name}" autofocus required>
				</div>

				<div class="input-group input-group-lg mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text"><i class="fas fa-lock"></i></span>
					</div>
					<input type="password" class="form-control" name="password"
						placeholder="请输入用户密码" required>
				</div>

				<div class="input-group input-group-lg mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text"> <i
							class="fas fa-closed-captioning"></i>
						</span>
					</div>
					<input type="text" class="form-control" name="code"
						placeholder="请输入验证码" maxlength="4" required>
					<div class="input-group-append">
						<span class="input-group-text" style="padding: 0px;"> <img
							id="captchaImg" alt="验证码"
							src="${pageContext.request.contextPath}/capthca"
							style="cursor: pointer;" onclick="change()">
						</span>
					</div>
				</div>

				<div class="form-group float-right">
					<a href="javascript:;" onclick="change() ">看不清，换一个</a>
				</div>
				<button type="submit" class="btn btn-primary btn-lg btn-block">登录</button>
			</form>
			<div class="text-danger" style="padding-top: 5px;">${message}</div>

		</div>
		<div class="card-footer  text-center text-muted">
			&copy;&nbsp;&nbsp;&nbsp;重庆信息技术职业学院&nbsp;&nbsp;&nbsp;唐杰1910070136</div>
	</div>
	<%@include file="../../include/js.jsp"%>
	<script type="text/javascript">
		function change() {
			$("#captchaImg").attr(
					"src",
					"${pageContext.request.contextPath}/capthca?t="
							+ new Date().getTime());
		}
	</script>
</body>
</html>