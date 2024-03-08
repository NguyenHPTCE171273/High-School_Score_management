<%-- 
    Document   : student_homePage
    Created on : Feb 28, 2024, 3:12:31 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Home</title>
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
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Lobster&display=swap" rel="stylesheet">
        <style>
            #school-name {
                font-family: "Lobster", sans-serif;
                font-weight: 400;
                font-style: normal;
            }
        </style>
    </head>
    <body>
        <header class="container-fluid">
            <div class="d-flex row">
                <div class="col-sm-2">
                    <a href="#"><img
                            class="navbar-brand"
                            id="logo"
                            src="<%= request.getContextPath()%>/imgs/logo_small.png"
                            alt="Hame Logo"
                            width="200px"
                            /></a>
                </div>

                <div id="school-name" class="col-sm-10 d-flex align-items-center ">
                    <h1 class="text-center" style="color: #003a5f; width: 100%">Welcome to ABC High School</h1>
                </div>
            </div>

            <!-- Menu -->
            <nav class="navbar navbar-expand-lg navbar-light bg-light" >
                <div class="container-fluid justify-content-between">
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
                        <p style="margin: 0">Hello, </p>                        
                        <div class="navbar-nav">
                            <a href="" class="nav-item nav-link">My account</a>
                            <a href="" class="nav-item nav-link">Change Password</a>
                            <a href="" class="nav-item nav-link">Sign out</a>
                        </div>
                    </div>
                </div>
            </nav>

            <div class="mt-3">
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
                <a href="" style="text-decoration: none" class="col-sm-12 col-md-6 text-center">
                    <img src="<%= request.getContextPath()%>/imgs/score.png" width="200px" >
                    <p style="color: #003a5f">Study Result</p>
                </a>
                <a href="" style="text-decoration: none" class="col-sm-12 col-md-6 text-center">
                    <img src="<%= request.getContextPath()%>/imgs/report.png" width="200px" >
                    <p style="color: #003a5f">Report</p>
                </a>
            </div>
        </main>
        
        <footer>
            
        </footer>
    </body>
</html>
