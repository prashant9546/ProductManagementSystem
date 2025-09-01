<%@page import="org.jsp.Dto.Customer"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Customer Dashboard</title>
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
    }

    /* Header */
    .header {
        width: 100%;
        background: linear-gradient(to right, #00838f, #26c6da);
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
        font-size: 22px;
        font-weight: bold;
        letter-spacing: 0.5px;
    }

    .header-buttons {
        display: flex;
        gap: 10px;
    }

    .header-buttons form {
        margin: 0;
    }

    .header-buttons button {
        padding: 8px 14px;
        border: none;
        border-radius: 6px;
        background-color: #ffffff;
        color: #00838f;
        font-size: 14px;
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
        max-width: 1000px;
        margin: 40px auto;
        padding: 20px;
    }

    .dashboard h1 {
        text-align: center;
        margin-bottom: 25px;
        color: #006064;
        font-size: 30px;
        letter-spacing: 1px;
    }

    /* Card Grid */
    .cards {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
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
        color: #00838f;
        font-size: 22px;
        margin-bottom: 15px;
    }

    .card p {
        font-size: 14px;
        color: #555;
        margin-bottom: 20px;
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
        box-shadow: 0 4px 10px rgba(0, 151, 167, 0.5);
    }

    /* Footer */
    footer {
        margin-top: 40px;
        background-color: #00838f;
        color: white;
        text-align: center;
        padding: 15px;
        font-size: 14px;
        box-shadow: 0 -2px 8px rgba(0, 0, 0, 0.3);
    }

    /* Responsive */
    @media (max-width: 768px) {
        .header {
            flex-direction: column;
            text-align: center;
        }

        .header-buttons {
            margin-top: 10px;
        }

        .dashboard h1 {
            font-size: 24px;
        }
    }
</style>
</head>
<body>

<%
    Customer customer = (Customer) session.getAttribute("customer");
    if (customer == null) {
        response.sendRedirect("CustomerLogin.jsp");
        return;
    }
%>

<!-- Header -->
<div class="header">
    <h2>Welcome, <%= customer.getName() %> </h2>
    <div class="header-buttons">
        <form action="CustomerProfile.jsp">
            <button>Profile</button>
        </form>
        <form action="Logout.jsp">
            <button class="logout-btn">Logout</button>
        </form>
    </div>
</div>

<!-- Dashboard -->
<div class="dashboard">
    <h1>Customer Dashboard</h1>
    <div class="cards">
        <div class="card">
            <h3>Buy Products</h3>
            <p>Explore and purchase products from our store.</p>
            <form action="CustomerDisplayAllProducts.jsp" method="get">
                <button>Buy Now</button>
            </form>
        </div>

        <div class="card">
            <h3>Purchased Products</h3>
            <p>View the products you have already purchased.</p>
            <form action="customerPurchased.jsp" method="get">
                <button>View Orders</button>
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
