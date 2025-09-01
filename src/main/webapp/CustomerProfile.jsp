<%@page import="org.jsp.Dao.BranchDao"%>
<%@page import="org.jsp.Dto.Customer"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Profile</title>
<style>
    /* Body Styling */
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background: linear-gradient(135deg, #74ebd5, #ACB6E5);
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
    }

    /* Card Container */
    .container {
        background-color: #ffffff;
        width: 420px;
        padding: 25px;
        border-radius: 15px;
        box-shadow: 0 8px 25px rgba(0, 0, 0, 0.25);
        text-align: center;
        animation: fadeIn 0.7s ease-in-out;
    }

    /* Heading */
    .container h2 {
        margin-bottom: 20px;
        font-size: 24px;
        color: #00796b;
    }

    /* Table Styling */
    table {
        width: 100%;
        border-collapse: collapse;
        margin-bottom: 15px;
    }

    td {
        padding: 10px 5px;
        text-align: left;
    }

    /* Input Fields */
    input[type="text"],
    input[type="email"],
    input[type="password"] {
        width: 95%;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 6px;
        outline: none;
        transition: all 0.3s ease;
        font-size: 14px;
    }

    input:focus {
        border-color: #0288d1;
        box-shadow: 0 0 8px rgba(2, 136, 209, 0.3);
    }

    /* Buttons */
    .btn {
        width: 100%;
        padding: 12px;
        margin-top: 10px;
        border: none;
        border-radius: 6px;
        font-size: 15px;
        cursor: pointer;
        transition: background-color 0.3s ease-in-out;
    }

    .btn-update {
        background-color: #0288d1;
        color: white;
    }

    .btn-update:hover {
        background-color: #0277bd;
    }

    .btn-reset {
        background-color: #fbc02d;
        color: #333;
    }

    .btn-reset:hover {
        background-color: #f9a825;
    }

    .btn-delete {
        background-color: #e53935;
        color: white;
        margin-top: 15px;
    }

    .btn-delete:hover {
        background-color: #c62828;
    }

    /* Back Link */
    .back-link {
        display: inline-block;
        margin-top: 18px;
        text-decoration: none;
        font-weight: bold;
        color: #00796b;
        transition: color 0.3s ease;
    }

    .back-link:hover {
        color: #004d40;
    }

    /* Animation */
    @keyframes fadeIn {
        from {
            opacity: 0;
            transform: translateY(-20px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }
</style>
</head>
<body>
<%
    Customer customer = (Customer) session.getAttribute("customer");

    if (customer != null) {
%>
    <div class="container">
        <h2>Update Profile</h2>
        <form action="CustomerUpdate.jsp" method="post">
            <table>
                <tr>
                    <td><label for="id">ID:</label></td>
                    <td>
                        <input type="text" value="<%= customer.getId() %>" disabled>
                        <input type="hidden" name="id" value="<%= customer.getId() %>">
                    </td>
                </tr>
                <tr>
                    <td><label for="name">Name:</label></td>
                    <td><input type="text" id="name" name="name" value="<%= customer.getName() %>" required></td>
                </tr>
                <tr>
                    <td><label for="mail">Mail:</label></td>
                    <td><input type="email" id="mail" name="mail" value="<%= customer.getMail() %>" required></td>
                </tr>
                <tr>
                    <td><label for="password">Password:</label></td>
                    <td><input type="text" id="password" name="password" value="<%= customer.getPassword() %>" required></td>
                </tr>
            </table>
            <button type="submit" class="btn btn-update">Update</button>
            <button type="reset" class="btn btn-reset">Reset</button>
        </form>

        <form action="CustomerDelete.jsp">
            <button type="submit" class="btn btn-delete">Delete Account</button>
        </form>

        <a href="CustomerHome.jsp" class="back-link">Back to Home</a>
    </div>
<%
    } else {
%>
    <p style="color:red; font-weight: bold;">
        Session expired. Please <a href='CustomerLogin.jsp'>login</a> again.
    </p>
<%
    }
%>
</body>
</html>
