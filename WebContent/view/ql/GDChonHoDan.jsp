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
<title>Chon ho dan</title>
<%
String idString = request.getParameter("id");
int id = 0;
if (idString != null) {
	id = Integer.parseInt(idString);
} else {
	response.sendRedirect("GDChinhNhanvien.jsp");
}

session.setAttribute("SubdistrictId", id);
SubDistrict subdistrict = new SubDistrict();
ArrayList<SubDistrict> listSubdistrict = (ArrayList<SubDistrict>) session.getAttribute("listSubDistrict");
for (SubDistrict ct : listSubdistrict) {
	if (id == ct.getId()) {
		subdistrict = ct;
		break;
	}
}
CustomerDAO customerDAO = new CustomerDAO();
ArrayList<Customer> listCustomer = customerDAO.getAll(String.valueOf(id));
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
				<form id="grade-form" method="POST" action="GDSoanTin.jsp">
					<div class="card mt-3">
						<div class="card-header d-flex justify-content-between">
							<span class="navbar-brand mb-0 h1">Chọn hộ gia đình đến từ
								<%=subdistrict.getName()%></span>

							<div>
								<button id="check-all" type="button"
									class="btn btn-outline-secondary mx-1">Chọn tất cả</button>
								<button id="un-check-all" type="button"
									class="btn btn-outline-secondary">Bỏ chọn</button>
							</div>
						</div>
						<div class="card-body">

							<table id="grade-table" class="table">
								<thead>
									<tr>
										<th scope="col" style="width: 10%">ID</th>
										<th scope="col">Tên chủ hộ</th>
										<th scope="col">Email</th>
										<th scope="col">Địa chỉ cụ thể</th>
										<th scope="col">Chọn</th>
									</tr>
								</thead>
								<tbody>
									<%
									for (int i = 0; i < listCustomer.size(); i++) {
									%>
									<tr>
										<td><%=listCustomer.get(i).getId()%></td>
										<td><%=listCustomer.get(i).getFullname()%></td>
										<td><%=listCustomer.get(i).getEmail()%></td>
										<td><%=listCustomer.get(i).getAddress()%></td>
										<td><input type='checkbox' name='email-check'
											id='check_all' value=<%=listCustomer.get(i).getId()%> /></td>
										<%
										}
										%>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="card-footer d-flex justify-content-end">
							<button class="btn btn-outline-secondary px-3 mx-2" type="submit">Soạn
								tin</button>
							<button class="btn btn-outline-secondary px-3" type="button"
								name="back" onclick="history.back()">Quay lại</button>
						</div>

					</div>
				</form>
			</div>
		</div>
		<!-- /#page-content-wrapper -->

	</div>
	<!-- /#wrapper -->

	<!-- Dup value modal -->
	<script type="text/javascript">
		$(function() {
			$('#contract-type-select').bind('change', function() {
				var url = $(this).val(); // get selected value
				alert(url); // This will help to check whether JS is getting executed.
				if (url) { // require a URL
					window.location = url; // redirect
				}
				return false;
			});
		});

		$("#grade-table").on('click', '.btnCheck', function() {

		});
		document.getElementById("check-all").onclick = function() {
			// Lấy danh sách checkbox
			var checkboxes = document.getElementsByName('email-check');

			// Lặp và thiết lập checked
			for (var i = 0; i < checkboxes.length; i++) {
				checkboxes[i].checked = true;
			}
		};

		// Chức năng bỏ chọn hết
		document.getElementById("un-check-all").onclick = function() {
			// Lấy danh sách checkbox
			var checkboxes = document.getElementsByName('email-check');

			// Lặp và thiết lập Uncheck
			for (var i = 0; i < checkboxes.length; i++) {
				checkboxes[i].checked = false;
			}
		};
	</script>
</body>
</html>