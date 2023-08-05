<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
   
    <style> <%@include file="/WEB-INF/home.css"%> </style>
    <title>Document</title>
</head>
<body>
    <section class="beforeHeader">
        <div class="bgDiv">
            <img src="hotel3.jpg" alt="">
        </div>
    </section>
    <header id="theNavigationBar">
        <div class="container">
            <div class="nav-bar">
                
                <div class="logo">
                    <img src="hotel2.png" alt="logo image">
                </div>
                <ul class="nav-list">
                    <li class="nav-item">
                        <a href="http://localhost:8080/TABD_TourismeProject/HomeServlet" class="nav-link active">Home</a>
                    </li>
                    <li class="nav-item">
                        <a href="http://localhost:8080/TABD_TourismeProject/HotelServlet" class="nav-link">Hotels</a>
                    </li>
                    <li class="nav-item">
                        <a href="http://localhost:8080/TABD_TourismeProject/ReserverServlet" class="nav-link">Reservations</a>
                    </li>
                    <li class="nav-item">
                        <a href="http://localhost:8080/TABD_TourismeProject/Consulterannulationservlet" class="nav-link">Canceled Reservations</a>
                    </li>
                    <li class="nav-item">
                        <a href="http://localhost:8080/TABD_TourismeProject/VisitorServlet" class="nav-link">Visitors</a>
                    </li>
                    
                </ul>
            </div>
        </div>
    </header>
    <section class="hero" >
        <div class="container gridTest ">
            
            <div class="firstDiv">
                <h2 class="sub-headline">
                    <span class="first-letter">W</span>elcome
                </h2>
                <h1 class="headline">Collect Moments </h1>
                <div class="separator">
                    <div class="line line-left"></div>
                    <h1 class="headline">Not Things</h1>
                    <div class="line line-right"></div>
                </div>
            
                <a href="#" class="btn cta-btn">Explore</a>
            </div>
        </div>
    </section>
</body>
</html>