<%@page import="java.lang.ProcessBuilder.Redirect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.ArrayList, java.util.Date, dao.*,model.*"%>
<%
String grade[] = request.getParameterValues("grade");
String value[] = request.getParameterValues("value");
String price[] = request.getParameterValues("price");

ArrayList<Grade> listGrade = new ArrayList<>();
int contractTypeId = Integer.parseInt(session.getAttribute("contractTypeId").toString());

Date date = new Date();
java.sql.Timestamp startDate = new java.sql.Timestamp(date.getTime());


for (int i = 0; i < grade.length; i++) {
	Grade gradeTemp = new Grade(0, Integer.parseInt(grade[i]), Integer.parseInt(value[i]), Float.parseFloat(price[i]), startDate);
	listGrade.add(gradeTemp);
}

GradeDAO gradeDAO = new GradeDAO();

boolean result = gradeDAO.saveGradeTable(listGrade, contractTypeId);
if(result == true){
	response.sendRedirect("GDChinhNVQuanly.jsp?result=gradeSuccess");
}
else{
	response.sendRedirect("GDChinhNVQuanly.jsp?result=gradeFail");
}
%>
