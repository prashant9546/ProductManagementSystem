<%@page import="org.jsp.Dto.Product"%>
<%@page import="org.jsp.Dao.BranchDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Remove Product</title>
<style>
    body {
        font-family: 'Segoe UI', sans-serif;
        background-color: #f0f8ff;
        padding: 30px;
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    h2, h3 {
        color: #d32f2f;
    }

    form {
        margin-bottom: 20px;
    }

    input[type="number"] {
        padding: 8px;
        width: 200px;
        border-radius: 5px;
        border: 1px solid #aaa;
    }

    button {
        padding: 8px 15px;
        margin: 10px;
        background-color: #d32f2f;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }

    button:hover {
        background-color: #b71c1c;
    }

    .cancel-btn {
        background-color: #4caf50;
    }

    .cancel-btn:hover {
        background-color: #388e3c;
    }

    table {
        border-collapse: collapse;
        width: 400px;
        margin: 20px auto;
        background: #ffe0e0;
        box-shadow: 2px 2px 8px rgba(0,0,0,0.2);
        border-radius: 8px;
    }

    td {
        padding: 12px;
        border-bottom: 1px solid #ef9a9a;
    }

    tr:last-child td {
        border-bottom: none;
    }

    .error {
        color: red;
        font-weight: bold;
    }

    a {
        text-decoration: none;
        color: white;
    }
</style>
</head>
<body>

<h2>Remove Product</h2>

<form action="BranchRemoveProduct.jsp" method="post">
    <h3>Enter Product ID to Remove:</h3>
    <input type="number" name="id" required>
    <button type="submit">Fetch</button>
</form>

<%
    String id = request.getParameter("id");
    if (id != null && request.getMethod().equals("POST")) {
        try {
            int id1 = Integer.parseInt(id);
            BranchDao branchDao = BranchDao.getBranchDao();
            Product product = branchDao.fetchProduct(id1);
%>
    <h3>Are you sure you want to delete the following product?</h3>
    <table>
        <tr><td><strong>Product ID:</strong></td><td><%= product.getId() %></td></tr>
        <tr><td><strong>Name:</strong></td><td><%= product.getName() %></td></tr>
        <tr><td><strong>Price:</strong></td><td> <%= product.getPrice() %></td></tr>
    </table>

    <form action="BranchRemoveCnfProduct.jsp" method="post">
        <input type="hidden" name="id" value="<%= product.getId() %>">
        <button type="submit">✅ Yes, Delete</button>
    </form>
    <form action="BranchHome.jsp">
        <button type="submit" class="cancel-btn"> No, Cancel</button>
    </form>
<%
        } catch (Exception e) {
%>
    <p class="error">Product Not Found</p>
<%
        }
    }
%>

</body>
</html>
