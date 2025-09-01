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
		String name=request.getParameter("name");
		String mail=request.getParameter("mail");
		String password=request.getParameter("password");

		name = name==null || name.isEmpty()? branch.getName(): name;
		mail = mail==null || mail.isEmpty()? branch.getMail(): mail;
		password = password==null || password.isEmpty()? branch.getPassword(): password;
		
		
		try{
			Branch branch2=new Branch();
			branch2.setId(branch.getId());
			branch2.setName(name);
			branch2.setMail(mail);
			branch2.setPassword(password);
		
			BranchDao dao=BranchDao.getBranchDao();
			
			dao.updateBranch(branch2);
			
			session.invalidate();
			
			response.sendRedirect("BranchLogin.jsp");
		}catch(Exception e){
			out.print(e.getMessage());
		}
	%>
</body>
</html>