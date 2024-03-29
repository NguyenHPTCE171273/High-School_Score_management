<%-- 
    Document   : statistical.jsp
    Created on : Mar 8, 2024, 3:18:33 PM
    Author     : La Hoang Khoi - CE171855
--%>

<%@page import="DAOs.StatisticalDAO"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.7.0/chart.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    </head>
    <style>
        html, body {
            margin: 0;
            padding: 0;
            height: 100%;
        }

        .container-content {
            display: flex;
            height: 100vh; /* Chiều cao bằng 100% chiều cao của màn hình */
        }

        .nav-bar {
            width: 200px;
            background-color: #333;
            color: #fff;
            overflow-y: auto; /* Cho phép cuộn nếu menu dài hơn chiều cao của màn hình */
        }

        .nav-bar ul {
            list-style-type: none;
            padding: 0;
            margin: 0;
        }

        .nav-bar ul li {
            padding: 10px;
        }

        .nav-bar ul li a {
            color: #fff;
            text-decoration: none;
        }

        .nav-bar ul li a:hover {
            background-color: #555;
        }

        .content {
            flex-grow: 1;
            padding: 20px;
        }

        .statistical{
            display: flex;
            flex-wrap: wrap;
        }

        .chart1{
            margin-right: 100px
        }


    </style>
    <%@include file="components/head.jsp" %>
    <body>
        <%@include file="components/header.jsp" %>
        <div class="container-content">
            <div class="nav-bar">
                <ul>
                    <li><a href="/admin/statistical">Statistical numbers Student</a></li>
                    <li><a href="/admin/statistical/academic">Statistical Student By Academic</a></li>
               
                </ul>
            </div>
            <div class="content">
                <div class="statistical">

                    <div class="chart1" style="margin-left: 30px;  width: 400px; height: 400px">
                        <canvas id="myChart" width="200" height="200"></canvas>
                    </div>

                    <div style="width: 400px; height: 400px">
                        <canvas id="myChart2" width="200" height="200"></canvas>
                    </div>

                    <div  style="width: 400px; height: 400px;">
                        <canvas id="myChart3" width="200" height="200"></canvas>
                    </div>
                </div>
            </div>
        </div>

        <%
            StatisticalDAO sDAO = new StatisticalDAO();
            Map<String, Integer> studentCounts = new HashMap<>();

            studentCounts = sDAO.getStudnentBySchoolYear();
        %>
        <script>

            var labels = [];
            var data = [];
            <%            for (Map.Entry<String, Integer> entry : studentCounts.entrySet()) {
            %>
            labels.push("<%= entry.getKey()%>");
            data.push(<%= entry.getValue()%>);
            <%
                }
            %>


            var ctx = document.getElementById('myChart').getContext('2d');
            var myChart = new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: labels,
                    datasets: [{
                            label: 'Number of student by school year',
                            data: data,
                            backgroundColor: 'rgba(255, 99, 132, 0.2)',
                            borderColor: 'rgba(255, 99, 132, 1)',
                            borderWidth: 1
                        }]
                },
                options: {
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                }
            });
        </script>

        <%
            Map<String, Integer> studentByClass = new HashMap<>();

            studentByClass = sDAO.getStudnentByClass();
        %>
        <script>

            var labels = [];
            var data = [];
            <%            for (Map.Entry<String, Integer> entry : studentByClass.entrySet()) {
            %>
            labels.push("<%= entry.getKey()%>");
            data.push(<%= entry.getValue()%>);
            <%
                }
            %>


            var ctx = document.getElementById('myChart2').getContext('2d');
            var myChart = new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: labels,
                    datasets: [{
                            label: 'Number of student by class',
                            data: data,
                            backgroundColor: 'rgba(255, 99, 132, 0.2)',
                            borderColor: 'rgba(255, 99, 132, 1)',
                            borderWidth: 1
                        }]
                },
                options: {
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                }
            });
        </script>

     




    </body>
</html>
