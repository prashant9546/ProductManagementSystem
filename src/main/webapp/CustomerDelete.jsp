<%@page import="org.jsp.Dao.BranchDao"%>
<%@page import="org.jsp.Dto.Customer"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete Customer Account</title>
<style>
    body {
        font-family: 'Segoe UI', sans-serif;
        background-color: #fdf1f1;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }

    .box {
        text-align: center;
        border: 2px solid #d32f2f;
        padding: 30px;
        background-color: #fff8f8;
        border-radius: 10px;
        box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.1);
    }

    h1 {
        color: #b71c1c;
    }

    form {
        margin-top: 20px;
    }

    button {
        padding: 10px 20px;
        margin: 10px;
        border: none;
        border-radius: 5px;
        color: white;
        cursor: pointer;
    }

    .yes-btn {
        background-color: #d32f2f;
    }

    .no-btn {
        background-color: #4caf50;
    }

    button:hover {
        opacity: 0.9;
    }
</style>
</head>
<body>
    <div class="box">
        <h1>Are you sure you want to delete your account?</h1>

        <form action="CustomerDeleteCnf.jsp" method="post">
            <button type="submit" class="yes-btn">Yes, Delete</button>
        </form>

        <form action="CustomerHome.jsp">
            <button type="submit" class="no-btn">No, Go Back</button>
        </form>
    </div>
</body>
</html>
