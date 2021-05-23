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
DistrictsDAO districtsDAO = new DistrictsDAO();
ArrayList<Districts> listDistricts = districtsDAO.getAllDistrict();
session.setAttribute("listDistricts", listDistricts);
ArrayList<SubDistrict> listSubDistrict = new ArrayList<SubDistrict>();
String idString = request.getParameter("id");

if (idString != null) {
	SubDistrictDAO subdistrictDAO = new SubDistrictDAO();
	listSubDistrict = subdistrictDAO.getAllSubDistrictById(idString);
	session.setAttribute("listSubDistrict", listSubDistrict);
}
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
							<label for="address-select">Chọn Quận/Huyện</label> <select
								class="form-control" id="district-select">
								<option value="default" disabled selected></option>
								<%
								if (listDistricts != null) {
									for (Districts districts : listDistricts) {
								%>
								<option value=<%=districts.getId()%>>
									<%=districts.getName()%>
								</option>

								<%
								}
								}
								%>
							</select> <label for="address-select">Chọn Phường/Xã</label> <select
								class="form-control" id="subdistrict-select">
								<option value="default" disabled selected></option>
								<%
								if (idString != null && listSubDistrict.size() != 0) {
									for (SubDistrict subdistrict : listSubDistrict) {
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
				</div>

			</div>
		</div>
		<!-- /#page-content-wrapper -->

	</div>
	<!-- /#wrapper -->
	<script type="text/javascript">
	$.urlParam = function(name){
	    var results = new RegExp('[\?&]' + name + '=([^&#]*)').exec(window.location.href);
	    if (results==null) {
	       return null;
	    }
	    return decodeURI(results[1]) || 0;
	}
		$(function() {
			if($.urlParam('id') != null){
				$("#district-select").val($.urlParam('id'));
			} else {
				$("#district-select").val("deafault");
			}
			

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