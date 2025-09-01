<%@page import="org.jsp.Dto.Product"%>
<%@page import="org.jsp.Dao.BranchDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Product</title>
<style>
    body {
        font-family: 'Segoe UI', sans-serif;
        background-color: #f1f8ff;
        padding: 30px;
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    h2, h3 {
        color: #0d47a1;
    }

    form {
        margin: 20px 0;
    }

    input[type="number"], input[type="text"] {
        padding: 8px;
        width: 250px;
        border-radius: 5px;
        border: 1px solid #ccc;
        margin-bottom: 10px;
    }

    button {
        padding: 8px 15px;
        background-color: #1976d2;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }

    button:hover {
        background-color: #0d47a1;
    }

    table {
        border-collapse: collapse;
        width: 400px;
        background-color: #e3f2fd;
        box-shadow: 2px 2px 8px rgba(0,0,0,0.2);
        border-radius: 8px;
        overflow: hidden;
        margin-top: 20px;
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
        margin-top: 20px;
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
    <h2> Update Product</h2>

    <form action="BranchUpdateProduct.jsp" method="post">
        <h3>Enter Product ID to Update:</h3>
        <input type="number" name="id" required>
        <button type="submit">Fetch</button>
    </form>

<%
    String id = request.getParameter("id");
    if (id != null && request.getMethod().equals("POST")) {
        try {
            int productId = Integer.parseInt(id);
            BranchDao dao = BranchDao.getBranchDao();
            Product product = dao.fetchProduct(productId);
%>
    <h3>Update Product Details</h3>
    <form action="BranchUpdateCnfProduct.jsp" method="post">
        <table>
            <tr>
                <td>ID:</td>
                <td>
                    <input type="text" value="<%= product.getId() %>" disabled>
                    <input type="hidden" name="id" value="<%= product.getId() %>">
                </td>
            </tr>
            <tr>
                <td>Name:</td>
                <td><input type="text" name="name" value="<%= product.getName() %>" required></td>
            </tr>
            <tr>
                <td>Price:</td>
                <td><input type="number" step="0.01" name="price" value="<%= product.getPrice() %>" required></td>
            </tr>
        </table>
        <button type="submit">Update</button>
    </form>
<%
        } catch (Exception e) {
%>
    <p class="error"> Product not found. Please enter a valid ID.</p>
<%
        }
    }
%>

<a href="BranchHome.jsp"> Back to Home</a>
</body>
</html>
