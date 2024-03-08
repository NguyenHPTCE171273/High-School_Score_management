<%-- 
    Document   : reportScore
    Created on : Mar 4, 2024, 10:06:23 PM
    Author     : admin
--%>

<%@page import="Model.teacher"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.StudentScoreModel"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DAOs.TeacherDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
        <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
        <script>
            $(document).ready(function () {
                $('#example').DataTable();
            });
        </script>

        <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
            integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
            crossorigin="anonymous"
            />
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
            integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
            crossorigin="anonymous"
        ></script>
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
            crossorigin="anonymous"
        ></script>
        <style>
            .d-flex {
                display: flex;
                justify-content: space-around;
                align-items: center;
            }

            .input-group {
                margin-right: 10px;
            }

            .btn {
                background-color: green;
                color: white;
                border: none;
                border-radius: 4px;
                padding: 5px 10px;
            }

            .nav-link {
                color: white;
            }

            .nav-link:hover {
                text-decoration: underline;
                color: white;
            }
        </style>
    </head>
    <body>
        <header style="background-color: #003a5f">
            <%
                String phone_number = "";
                Cookie[] cList = request.getCookies();
                if (cList != null) {
                    for (Cookie c : cList) {
                        if (c.getName().equals("Teacher")) {
                            phone_number = c.getValue();
                            break;
                        }
                    }
                }

                TeacherDAO ad = new TeacherDAO();
                teacher adc = ad.getInfoteacher(phone_number);

            %>
            <!-- Menu -->
            <nav class="navbar navbar-expand-lg navbar-light" >
                <div class="container-fluid justify-content-between">
                    <a href="/Management/TeacherHomePage">
                        <img
                            class="navbar-brand"
                            id="logo"
                            src="<%= request.getContextPath()%>/imgs/logo_small.jpg"
                            alt="Hame Logo"
                            style="width: 60px; border-radius: 15%"
                            />
                    </a>
                    <button
                        type="button"
                        class="navbar-toggler"
                        data-bs-toggle="collapse"
                        data-bs-target="#navbarCollapse"
                        >
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div
                        class="collapse navbar-collapse justify-content-between"
                        id="navbarCollapse"
                        >                        
                        <ul class="navbar-nav">
                            <li class="nav-item dropdown">
                                <a
                                    class="nav-link dropdown-toggle"
                                    data-bs-toggle="dropdown"
                                    href=""
                                    >Hello, <%=adc.getName()%></a
                                >
                                <ul class="dropdown-menu">
                                    <li>
                                        <a class="dropdown-item" href="/StudentManagement/AccountTeacherPage"
                                           >My account</a
                                        >
                                    </li>
                                    <li>
                                        <a class="dropdown-item" href="/StudentManagement/ChangpassPage"
                                           >Change Password</a
                                        >
                                    </li>
                                    <li>
                                        <a class="dropdown-item" href="/StudentManagement/TeacherSignOut"
                                           >Sign out</a
                                        >
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
        </header>

        <%
            String homeroom = (String) session.getAttribute("homeroom");

            if (!homeroom.equals("false")) {
                String[] arr = homeroom.split(" ");
                String classes = arr[0];

                String semester = "";
                if ((String) session.getAttribute("semester") != null)
                    semester = (String) session.getAttribute("semester");
        %>
        <form action="/AddScore" method="post">
            <div class="d-flex">
                <div class="input-group mb-3">
                    <label class="input-group-text" for="inputGroupSelect01">Class: </label>
                    <select name="class" class="form-select" id="inputGroupSelect01">
                        <option value="<%=classes%>" selected="" > <%=classes%></option>
                    </select>
                </div>

                <div class="input-group mb-3">
                    <label class="input-group-text" for="inputGroupSelect03">Semester: </label>
                    <select name="semester" class="form-select" id="inputGroupSelect03">
                        <option value="Semester 1" <%= semester.equals("Semester 1") ? "selected" : ""%>>Semester 1</option>    
                        <option value="Semester 2" <%= semester.equals("Semester 2") ? "selected" : ""%>>Semester 2</option>
                        <option value="All Year" <%= semester.equals("All Year") ? "selected" : ""%>>All Year</option>
                    </select>
                </div>
                <button class="btn" type="submit" name="btn-filtScore" value="Loc">Lọc</button>
            </div>
        </form> 


        <%
            if (!semester.equals("")) {
                int semester_id = 0;

                if (semester.equals("Semester 1")) {
                    semester_id = 1;
                } else if (semester.equals("Semester 2")) {
                    semester_id = 2;
                } else {
                    semester_id = 3;
                }

                TeacherDAO tDAO = new TeacherDAO();
                ResultSet rsSubject = tDAO.getAllSubject();
                ResultSet rsStudent = tDAO.getStudentInClass(classes);


        %>
        <table id="example">
            <thead>
                <tr>
                    <th>Phone Number</th>
                    <th>Fullname</th>
                    <th>Birthday</th>
                        <%                            
                            while (rsSubject.next()) {
                        %>
                                <th><%=rsSubject.getString("name")%></th>
                        <%
                            }
                        %>
                    <th>GPA</th>
                    <th>Learning outcomes</th>
                    <th>Conduct</th>
                    <th>Titles and awards</th>
                </tr>
            </thead>

            <tbody>
                <%
                    while (rsStudent.next()) {
                %>
                <tr>
                    <td><%=rsStudent.getString("phone_number")%></td>
                    <td><%=rsStudent.getString("name")%></td>
                    <td><%=rsStudent.getDate("birthday")%></td>

                    <%
                        ArrayList<StudentScoreModel> scores = new ArrayList<>();
                        float average = 0;
                        float scoreConditional = 0;
                        float lowestAverage = 10;
                        boolean requireSubject = true;

                        for (int i = 1; i <= 10; ++i) {
                            ResultSet rsScore = tDAO.getScoreByStudent(rsStudent.getInt("id"), i, semester_id);
                            StudentScoreModel studentScore = null;

                            while (rsScore.next()) {
                                studentScore = new StudentScoreModel(rsStudent.getInt("id"), i, rsScore.getFloat("scoreMouth"), rsScore.getFloat("scoreShortExam"), rsScore.getFloat("scoreMidSemester"), rsScore.getFloat("scoreSemester"));
                            }
                            if (studentScore != null) {
                                scores.add(studentScore);
                    %>
                    <td><%=(i == 9) ? (studentScore.getGpa() >= 5 ? "Đ" : "CĐ") : studentScore.getGpa()%></td>
                    <%
                    } else {
                    %>
                    <td> - </td>
                    <%
                            }
                        }

                        if (scores.size() == 10) {
                            for (StudentScoreModel studentScoreModel : scores) {
                                average += studentScoreModel.getGpa();
                                if (studentScoreModel.getSubject_id() == 1
                                        || studentScoreModel.getSubject_id() == 2
                                        || studentScoreModel.getSubject_id() == 8) {
                                    if (studentScoreModel.getGpa() > scoreConditional) {
                                        scoreConditional = studentScoreModel.getGpa();
                                    }
                                } else if (studentScoreModel.getSubject_id() == 9 && studentScoreModel.getGpa() < 5) {
                                    requireSubject = false;
                                }

                                if (studentScoreModel.getGpa() < lowestAverage) {
                                    lowestAverage = studentScoreModel.getGpa();
                                }

                            }
                            average = (float) Math.round(average) / 10;
                    %>
                    <td><%= average%> </td>
                    <%
                    } else {
                    %>
                    <td> - </td>
                    <%
                        }
                        if (scores.size() < 10) {
                    %>
                    <td> - </td>
                    <%
                    } else if (requireSubject) {
                        if (average >= 8 && scoreConditional >= 8 && lowestAverage >= 6.5) {
                    %>
                    <td>Gioi</td>
                    <%
                    } else if (average >= 6.5 && scoreConditional >= 6.5 && lowestAverage >= 5) {
                    %>
                    <td>Kha</td>
                    <%
                    } else if (average >= 5 && scoreConditional >= 5 && lowestAverage >= 3.5) {
                    %>
                    <td>Trung binh</td>
                    <%
                    } else {
                    %>
                    <td>Yeu</td>
                    <%
                        }
                    } else {
                    %>
                    <td>Yeu</td>
                    <%
                        }

                        int student_id = rsStudent.getInt("id");

                        String conduct = tDAO.getConduct(student_id);
//                        while(rsConduct.next()){
//                            conduct = rsConduct.getString("conduct");
//                        }
%>
                    <td>
                        <select id="<%=student_id %>" name="<%=rsStudent.getInt("id") + " conduct"%>">
                            <option value="value">Select</option>
                            <option value="T" <%= conduct.equals("T") ? "selected" : ""%> >Tot</option>
                            <option value="K" <%= conduct == "K"? "selected" : ""%> >Kha</option>
                            <option value="TB" <%= conduct == "YB"? "selected" : ""%> >Trung binh</option>
                            <option value="Y" <%= conduct == "Y"? "selected" : ""%> >Yeu</option>
                        </select>
                    </td>
                    <td>cell</td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>

        <%
            }
        } else {
        %>
        <p>Bạn chưa có lớp chủ nhiệm nên không thể xem báo cao điểm!!</p>
        <%
            }
        %>
        
        
        
        <script>
            
            function updateConduct(student_id) {
                const conduct = document.getElementById(student_id).value;
                
                $.ajax({
                    type: "GET",
                    url: "/AddScore/updateConduct",
                    data: {
                        id: student_id,
                        conduct: conduct
                    },
                    success: function (result) {
                        
                        alert(student_id);
                    }
                });
            }
        </script>
    </body>
</html>
