<%@ page import="java.sql.*"%>
<%
int doctorCount = 0;
int nurseCount = 0;
int pharmacistCount = 0;
int admin = 0;

String url = "jdbc:mysql://localhost:3306/saka_crm_";
String username = "root";
String password = "root";

try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = DriverManager.getConnection(url, username, password);
	Statement stmt = conn.createStatement();

	ResultSet rs1 = stmt.executeQuery("SELECT COUNT(*) FROM user WHERE designation = 'Doctor'");
	if (rs1.next())
		doctorCount = rs1.getInt(1);

	ResultSet rs2 = stmt.executeQuery("SELECT COUNT(*) FROM user WHERE designation = 'Nurse'");
	if (rs2.next())
		nurseCount = rs2.getInt(1);

	ResultSet rs3 = stmt.executeQuery("SELECT COUNT(*) FROM user WHERE designation = 'Pharmacist'");
	if (rs3.next())
		pharmacistCount = rs3.getInt(1);

	ResultSet rs4 = stmt.executeQuery("SELECT COUNT(*) FROM user WHERE designation = 'Admin'");
	if (rs4.next())
		admin = rs4.getInt(1);
	

	conn.close();
} catch (Exception e) {
	e.printStackTrace();
}
%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Dashboard | Admin</title>
<script src="https://cdn.tailwindcss.com"></script>
<link rel="stylesheet" href="./dash.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
<style type="text/css">
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
	flex:column;
	align-items: center;
	transition: transform 0.3s ease, box-shadow 0.3s ease;
}
.dashboard-card a {
  display: flex;
  align-items: center; /* optional: centers items vertically */
  justify-content: space-between; /* optional: spreads items horizontally */
  text-decoration: none; /* optional: removes underline from links */
  color: inherit; /* optional: keeps the text color consistent */
}


.dashboard-card:hover {
	transform: translateY(-4px);
	box-shadow: 0 10px 20px rgba(0, 0, 0, 0.15);
}

