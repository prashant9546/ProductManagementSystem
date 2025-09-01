<%@page import="org.jsp.Dao.BranchDao"%>
<%@page import="org.jsp.Dto.Branch"%>
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
		Branch branch=(Branch) session.getAttribute("branch");
		BranchDao dao=BranchDao.getBranchDao();
		try{
			dao.deleteBranch(branch);
			session.invalidate();
			response.sendRedirect("BranchSignup.jsp");
		}catch(Exception e){
			out.print(e.getMessage());
		}
	%>
</body>
</html>