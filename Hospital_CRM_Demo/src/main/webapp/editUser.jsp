<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String userId = request.getParameter("id");
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    String url = "jdbc:mysql://localhost:3306/saka_crm_";
    String username = "root";
    String password = "root";

    String firstName = "", lastName = "", email = "", phone = "", address = "", designation = "", department = "";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, username, password);
        stmt = conn.prepareStatement("SELECT * FROM user WHERE id = ?");
        stmt.setString(1, userId);
        rs = stmt.executeQuery();

        if (rs.next()) {
            firstName = rs.getString("firstName");
            lastName = rs.getString("lastName");
            email = rs.getString("email");
            phone = rs.getString("phone");
            address = rs.getString("address");
            designation = rs.getString("designation");
            department = rs.getString("department");
        }
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    } finally {
        try { if (rs != null) rs.close(); } catch (Exception e) {}
        try { if (stmt != null) stmt.close(); } catch (Exception e) {}
        try { if (conn != null) conn.close(); } catch (Exception e) {}
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Edit User</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet">
    <style type="text/css">
   
    </style>
</head>
<body class="bg-light">

<div class="container mt-5">
    <h2>Edit Staff Details</h2>
    <form action="UpdateUserServlet" method="post">
        <input type="hidden" name="id" value="<%= userId %>">
        <div class="mb-3">
            <label>First Name</label>
            <input type="text" name="firstName" class="form-control" value="<%= firstName %>">
        </div>
        <div class="mb-3">
            <label>Last Name</label>
            <input type="text" name="lastName" class="form-control" value="<%= lastName %>">
        </div>
        <div class="mb-3">
            <label>Email</label>
            <input type="email" name="email" class="form-control" value="<%= email %>">
        </div>
        <div class="mb-3">
            <label>Phone</label>
            <input type="text" name="phone" class="form-control" value="<%= phone %>">
        </div>
        <div class="mb-3">
            <label>Address</label>
            <textarea name="address" class="form-control"><%= address %></textarea>
        </div>
        <div class="mb-3">
            <label>Designation</label>
            <input type="text" name="designation" class="form-control" value="<%= designation %>">
        </div>
        <div class="mb-3">
            <label>Department</label>
            <input type="text" name="department" class="form-control" value="<%= department %>">
        </div>
        <button type="submit" class="btn btn-primary">Update</button>
    </form>
</div>

</body>
</html>
