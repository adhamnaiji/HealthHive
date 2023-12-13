<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="java.sql.*" %>
<%@ page import="ClassMétier.Singleton" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Profile</title>
    <link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        
         .elbody {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .user-card {
            width: 400px; /* Adjust width as needed */
            border: 1px solid #ccc;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        .user-card svg {
            width: 150px; /* Adjust image size as needed */
            height: 150px; /* Adjust image size as needed */
            border-radius: 50%;
            margin-bottom: 20px;
        }
        .user-card h3 {
            margin: 0;
            font-size: 24px;
            color: #333;
        }
        .user-card p {
            margin: 10px 0;
            font-size: 16px;
            color: #666;
        }
    </style>
    
</head>

<body>
<div>
<jsp:include page="NavBar.jsp"/>
<div class="elbody">
<% 
    try {
        int user_id = (int) session.getAttribute("user_id");
        Singleton singleton = Singleton.getInstance();
        PreparedStatement stmt = singleton.conn.prepareStatement("SELECT * FROM user WHERE id = ?");
        stmt.setInt(1, user_id);

        // Execute SQL query
        ResultSet rs = stmt.executeQuery();

        if (rs.next()) {
            String telephone = rs.getString("tel");
            String Email=rs.getString("email");
            String DB=rs.getString("date_ness");
    %>
            <div class="user-card">
        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
  <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6m2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0m4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4m-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664z"/>
</svg>
        <h3>User id <%= user_id %></h3>
        <p>Email: <%=Email %></p>
        <p>Date of Birth: <%= DB %></p>
    </div>
    <% 
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.println("An error occurred: " + e.getMessage());
    }
    %>

</div>
</body>
</html>
