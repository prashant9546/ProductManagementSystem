<%@page import="org.jsp.Dto.Product"%>
<%@page import="java.util.List"%>
<%@page import="org.jsp.Dto.Customer"%>
<%@page import="org.jsp.Dao.BranchDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer Details</title>
<style>
    body {
        font-family: 'Segoe UI', sans-serif;
        background-color: #f4f8fc;
        padding: 30px;
    }

    h1 {
        color: #0d47a1;
        text-align: center;
    }

    table {
        border-collapse: collapse;
        width: 60%;
        margin: 20px auto;
        background-color: #e3f2fd;
        box-shadow: 2px 2px 8px rgba(0, 0, 0, 0.1);
    }

    th, td {
        padding: 12px;
        border-bottom: 1px solid #bbdefb;
        text-align: center;
    }

    th {
        background-color: #64b5f6;
        color: white;
    }

    input[disabled] {
        border: none;
        background-color: transparent;
        font-weight: bold;
        text-align: center;
    }

    .section {
        width: 50%;
        margin: 20px auto;
    }

    a {
        display: block;
        text-align: center;
        margin-top: 20px;
        font-weight: bold;
        color: #0d47a1;
        text-decoration: none;
    }

    a:hover {
        text-decoration: underline;
    }

    .error {
        text-align: center;
        color: red;
        font-weight: bold;
    }
</style>
</head>
<body>

<%
    String id = request.getParameter("id");
    if (id != null && request.getMethod().equals("POST")) {
        try {
            int id1 = Integer.parseInt(id);
            BranchDao dao = BranchDao.getBranchDao();
            Customer customer = dao.fetchCustomer(id1);

            if (customer != null) {
%>

<div class="section">
    <h1> Customer Details</h1>
    <table>
        <tr>
            <td>ID:</td>
            <td><input type="number" value="<%= customer.getId() %>" disabled></td>
        </tr>
        <tr>
            <td>Name:</td>
            <td><input type="text" value="<%= customer.getName() %>" disabled></td>
        </tr>
        <tr>
            <td>Mail:</td>
            <td><input type="email" value="<%= customer.getMail() %>" disabled></td>
        </tr>
    </table>
</div>

<h1> Purchased Products</h1>
<table>
    <thead>
        <tr>
            <th>Product Id</th>
            <th>Product Name</th>
            <th>Product Price</th>
        </tr>
    </thead>
    <tbody>
        <%
            List<Product> products = dao.fetchCustomerPurchased(id1);
            if (products != null && !products.isEmpty()) {
                for (Product product : products) {
        %>
            <tr>
                <td><%= product.getId() %></td>
                <td><%= product.getName() %></td>
                <td><%= product.getPrice() %></td>
            </tr>
        <%
                }
            } else {
        %>
            <tr><td colspan="3"><b>No products purchased.</b></td></tr>
        <%
            }
        %>
    </tbody>
</table>

<%
            } else {
%>
    <p class="error"> Customer not found.</p>
<%
            }
        } catch (Exception e) {
%>
    <p class="error"> Error: <%= e.getMessage() %></p>
<%
        }
    } else {
%>
    <p class="error"> Invalid request. Please go back and select a customer.</p>
<%
    }
%>

<a href="BranchHome.jsp"> Back to Home</a>

</body>
</html>
