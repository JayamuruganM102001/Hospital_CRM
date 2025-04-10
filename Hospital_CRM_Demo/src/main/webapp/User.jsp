<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Dashboard | Admin</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="./dash.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
    <style type="text/css">
    /* style.css */

.nav-link {
    display: flex;
    align-items: center;
    padding: 0.5rem;
    color: #4a5568;
    border-radius: 0.375rem;
    transition: background-color 0.3s, color 0.3s;
  }
  .nav-link:hover {
    background-color: #edf2f7;
  }
  .nav-link.active {
    background-color: #e2e8f0;
  }
  body.dark .nav-link:hover {
    background-color: #2d3748;
  }
  body.dark .nav-link.active {
    background-color: #4a5568;
    color: white;
  }
  
  .dashboard-card {
    background-color: white;
    padding: 1rem;
    border-radius: 0.5rem;
    box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
    display: flex;
    align-items: center;
    transition: transform 0.3s ease, box-shadow 0.3s ease;
  }
  .dashboard-card:hover {
    transform: translateY(-4px);
    box-shadow: 0 10px 20px rgba(0, 0, 0, 0.15);
  }
  .dashboard-card .icon {
    background-color: #3b82f6;
    padding: 1rem;
    border-radius: 9999px;
    color: white;
    margin-right: 1rem;
  }
  .dashboard-card .value {
    font-size: 1.25rem;
    font-weight: bold;
    color: #3b82f6;
  }
  .dashboard-card .label {
    color: #6b7280;
  }
  body.dark .dashboard-card {
    background-color: #1f2937;
  }
  body.dark .dashboard-card .label {
    color: #d1d5db;
  }
  /* Custom table design */
.table {
  width: 100%;
  border-collapse: collapse;
  background-color: white;
  border: 1px solid #dee2e6;
  border-radius: 0.5rem;
  overflow: hidden;
  margin-top: 20px;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
}

.table thead {
  background-color: rgb(1, 156, 19);
  color: white;
}

.table th, .table td {
  padding: 0.75rem 1rem;
  text-align: left;
  border-bottom: 1px solid #e5e7eb;
  vertical-align: middle;
}

.table tbody tr:hover {
  background-color: #f1f5f9;
}

.btn {
  padding: 0.375rem 0.75rem;
  border-radius: 0.375rem;
  font-size: 0.875rem;
  font-weight: 500;
  text-decoration: none;
  color: white;
}

.btn-success {
  background-color: rgb(1, 156, 19);
 
}

.btn-primary {
  background-color: #2563eb;
}

.btn-danger {
  background-color: #dc2626;
}

.btn:hover {
  opacity: 0.9;
}

/* Dark mode adjustments */
body.dark .table {
  background-color: #1f2937;
  color: #f9fafb;
}

body.dark .table thead {
  background-color: rgb(1, 156, 19);
  color: white;
}

body.dark .table tbody tr:hover {
  background-color: #374151;
}
  
  </style>
</head>

