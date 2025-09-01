<%@page import="org.jsp.Dto.Branch"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Branch Dashboard</title>
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
        line-height: 1.6;
    }

    /* Header */
    .header {
        width: 100%;
        background: linear-gradient(to right, #00796b, #26c6da);
        padding: 15px 30px;
        display: flex;
        justify-content: space-between;
        align-items: center;
        color: white;
        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.3);
        position: sticky;
        top: 0;
        z-index: 1000;
    }

    .header h2 {
        font-size: 24px;
        font-weight: bold;
        letter-spacing: 1px;
    }

    .header-buttons {
        display: flex;
        gap: 12px;
    }

    .header-buttons form {
        margin: 0;
    }

    .header-buttons button {
        padding: 8px 16px;
        border: none;
        border-radius: 6px;
        background-color: #ffffff;
        color: #00796b;
        font-size: 15px;
        font-weight: bold;
        cursor: pointer;
        transition: 0.3s ease-in-out;
    }

    .header-buttons button:hover {
        background-color: #004d40;
        color: white;
    }

    .logout-btn {
        background-color: #e53935;
        color: white;
    }

    .logout-btn:hover {
        background-color: #b71c1c;
    }

    /* Dashboard Container */
    .dashboard {
        max-width: 1200px;
        margin: 30px auto;
        padding: 20px;
    }

    .dashboard h1 {
        text-align: center;
        margin-bottom: 25px;
        color: #004d40;
        font-size: 30px;
        letter-spacing: 1px;
    }

    /* Cards Grid */
    .cards {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(260px, 1fr));
        gap: 20px;
        margin-top: 20px;
    }

    /* Card Styling */
    .card {
        background-color: #ffffff;
        border-radius: 12px;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
        padding: 25px 20px;
        text-align: center;
        transition: transform 0.3s ease, box-shadow 0.3s ease;
        cursor: pointer;
    }

    .card:hover {
        transform: translateY(-8px);
        box-shadow: 0 8px 20px rgba(0, 0, 0, 0.3);
    }

    .card h3 {
        color: #00796b;
        font-size: 20px;
        margin-bottom: 15px;
    }

    .card button {
        background-color: #26c6da;
        color: white;
        padding: 10px 20px;
        border: none;
        border-radius: 8px;
        font-size: 16px;
        font-weight: bold;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    .card button:hover {
        background-color: #0097a7;
    }

    /* Footer */
    footer {
        margin-top: 40px;
        background-color: #00796b;
        color: white;
        text-align: center;
        padding: 15px;
        font-size: 14px;
        box-shadow: 0 -2px 8px rgba(0, 0, 0, 0.3);
    }

    /* Responsive Design */
    @media (max-width: 768px) {
        .header {
            flex-direction: column;
            text-align: center;
        }

        .header-buttons {
            margin-top: 10px;
        }
    }
</style>
</head>
<body>
<%
    Branch branch = (Branch) session.getAttribute("branch");
    if (branch == null) {
        response.sendRedirect("BranchLogin.jsp");
        return;
    }
%>

<!-- Header -->
<div class="header">
    <h2>Welcome, Mr. <%= branch.getName() %> </h2>
    <div class="header-buttons">
        <form action="BranchProfile.jsp">
            <button>Profile</button>
        </form>
        <form action="Logout.jsp">
            <button class="logout-btn">Log Out</button>
        </form>
    </div>
</div>

<!-- Dashboard -->
<div class="dashboard">
    <h1>Branch Dashboard</h1>
    <div class="cards">
        <div class="card">
            <h3>Add New Product</h3>
            <form action="BranchAddProduct.jsp">
                <button>Add Product</button>
            </form>
        </div>

        <div class="card">
            <h3>Remove Product</h3>
            <form action="BranchRemoveProduct.jsp">
                <button>Remove Product</button>
            </form>
        </div>

        <div class="card">
            <h3>Update Product</h3>
            <form action="BranchUpdateProduct.jsp">
                <button>Update Product</button>
            </form>
        </div>

        <div class="card">
            <h3>Display Product</h3>
            <form action="BranchDisplayProduct.jsp">
                <button>View Product</button>
            </form>
        </div>

        <div class="card">
            <h3>Display All Products</h3>
            <form action="BranchDisplayAllProduct.jsp">
                <button>View All Products</button>
            </form>
        </div>
    </div>
</div>

<!-- Footer -->
<footer>
    &copy; 2025 Store Management System | Designed by Prashant
</footer>
</body>
</html>
