package web;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet("/BlogServlet")
public class BlogServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the input parameters from the form
        String title = request.getParameter("title");
        String category = request.getParameter("category");
        String content = request.getParameter("content");

        if (title == null || title.isEmpty() || category == null || category.isEmpty() || content == null || content.isEmpty()) {
            request.setAttribute("errorMessage", "Title, category, and content are required fields.");
        } else {
            // Establish a database connection (Replace with your database connection details)
            Connection con = null;
            PreparedStatement preparedStatement = null;

            try {
                // Load the JDBC driver
                Class.forName("oracle.jdbc.OracleDriver");

                // Connect to the database
                con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "Harshit", "123");

                // SQL query to insert the blog post into the database
                String sql = "INSERT INTO blog_posts (title, category, content) VALUES (?, ?, ?)";
                preparedStatement = con.prepareStatement(sql);
                preparedStatement.setString(1, title);
                preparedStatement.setString(2, category);
                preparedStatement.setString(3, content);

                // Execute the SQL query
                preparedStatement.executeUpdate();

                // Redirect to a success page
                response.sendRedirect("dashboard.jsp");
            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("errorMessage", "Blog post creation failed. Please try again.");
                // Forward to an error page or return an error response
                //request.getRequestDispatcher("error.jsp").forward(request, response);
            } finally {
                // Close the database resources
                try {
                    if (preparedStatement != null) {
                        preparedStatement.close();
                    }
                    if (con != null) {
                        con.close();
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
