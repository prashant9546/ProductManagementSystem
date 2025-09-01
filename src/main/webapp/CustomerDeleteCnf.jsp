<%@page import="org.jsp.Dao.BranchDao"%>
<%@page import="org.jsp.Dto.Customer"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		Customer customer=(Customer) session.getAttribute("customer");
		BranchDao dao=BranchDao.getBranchDao();
		try{
			dao.deleteCustomer(customer);
			session.invalidate(); 
			response.sendRedirect("CustomerSignup.jsp");
		}catch(Exception e){
			out.print(e.getMessage());
		}
	%>
</body>
</html>