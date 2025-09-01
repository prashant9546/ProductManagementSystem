<%@page import="org.jsp.Dao.BranchDao"%>
<%@page import="org.jsp.Dto.Customer"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <title>Customer Login</title>
    <style>
        /* ======= Global Styling ======= */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background: linear-gradient(135deg, #00c6ff, #0072ff);
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        /* ======= Login Card ======= */
        .login-container {
            background: #fff;
            padding: 35px 40px;
            width: 400px;
            border-radius: 15px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.3);
            text-align: center;
            animation: fadeIn 0.8s ease-in-out;
        }

        /* Fade-in animation */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .login-container h1 {
            font-size: 26px;
            margin-bottom: 8px;
            color: #222;
        }

        .login-container p {
            font-size: 14px;
            color: #555;
            margin-bottom: 20px;
        }

        /* ======= Input Fields ======= */
        .form-group {
            text-align: left;
            margin-bottom: 18px;
        }

        label {
            font-weight: 600;
            color: #333;
            display: block;
            margin-bottom: 6px;
        }

        input {
            width: 100%;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 8px;
            outline: none;
            font-size: 15px;
            transition: 0.3s ease;
        }

        input:focus {
            border-color: #0072ff;
            box-shadow: 0 0 5px rgba(0, 114, 255, 0.4);
        }

        /* ======= Buttons ======= */
        .btn {
            width: 100%;
            padding: 12px;
            font-size: 16px;
            font-weight: bold;
            color: #fff;
            background: #0072ff;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            margin-top: 8px;
            transition: 0.3s ease;
        }

        .btn:hover {
            background: #005fe0;
            box-shadow: 0 4px 15px rgba(0, 114, 255, 0.4);
        }

        /* Reset Button */
        .btn-reset {
            background: #ccc;
            color: #222;
            margin-top: 10px;
        }

        .btn-reset:hover {
            background: #aaa;
        }

        /* ======= Links ======= */
        .links {
            margin-top: 18px;
            font-size: 14px;
        }

        .links a {
            color: #0072ff;
            text-decoration: none;
            font-weight: 600;
            transition: 0.3s ease;
        }

        .links a:hover {
            text-decoration: underline;
        }

        /* ======= Error Message ======= */
        .error {
            color: red;
            font-size: 14px;
            font-weight: bold;
            margin-top: 15px;
        }

        /* ======= Responsive Design ======= */
        @media (max-width: 500px) {
            .login-container {
                width: 90%;
                padding: 25px;
            }
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h1>Welcome Back!</h1>
        <p>Login to your account</p>

        <form action="CustomerLogin.jsp" method="post">
            <div class="form-group">
                <label for="mail">Email Address</label>
                <input type="email" id="mail" name="mail" placeholder="Enter your email" required>
            </div>

            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" placeholder="Enter your password" required>
            </div>

            <button type="submit" class="btn">Login</button>
            <button type="reset" class="btn btn-reset">Reset</button>
        </form>

        <div class="links">
            <p>Don't have an account? <a href="CustomerSignup.jsp">Sign Up</a></p>
            <p><a href="WelcomePage.jsp"> Back to Welcome Page</a></p>
        </div>

        <%
            String mail = request.getParameter("mail");
            String password = request.getParameter("password");

            if (mail != null && password != null && request.getMethod().equalsIgnoreCase("POST")) {
                BranchDao dao = BranchDao.getBranchDao();
                Customer customer = dao.loginCustomerMail(mail);

                if (customer == null) {
        %>
                    <p class="error">⚠ Email does not exist!</p>
        <%
                } else if (!customer.getPassword().equals(password)) {
        %>
                    <p class="error">⚠ Invalid password! Please try again.</p>
        <%
                } else {
                    session.setAttribute("customer", customer);
                    response.sendRedirect("CustomerHome.jsp");
                }
            }
        %>
    </div>
</body>
</html>
