<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*, model.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Employee employee = (Employee) session.getAttribute("employee");
%>
<!DOCTYPE html>
<html lang="vi">

<head>
<meta charset="UTF-8">
<jsp:include page="../include.jsp" />
<!--Custom styles-->
<style type="text/css">
    <%@include file="../vendor/css/signup.css" %>
</style>
<title>Sign up</title>
</head>
<body>
	<div class="container">
		<div class="d-flex justify-content-center h-100">
			<div class="card">
				<div class="card-header">
					<h3 class="text-center">Sign up</h3>
				</div>
				<div class="card-body">
					<form method="POST" action="doDangki.jsp">
						<div class="row">
							<div class="input-group form-group col-6">
								<div class="input-group-prepend">
									<span class="input-group-text"><i class="fas fa-user"></i></span>
								</div>
								<input type="text" class="form-control" name="username"
									placeholder="username" required>
							</div>
							<div class="input-group form-group col-6">
								<div class="input-group-prepend">
									<span class="input-group-text"><i class="fas fa-key"></i></span>
								</div>
								<input type="password" class="form-control" name="password"
									placeholder="password" required>
							</div>
						</div>
						<div class="row">
							<div class="input-group form-group col-12">
								<div class="input-group-prepend">
									<span class="input-group-text"><i class="fas fa-user"></i></span>
								</div>
								<input type="text" class="form-control" name="fullname"
									placeholder="fullname" <%if (employee != null) {%>
									value="<%=employee.getFullname()%>" <%}%> required>
							</div>
						</div>
						<div class="row">
							<div class="input-group form-group col-6">
								<div class="input-group-prepend">
									<span class="input-group-text"><i class="fas fa-key"></i></span>
								</div>
								<input type="date" class="form-control" name="dateofbirth"
									placeholder="DOB" <%if (employee != null) {%>
									value="<%=employee.getAddress()%>" <%}%>
									required>
							</div>
							<div class="input-group form-group col-6">
								<div class="input-group-prepend">
									<span class="input-group-text"><i class="fas fa-user"></i></span>
								</div>
								<input type="email" class="form-control" name="email"
									placeholder="email" <%if (employee != null) {%>
									value="<%=employee.getPhonenumber()%>" <%}%> required>
							</div>
						</div>
						<div class="form-group">
							<input type="submit" value="Signup"
								class="btn float-right login_btn">
						</div>
					</form>
				</div>
				<div class="card-footer">
					<div class="d-flex justify-content-center links">
						Already have an account?<a href="./gdDangnhap.jsp">Sign in?</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%
		if (request.getParameter("message") != null && request.getParameter("message").equals("dup")) {
	%>
	<div class="modal fade" id="bookBorrowModal" tabindex="-1"
		role="dialog">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">This username has been taken</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">This username has been taken, please use other username</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<script>
		$('#bookBorrowModal').modal();
	</script>
	<%
		}
	%>
</body>
</html>