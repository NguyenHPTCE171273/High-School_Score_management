<%-- 
    Document   : teacher_homePage
    Created on : Feb 28, 2024, 4:25:03 PM
    Author     : Admin
--%>

<%@page import="DAOs.TeacherDAO"%>
<%@page import="Model.teacher"%>
<%@page import="DAOs.AdministratorDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Document</title>
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
    </head>
    <style>
        .nav-link {
            color: white;
        }

        .nav-link:hover {
            text-decoration: underline;
            color: white;
        }
    </style>
    <body style="background-color: #003a5f">
        <header>
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
                    <img
                        class="navbar-brand"
                        id="logo"
                        src="<%= request.getContextPath()%>/imgs/logo_small.jpg"
                        alt="Hame Logo"
                        style="width: 60px; border-radius: 15%"
                        />
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
                                        <a class="dropdown-item" href="/Management/AccountTeacherPage"
                                           >My account</a
                                        >
                                    </li>
                                    <li>
                                        <a class="dropdown-item" href="/Management/ChangpassPage"
                                           >Change Password</a
                                        >
                                    </li>
                                    <li>
                                        <a class="dropdown-item" href="/Management/TeacherSignOut"
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

        <main class="container">
            <div class="row mt-5">
                <div class="col-sm-12 col-md-6 col-lg-3 text-center">
                    <img src="<%= request.getContextPath()%>/imgs/1492531743-icon-sets-school-outline-hand-drawn-iconfinder02_83203.png" width="200px" >
                    <a href="/AddScore"><p class="text-light">Teaching classes</p></a>
                </div>
                <div class="col-sm-12 col-md-6 col-lg-3 text-center">
                    <img src="<%= request.getContextPath()%>/imgs/icons8-reading-100.png" width="200px" >
                    <p class="text-light">Homeroom class</p>
                </div>
                <div class="col-sm-12 col-md-6 col-lg-3 text-center">
                    <img src="<%= request.getContextPath()%>/imgs/icons8-report-card-80.png" width="200px" >
                    <a href="/AddScore/reportScore"><p class="text-light">Report of score</p></a>
                </div>
            </div>
        </main>
    </body>
</html>
