<%@page import="org.jsp.Dao.BranchDao"%>
<%@page import="org.jsp.Dto.Customer"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer Sign-up</title>
<style>
    body {
        margin: 0;
        padding: 0;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background: linear-gradient(to right, #e8f5e9, #ffffff);
    }

    .form-container {
        margin: 8% auto;
        padding: 25px;
        border: 2px solid #388e3c;
        width: 350px;
        background-color: #c8e6c9;
        display: flex;
        flex-direction: column;
        align-items: center;
        border-radius: 12px;
        box-shadow: 0 0 10px rgba(0,0,0,0.2);
    }

    .form-container:hover {
        border-radius: 20px;
        box-shadow: 3px 3px 12px black;
    }

    h1 {
        margin-bottom: 20px;
        color: #2e7d32;
    }

    table {
        width: 100%;
    }

    td {
        padding: 8px;
    }

    input {
        border-radius: 5px;
        width: 100%;
        padding: 6px;
        border: 1px solid #ccc;
    }

    button {
        height: 30px;
        width: 80px;
        border-radius: 10px;
        background-color: #4fc3f7;
        color: white;
        border: none;
        cursor: pointer;
        transition: 0.3s ease;
    }

    button:hover {
        box-shadow: 2px 2px 10px black;
        font-weight: bold;
        background-color: #81d4fa;
        color: black;
    }

    a {
        color: #00796b;
        text-decoration: none;
    }

    a:hover {
        text-decoration: underline;
    }

    .login-link {
        margin-top: 10px;
    }

    .error {
        color: red;
        font-weight: bold;
        margin-top: 10px;
    }
</style>
</head>
<body>
<div class="form-container">
    <h1>Customer Sign-up</h1>  
    <form action="CustomerSignup.jsp" method="post">
        <table>
            <tr>
                <td><label for="name">Name :</label></td>
                <td><input type="text" id="name" name="name" required></td>        
            </tr>
            <tr>
                <td><label for="mail">Mail :</label></td>
                <td><input type="email" id="mail" name="mail" required></td>        
            </tr>
            <tr>
                <td><label for="password">Password :</label></td>
                <td><input type="password" id="password" name="password" required></td>        
            </tr>
            <tr>
                <td><button type="reset">Reset</button></td>
                <td><button type="submit">Submit</button></td>
            </tr>
        </table>
    </form>
    
    <div class="login-link">
        Already have an account? <a href="CustomerLogin.jsp">Log-In</a>
    </div>

<%
    String name = request.getParameter("name");
    String mail = request.getParameter("mail");
    String password = request.getParameter("password");

    if (name != null && mail != null && password != null && request.getMethod().equals("POST")) {
        try {
            Customer customer = new Customer();
            customer.setName(name);
            customer.setMail(mail);
            customer.setPassword(password);

           
            BranchDao dao = BranchDao.getBranchDao(); 
            dao.saveCustomer(customer);

            response.sendRedirect("CustomerLogin.jsp");
        } catch (Exception e) {
%>
        <p class="error"><%= e.getMessage() %></p>
<%
        }
    }
%>
</div>
</body>
</html>
