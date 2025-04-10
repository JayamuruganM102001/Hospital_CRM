package com;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/demo1")
public class login extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("uname");
        String password = request.getParameter("pword");

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        PrintWriter out = response.getWriter();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/saka_crm_", "root", "root");

            // Admin login check
//            if ("admin".equals(username) && "admin".equals(password)) {
//                request.setAttribute("isAdmin", true);
//                RequestDispatcher rd = request.getRequestDispatcher("admin_dashboard.jsp");
//                rd.forward(request, response);
//                return;
//            }

            // User login check
            String sql = "SELECT * FROM user WHERE user_id = ? AND password = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            rs = ps.executeQuery();

            if (rs.next()) {
            	String desc=rs.getString("designation");
            	if(desc.equals("Doctor")) {
            		RequestDispatcher rd = request.getRequestDispatcher("doctor_dashboard.html");
                    rd.forward(request, response);
            	}
            	if(desc.equals("Nurse")) {
            		RequestDispatcher rd = request.getRequestDispatcher("Nurse_dashboard.html");
                    rd.forward(request, response);
            	}
            	if(desc.equals("Pharmacist")) {
            		RequestDispatcher rd = request.getRequestDispatcher("Pharmacy.html");
                    rd.forward(request, response);
            	}
            	if(desc.equals("Admin")) {
            		RequestDispatcher rd = request.getRequestDispatcher("admin_dashboard.jsp");
                    rd.forward(request, response);
            	}
                
            } else {
                out.println("<script type='text/javascript'>");
                out.println("alert('No user found');");
                out.println("window.location.href='index.html';");
                out.println("</script>");
            }

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        } finally {
            try { if (rs != null) rs.close(); } catch (Exception e) { e.printStackTrace(); }
            try { if (ps != null) ps.close(); } catch (Exception e) { e.printStackTrace(); }
            try { if (conn != null) conn.close(); } catch (Exception e) { e.printStackTrace(); }
        }
    }
}
