<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="java.util.ArrayList, dao.*, model.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">

<head>
<meta charset="UTF-8">
<jsp:include page="../include.jsp" />
<!--Custom styles-->
<link rel="stylesheet" href="../vendor/css/main_view.css">
<title>Chọn năm</title>
<%
	ContractTypeDAO contractTypeDAO = new ContractTypeDAO();
	ArrayList<ContractType> listContractTypes = contractTypeDAO.getAllContractType();
	session.setAttribute("listContractType", listContractTypes);
%>
</head>

<body>
	<div class="d-flex" id="wrapper">

		<%@include file="menu.jsp"%>

		<!-- Page Content -->
		<div id="page-content-wrapper">

			<%@include file="navbar.jsp"%>

			<div class="container-fluid">
				<!-- Code in here -->
				<div class="card mt-3">
					<div class="card-header d-flex justify-content-between">
						<span class="navbar-brand mb-0 h1">Xem thống kê bảng giá
							nước</span>
					</div>
					<div class="card-body">
						<div class="d-flex flex-row">
							<div class="form-group">
								<input class="form-control" type="date" id="date-input"
									name="date-input">
							</div>
							<div class="form-group">
								<button class="btn btn-outline-secondary px-4 mx-2"
									type="button" name="submit" onclick="myFunction()">Xem
									bảng giá</button>
							</div>

						</div>
					</div>
					<div class="card-footer d-flex justify-content-end">
						<button class="btn btn-outline-secondary px-4" type="button"
							name="back" onclick="history.back()">Quay lại</button>
					</div>
				</div>

			</div>
		</div>
		<!-- /#page-content-wrapper -->
	
	</div>
	<!-- /#wrapper -->
	<script>
	function myFunction() {
		var text = $('#date-input').val();
		if (text){
			window.location = "GDThongKeBangGia.jsp?id=" + text;
		}
	}
	</script>
</body>
</html>