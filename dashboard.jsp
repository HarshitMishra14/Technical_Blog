<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dashboard - Technical Blog</title>
    <link href="css/dashboard.css" rel="stylesheet" type="text/css"/>
</head>
<body>
    <header>
        <h1>Welcome to our Technical Blog</h1>
        <p>Your source for the latest tech news and tutorials</p>
    </header>
    <section class="content">
        <h2>Dashboard Links</h2>
        <ul>
            <li><a href="blog.jsp">Create a New Blog</a></li>
        </ul>
        <br>
        <form action="LogoutServlet" method="get">
            <input type="submit" value="Logout">
        </form>
    </section>
    <footer>
        <p>&copy; 2023 Technical Blog. All rights reserved.</p>
    </footer>
</body>
</html>
