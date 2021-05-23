<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.ArrayList, java.sql.Date, dao.*,model.*"%>

<%
	EmployeeDAO employeeDAO = new EmployeeDAO();
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	String fullname = request.getParameter("fullname");
	String phone = request.getParameter("phone");
	String address = request.getParameter("address");
	Employee employee = new Employee(0, fullname, address, phone, username, password, "nhan_vien");
	session.setAttribute("employee", employee);
	boolean result = employeeDAO.checkSignup(employee);
	if (result == true) {
		response.sendRedirect("GDDangnhap.jsp?message=good");
	} else {
		response.sendRedirect("GDDangki.jsp?message=dup");
	}
	System.out.println(result);
%>