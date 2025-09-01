<%@page import="org.jsp.Dto.Branch"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete Branch Account</title>
<style>
    body {
        font-family: 'Segoe UI', sans-serif;
        background-color: #f5f5f5;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }

    .confirm-box {
        background-color: #fff;
        border: 2px solid #c62828;
        padding: 30px;
        border-radius: 10px;
        box-shadow: 2px 2px 12px rgba(0, 0, 0, 0.2);
        text-align: center;
    }

    h1 {
        color: #c62828;
    }

    .btn {
        padding: 10px 20px;
        margin: 10px;
        border-radius: 5px;
        border: none;
        cursor: pointer;
        font-weight: bold;
        transition: 0.3s ease;
    }

    .btn-yes {
        background-color: #e53935;
        color: white;
    }

    .btn-no {
        background-color: #4caf50;
        color: white;
    }

    .btn:hover {
        box-shadow: 2px 2px 8px black;
    }
</style>
</head>
<body>
    <div class="confirm-box">
        <h1>Are you sure you want to delete your account?</h1>
        <form action="BranchDeleteCnf.jsp" method="post" style="display:inline;">
            <button type="submit" class="btn btn-yes">Yes, Delete</button>
        </form>
        <form action="BranchHome.jsp" method="get" style="display:inline;">
            <button type="submit" class="btn btn-no">No, Cancel</button>
        </form>
    </div>
</body>
</html>