.dashboard-card .icon {
	background-color: #3b82f6;
	padding: 1rem;
	width: 70px;
	height: 70px;
	border-radius: 50%;
	font-size: 40px;
	display: flex;
	justify-content: center;
	align-items: center;
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
	background-color: rgb(70, 111, 243);
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

<body
	class="bg-gray-100 dark:bg-gray-900 dark:text-white transition-colors duration-300">
	<div class="flex h-screen">

		<!-- Sidebar -->
		<div
			class="w-64 bg-white dark:bg-gray-800 shadow-md transform transition-transform duration-300 ease-in-out lg:translate-x-0 -translate-x-full lg:block"
			id="sidebar">
			<div class="p-4 flex items-center">
				<img src="image/logo.png" width="40" height="40" class="mr-2"
					alt="Logo" /> <span class="text-xl font-bold">SAKA</span>
			</div>
			<div class="p-4">
				<input type="text" placeholder="Search"
					class="w-full p-2 border rounded" />
			</div>
			<nav class="p-4">
				<ul>
					<li><a class="nav-link active" href="#"><i
							class="fas fa-tachometer-alt mr-2"></i>Dashboard</a></li>
					<li><a class="nav-link" href="#"><i
							class="fas fa-id-card mr-2"></i>Patient Smart Cards</a></li>
					<li><a class="nav-link" href="User.jsp"><i
							class="fas fa-users mr-2"></i>Users</a></li>
					<li><a class="nav-link" href="#"><i
							class="fas fa-calendar-alt mr-2"></i>Appointments</a></li>
					<li><a class="nav-link" href="#"><i
							class="fas fa-procedures mr-2"></i>IPD - Patient In</a></li>
					<li><a class="nav-link" href="#"><i
							class="fas fa-walking mr-2"></i>OPD - Patient Out</a></li>
					<li><a class="nav-link" href="#"><i
							class="fas fa-file-invoice-dollar mr-2"></i>Billings</a></li>
					<li><a class="nav-link" href="#"><i
							class="fas fa-bed mr-2"></i>Bed Management</a></li>
					<li><a class="nav-link" href="#"><i
							class="fas fa-tint mr-2"></i>Blood Banks</a></li>
					<li><a class="nav-link" href="#"><i
							class="fas fa-file-alt mr-2"></i>Documents</a></li>
					<li><a class="nav-link" href="#"><i
							class="fas fa-user-md mr-2"></i>Doctors</a></li>
					<li><a class="nav-link" href="#"><i
							class="fas fa-prescription-bottle-alt mr-2"></i>Prescriptions</a></li>
					<li><a class="nav-link" href="#"><i
							class="fas fa-diagnoses mr-2"></i>Diagnosis</a></li>
				</ul>
			</nav>
		</div>

		<!-- Main Content -->
		<div class="flex-1 flex flex-col">

			<!-- Header -->
			<header
				class="flex items-center justify-between p-4 bg-white dark:bg-gray-800 shadow-md">
				<div class="flex items-center">
					<button class="text-gray-500 focus:outline-none lg:hidden"
						id="sidebarToggle">
						<i class="fas fa-bars"></i>
					</button>
					<h1 class="text-xl font-bold ml-4">Dashboard</h1>
				</div>
				<div class="flex items-center">
					<button class="text-gray-500 focus:outline-none"
						id="darkModeToggle">
						<i class="fas fa-moon"></i>
					</button>
					<div class="relative ml-4">
						<img src="image/hospital1.jpg" alt="User  Avatar" width="40"
							height="40" class="w-10 h-10 rounded-full" /> <span
							class="absolute bottom-0 right-0 w-3 h-3 bg-green-500 border-2 border-white rounded-full"></span>
					</div>
					<span class="ml-2 text-gray-700 dark:text-white">Admin</span>
				</div>
			</header>

			<!-- Dashboard Content -->
			<main class="p-4 flex-1 overflow-y-auto">
				<div
					class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-4">
					<!-- Doctor Count -->
					<div class="dashboard-card">
						<a href="#" id="doctorsButton">
							<div class="icon">
								<i class="fas fa-user-md"></i>
							</div>
							<div>
								<div class="value"><%=doctorCount%></div>
								<div class="label">Doctors</div>
							</div>
						</a>
					</div>

					<!-- Nurse Count -->
					<div class="dashboard-card">
						<a href="#" id="nurseButton" >
							<div class="icon">
								<i class="fas fa-user-nurse"></i>
							</div>
							<div>
								<div class="value"><%=nurseCount%></div>
								<div class="label">Nurses</div>
							</div>
						</a>
					</div>

					<!-- Pharmacist Count -->
					<div class="dashboard-card">
						<a href="#" id="pharmButton">
							<div class="icon">
								<i class="fas fa-pills"></i>
							</div>
							<div>
								<div class="value"><%=pharmacistCount%></div>
								<div class="label">Pharmacists</div>
							</div>
						</a>
					</div>
					<!-- Admin Count -->
					<div class="dashboard-card">
						<a href="#" id="adminButton">
							<div class="icon">
								<i class="fas fa-lock"></i>
							</div>
							<div>
								<div class="value"><%=admin%></div>
								<div class="label">Admins</div>
							</div>
						</a>
					</div>
				</div>

				<!-- User Table -->
				<div class="container mt-6 px-4">
					<table
						class="table w-full text-sm text-left text-gray-500 dark:text-gray-400"
						id="userTable">
						<thead
							class="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
							<tr>
								<th>ID</th>
								<th>Name</th>
								<th>Email</th>
								<th>Phone</th>
								<th>Designation</th>
								<th>Department</th>
							</tr>
						</thead>
						<tbody>
							<%
							try (Connection conn = DriverManager.getConnection(url, username, password);
									Statement stmt = conn.createStatement();
									ResultSet rs = stmt.executeQuery("SELECT * FROM user")) {
								while (rs.next()) {
									int id = rs.getInt("id");
									String fullName = rs.getString("firstName") + " " + rs.getString("lastName");
							%>
							<tr>
								<td><%=id%></td>
								<td><%=fullName%></td>
								<td><%=rs.getString("email")%></td>
								<td><%=rs.getString("phone")%></td>
								<td><%=rs.getString("designation")%></td>
								<td><%=rs.getString("department")%></td>
							</tr>
							<%
							}
							} catch (Exception e) {
							%>
							<tr>
								<td colspan="6" class="text-red-500">Error: <%=e.getMessage()%></td>
							</tr>
							<%
							}
							%>
						</tbody>
					</table>
				</div>
			</main>
		</div>
	</div>

	
	<script>
    // Dark mode toggle
    document.getElementById("darkModeToggle").addEventListener("click", () => {
        document.body.classList.toggle("dark");
        localStorage.setItem("theme", document.body.classList.contains("dark") ? "dark" : "light");
    });

    window.addEventListener("DOMContentLoaded", () => {
        if (localStorage.getItem("theme") === "dark") {
            document.body.classList.add("dark");
        }
    });

    // Designation-based fetch logic
    const roleButtons = {
        doctorsButton: "fetchDoctors.jsp",
        nurseButton: "fetchNurse.jsp",
        pharmButton: "fetchPharmacists.jsp",
        adminButton: "fetchAdmin.jsp"
    };

    for (const [buttonId, url] of Object.entries(roleButtons)) {
        document.getElementById(buttonId)?.addEventListener("click", () => {
            fetch(url)
                .then(res => res.text())
                .then(data => document.querySelector("#userTable tbody").innerHTML = data)
                .catch(err => console.error(`Error loading data from ${url}:`, err));
        });
    }
</script>

   
</body>
</html>