<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Create New User</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #dbeafe, #ffffff);
            background: url('image/hospital2.jpg') no-repeat center center/cover;
            animation: fadeIn 1s ease-in-out;
            font-family: 'Arial', sans-serif;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .card {
            border-radius: 20px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
            animation: slideUp 1s ease-in-out;
            transition: transform 0.3s;
        }

        @keyframes slideUp {
            from {
                opacity: 0;
                transform: translateY(40px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .card:hover {
            transform: scale(1.02);
        }

        .form-label {
            font-weight: 500;
            color: #333;
        }

        .form-control {
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
        }

        .form-control:focus {
            border-color: #3b82f6;
            box-shadow: 0 0 0 0.2rem rgba(59, 130, 246, 0.25);
        }

        .btn-success {
            background-color: #28a745;
            border: none;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        .btn-success:hover {
            background-color: #218838;
            transform: scale(1.05);
        }

        .btn-success:active {
            transform: scale(0.95);
        }

        @media (max-width: 768px) {
            .form-row {
                flex-direction: column;
            }
        }

        .footer {
            position: fixed;
            bottom: 0;
            width: 100%;
            text-align: center;
            padding: 10px;
            background-color: #f8f9fa;
            box-shadow: 0 -2px 10px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body>

<div class="container mt-5">
    <div class="card p-4">
        <h2 class="text-center mb-4">Add New Staff</h2>
        
        <form action="CreateUserServlet" method="post" enctype="multipart/form-data">
        
            <div class="row g-4">
                <div class="col-md-6">
                    <label class="form-label">First Name</label>
                    <input type="text" name="firstName" class="form-control" required>
                </div>
                <div class="col-md-6">
                    <label class="form-label">Last Name</label>
                    <input type="text" name="lastName" class="form-control" required>
                </div>
                <div class="col-md-6">
                    <label class="form-label">User  ID</label>
                    <input type="text" name="userid" class="form-control" required>
                </div>
                <div class="col-md-6">
                    <label class="form-label">Password</label>
                    <input type="password" name="pass" class="form-control" required>
                </div>
                <div class="col-md-6">
                    <label class="form-label">Email</label>
                    <input type="email" name="email" class="form-control" required>
                </div>
                <div class="col-md-6">
                    <label class="form-label">Phone</label>
                    <input type="text" name="phone" class="form-control">
                </div>
                <div class="col-md-6">
                    <label class="form-label">Address</label>
                    <textarea name="address" class="form-control" rows="1"></textarea>
                </div>
                <div class="col-md-6">
                    <label class="form-label">Designation</label>                    
                    <select id="designation"
						name="designation" class="form-control" required>
						<option value="">Select Designation</option>
						<option value="Admin">Admin</option>
						<option value="Nurse">Nurse</option>
						<option value="Pharmacist">Pharmacist</option>
						<option value="Doctor">Doctor</option>
						<option value="others">others</option>
					</select>
                </div>
                <div class="col-md-6">
                    <label class="form-label">Department</label>
                    <input type="text" name="department" class="form-control">
                </div>
                <div class="col-md-6">
                    <label class="form-label">Profile Photo</label>
                    <input type="file" name="photo" class="form-control" size="50">
                </div>
                
            </div>
            <div class="text-center mt-4">
                <button type="submit" class="btn btn-success px-5 py-2">Save</button>
            </div>
        </form>
    </div>
</div>


</body>
</html>