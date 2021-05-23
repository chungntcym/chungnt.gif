<%@ page import="java.io.*,java.util.*,java.sql.*,java.util.Date,java.text.DateFormat"%>
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
<title>Soạn tin nhắn</title>
<% 
String idString = request.getParameter("id");
char idReal = idString.charAt(0);
int idAu=Integer.parseInt(String.valueOf(idReal));
session.setAttribute("idAu", idAu);
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
				<form id="grade-form" method="POST" action="doGuiTin.jsp?id=<%=idAu%>" accept-charset="utf-8">
					<div class="card mt-3">
						<div class="card-header d-flex justify-content-between">
							<span class="navbar-brand mb-0 h1">Soạn thông báo</span>
						</div>
						<div class="card-body">
							<% if (idAu==2){%> 
								<form>
								
								  	<textarea class="form-control" id ="message-1" name="message1" rows="10"></textarea>
								</form>
							<%} else if (idAu==0){ %>
								<form>
									<span class="navbar-brand mb-0" STYLE="font-size:110%"><b>Đối với khách còn nợ</b></span>
								  	<p>Chào bạn!<br>Tiền nước đến ngày: {Ngày ghi chỉ số đồng hồ} của bạn là: {Tổng tiền còn nợ}.<br> Hãy đến địa điểm gần nhất để đóng tiền.<br> Sau 10 ngày kể từ ngày nhận thông báo, nếu chủ hộ chưa đóng tiền, công ty sẽ tiến hành cắt nước.<br> Xin chân thành cảm ơn</p>
								</form>
								<form>
									<span class="navbar-brand mb-0" STYLE="font-size:110%"><b>Đối với khách đã đóng tiền</b></span>
								  	<p>Bạn đã thanh toán hoá đơn thành công</p>
								</form>
							<%} else {%>
								<form>
									<p>Chào bạn!<br> Chúng tôi rất xin lỗi khi phải thông báo điều này với bạn.<br> Nước sẽ bị cắt từ thời điểm: {Thời gian bắt đầu} đến thời điểm  {Thời gian kết thúc} <br>Mong nhận được sự thông cảm từ các bạn</p>
									<div class="my-auto">Thời gian bắt đầu</div>
									<!-- <textarea class="form-control" id ="message-4" name="cuttime" rows="1"></textarea> -->
									<div class="card-body">
										<div class="d-flex flex-row">
											<div class="form-group">
												<input class="form-control" type="time" id="appt" name="cuttime" value="00:00" required>
											</div>
											<div class="form-group">
												<input class="form-control" type="date" id="date-input" name="cutday">
											</div>

										</div>
									</div>
									
									<div class="my-auto">Thời gian kết thúc</div>
									<!-- <textarea class="form-control" id ="message-5" name="ontime" rows="1"></textarea> -->
									<div class="card-body">
										<div class="d-flex flex-row">
											<div class="form-group">
												<input class="form-control" type="time" id="appt" name="ontime" value="00:00" required>
											</div>
											<div class="form-group">
												<input class="form-control" type="date" id="date-input" name="onday">
												
											</div>

										</div>
									</div>
								</form>
							<%} %>
						</div>
						<div class="card-footer d-flex justify-content-end">
							<button class="btn btn-outline-secondary px-3 mx-2" type="submit" name="send-email">Gửi tin</button>
							<button class="btn btn-outline-secondary px-3" type="button" name="back" onclick="history.back()">Huỷ</button>
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
			$('#select-type').bind('change', function() {
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
		document.getElementById("check-all").onclick = function () 
        {
            // Lấy danh sách checkbox
            var checkboxes = document.getElementsByName('email-check');

            // Lặp và thiết lập checked
            for (var i = 0; i < checkboxes.length; i++){
                checkboxes[i].checked = true;
            }
        };

        // Chức năng bỏ chọn hết
        document.getElementById("un-check-all").onclick = function () 
        {
            // Lấy danh sách checkbox
            var checkboxes = document.getElementsByName('email-check');

            // Lặp và thiết lập Uncheck
            for (var i = 0; i < checkboxes.length; i++){
                checkboxes[i].checked = false;
            }
        };
	</script>
</body>
</html>