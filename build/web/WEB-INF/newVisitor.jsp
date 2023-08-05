

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
                        <a href="http://localhost:8080/TABD_TourismeProject/HotelServlet" class="nav-link ">Hotels</a>
                    </li>
                    <li class="nav-item">
                        <a href="http://localhost:8080/TABD_TourismeProject/ReserverServlet" class="nav-link">Reservations</a>
                    </li>
                    <li class="nav-item">
                        <a href="http://localhost:8080/TABD_TourismeProject/Consulterannulationservlet" class="nav-link">Canceled Reservations</a>
                    </li>
                    <li class="nav-item">
                        <a href="http://localhost:8080/TABD_TourismeProject/VisitorServlet" class="nav-link active">Visitors</a>
                    </li>
                    
                </ul>
            </div>
        </div>
    </header>
        <section class="main__section">
            <div class='Section' >
                <form class="profile" action="NewVisitorSrevlet" Method="Post" autocomplete="off">
                    <h3 class="sectionTitle">Add New Visitor</h3>
                    <div class="input-container">
                        <label >Visitor Name :</label>
                        <input type="text" name="nomVisiteur" class="input" placeholder="Name"/>
                    </div>
                    <div class="input-container">
                        <label >Visitor Adresse :</label>
                        <input type="text" name="adresse" class="input" placeholder="Adresse"  />
                    </div>
                    <div class="input-container">
                        <label >Visitor Phone Number :</label>
                        <input type="tel" name="tel" class="input" placeholder=" phone" />
                    </div>
                    
                    
                    
                    <div class="buttons">
                        <a  href="http://localhost:8080/TABD_TourismeProject/VisitorServlet" class="btn fta-btn" >Cancel</a>
                        <input type="submit" value="Save" class="btn fta-btn " />
                    </div>
                    
                </form>
            </div>
        </section>
    

</body>
</html>