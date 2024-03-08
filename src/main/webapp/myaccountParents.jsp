<%-- 
    Document   : myaccountTeacher
    Created on : Mar 4, 2024, 1:02:58 AM
    Author     : Tran Duy Dat - CE172036
--%>

<%@page import="DAOs.ParentsDAO"%>
<%@page import="Model.parents"%>
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
            form {
                max-width: 400px;
                margin: 0 auto;
                padding: 20px;
                background-color: #f9f9f9;
                border: 1px solid #ccc;
                border-radius: 5px;
            }

            label {
                font-weight: bold;
            }

            input[type="text"] {
                width: calc(100% - 22px);
                padding: 10px;
                margin-bottom: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
            }
                   input[type="number"] {
                width: calc(100% - 22px);
                padding: 10px;
                margin-bottom: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
            }
            input[type="date"] {
                width: calc(100% - 22px);
                padding: 10px;
                margin-bottom: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
            }

            button {
                padding: 10px 20px;
                background-color: #4caf50;
                color: #fff;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }

            button:hover {
                background-color: #45a049;
            }

            /* Các phần tử cụ thể cho từng biểu mẫu */
            #parentForm {
                margin-bottom: 30px;
            }

            #studentForm {
                margin-top: 30px;
            }
            .h2-parent{
                text-align: center;
            }
            .h2-student{
                text-align: center;
            }
        </style>
    </head>
    <body>

        <%                String phone_number = "";
            Cookie[] cList = request.getCookies();
            if (cList != null) {
                for (Cookie c : cList) {
                    if (c.getName().equals("Parents")) {
                        phone_number = c.getValue();
                        break;
                    }
                }
            }
            ParentsDAO dDAO = new ParentsDAO();

            ParentsDAO pDAO = new ParentsDAO();
            ResultSet rs = pDAO.getAllparents(phone_number);
            parents ra = dDAO.getInfoparent(phone_number);

            while (rs.next()) {
        %>
        <h2 class="h2-parent">Information of <%= ra.getName()%> </h2>        

        <form action="/Management/" method="POST">
            <label for="pro_id">ID:</label><br>
            <input id="pro_id" type="number" name="parentID" value="<%= rs.getInt(1)%>" readonly=""/>

            <label for="value4">Phone_number:</label><br>
            <input type="text" id="value4" name="phone_parent" value="<%=rs.getString(2)%>"><br>

            <label for="value1">Name:</label><br>
            <input type="text" id="value1" name="name_parent" value="<%=rs.getString(4)%>"><br>

            <label for="value2">Role:</label><br>
            <input type="text" id="value2" name="role_parent" value="<%=rs.getString(5)%>"><br>

            <label for="value3">Job:</label><br>
            <input type="text" id="value3" name="job_parent" value="<%=rs.getString(6)%>"><br>
            <button id="btnSave" type="submit" name="submit_saveParent">Save</button>       
        </form>

        <h2 class="h2-student">Student  </h2>
        <form action="/Management/" method="POST">
            <label for="pro_id">ID:</label><br>
            <input id="pro_id" type="number" name="teacherID" value="<%= rs.getInt(7)%>" readonly=""/>

            <label for="value1">Email:</label><br>
            <input type="text" id="value1" name="email_student" value="<%=rs.getString(9)%>"><br>

            <label for="value2">Name:</label><br>
            <input type="text" id="value2" name="name_student" value="<%=rs.getString(11)%>"><br>

            <label for="value3">Gender:</label><br>
            <input type="text" id="value3" name="gender_student" value="<%=rs.getString(12)%>"><br>

            <label for="value4">Birthday:</label><br>
            <input type="date" id="value4" name="birthday_student" value="<%=rs.getString(13)%>"><br>

            <label for="value2">Phone_number of student:</label><br>
            <input type="text" id="value2" name="phone_student" value="<%=rs.getString(14)%>"><br>

            <label for="value3">Address:</label><br>
            <input type="text" id="value3" name="address_student" value="<%=rs.getString(15)%>"><br>

            <label for="value4">Status:</label><br>
            <input type="text" id="value4" name="status_student" value="<%=rs.getString(16)%>"><br>

            <button id="btnSave" type="submit" name="submit_saveStudent">Save</button>
        </form>


        <%
            }
        %>

    </body>
</html>
