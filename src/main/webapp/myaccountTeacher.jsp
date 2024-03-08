<%-- 
    Document   : myaccountTeacher
    Created on : Mar 4, 2024, 10:22:20 AM
    Author     : Tran Duy Dat - CE172036
--%>

<%@page import="DAOs.TeacherDAO"%>
<%@page import="Model.teacher"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DAOs.AdministratorDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
            }
            form {
                max-width: 400px;
                margin: 20px auto;
                padding: 20px;
                background: #fff;
                border-radius: 5px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
            label {
                font-weight: bold;
            }
            input[type="text"] {
                width: 100%;
                padding: 10px;
                margin: 5px 0 20px;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            }
                     input[type="number"] {
                width: 100%;
                padding: 10px;
                margin: 5px 0 20px;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            }
            input[type="date"] {
                width: 100%;
                padding: 10px;
                margin: 5px 0 20px;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            }
            button {
                background-color: #4CAF50;
                color: white;
                padding: 14px 20px;
                margin: 8px 0;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                width: 100%;
            }
            button:hover {
                background-color: #45a049;
            }
            .h1{
                text-align: center;
                color: red;
            }
        </style>    
    </head>
    <body>
        <%                String phone_number = "";
            Cookie[] cList = request.getCookies();
            if (cList != null) {
                for (Cookie c : cList) {
                    if (c.getName().equals("Teacher")) {
                        phone_number = c.getValue();
                        break;
                    }
                }
            }
            TeacherDAO pDAO = new TeacherDAO();
            TeacherDAO dDAO = new TeacherDAO();
            
            ResultSet rs = pDAO.getAllTeacher(phone_number);
            teacher ra = dDAO.getInfoteacher(phone_number);
            while (rs.next()) {
        %>
        <h1 class="h1"><%= ra.getName()%> of  Information</h1>
        <form action="/Management/" method="post">
            <label for="pro_id">ID:</label><br>
            <input id="pro_id" type="number" name="teacherID" value="<%= rs.getInt(1)%>" readonly=""/>

            <label for="field1">Phone_Number:</label><br>
            <input type="text" id="field1" name="phone_number" value="<%= rs.getString(2)%>"><br>

            <label for="field2">Email:</label><br>
            <input type="text" id="field2" name="email" value="<%= rs.getString(3)%>"><br>

            <label for="field3">Name:</label><br>
            <input type="text" id="field3" name="name" value="<%= rs.getString(5)%>"><br>

            <label for="field4">Gender:</label><br>
            <input type="text" id="field4" name="gender" value="<%= rs.getString(6)%>"><br>

            <label for="field5">Birthday:</label><br>
            <input type="date" id="field5" name="birthday" value="<%= rs.getString(7)%>"><br>

            <label for="field6">Address:</label><br>
            <input type="text" id="field6" name="address" value="<%= rs.getString(8)%>"><br>

            <label for="field7">Status:</label><br>
            <input type="text" id="field7" name="status" value="<%= rs.getString(9)%>"><br>


            <button id="btnSave" type="submit" name="submit_saveTeacher">Save</button>


            <%
                }
            %>
        </form>
    </body>
</html>
