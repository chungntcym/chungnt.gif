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
<title>Chọn khu vực dân cư</title>
<%
 String idString = request.getParameter("id");
int id = 0;
if (idString != null) {
	id = Integer.parseInt(idString);
} else {
	response.sendRedirect("GDChinhNhanVien.jsp");
}

session.setAttribute("DistrictID", id);
Districts districts = new Districts();
ArrayList<Districts> listDistricts = (ArrayList<Districts>) session.getAttribute("listDistricts");
for (Districts ct : listDistricts) {
	if (id == ct.getId()) {
		districts = ct;
		break;
	}
}
SubDistrictDAO subdistrictDAO = new SubDistrictDAO();
ArrayList<SubDistrict> listSubDistrict = new ArrayList<SubDistrict>(); 
listSubDistrict = subdistrictDAO.getAllSubDistrictById(String.valueOf(id));
session.setAttribute("listSubDistrict", listSubDistrict); 
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
						<span class="navbar-brand mb-0 h1">Thông báo khách hàng qua Email </span>
					</div>
					<div class="card-body">
						<div class="form-group">
							<label for="address-select">Chọn Quận/Huyện</label> 
								<select class="form-control" id="district-select" disabled>
									<option value="default" disabled selected><%=districts.getName()%> </option>
								</select>
							<label for="address-select">Chọn Phường/Xã</label>
								<select class="form-control" id="subdistrict-select">
									<option value="default" disabled selected> </option>
									<%
									
									if(listSubDistrict != null){
										for(SubDistrict subdistrict : listSubDistrict){ 
									%>
									<option value=<%=subdistrict.getId()%>>
										<%=subdistrict.getName()%> 
									</option>
									<%
										} 
									}
									%>
								</select>
						</div>
					</div>
					<div class="card-footer d-flex justify-content-end">
							<button class="btn btn-outline-secondary px-3" type="button" name="back" onclick="history.back()">Chọn lại Quận</button>
						</div>
				</div>

			</div>
		</div>
		<!-- /#page-content-wrapper -->

	</div>
	<!-- /#wrapper -->
	<script type="text/javascript">
		$(function() {
			$("#district-select").val("default");
			
			$("#district-select").bind("change", function() {
				var val = $(this).val(); // get selected value
				if (val) { // require a URL
					window.location = "GDChonKhuVucTimKiem.jsp?id=" + val; // redirect
				}
				return false;
			});
			$("#subdistrict-select").val("default");
			
			$("#subdistrict-select").bind("change", function() {
				var val = $(this).val(); // get selected value
				if (val) { // require a URL
					window.location = "GDChonHoDan.jsp?id=" + val; // redirect
				}
				return false;
			});
			
		}); 
	</script>
</body>
</html>