<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.ArrayList, java.sql.Date, dao.*,model.*"%>

<%
	EmployeeDAO employeeDAO = new EmployeeDAO();
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	
	Employee employee = new Employee(username,password);
	Employee result = employeeDAO.checkSignin(employee);
	if(result != null){
		session.setAttribute("employee", result);
		//Neu nguoi dang nhap la nhan vien ghi so dien
		if(result.getPosition().equals("quan_ly")){
			response.sendRedirect("../ql/GDChinhNVQuanly.jsp");
		}
		//Neu nguoi dang nhap la nhan vien
		if(result.getPosition().equals("nhan_vien")){
			response.sendRedirect("../nhanvien/GDChinhNhanvien.jsp");
		}
	}
	else{
		//Sai mat khau
		response.sendRedirect("GDDangnhap.jsp?message=wrongPass");
	}
%>