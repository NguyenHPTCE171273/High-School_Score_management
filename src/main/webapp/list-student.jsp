<%-- 
    Document   : list-student
    Created on : Mar 4, 2024, 9:26:38 PM
    Author     : La Hoang Khoi - CE171855
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="DAOs.StudentDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include  file="components/head.jsp" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="components/header.jsp" %>
        <div id="table">
            <table id="example">
                <thead>
                    <tr>
                        <th>ID Student</th>
                        <th>Phone Number</th>
                        <th>Email</th>               
                        <th>Name</th>
                        <th>Gender</th>
                        <th>Birthday</th>
                        <th>Address</th>    
                        <th>Status</th>                     
                    </tr>
                </thead>
                <%
                    StudentDAO tDAO = new StudentDAO();
                    ResultSet rs = tDAO.getAll();
                    while (rs.next()) {
                %>
                <tbody>
                    <tr>
                        <td><%= rs.getString("id")%></td>
                        <td><%= rs.getString("phone_number")%></td>
                        <td><%= rs.getString("email")%></td>             
                        <td><%= rs.getString("name")%></td>
                        <td><%= rs.getString("gender")%></td>
                        <td><%= rs.getString("birthday")%></td>
                        <td><%= rs.getString("address")%></td>
                        <td><%= rs.getString("status")%></td>           
                    </tr>
                    <%                        }
                    %>
                </tbody>    
            </table>
        </div>
    </body>
</html>
