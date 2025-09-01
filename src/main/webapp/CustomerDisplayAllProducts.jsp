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
<title>Available Products</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f8fb;
        padding: 30px;
    }
    h1 {
        color: #0d47a1;
        text-align: center;
    }
    table {
        width: 70%;
        margin: 20px auto;
        border-collapse: collapse;
        box-shadow: 2px 2px 10px #ccc;
        background-color: #e3f2fd;
    }
    th, td {
        border: 1px solid #90caf9;
        padding: 10px;
        text-align: center;
    }
    th {
        background-color: #64b5f6;
        color: white;
    }
    button {
        background-color: #42a5f5;
        color: white;
        border: none;
        padding: 8px 12px;
        border-radius: 5px;
        cursor: pointer;
    }
    button:hover {
        background-color: #1976d2;
    }
    a {
        display: block;
        text-align: center;
        margin-top: 20px;
        color: #0d47a1;
        font-weight: bold;
        text-decoration: none;
    }
    a:hover {
        text-decoration: underline;
    }
    .message {
        text-align: center;
        color: green;
        font-weight: bold;
    }
    .error {
        text-align: center;
        color: red;
        font-weight: bold;
    }
</style>
</head>
<body>

<h1>Available Products</h1>

<%
    BranchDao branchDao = BranchDao.getBranchDao();
    List<Product> products = branchDao.fetchUnpurchasedProduct();
    if (products != null && !products.isEmpty()) {
%>
    <table>
        <thead>
            <tr>
                <th>Product Id</th>
                <th>Product Name</th>
                <th>Product Price</th>
                <th>Buy</th>
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
                    <form action="CustomerDisplayAllProducts.jsp" method="post">
                        <input type="hidden" name="id" value="<%= product.getId() %>">
                        <button type="submit">Buy</button>
                    </form>
                </td>
            </tr>
        <%
            }
        %>
        </tbody>
    </table>
<%
    } else {
%>
    <p class="message">All products are purchased. Nothing left to buy!</p>
<%
    }
%>

<%
    String id = request.getParameter("id");
    if (id != null && request.getMethod().equals("POST")) {
        try {
            Customer customer = (Customer) session.getAttribute("customer");
            int id1 = Integer.parseInt(id);

            if (customer != null) {
                Product product = branchDao.fetchProduct(id1);
                product.setCustomer(customer);
                branchDao.updateProduct(product);
                response.sendRedirect("CustomerDisplayAllProducts.jsp");
            } else {
%>
                <p class="error"> Customer not logged in. Please log in again.</p>
<%
            }
        } catch (Exception e) {
%>
            <p class="error"> Error purchasing product: <%= e.getMessage() %></p>
<%
        }
    }
%>

<a href="CustomerHome.jsp"> Back to Home</a>

</body>
</html>
