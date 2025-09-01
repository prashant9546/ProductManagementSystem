<%@page import="org.jsp.Dao.BranchDao"%>
<%@page import="org.jsp.Dto.Branch"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Update Branch Profile</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
    /* Reset & Base Styling */
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }

    body {
        background-color: #f4f8fb;
        color: #333;
        display: flex;
        justify-content: center;
        align-items: flex-start;
        min-height: 100vh;
        padding: 40px 15px;
    }

    /* Container Card */
    .container {
        background-color: #ffffff;
        max-width: 500px;
        width: 100%;
        padding: 30px 25px;
        border-radius: 12px;
        box-shadow: 0 8px 18px rgba(0, 0, 0, 0.2);
        text-align: center;
        animation: fadeIn 0.6s ease-in-out;
    }

    /* Heading */
    .container h2 {
        margin-bottom: 20px;
        color: #00796b;
        font-size: 24px;
        font-weight: bold;
    }

    /* Form */
    form {
        display: flex;
        flex-direction: column;
        gap: 15px;
        margin-bottom: 15px;
    }

    label {
        font-size: 15px;
        font-weight: 600;
        color: #333;
        display: block;
        text-align: left;
        margin-bottom: 5px;
    }

    input {
        padding: 10px 12px;
        font-size: 15px;
        width: 100%;
        border-radius: 8px;
        border: 1px solid #ccc;
        background-color: #f9f9f9;
        transition: all 0.3s ease;
    }

    input:focus {
        border-color: #26c6da;
        outline: none;
        box-shadow: 0 0 5px rgba(38, 198, 218, 0.6);
        background-color: #fff;
    }

    /* Buttons */
    .btn {
        padding: 10px;
        border: none;
        border-radius: 8px;
        font-size: 16px;
        font-weight: bold;
        cursor: pointer;
        transition: all 0.3s ease-in-out;
    }

    .btn-update {
        background-color: #26c6da;
        color: white;
    }

    .btn-update:hover {
        background-color: #0097a7;
        box-shadow: 0 4px 10px rgba(0, 151, 167, 0.4);
    }

    .btn-reset {
        background-color: #ffc107;
        color: #000;
    }

    .btn-reset:hover {
        background-color: #e0a800;
        box-shadow: 0 4px 10px rgba(255, 193, 7, 0.5);
    }

    .btn-delete {
        background-color: #e53935;
        color: white;
        width: 100%;
    }

    .btn-delete:hover {
        background-color: #b71c1c;
        box-shadow: 0 4px 10px rgba(183, 28, 28, 0.5);
    }

    /* Back Link */
    .back-link {
        margin-top: 15px;
        display: inline-block;
        font-weight: bold;
        text-decoration: none;
        color: #00796b;
        transition: color 0.3s ease;
    }

    .back-link:hover {
        color: #004d40;
        text-decoration: underline;
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

    /* Responsive */
    @media (max-width: 600px) {
        .container {
            padding: 20px;
        }

        .container h2 {
            font-size: 20px;
        }
    }
</style>
</head>
<body>

<%
    Branch branch = (Branch) session.getAttribute("branch");
    if (branch == null) {
%>
    <div class="container">
        <p style="color:red;">Session expired. Please <a href="BranchLogin.jsp">login again</a>.</p>
    </div>
<%
        return;
    }
    int id = branch.getId();
    String name = branch.getName();
    String mail = branch.getMail();
    String password = branch.getPassword();
%>

<div class="container">
    <h2>Update Branch Profile</h2>
    <form action="BranchUpdate.jsp" method="post">
        <input type="hidden" name="id" value="<%=id%>">

        <label for="name">Branch Name</label>
        <input type="text" id="name" name="name" value="<%=name%>" required>

        <label for="mail">Email</label>
        <input type="email" id="mail" name="mail" value="<%=mail%>" required>

        <label for="password">Password</label>
        <input type="text" id="password" name="password" value="<%=password%>" required>

        <div style="display: flex; gap: 10px; justify-content: space-between;">
            <button type="reset" class="btn btn-reset">Reset</button>
            <button type="submit" class="btn btn-update">Update</button>
        </div>
    </form>

    <form action="BranchDelete.jsp" method="get">
        <button class="btn btn-delete" type="submit">Delete Account</button>
    </form>

    <a href="BranchHome.jsp" class="back-link"> Back to Dashboard</a>
</div>

</body>
</html>
