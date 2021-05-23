<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, model.*, dao.*"%>
<%
ArrayList<TKContract> listyc = new ArrayList<TKContract>();
listyc = (new TKContractDAO()).getAllContract();
%>
<!DOCTYPE html>
<html lang="vi">

<head>
<meta charset="UTF-8">
<jsp:include page="../include.jsp" />
<!--Custom styles-->
<link rel="stylesheet" href="../vendor/css/main_view.css">
<title>Aquaman - Thống kê hợp đồng</title>
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
						<span class="navbar-brand mb-0 h1">Thống kê hợp đồng</span>
					</div>
					<div class="card-body">
						<form>
							<table class="table">
								<thead>
									<tr>
										<th>ID</th>
										<th>Họ và tên</th>
										<th>Địa chỉ</th>
										<th>Số điện thoại</th>
										<th>Số CMND/CCCD</th>
										<th>Email</th>
										<th>Loại hợp đồng</th>
										<th></th>
									</tr>
								</thead>
								<tbody>
									<%
									for (int i = 0; i < listyc.size(); i++) {
									%>
									<tr>
										<td name="id"><%=listyc.get(i).getId()%></td>
										<td><%=listyc.get(i).getFullname()%></td>
										<td><%=listyc.get(i).getAddress()%></td>
										<td><%=listyc.get(i).getPhonenumber()%></td>
										<td><%=listyc.get(i).getIdentityNumber()%></td>
										<td><%=listyc.get(i).getEmail()%></td>
										<td><%=listyc.get(i).getLoaihopdong()%></td>
										<td>
											<button class="btn btn-info" type="button"
												data-toggle="tooltip" data-placement="left"
												title="Xem hoá đơn"
												onclick="location.href='GDHoaDonKhachHang.jsp?id=<%=listyc.get(i).getId()%>';">
												<i class="fas fa-receipt"></i>
											</button>
										</td>
									</tr>
									<%
									}
									}
									%>
								</tbody>
							</table>
							<div class="card-footer d-flex justify-content-end">
								<button class="btn btn-outline-secondary px-4" type="button"
									name="back" onclick="history.back()">Quay lại</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>