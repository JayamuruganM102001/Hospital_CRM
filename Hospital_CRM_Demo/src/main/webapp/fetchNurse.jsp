<%@ page import="java.sql.*" %>
<%
    String url = "jdbc:mysql://localhost:3306/saka_crm_";
    String username = "root";
    String password = "root";

    try (Connection conn = DriverManager.getConnection(url, username, password);
         Statement stmt = conn.createStatement();
         ResultSet rs = stmt.executeQuery("SELECT * FROM user WHERE designation = 'Nurse'")) {
        while (rs.next()) {
            int id = rs.getInt("id");
            String fullName = rs.getString("firstName") + " " + rs.getString("lastName");
%>
            <tr>
                <td><%= id %></td>
                <td><%= fullName %></td>
                <td><%= rs.getString("email") %></td>
                <td><%= rs.getString("phone") %></td>
                <td><%= rs.getString("designation") %></td>
                <td><%= rs.getString("department") %></td>
            </tr>
<%
        }
    } catch (Exception e) {
%>
    <tr><td colspan="6" class="text-red-500">Error: <%= e.getMessage() %></td></tr>
<%
    }
%>