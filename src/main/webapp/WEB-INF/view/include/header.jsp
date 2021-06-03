<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
	<a class="navbar-brand" href="javascript:;">通用权限管理系统</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav ml-auto">
			<li class="nav-item"><a class="nav-link"
				href="${pageContext.request.contextPath}/app/main.html"> <i
					class="fas fa-home"></i> 主页
			</a></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"><i class="fas fa-user"></i> ${account.name} </a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdown">
					<a class="dropdown-item" href="javascript:;" data-toggle="modal"
						data-target="#changePsswordModal">修改密码</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="${pageContext.request.contextPath}/user/exit.html">退出系统</a>
				</div></li>
		</ul>
	</div>

	<div class="modal fade" id="changePsswordModal" data-backdrop="static"
		tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel"
		aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel">修改密码</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form>
						<input type="hidden" id="id" value="${sessionScope.account.id}">
						<div class="form-group row">
							<label for="staticEmail" class="col-sm-3 col-form-label">用户名：</label>
							<div class="col-sm-9">
								<input type="text" readonly class="form-control-plaintext"
									value="${sessionScope.account.name}">
							</div>
						</div>
						<div class="form-group row">
							<label for="oldPassword" class="col-sm-3 col-form-label">原密码：</label>
							<div class="col-sm-9">
								<input type="password" class="form-control" id="oldPassword"
									required aria-describedby="hbOldPassword"> <small
									id="hbOldPassword" class="form-text text-danger"></small>
							</div>
						</div>
						<div class="form-group row">
							<label for="newPassword" class="col-sm-3 col-form-label">新密码：</label>
							<div class="col-sm-9">
								<input type="password" class="form-control" id="newPassword"
									required aria-describedby="hbNewPassword"> <small
									id="hbNewPassword" class="form-text text-danger"></small>
							</div>
						</div>
						<div class="form-group row">
							<label for="confirmPassword" class="col-sm-3 col-form-label">确认密码：</label>
							<div class="col-sm-9">
								<input type="password" class="form-control" id="confirmPassword"
									required aria-describedby="hbConfirmPassword"> <small
									id="hbConfirmPassword" class="form-text text-danger"></small>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary"
						onclick="changePassword()">保存</button>
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">取消</button>
				</div>
			</div>
		</div>
	</div>
</nav>
<script>
	function changePassword() {
		oldPw = $("#oldPassword").val();
		if (oldPw == "") {
			$("#hbOldPassword").text("请输入用户原密码！");
			$("#oldPassword").focus();
			return;
		}
		$("#hbOldPassword").text("");
		newPw = $("#newPassword").val();
		if (newPw == "") {
			$("#hbNewPassword").text("请输入新密码！");
			$("#newPassword").focus();
			return;
		}
		$("#hbNewPassword").text("");
		confirmPw = $("#confirmPassword").val();
		if (oldPw == "") {
			$("#hbConfirmPassword").text("请输入用户原密码！");
			$("#confirmPassword").focus();
			return;
		}
		$("#hbConfirmPassword").text("");
		if (newPw != confirmPw) {
			alert("新密码与确认密码不一致，请重新输入！");
			$("#newPassword").focus();
			return;
		}
		$
				.ajax({
					url : "${pageContext.request.contextPath}/api/user/change/password",
					type : "POST",
					data : {
						id : "${sessionScope.account.id}",
						oldPassword : oldPw,
						newPassword : newPw,
						confirmPassword : confirmPw
					},
					dataType : "json",
					success : function(result) {
						$("#message").text(result.message);
						if (result.code == 0) {
							$("#changePsswordModal").modal("hide");
							$("#oldPassword").val("");
							$("#newPassword").val("");
							$("#confirmPassword").val("");
							$("#message").text("");
						}
					},
					error : function(xhr, msg, ex) {
						alert("修改密码操作失败！");
					}
				});
	}
</script>