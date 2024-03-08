<%-- 
    Document   : student_homePage
    Created on : Feb 28, 2024, 3:12:31 PM
    Author     : Admin
--%>

<%@page import="Model.student"%>
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
        <header class="container-fluid"> 
                                    <%
                String phone_number = "";
                Cookie[] cList = request.getCookies();
                if (cList != null) {
                    for (Cookie c : cList) {
                        if (c.getName().equals("Student")) {
                            phone_number = c.getValue();
                            break;
                        }
                    }
                }
                AdministratorDAO ad = new AdministratorDAO();
                student adc = ad.getInfostudent(phone_number);
            %>
            <!-- Menu -->
            <nav class="navbar navbar-expand-lg navbar-light" >
                <div class="container-fluid">
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
                            <li class="nav-item">
                                <a class="nav-link" href="/HandmadeStore/ListProduct"
                                   >Product</a
                                >
                            </li>
                        </ul>
                        <ul class="navbar-nav">
                            <li class="nav-item dropdown">
                                <a
                                    class="nav-link dropdown-toggle"
                                    data-bs-toggle="dropdown"
                                    href=""
                                    >Hello <%= adc.getName() %></a
                                >
                                <ul class="dropdown-menu">
                                    <li>
                                        <a class="dropdown-item" href="/StudentManagement/AccountStudentPage"
                                           >My account</a
                                        >
                                    </li>
                                    <li>
                                        <a class="dropdown-item" href="/StudentManagement/ChangpassPage"
                                           >Change Password</a
                                        >
                                    </li>
                                    <li>
                                        <a class="dropdown-item" href="/StudentManagement/StudentSignOut"
                                           >Sign out</a
                                        >
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>

            <div>
                <div id="myCorousel" class="carousel slide" data-bs-ride="carousel">

                    <!-- Indicators/dots -->
                    <div class="carousel-indicators">
                        <button type="button" data-bs-target="#myCorousel" data-bs-slide-to="0" class="active"></button>
                        <button type="button" data-bs-target="#myCorousel" data-bs-slide-to="1"></button>
                    </div>

                    <!-- The slideshow/carousel -->
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img src="<%= request.getContextPath()%>/imgs/Black School Art Club Poster - Made with PosterMyWall.jpg" class="d-block w-100" id="slide" alt="Slide 1">
                        </div>
                        <div class="carousel-item">
                            <img src="<%= request.getContextPath()%>/imgs/a6401272ad0ecf54fdec283f4d338c7c.gif" class="d-block w-100" id="slide" alt="Slide 2">
                        </div>
                    </div>

                    <!-- Left and right controls/icons -->
                    <a class="carousel-control-prev" href="#myCorousel" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon"></span>
                    </a>
                    <a class="carousel-control-next" href="#myCorousel" data-bs-slide="next">
                        <span class="carousel-control-next-icon"></span>
                    </a>
                </div>
            </div>
        </header>

        <main class="container">
            <div class="row mt-5">
                <div class="col-sm-12 col-md-6 text-center">
                    <img src="<%= request.getContextPath()%>/imgs/icons8-pass-fail-80.png" width="200px" >
                    <p class="text-light">Study Result</p>
                </div>
                <div class="col-sm-12 col-md-6 text-center">
                    <img src="<%= request.getContextPath()%>/imgs/icons8-report-card-80.png" width="200px" >
                    <p class="text-light">Report</p>
                </div>
            </div>
        </main>
        
        <footer>
            
        </footer>
    </body>
</html>
