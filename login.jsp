<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login - Technical Blog</title>
    <link href="css/login.css" rel="stylesheet" type="text/css"/>
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
    <center><h1>Login to Your Account</h1></center>
    <section class="content">
        <form action="LoginServlet" method="post">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required>
            <br>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
            <br>
            <div class="button-container">
                <input type="submit" value="Login">
                <input type="reset" value="Reset">
            </div>
            <center><p>Don't have an Account?<a href="register.jsp">Register here..</a></p></center>
        </form>
    </section>
    <footer>
        <center><p>&copy; 2023 Technical Blog. All rights reserved.</p></center>
    </footer>
</body>
</html>
