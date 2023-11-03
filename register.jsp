<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register - Technical Blog</title>
    <link href="register.css" rel="stylesheet" type="text/css"/>
</head>
<body>
    <header>
        <h1>Welcome to our Technical Blog</h1>
        <p>Your source for the latest tech news and tutorials</p>
    </header>
    <nav>
        <ul>
            <li><a href="home.jsp">Home</a></li>
            <li><a href="about.jsp">About Us</a></li>
            <li><a href="register.jsp">Sign Up</a></li>
            <li><a href="login.jsp">Login</a></li>
        </ul>
    </nav>
    <br/>
    <br/>
    <center><h1>Create Your Account</h1></center>
    <center><section class="content">
        <form action="RegisterServlet" method="post">
            <label for="username">Username:</label>
                <input type="text" id="username" name="username" required>
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required>
                <label for="confirmPassword">Confirm Password:</label>
                <input type="password" id="confirmPassword" name="confirmPassword" required>
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>
                <br/>
                <br/>
                <button type="submit">Register</button>
                <center><p>Already have an Account?<a href="login.jsp">Login here..</a></p></center>
            </form>
        </section></center>
    <footer>
        <p>&copy; 2023 Technical Blog. All rights reserved.</p>
    </footer>
</body>
</html>
