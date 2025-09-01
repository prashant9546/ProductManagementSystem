<%@page import="org.jsp.Dto.Product"%>
<%@page import="java.util.List"%>
<%@page import="org.jsp.Dao.BranchDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Products</title>
<style>
    body {
        font-family: 'Segoe UI', sans-serif;
        background: #f0f8ff;
        padding: 20px;
    }

    h1 {
        color: #0d47a1;
        margin-top: 40px;
        margin-bottom: 10px;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-bottom: 40px;
    }

    th, td {
        border: 1px solid #aaa;
        padding: 10px;
        text-align: center;
    }

    th {
        background-color: #90caf9;
        color: #000;
    }

    tr:nth-child(even) {
        background-color: #e3f2fd;
    }

    .btn {
        background-color: #64b5f6;
        border: none;
        padding: 6px 10px;
        border-radius: 4px;
        color: white;
        cursor: pointer;
        font-weight: bold;
    }

    .btn:hover {
        background-color: #1976d2;
    }

    .back-link {
        margin-top: 20px;
        display: inline-block;
        background: #4caf50;
        padding: 10px 15px;
        color: white;
        text-decoration: none;
        border-radius: 5px;
        font-weight: bold;
    }

    .back-link:hover {
        background: #388e3c;
    }
</style>
</head>
<body>

<h1>Unpurchased Products</h1>
<table>
    <thead>
        <tr>
            <th>Product Id</th>
            <th>Product Name</th>
            <th>Product Price</th>
            <th>Branch Id</th>
        </tr>
    </thead>
    <tbody>
        <%
            BranchDao branchDao = BranchDao.getBranchDao();
            List<Product> unpurchased = branchDao.fetchUnpurchasedProduct();
            for(Product product : unpurchased) {
        %>
            <tr>
                <td><%= product.getId() %></td>
                <td><%= product.getName() %></td>
                <td><%= product.getPrice() %></td>
                <td><%= product.getBranch().getId() %></td>
            </tr>
        <%
            }
        %>
    </tbody>
</table>

<h1>Purchased Products</h1>
<table>
    <thead>
        <tr>
            <th>Product Id</th>
            <th>Product Name</th>
            <th>Product Price</th>
            <th>Branch Id</th>
            <th>Customer</th>
        </tr>
    </thead>
    <tbody>
        <%
            List<Product> purchased = branchDao.fetchPurchasedProduct();
            for(Product product : purchased) {
        %>
            <tr>
                <td><%= product.getId() %></td>
                <td><%= product.getName() %></td>
                <td> <%= product.getPrice() %></td>
                <td><%= product.getBranch().getId() %></td>
                <td>
                    <form action="CustomerDetails.jsp" method="post" style="margin:0;">
                        <input type="hidden" name="id" value="<%= product.getCustomer().getId() %>">
                        <button type="submit" class="btn">
                            View ID <%= product.getCustomer().getId() %>
                        </button>
                    </form>
                </td>
            </tr>
        <%
            }
        %>
    </tbody>
</table>

<a class="back-link" href="BranchHome.jsp"> Back to Home</a>

</body>
</html>
