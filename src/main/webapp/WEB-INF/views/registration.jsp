<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Page</title>
    <style>
        /* General reset and styling */
        * {
            box-sizing: border-box;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        /* Container styling */
        .container {
            width: 500px;
            margin: 50px auto;
            padding: 25px;
            border: 2px solid #4A90E2;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            background-color: #f9f9f9;
        }

        h2 {
            color: #333;
            text-align: center;
            margin-bottom: 20px;
            font-family: "Times New Roman", Times, serif;
            
        }

        table {
            width: 100%;
            border-spacing: 5px;
        }

        td {
            padding: 8px;
            color: #555;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        input[type="text"],
        input[type="date"],
        input[type="email"],
        input[type="password"] {
            width: 100%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 5px;
            margin-top: 5px;
        }

        input[type="radio"] {
            margin: 0 8px;
        }

        button {
            width: 100%;
            padding: 10px;
            border: none;
            border-radius: 5px;
            background-color: #4A90E2;
            color: #fff;
            font-size: 16px;
        }

        button:hover {
            background-color: #357ABD;
        }

        /* Login link styling */
        p {
            text-align: center;
            margin-top: 15px;
        }

        a {
            color: #4A90E2;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }

        /* Message styling */
        h3 {
            text-align: center;
            color: #e74c3c;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Register Here</h2>
        <form action="register-user" method="post">
            <table>
                <tr>
                    <td>Name</td>
                    <td><input type="text" name="name" required="required" autofocus="autofocus"></td>
                </tr>
                <tr>
                    <td>Date of Birth</td>
                    <td><input type="date" name="dateOfBirth" required="required"></td>
                </tr>
                <tr>
                    <td>Gender</td>
                    <td>
                        <input type="radio" name="gender" value="Male" required="required"> Male
                        <input type="radio" name="gender" value="Female" required="required"> Female
                        <input type="radio" name="gender" value="Other" required="required"> Other
                    </td>
                </tr>
                <tr>
                    <td>Address</td>
                    <td><input type="text" name="address" required="required"></td>
                </tr>
                <tr>
                    <td>City</td>
                    <td><input type="text" name="city" required="required"></td>
                </tr>
                <tr>
                    <td>State</td>
                    <td><input type="text" name="state" required="required"></td>
                </tr>
                <tr>
                    <td>Login ID (Email)</td>
                    <td><input type="email" name="loginId" required="required"></td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td><input type="password" name="password" required="required"></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <button type="submit">Register</button>
                    </td>
                </tr>
            </table>
        </form>
        <p>Already have an account? <a href="login">Login here</a></p>

        <%
            String message = (String) request.getAttribute("message");
            if (message != null) {
        %>
        <h3><%= message %></h3>
        <%
            }
        %>
    </div>
</body>
</html>