<body class="bg-gray-100 dark:bg-gray-900 dark:text-white transition-colors duration-300">
    <div class="flex h-screen">

        <!-- Sidebar -->
        <div class="w-64 bg-white dark:bg-gray-800 shadow-md transform transition-transform duration-300 ease-in-out lg:translate-x-0 -translate-x-full lg:block"
            id="sidebar">
            <div class="p-4 flex items-center">
                <img src="image/logo.png" width="40" height="40" class="mr-2" alt="Logo" />
                <span class="text-xl font-bold">SAKA</span>
            </div>
            <div class="p-4">
                <input type="text" placeholder="Search" class="w-full p-2 border rounded" />
            </div>
            <nav class="p-4">
                <ul>
                    <li><a class="nav-link " href="admin_dashboard.jsp"><i class="fas fa-tachometer-alt mr-2"></i>Dashboard</a></li>
                    <li><a class="nav-link" href="#"><i class="fas fa-id-card mr-2"></i>Patient Smart Cards</a></li>
                    <li><a class="nav-link active" href="User.jsp"><i class="fas fa-users mr-2"></i>Users</a></li>
                    <li><a class="nav-link" href="#"><i class="fas fa-calendar-alt mr-2"></i>Appointments</a></li>
                    <li><a class="nav-link" href="#"><i class="fas fa-procedures mr-2"></i>IPD - Patient In</a></li>
                    <li><a class="nav-link" href="#"><i class="fas fa-walking mr-2"></i>OPD - Patient Out</a></li>
                    <li><a class="nav-link" href="#"><i class="fas fa-file-invoice-dollar mr-2"></i>Billings</a></li>
                    <li><a class="nav-link" href="#"><i class="fas fa-bed mr-2"></i>Bed Management</a></li>
                    <li><a class="nav-link" href="#"><i class="fas fa-tint mr-2"></i>Blood Banks</a></li>
                    <li><a class="nav-link" href="#"><i class="fas fa-file-alt mr-2"></i>Documents</a></li>
                    <li><a class="nav-link" href="#"><i class="fas fa-user-md mr-2"></i>Doctors</a></li>
                    <li><a class="nav-link" href="#"><i
                                class="fas fa-prescription-bottle-alt mr-2"></i>Prescriptions</a></li>
                    <li><a class="nav-link" href="#"><i class="fas fa-diagnoses mr-2"></i>Diagnosis</a></li>
                </ul>
            </nav>
        </div>

        <!-- Main Content -->
         <main class="flex-1 flex flex-col">
            <header class="flex items-center justify-between p-4 bg-white dark:bg-gray-800 shadow-md">
                <div class="flex items-center">
                    <h1 class="text-xl font-bold ml-4">User</h1>
                </div>
                <div class="flex items-center">
                    <img src="image/hospital1.jpg" alt="User Avatar" class="w-10 h-10 rounded-full" />
                    <span class="ml-2 text-gray-700 dark:text-white">Admin</span>
                </div>
            </header>

            <div class="container mt-5 px-4">
                <a class="btn btn-success mb-3" href="CreateUser.jsp" style="margin-bottom: 20px">New User</a>
                <table class="table">
                    <thead class="table-dark">
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Phone</th>
                            <th>Address</th>
                            <th>Designation</th>
                            <th>Department</th>
                            <th>Created At</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            String url = "jdbc:mysql://localhost:3306/saka_crm_";
                            String dbUser = "root";
                            String dbPass = "root";
                            try (Connection conn = DriverManager.getConnection(url, dbUser, dbPass);
                                 Statement stmt = conn.createStatement();
                                 ResultSet rs = stmt.executeQuery("SELECT * FROM user")) {
                                while (rs.next()) {
                                    int id = rs.getInt("id");
                                    String fullName = rs.getString("firstName") + " " + rs.getString("lastName");
                        %>
                        <tr>
                            <td><%= id %></td>
                            <td><%= fullName %></td>
                            <td><%= rs.getString("email") %></td>
                            <td><%= rs.getString("phone") %></td>
                            <td><%= rs.getString("address") %></td>
                            <td><%= rs.getString("designation") %></td>
                            <td><%= rs.getString("department") %></td>
                            <td><%= rs.getTimestamp("createdAt") %></td>
                            <td>
                            <div style="display: flex; gap: 2px;">
                                <a class="btn btn-sm btn-primary" href="editUser.jsp?id=<%= id %>">Edit</a>
                               
                                <a class="btn btn-sm btn-danger" href="DeleteUserServlet?id=<%= id %>" onclick="return confirm('Are you sure?')">Delete</a>
                            </div>
                                
                                
                                	
                            </td>
                        </tr>
                        <%
                                }
                            } catch (Exception e) {
                        %>
                        <tr><td colspan="9" class="text-danger">Error: <%= e.getMessage() %></td></tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </main>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js"></script>
    </body>
    </html>
    