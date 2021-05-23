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
<%String idCustomer[] = request.getParameterValues("email-check") ;
for (int j=0;j<idCustomer.length;j++){
		CustomerDAO customerDAO = new CustomerDAO();
		ArrayList<Customer> listCustomer = customerDAO.getAll(idCustomer[j]);
		session.setAttribute("listCusSend", listCustomer);}
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
						<span class="navbar-brand mb-0 h1">Chọn loại thông báo bạn muốn gửi</span>
						</div>
						<div class="card-body">

							<table id="grade-table" class="table">
								<thead>
									<tr>
										<th scope="col" >Loại thông báo</th>
										<th scope="col" >Chọn</th>
									</tr>
								</thead>
								<tbody>
									<%
									String[] c = {"Thông báo hoá đơn tiền nước","Thông báo cắt nước","Thông báo tự soạn"};
									int[] d = {0,1,2};
									String[] e = {"0","1","2"};
									for (int i = 0; i < 3; i++) {
										int id=i;
									%>
									<tr>
										<td><%=c[i]%></td>
										<td scope="col"><input type='radio' name='type-select' id=<%=e[i]%> value=<%=d[i]%>/></td>
									</tr>
									<%
									}
									%>
								</tbody>
							</table>
						</div>
						<div class="card-footer d-flex justify-content-end">
							<button class="btn btn-outline-secondary px-3" type="button" name="back" onclick="history.back()">Quay lại</button>
						</div>
						
					</div>
				
			</div>
		</div>
		<!-- /#page-content-wrapper -->

	</div>
	<!-- /#wrapper -->

	<!-- Dup value modal -->
	<script type="text/javascript">
	$(function() {
		$("#0").bind("change", function() {
			var val = $(this).val(); // get selected value
			if (val) { // require a URL
				window.location = "GDGuiTin.jsp?id=" + val; // redirect
			}
			return false;
		});
		$("#1").bind("change", function() {
			var val = $(this).val(); // get selected value
			if (val) { // require a URL
				window.location = "GDGuiTin.jsp?id=" + val; // redirect
			}
			return false;
		});
		$("#2").bind("change", function() {
			var val = $(this).val(); // get selected value
			if (val) { // require a URL
				window.location = "GDGuiTin.jsp?id=" + val; // redirect
			}
			return false;
		});
	}); 
		

       
	</script>
</body>
</html>