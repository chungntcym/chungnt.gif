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
<title>Chọn loại hợp đồng</title>
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
						<span class="navbar-brand mb-0 h1">Cấu hình giá</span>
					</div>
					<div class="card-body">
						<div class="form-group">
							<label for="contract-type-select">Chọn loại hợp đồng</label> <select
								class="form-control" id="contract-type-select">
								<option value="default" disabled selected></option>
								<%
								if (listContractTypes != null) {
									for (ContractType contractType : listContractTypes) {
								%>
								<option value=<%=contractType.getId()%>>
									<%=contractType.getType()%>
								</option>
								<%
								}
								}
								%>
							</select>
						</div>
					</div>
				</div>

			</div>
		</div>
		<!-- /#page-content-wrapper -->

	</div>
	<!-- /#wrapper -->
	<script type="text/javascript">
		$(function() {
			$('#contract-type-select').val("deafault");

			$('#contract-type-select').bind('change', function() {
				var val = $(this).val(); // get selected value
				if (val) { // require a URL
					window.location = "GDBangGia.jsp?id=" + val; // redirect
				}
				return false;
			});
		});
	</script>
</body>
</html>