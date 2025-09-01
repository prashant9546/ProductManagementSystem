<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Product Management System</title>
<style>
    /* ---------- Global Reset ---------- */
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }

    body {
        min-height: 100vh;
        display: flex;
        flex-direction: column;
        background: linear-gradient(135deg, #ff6a00, #ee0979, #00c9ff, #92fe9d);
        background-size: 400% 400%;
        animation: gradientBG 10s ease infinite;
    }

    /* ---------- Header ---------- */
    header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        background: rgba(255, 255, 255, 0.15);
        backdrop-filter: blur(12px);
        padding: 18px 60px;
        box-shadow: 0 4px 15px rgba(0, 0, 0, 0.3);
        position: sticky;
        top: 0;
        z-index: 1000;
    }

    .logo {
        display: flex;
        align-items: center;
    }

    .logo img {
        height: 60px;
        margin-right: 15px;
        animation: logoPop 1.5s ease-in-out infinite alternate;
    }

    .logo h2 {
        font-size: 30px;
        color: #fff;
        font-weight: 700;
        letter-spacing: 1px;
    }

    /* ---------- Container ---------- */
    .container {
        flex: 1;
        display: flex;
        justify-content: center;
        align-items: center;
        padding: 40px;
    }

    .card {
        background: rgba(255, 255, 255, 0.2);
        padding: 40px 50px;
        border-radius: 25px;
        backdrop-filter: blur(20px);
        box-shadow: 0 8px 30px rgba(0, 0, 0, 0.3);
        text-align: center;
        max-width: 500px;
        width: 100%;
        animation: fadeIn 1s ease-in-out;
    }

    .card h1 {
        font-size: 32px;
        color: #fff;
        margin-bottom: 30px;
        text-transform: uppercase;
        letter-spacing: 1px;
        font-weight: bold;
    }

    /* ---------- Buttons ---------- */
    .card form {
        margin: 15px 0;
    }

    button {
        height: 55px;
        width: 100%;
        border-radius: 15px;
        background: linear-gradient(135deg, #ff6a00, #ee0979);
        color: white;
        font-size: 18px;
        cursor: pointer;
        border: none;
        font-weight: 600;
        letter-spacing: 1px;
        transition: all 0.3s ease-in-out;
        box-shadow: 0 5px 20px rgba(0, 0, 0, 0.3);
    }

    button:nth-child(2) {
        background: linear-gradient(135deg, #00c6ff, #0072ff);
    }

    button:hover {
        transform: scale(1.05);
        filter: brightness(1.1);
        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.4);
    }

    /* ---------- Footer ---------- */
    footer {
        text-align: center;
        padding: 18px;
        background: rgba(255, 255, 255, 0.15);
        backdrop-filter: blur(10px);
        color: #fff;
        font-size: 15px;
        letter-spacing: 0.5px;
        box-shadow: 0 -3px 15px rgba(0, 0, 0, 0.3);
    }

    /* ---------- Animations ---------- */
    @keyframes gradientBG {
        0% { background-position: 0% 50%; }
        50% { background-position: 100% 50%; }
        100% { background-position: 0% 50%; }
    }

    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(40px); }
        to { opacity: 1; transform: translateY(0); }
    }

    @keyframes logoPop {
        from { transform: scale(1); }
        to { transform: scale(1.1); }
    }

    /* ---------- Responsive Design ---------- */
    @media (max-width: 768px) {
        header {
            padding: 15px 20px;
        }

        .logo h2 {
            font-size: 24px;
        }

        .card {
            padding: 30px 25px;
        }

        .card h1 {
            font-size: 24px;
        }

        button {
            font-size: 16px;
            height: 50px;
        }
    }
</style>
</head>
<body>

    <!-- ---------- Header ---------- -->
    <header>
        <div class="logo">
            <img src="https://cdn-icons-png.flaticon.com/512/263/263115.png" alt="Store Logo" />
            <h2>Product Store</h2>
        </div>
    </header>

    <!-- ---------- Main Content ---------- -->
    <div class="container">
        <div class="card">
            <h1>Product Management System</h1>
            <form action="BranchLogin.jsp">
                <button>Branch Login</button>
            </form>
            <form action="CustomerLogin.jsp">
                <button>Customer Login</button>
            </form>
        </div>
    </div>

    <!-- ---------- Footer ---------- -->
    <footer>
        &copy; 2025 Product Store. All Rights Reserved Designed by PRASHANT.
    </footer>

</body>
</html>
