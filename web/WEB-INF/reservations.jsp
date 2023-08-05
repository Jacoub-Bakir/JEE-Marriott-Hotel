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
                        <a href="http://localhost:8080/TABD_TourismeProject/ReserverServlet" class="nav-link active">Reservations</a>
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

    <section>
        <div class="container">

            
            
            <div class="content-box">
                <div class="pageHeader">
                    <h1>Reservations List :</h1>
                    <div class="btns">
                    <a href="http://localhost:8080/TABD_TourismeProject/newREservation" class="btn cta-btn">+ Add New Reservation</a>
                    </div>
                </div>
                <table>
                    <thead>
                        <tr>
                            <th>Visitor</th>
                            <th>Hotel</th>
                            <th>Room</th>
                            <th>Start Date</th>
                            <th>End Date</th>
                            <th>Action</th>
                            
                            
                            
                            
                        </tr>
                    </thead>
                    <tbody>
                        <c:if test = "${reservationsList.size() > 0}">
                         <c:forEach var="i" begin="0" end="${reservationsList.size()-1}" step="1"> 
                          <tr>
                         
                           <td><c:out value="${reservationsList[i].visiteur}" /></td>
                           <td><c:out value="${reservationsList[i].hotel}" /></td>
                           <td><c:out value="${reservationsList[i].chambre}" /></td>
                           <td><c:out value="${reservationsList[i].date_res}" /></td>
                           <td><c:out value="${reservationsList[i].date_fin}" /></td>
                           <td>
                                <a class="btn table_btn" href="AnullerServlet?v=${reservationsList[i].visiteur}&h=${reservationsList[i].hotel}&c=${reservationsList[i].chambre}&d=${reservationsList[i].date_res}">Cancel</a>
                           </td>
                             </tr>
                        
                        </c:forEach>
                        </c:if>
                        <c:if test = "${reservationsList.size() == 0}">
                            <tr>
                                <td class="centerRow">No Reservations Yet</td>
                            </tr>
                        </c:if>
                        
                    </tbody>
        
                </table>
            </div>
            
            
            
        </div>
    </section>
</body>
</html>