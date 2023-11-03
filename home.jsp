<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Technical Blog</title>
    <link href="style.css" rel="stylesheet" type="text/css"/>
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

    <main>
        <center><h1>Latest Posts</h1></center>
        <section class="featured-posts">
            <%
                Connection con = null;
                PreparedStatement preparedStatement = null;
                try {
                    // Load the JDBC driver
                    Class.forName("oracle.jdbc.OracleDriver");

                    // Establish a database connection
                    con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "Harshit", "123");

                    // Define and execute your SQL query to retrieve all blog posts
                    String qry = "SELECT * FROM blog_posts";
                    preparedStatement = con.prepareStatement(qry);
                    ResultSet resultSet = preparedStatement.executeQuery();

                    // Process the results and display all the blog posts
                    while (resultSet.next()) {
                    String title = resultSet.getString("title");
                    String category = resultSet.getString("category");
                    String content = resultSet.getString("content");
            %>
            <article>
                <h2><%= title %></h2>
                <p>Category: <%= category %></p>
                <p><%= content %></p>
            </article>
            <%
            }
        } catch (Exception e) {
        e.printStackTrace();
         } finally {
            // Close the resources (Connection, PreparedStatement, and ResultSet) in a real application
            if (preparedStatement != null) {
            preparedStatement.close();
        }
        if (con != null) {
            con.close();
        }
    }
%>

        </section>
    </main>

    <footer>
        <p>&copy; 2023 Technical Blog. All rights reserved.</p>
    </footer>
</body>
</html>
