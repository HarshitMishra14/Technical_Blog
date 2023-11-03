package web;
import java.io.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
       @Override
       protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve user input from the registration form
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        String email = request.getParameter("email");

        // Perform validation (add more validation as needed)
        if (!password.equals(confirmPassword)) {
            request.setAttribute("errorMessage", "Password and confirm password do not match.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("register.jsp");
            dispatcher.forward(request, response);
            return;
        }

        // Store user data in the database
        Connection con = null;
        PreparedStatement preparedStatement = null;
        try {
            // Load the JDBC driver
            Class.forName("oracle.jdbc.OracleDriver");

            // Establish a database connection
            con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","Harshit","123");

            // Define the SQL query to insert user data
            String sql = "INSERT INTO users (username, password, email) VALUES (?, ?, ?)";
            preparedStatement = con.prepareStatement(sql);
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, password);
            preparedStatement.setString(3, email);

            // Execute the SQL query
            preparedStatement.executeUpdate();

            // Redirect the user to a success page or login page
            response.sendRedirect("login.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Registration failed. Please try again.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("register.jsp");
            dispatcher.forward(request, response);
        } finally {
            // Close the database resources
            try {
                if (preparedStatement != null) {
                    preparedStatement.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
