<%-- 
    Document   : class-management
    Created on : Mar 4, 2024, 8:08:18 PM
    Author     : La Hoang Khoi - CE171855
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="DAOs.ClassDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="components/head.jsp" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="components/header.jsp" %>
        <button type="submit" name="submitAssign">Save</button>
        <div id="table">
            <form action="saveHomeroomAssignment.jsp" method="post"> <!-- Thêm action và method -->
                <table id="example">
                    <thead>
                        <tr>
                            <th>Class Name</th>
                            <th>Grade</th>  
                            <th>Homeroom teacher</th>
                            <th>Assign Homeroom</th>
                        </tr>
                    </thead>

                    <%
                        ClassDAO tDAO = new ClassDAO();
                        ResultSet rs = tDAO.getAll();
                        while (rs.next()) {
                    %>
                    <tbody>
                        <tr>
                            <td><%= rs.getString("id")%></td>
                            <td><%= rs.getInt("grade")%></td>
                            <td><%= rs.getString("homeroom")%></td>
                            <td>
                                <select name="homeroomAssignment"> 
                                    <option value="">Select Homeroom Teacher</option>
                                    <%
                                        ResultSet teacherRS = tDAO.getAllTeacherNotHoomroom();
                                        while (teacherRS.next()) {
                                    %>
                                    <option value="<%= teacherRS.getString("id")%>"><%= teacherRS.getString("name")%></option>
                                    <%
                                        }
                                    %>
                                </select>
                            </td>
                        </tr>
                    </tbody>    
                    <% }
                    %>
                </table>
                <!-- Thêm nút Save -->
            </form>
        </div>
    </body>
</html>
