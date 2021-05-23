<!DOCTYPE html>
<html lang="vi">
<head>

<jsp:include page="../include.jsp" />
<!DOCTYPE html>
<html lang="vi">
<head>

<jsp:include page="../include.jsp" />
	<!--Custom styles-->
	<style type="text/css">
    <%@include file="../vendor/css/login.css" %>
</style>
<title>Sign in</title>
</head>
<body>
	<div class="container">
		<div class="d-flex justify-content-center h-100">
			<div class="card">
				<div class="card-header">
					<h3 class="text-center">Sign in</h3>
				</div>
				<div class="card-body">
					<form action="doDangnhap.jsp" method="POST">
						<!-- Username -->
						<div class="input-group form-group">
							<div class="input-group-prepend">
								<span class="input-group-text"><i class="fas fa-user"></i></span>
							</div>
							<input type="text" class="form-control" placeholder="username"
								name="username">
						</div>

						<!-- Password -->
						<div class="input-group form-group">
							<div class="input-group-prepend">
								<span class="input-group-text"><i class="fas fa-key"></i></span>
							</div>
							<input type="password" class="form-control"
								placeholder="password" name="password">
						</div>

						<div class="form-group">
							<input id="btn_login" type="submit" value="Login"
								class="btn float-right login_btn">
						</div>

					</form>
				</div>
				<div class="card-footer">
					<div class="d-flex justify-content-center links">
						Don't have an account?<a href="./gdDangki.jsp">Sign up</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>