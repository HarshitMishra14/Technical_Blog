<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Blog - Technical Blog</title>
    <link href="blog.css" rel="stylesheet" type="text/css"/>
</head>
<body>
    <header>
        <h1>Welcome to our Technical Blog</h1>
        <p>Your source for the latest tech news and tutorials</p>
    </header>
    <main>
        <section class="blog-post">
            <center><h2>Create a Blog Post</h2></center>
            <form action="BlogServlet" method="post">
                <label for="title">Title:</label>
                <input type="text" id="title" name="title" required>
                
                <label for="category">Category:</label>
                <input type="text" id="category" name="category" required>

                <label for="content">Content:</label>
                <textarea id="content" name="content" rows="8" required></textarea>
                <br/>
                <br/>
                <center><button type="submit">Publish</button></center>
            </form>
        </section>
    </main>
    <footer>
        <p>&copy; 2023 Technical Blog. All rights reserved.</p>
    </footer>
</body>
</html>
