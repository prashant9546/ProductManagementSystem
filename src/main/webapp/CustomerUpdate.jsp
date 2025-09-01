<%@ page import="org.jsp.Dao.BranchDao" %>
<%@ page import="org.jsp.Dto.Customer" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
    // Fetch session customer
    Customer customer = (Customer) session.getAttribute("customer");
    String message = null;
    String status = null;

    if (customer == null) {
        response.sendRedirect("CustomerLogin.jsp");
        return;
    }

    // Handle form submission
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        try {
            String name = request.getParameter("name");
            String mail = request.getParameter("mail");
            String password = request.getParameter("password");

            // Keep old values if fields are empty
            name = (name == null || name.isEmpty()) ? customer.getName() : name;
            mail = (mail == null || mail.isEmpty()) ? customer.getMail() : mail;
            password = (password == null || password.isEmpty()) ? customer.getPassword() : password;

            // Create updated customer object
            Customer updatedCustomer = new Customer();
            updatedCustomer.setId(customer.getId());
            updatedCustomer.setName(name);
            updatedCustomer.setMail(mail);
            updatedCustomer.setPassword(password);

            // Update database
            BranchDao dao = BranchDao.getBranchDao();
            dao.updateCustomer(updatedCustomer);

            // Update session with new data
            session.setAttribute("customer", updatedCustomer);

            message = "Profile updated successfully!";
            status = "success";
        } catch (Exception e) {
            message = "Error updating profile: " + e.getMessage();
            status = "error";
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Customer Profile</title>
<style>
    /* ---------- Global Styling ---------- */
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }

    body {
        background: linear-gradient(135deg, #ff6a00, #ee0979, #00c9ff, #92fe9d);
        background-size: 400% 400%;
        animation: gradientBG 10s ease infinite;
        min-height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .card {
        background: rgba(255, 255, 255, 0.2);
        padding: 40px 50px;
        border-radius: 20px;
        backdrop-filter: blur(15px);
        box-shadow: 0 8px 25px rgba(0, 0, 0, 0.3);
        max-width: 450px;
        width: 100%;
        text-align: center;
        animation: fadeIn 1s ease-in-out;
    }

    .card h1 {
        font-size: 28px;
        margin-bottom: 20px;
        color: #fff;
        text-transform: uppercase;
        letter-spacing: 1px;
    }

    label {
        display: block;
        margin: 12px 0 5px;
        color: #fff;
        font-weight: 600;
        text-align: left;
    }

    input {
        width: 100%;
        padding: 12px;
        border: none;
        border-radius: 8px;
        margin-bottom: 15px;
        font-size: 16px;
        outline: none;
        box-shadow: 0 2px 8px rgba(0,0,0,0.2);
    }

    button {
        width: 100%;
        height: 50px;
        background: linear-gradient(135deg, #ff6a00, #ee0979);
        border: none;
        color: white;
        font-size: 18px;
        font-weight: bold;
        border-radius: 12px;
        cursor: pointer;
        transition: all 0.3s ease-in-out;
        margin-top: 10px;
        box-shadow: 0 5px 20px rgba(0, 0, 0, 0.3);
    }

    button:hover {
        transform: scale(1.05);
        background: linear-gradient(135deg, #00c9ff, #92fe9d);
        color: #000;
    }

    .message {
        margin-top: 15px;
        padding: 10px;
        border-radius: 8px;
        font-weight: bold;
    }

    .success {
        background: rgba(46, 204, 113, 0.2);
        color: #2ecc71;
    }

    .error {
        background: rgba(231, 76, 60, 0.2);
        color: #e74c3c;
    }

    @keyframes gradientBG {
        0% { background-position: 0% 50%; }
        50% { background-position: 100% 50%; }
        100% { background-position: 0% 50%; }
    }

    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(40px); }
        to { opacity: 1; transform: translateY(0); }
    }
</style>
</head>
<body>

    <div class="card">
        <h1>Update Profile</h1>

        <% if (message != null) { %>
            <div class="message <%=status%>"><%= message %></div>
        <% } %>

        <form method="post">
            <label>Name</label>
            <input type="text" name="name" value="<%= customer.getName() %>" />

            <label>Email</label>
            <input type="email" name="mail" value="<%= customer.getMail() %>" />

            <label>Password</label>
            <input type="password" name="password" placeholder="Enter new password" />

            <button type="submit">Update Profile</button>
        </form>
    </div>

</body>
</html>
