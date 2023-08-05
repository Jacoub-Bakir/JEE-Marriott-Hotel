

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
  
    <style> <%@include file="/WEB-INF/hotels.css"%> </style>
    <style> <%@include file="/WEB-INF/newHotel.css"%> </style>
    <title>Document</title>
</head>
<body>
    <header id="theNavigationBar">
        <div class="navContainer">
            <div class="nav-bar">
                
                <div class="logo">
                    <img src="hotel2.png" alt="logo image">
                </div>
                <ul class="nav-list">
                    <li class="nav-item">
                        <a href="http://localhost:8080/TABD_TourismeProject/HomeServlet" class="nav-link ">Home</a>
                    </li>
                    <li class="nav-item">
                        <a href="http://localhost:8080/TABD_TourismeProject/HotelServlet" class="nav-link active">Hotels</a>
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
        <section class="main__section">
            <div class='Section' >
                <form class="profile" action="newHotelServlet" Method="Post" autocomplete="off">
                    <h3 class="sectionTitle">Add New Hotel</h3>
                    <div class="input-container">
                        <label >Hotel Name :</label>
                        <input type="text" name="nom" class="input" placeholder="Name"/>
                    </div>
                    <div class="input-container">
                        <label >Hotel Adresse :</label>
                        <input type="text" name="adresse" class="input" placeholder="Adresse"  />
                    </div>
                    <div class="input-container">
                        <label >Hotel City :</label>
                        <input type="text" name="ville" class="input" placeholder=" City" />
                    </div>
                    <div class="input-container">
                        <label >Hotel Code Postal  :</label>
                        <input type="number" name="codepostal" class="input" placeholder=" Code Postal"/>
                    </div>
                    
                    <div class="input-container ">
                        <label >Hotel Stars :</label>
                        <div class="input no_border">
                        <input name="etoiles" class="rating rating--nojs" max="5" step="1" type="range" value="3">
                        </div>
                    </div>
                    <div class="input-container">
                        <label>Hotel Capacity :</label>
                        <input type="number" name="capacite" class="input" placeholder="Capacity" />
                    </div>
                    <div class="buttons">
                        <a  href="http://localhost:8080/TABD_TourismeProject/HotelServlet" class="btn fta-btn" >Cancel</a>
                        <input type="submit" value="Save" class="btn fta-btn " />
                    </div>
                    
                </form>
            </div>
        </section>
    

</body>
</html>