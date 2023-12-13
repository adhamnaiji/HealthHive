<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="java.sql.*" %>
<%@ page import="ClassMétier.Singleton" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Mes Rendez-vous</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        table, th, td {
            border: 1px solid black;
        }
    </style>
</head>
<body>
    <jsp:include page="NavBar.jsp"/>
    <table style="width:100%;">
        <tr>
            <th colspan="4">Mes Rendez-vous</th>
        </tr>
        <tr>
            <th>Medecin</th>
            <th>Nom patient</th>
            <th>Date</th>
            <th>Temps</th>
        </tr>
        <% 
            try {
                int user_id = (int) session.getAttribute("user_id");
                Singleton singleton = Singleton.getInstance();
                PreparedStatement stmt = singleton.conn.prepareStatement("SELECT * FROM rendez_vous WHERE user_id = ?");
                stmt.setInt(1, user_id);
                ResultSet rs = stmt.executeQuery();

                while(rs.next()) {
                    int medecinId = rs.getInt("medcin_id");
                    PreparedStatement st = singleton.conn.prepareStatement("SELECT nom FROM medecin WHERE id = ?");
                    st.setInt(1, medecinId);
                    ResultSet stt = st.executeQuery();
                    
                    if (stt.next()) {
                        String nomMedecin = stt.getString("nom");
                        String nomPatient = rs.getString("nom_patient");
                        String date = rs.getString("date");
                        String temps = rs.getString("time_R");
        %>
        <tr>
            <td><%= nomMedecin %></td>
            <td><%= nomPatient %></td>
            <td><%= date %></td>
            <td><%= temps %></td>
        </tr>
        <% 
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
                out.println("An error occurred: " + e.getMessage());
            }
        %>
    </table>
</body>
</html>