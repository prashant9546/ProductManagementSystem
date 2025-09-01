<%@page import="org.jsp.Dao.BranchDao"%>
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
		try{
			int id=Integer.parseInt(request.getParameter("id"));
			BranchDao branchDao=BranchDao.getBranchDao();
			branchDao.removeProduct(id);
			RequestDispatcher dispatcher=request.getRequestDispatcher("BranchHome.jsp");
			dispatcher.forward(request, response);
		}catch(Exception e){
			out.print(e.getMessage());
		}
		
	%>
</body>
</html>