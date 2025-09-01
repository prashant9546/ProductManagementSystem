<%@page import="org.jsp.Dto.Branch"%>
<%@page import="org.jsp.Dto.Product"%>
<%@page import="org.jsp.Dao.BranchDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add New Product</title>
<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background: linear-gradient(to right, #e3f2fd, #ffffff);
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }

    .form-container {
        background-color: #bbdefb;
        padding: 30px;
        border-radius: 10px;
        box-shadow: 2px 2px 12px rgba(0, 0, 0, 0.2);
        width: 400px;
    }

    h2 {
        text-align: center;
        color: #0d47a1;
    }

    table {
        width: 100%;
    }

    td {
        padding: 10px;
    }

    input[type="text"],
    input[type="number"] {
        width: 95%;
        padding: 8px;
        border: 1px solid #ccc;
        border-radius: 6px;
    }

    input[type="submit"] {
        background-color: #1976d2;
        color: white;
        padding: 10px;
        border: none;
        border-radius: 6px;
        width: 100%;
        cursor: pointer;
    }

    input[type="submit"]:hover {
        background-color: #0d47a1;
    }

    .message {
        text-align: center;
        margin-top: 10px;
        font-weight: bold;
    }

    .success {
        color: green;
    }

    .error {
        color: red;
    }

    .back {
        text-align: center;
        margin-top: 15px;
    }

    .back a {
        color: #0d47a1;
        text-decoration: none;
        font-weight: bold;
    }

    .back a:hover {
        text-decoration: underline;
    }
</style>
</head>
<body>
<div class="form-container">
    <h2>Add New Product</h2>
    <form action="BranchAddProduct.jsp" method="post">
        <table>
            <tr>
                <td>Product Name:</td>
                <td><input type="text" name="name" required></td>
            </tr>
            <tr>
                <td>Price:</td>
                <td><input type="number" step="0.01" name="price" required></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" value="Add Product"></td>
            </tr>
        </table>
    </form>

    <%
        String name = request.getParameter("name");
        String price = request.getParameter("price");
        Branch branch = (Branch) session.getAttribute("branch");

        if (branch == null) {
            response.sendRedirect("BranchLogin.jsp");
            return;
        }

        if (name != null && price != null && request.getMethod().equals("POST")) {
            try {
                double price1 = Double.parseDouble(price);
                Product product = new Product();
                product.setName(name);
                product.setPrice(price1);
                product.setBranch(branch);

                BranchDao dao = BranchDao.getBranchDao();
                dao.saveProduct(product);
    %>
                <div class="message success">Product "<%= name %>" added successfully!</div>
    <%
            } catch (Exception e) {
    %>
                <div class="message error"> Error: <%= e.getMessage() %></div>
    <%
            }
        }
    %>

    <div class="back">
        <a href="BranchHome.jsp"> Back to Home</a>
    </div>
</div>
</body>
</html>
