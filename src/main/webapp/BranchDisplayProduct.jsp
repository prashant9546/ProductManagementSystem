<%@page import="org.jsp.Dto.Product"%>
<%@page import="org.jsp.Dao.BranchDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Display Product by ID</title>
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
        color: #0d47a1;
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
        background-color: #1976d2;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        margin-left: 10px;
    }

    button:hover {
        background-color: #0d47a1;
    }

    table {
        border-collapse: collapse;
        width: 400px;
        margin-top: 20px;
        box-shadow: 2px 2px 10px rgba(0,0,0,0.2);
        background: #e3f2fd;
        border-radius: 8px;
        overflow: hidden;
    }

    td {
        padding: 12px;
        border-bottom: 1px solid #90caf9;
    }

    tr:last-child td {
        border-bottom: none;
    }

    .error {
        color: red;
        font-weight: bold;
    }

    a {
        margin-top: 30px;
        display: inline-block;
        color: #0d47a1;
        font-weight: bold;
        text-decoration: none;
    }

    a:hover {
        text-decoration: underline;
    }
</style>
</head>
<body>
    <h2>Search Product by ID</h2>
    <form action="BranchDisplayProduct.jsp" method="post">
        <h3>Enter Product ID:</h3>
        <input type="number" name="id" required>
        <button type="submit">Fetch</button>
    </form>

    <%
        String id = request.getParameter("id");
        if (id != null && request.getMethod().equals("POST")) {
            try {
                int pid = Integer.parseInt(id);
                BranchDao dao = BranchDao.getBranchDao();
                Product product = dao.fetchProduct(pid);
    %>
                <table>
                    <tr><td><strong>Product ID:</strong></td><td><%= product.getId() %></td></tr>
                    <tr><td><strong>Name:</strong></td><td><%= product.getName() %></td></tr>
                    <tr><td><strong>Price:</strong></td><td><%= product.getPrice() %></td></tr>
                </table>
    <%
            } catch (Exception e) {
    %>
                <p class="error"> Product not found. Please check the ID and try again.</p>
    <%
            }
        }
    %>

    <a href="BranchHome.jsp"> Back to Home</a>
</body>
</html>
