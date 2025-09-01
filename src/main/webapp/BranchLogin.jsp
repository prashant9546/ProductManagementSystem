<%@ page import="org.jsp.Dao.BranchDao" %>
<%@ page import="org.jsp.Dto.Branch" %>
<%@ page import="javax.servlet.RequestDispatcher" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Branch Log-In</title>
<style>
    /* Background Styling */
    body {
        margin: 0;
        padding: 0;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background: linear-gradient(135deg, #00bcd4, #4caf50);
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }

    /* Login Container */
    .form-box {
        width: 380px;
        background-color: #ffffff;
        padding: 30px 25px;
        border-radius: 15px;
        box-shadow: 0 8px 25px rgba(0, 0, 0, 0.3);
        text-align: center;
        animation: fadeIn 0.7s ease-in-out;
    }

    /* Animation Effect */
    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(-30px); }
        to { opacity: 1; transform: translateY(0); }
    }

    /* Heading */
    h1 {
        margin-bottom: 20px;
        color: #00796b;
        font-size: 26px;
    }

    /* Input Table */
    table {
        width: 100%;
        margin-top: 10px;
    }

    td {
        padding: 10px 5px;
        text-align: left;
    }

    /* Input Fields */
    input {
        width: 100%;
        padding: 10px;
        border: 1px solid #bbb;
        border-radius: 8px;
        font-size: 15px;
        outline: none;
        transition: 0.3s ease-in-out;
    }

    input:focus {
        border-color: #00bcd4;
        box-shadow: 0 0 8px rgba(0, 188, 212, 0.3);
    }

    /* Buttons */
    .btn-box {
        display: flex;
        justify-content: space-between;
        margin-top: 15px;
    }

    button {
        flex: 1;
        padding: 10px;
        border: none;
        margin: 5px;
        border-radius: 8px;
        background-color: #00bcd4;
        color: white;
        font-size: 15px;
        cursor: pointer;
        transition: 0.3s ease-in-out;
    }

    button:hover {
        background-color: #008ba3;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
    }

    /* Links */
    .login-link {
        margin-top: 20px;
        font-size: 14px;
        color: #555;
    }

    .login-link a {
        color: #00bcd4;
        text-decoration: none;
        font-weight: bold;
    }

    .login-link a:hover {
        text-decoration: underline;
        color: #00796b;
    }

    /* Error Message */
    .error {
        color: red;
        font-weight: bold;
        margin-top: 12px;
    }
</style>
</head>
<body>
<div class="form-box">
    <h1>Branch Log-In</h1>
    <form action="BranchLogin.jsp" method="post">
        <table>
            <tr>
                <td><label for="mail">Email:</label></td>
                <td><input type="email" id="mail" name="mail" placeholder="Enter your email" required></td>
            </tr>
            <tr>
                <td><label for="password">Password:</label></td>
                <td><input type="password" id="password" name="password" placeholder="Enter your password" required></td>
            </tr>
        </table>
        <div class="btn-box">
            <button type="reset">Reset</button>
            <button type="submit">Login</button>
        </div>
    </form>

    <div class="login-link">
        Don't have an account? <a href="BranchSignup.jsp">Sign Up</a><br>
        <a href="WelcomePage.jsp">Back to Welcome Page</a>
    </div>

<%
    String mail = request.getParameter("mail");
    String password = request.getParameter("password");

    if (mail != null && password != null && request.getMethod().equalsIgnoreCase("POST")) {
        BranchDao dao = BranchDao.getBranchDao();
        Branch branch = dao.loginBranchMail(mail);

        if (branch != null) {
            if (branch.getPassword().equals(password)) {
                session.setAttribute("branch", branch);
                response.sendRedirect("BranchHome.jsp");
                return;
            } else {
%>
                <p class="error"> Incorrect password. Please try again.</p>
<%
            }
        } else {
%>
            <p class="error"> Email not found. Please sign up first.</p>
<%
        }
    }
%>
</div>
</body>
</html>
