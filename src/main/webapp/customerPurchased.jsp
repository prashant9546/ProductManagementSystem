<%@page import="org.jsp.Dto.Customer"%>
<%@page import="org.jsp.Dto.Product"%>
<%@page import="java.util.List"%>
<%@page import="org.jsp.Dao.BranchDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Purchased Products</title>
<style>
	body {
		font-family: Arial, sans-serif;
		margin: 30px;
		background-color: pink;
	}
	table {
		width: 80%;
		border-collapse: collapse;
		margin-bottom: 20px;
	}
	th, td {
		padding: 10px;
		border: 1px solid black;
		text-align: center;
	}
	th {
		background-color: #f0f0f0;
	}
	button {
		padding: 5px 10px;
		border-radius: 4px;
		background-color: red;
		color: white;
		border: none;
		cursor: pointer;
	}
	button:hover {
		background-color: darkred;
	}
	a {
		font-weight: bold;
		text-decoration: none;
		color: blue;
	}
</style>
</head>
<body>
<%
	String msg = null;
	String id1 = request.getParameter("id");
	if (id1 != null && request.getMethod().equalsIgnoreCase("POST")) {
		try {
			int id2 = Integer.parseInt(id1);
			BranchDao branchDao = BranchDao.getBranchDao();
			Product product = branchDao.fetchProduct(id2);
			product.setCustomer(null);
			branchDao.updateProduct(product);
			msg = " Product removed from your purchase list.";
			response.sendRedirect("customerPurchased.jsp");
			return; // prevent rendering twice
		} catch (Exception e) {
			msg = " Error removing product: " + e.getMessage();
		}
	}
%>

<h1>Purchased Products</h1>

<%
	Customer customer = (Customer) session.getAttribute("customer");
	if (customer != null) {
		int cid = customer.getId();
		BranchDao branchDao = BranchDao.getBranchDao();
		List<Product> products = branchDao.fetchCustomerPurchased(cid);
		
		if (msg != null) {
			out.print("<p style='color: green; font-weight:bold;'>" + msg + "</p>");
		}
		
		if (products.isEmpty()) {
%>
			<p>No products purchased yet.</p>
<%
		} else {
%>
	<table>
		<thead>
			<tr>
				<th>Product Id</th>
				<th>Product Name</th>
				<th>Product Price</th>
				<th>Remove</th>
			</tr>
		</thead>
		<tbody>
			<%
				for (Product product : products) {
			%>
			<tr>
				<td><%= product.getId() %></td>
				<td><%= product.getName() %></td>
				<td><%= product.getPrice() %></td>
				<td>
					<form action="customerPurchased.jsp" method="post">
						<input type="hidden" name="id" value="<%= product.getId() %>">
						<button type="submit">Remove</button>
					</form>
				</td>
			</tr>
			<%
				}
			%>
		</tbody>
	</table>
<%
		}
	} else {
%>
	<p style="color: red;">Session expired. Please <a href="CustomerLogin.jsp">log in</a> again.</p>
<%
	}
%>

<p><a href="CustomerHome.jsp"> Back to Home</a></p>

</body>
</html>
