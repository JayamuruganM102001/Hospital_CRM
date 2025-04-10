package com;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

//import org.mindrot.jbcrypt.BCrypt;

@WebServlet("/CreateUserServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2,     // 2MB
                 maxFileSize = 1024 * 1024 * 10,          // 10MB
                 maxRequestSize = 1024 * 1024 * 50)       // 50MB
public class CreateUserServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private static final String UPLOAD_DIR = "uploads";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Form data
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String userid = request.getParameter("userid");
        String pass = request.getParameter("pass");
        String designation = request.getParameter("designation");
        String department = request.getParameter("department");

        // File upload logic
        Part filePart = request.getPart("photo");
        String fileName = System.currentTimeMillis() + "_" + filePart.getSubmittedFileName(); // avoid duplicates

        String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdir();

        String filePath = uploadPath + File.separator + fileName;
        filePart.write(filePath);

        // Hash the password
//        String hashedPass = BCrypt.hashpw(pass, BCrypt.gensalt());

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/saka_crm_", "root", "root");

            String sql = "INSERT INTO user (firstName, lastName, email, phone, address, designation, department, user_id, password, photo) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, firstName);
            stmt.setString(2, lastName);
            stmt.setString(3, email);
            stmt.setString(4, phone);
            stmt.setString(5, address);
            stmt.setString(6, designation);
            stmt.setString(7, department);
            stmt.setString(8, userid);
            stmt.setString(9, pass);
            stmt.setString(10, fileName); // store only the filename

            stmt.executeUpdate();
            response.sendRedirect("User.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
