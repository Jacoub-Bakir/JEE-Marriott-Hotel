<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib   uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <style> <%@include file="/WEB-INF/tableStyle.css"%> </style>
    <style> <%@include file="/WEB-INF/hotels.css"%> </style>
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
                        <a href="http://localhost:8080/TABD_TourismeProject/ReserverServlet" class="nav-link ">Reservations</a>
                    </li>
                    <li class="nav-item">
                        <a href="http://localhost:8080/TABD_TourismeProject/Consulterannulationservlet" class="nav-link active">Canceled Reservations</a>
                    </li>
                    <li class="nav-item">
                        <a href="http://localhost:8080/TABD_TourismeProject/VisitorServlet" class="nav-link ">Visitors</a>
                    </li>
                    
                </ul>
            </div>
        </div>
    </header>

    <section>
        <div class="container">

            
            
            <div class="content-box">
                <div class="pageHeader">
                    <h1>Canceled Reservations List :</h1> 
                   
                
                </div>
                <table>
                    <thead>
                        <tr>
                            <th>Visitor</th>
                            <th>Hotel</th>
                            <th>Room</th>
                            <th>Start Date</th>
                            
                            
                            
                            
                            
                            
                        </tr>
                    </thead>
                    <tbody>
                        <c:if test = "${canceledReservationsList.size() > 0}">
                         <c:forEach var="i" begin="0" end="${canceledReservationsList.size()-1}" step="1"> 
                          <tr>
                         
                           <td><c:out value="${canceledReservationsList[i].visiteur}" /></td>
                           <td><c:out value="${canceledReservationsList[i].hotel}" /></td>
                           <td><c:out value="${canceledReservationsList[i].chambre}" /></td>
                           <td><c:out value="${canceledReservationsList[i].date_debut}" /></td>
                           
                           
                             </tr>
                        
                        </c:forEach>
                        </c:if>
                        <c:if test = "${canceledReservationsList.size() == 0}">
                            <tr>
                                <td class="centerRow">No Canceled Reservations</td>
                            </tr>
                        </c:if>
                        
                    </tbody>
        
                </table>
            </div>
            
            
            
        </div>
    </section>
</body>
</html>