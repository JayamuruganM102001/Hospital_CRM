package com;


import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DeleteUserServlet")

public class DeleteUserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Database credentials
    private final String jdbcURL = "jdbc:mysql://localhost:3306/saka_crm_";
    private final String jdbcUsername = "root";
    private final String jdbcPassword = "root";

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String userIdStr = request.getParameter("id");

        if (userIdStr != null && !userIdStr.isEmpty()) {
            try {
                int userId = Integer.parseInt(userIdStr);

                Class.forName("com.mysql.cj.jdbc.Driver");
                try (Connection conn = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword)) {
                    String sql = "DELETE FROM user WHERE id = ?";
                    try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                        stmt.setInt(1, userId);
                        stmt.executeUpdate();
                    }
                }

                // Redirect to user list after deletion
                response.sendRedirect("User.jsp");

            } catch (Exception e) {
                e.printStackTrace();
                response.getWriter().println("Error deleting user: " + e.getMessage());
            }
        } else {
            response.getWriter().println("Invalid user ID.");
        }
    }
}
