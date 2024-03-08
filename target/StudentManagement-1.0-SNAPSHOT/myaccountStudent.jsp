<%-- 
    Document   : myaccountStudent
    Created on : Mar 4, 2024, 1:57:29 AM
    Author     : Tran Duy Dat - CE172036
--%>

<%@page import="DAOs.StudentDAO"%>
<%@page import="Model.student"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DAOs.AdministratorDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            /* Thiết lập cho bảng */
            table {
                width: 100%;
                border-collapse: collapse;
                margin-bottom: 20px;
            }

            /* Thiết lập cho tiêu đề của bảng */
            th {
                background-color: #f2f2f2;
                padding: 10px;
                text-align: center;
            }

            /* Thiết lập cho dòng chẵn của bảng */
            tr:nth-child(even) {
                background-color: #f2f2f2;
            }

            /* Thiết lập cho các ô của bảng */
            td {
                padding: 10px;
                text-align: left;
            }

            /* Hiệu ứng hover cho các dòng của bảng */
            tr:hover {
                background-color: #dddddd;
            }
            .h1{
                text-align: center;
                color: red;
            }
        </style>
    </head>
    <body>
        <table>
            <%                String phone_number = "";
                Cookie[] cList = request.getCookies();
                if (cList != null) {
                    for (Cookie c : cList) {
                        if (c.getName().equals("Student")) {
                            phone_number = c.getValue();
                            break;
                        }
                    }
                }
                StudentDAO pDAO = new StudentDAO();
                ResultSet rs = pDAO.getAllStudent(phone_number);
                StudentDAO dDAO = new StudentDAO();
                student ra = dDAO.getInfostudent(phone_number);
                while (rs.next()) {
            %>
            <h2>Information Of <%= ra.getName()%></h2>

            <tr>
                <td>Email</td>
                <td><%= rs.getString(2)%></td>
            </tr>
            <tr>
                <td>Name</td>
                <td><%= rs.getString(4)%></td>
            </tr>
            <tr>
                <td>Gender</td>
                <td><%= rs.getString(5)%></td>
            </tr>
            <tr>
                <td>Birthday</td>
                <td><%= rs.getString(6)%></td>
            </tr>
            <tr>
                <td>Phone_Number</td>
                <td><%= rs.getString(7)%></td>
            </tr>
            <tr>
                <td>Address</td>
                <td><%= rs.getString(8)%></td>
            </tr>
            <tr>
                <td>Status</td>
                <td><%= rs.getString(9)%></td>
            </tr>

        </table>





        <table>
            <h2> Parent Of <%= ra.getName()%></h2>
            <tr>
                <td>Phone_number</td>
                <td><%=rs.getString(11)%></td>
            </tr>
            <tr>
                <td>Name</td>
                <td><%=rs.getString(13)%></td>
            </tr>
            <tr>
                <td>Role</td>
                <td><%=rs.getString(14)%></td>
            </tr>
            <tr>
                <td>Job</td>
                <td><%=rs.getString(15)%></td>
            </tr>

        </table>
        <%
            }
        %>

    </body>
</html>
