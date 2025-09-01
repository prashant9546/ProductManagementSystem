<%@page import="org.jsp.Dto.Product"%>
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
    	String id=request.getParameter("id");
    	String name=request.getParameter("name");
    	String price=request.getParameter("price");
    	Branch branch=(Branch)session.getAttribute("branch");
    	if(branch != null && name!=null && price != null && request.getMethod().equals("POST")){
    		int id1=Integer.parseInt(id);
    		double price1= Double.parseDouble(price);
    		try{
	    		BranchDao dao=BranchDao.getBranchDao();
	    		
    			Product product= new Product();
    			product.setId(id1);
    			product.setName(name);
    			product.setPrice(price1);
    			product.setBranch(branch);
    			
    			dao.updateProduct(product);
    			RequestDispatcher dispatcher=request.getRequestDispatcher("BranchUpdateProduct.jsp");
    			out.print("Product updated");
    			dispatcher.include(request, response);
    		}catch(Exception e){
    			out.print(e.getMessage());
    		}
    	}
    
    %>
</body>
</html>