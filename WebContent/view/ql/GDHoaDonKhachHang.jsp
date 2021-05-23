<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, model.*, dao.*"%>
<%
int id = Integer.parseInt(request.getParameter("id").toString());
ArrayList<Payment> listyc = new ArrayList<Payment>();
PaymentDAO paymentDAO = new PaymentDAO();
listyc = paymentDAO.getInvoiceByCusId(id);
%>
<!DOCTYPE html>
<html lang="vi">

<head>
<meta charset="UTF-8">
<jsp:include page="../include.jsp" />
<!--Custom styles-->
<link rel="stylesheet" href="../vendor/css/main_view.css">
<title>Aquaman - Thống kê hoá đơn khách hàng</title>
</head>
<%
if (listyc != null) {
%>
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
						<div class="my-auto"></div>
					</div>
					<div class="card-body">
						<form>
							<table class="table">
								<thead>
									<tr>
										<th>ID</th>
										<th>Ngày thanh toán</th>
										<th>Ngày ghi chỉ số</th>
										<th>Số chỉ đồng hồ điện</th>
										<th>Tổng cộng</th>
									</tr>
								</thead>
								<tbody>
									<%
									for (int i = 0; i < listyc.size(); i++) {
									%>
									<tr>
										<td><%=listyc.get(i).getId()%></td>
										<td>
										<%if (listyc.get(i).getPayment_time() == null){ %>
										<strong style="color: red">Chưa thanh toán</strong>
										<%}else{ %>
										<%=listyc.get(i).getPayment_time()%>
										<%} %></td>
										<td><%=listyc.get(i).getIssue_time()%></td>
										<td><%=listyc.get(i).getWater_meter_value()%></td>
										<td><%=listyc.get(i).getPrice()%></td>
									</tr>
									<%
									}
									}
									%>
								</tbody>
							</table>
							<div class="card-footer d-flex justify-content-end">
								<button class="btn btn-outline-secondary px-4" type="button" name="back" onclick="history.back()">Quay lại</button>
							</div>
						</form>
					</div>
				</div>
</body>
</html>