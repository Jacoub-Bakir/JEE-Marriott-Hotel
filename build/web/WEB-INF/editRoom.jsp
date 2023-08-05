<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    
   
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
        <section class="main__section">
            <div class='Section' >
                <form class="profile modification" action="editRoomServlet" method="post" >
                        
                    
                    <h3 class="sectionTitle">Edit Room</h3>
                    <div class="input-container">
                        <label >Room Number :</label>
                        <input type="text" name="numero" class="input" value="${chambre.numero}" readonly/>
                    </div>
                    <div class="input-container">
                        <label >Hotel :</label>
                        <input type="text" name="hotel" class="input" value="${chambre.hotel}" readonly/>
                    </div>
                    <div class="input-container">
                        <label >Description :</label>
                        <input type="text" name="description" class="input" value="${chambre.decription}"/>
                    </div>
                    <div class="input-container">
                        <label >Capacity :</label>
                        <input type="text" name="nmbrPersonne" class="input" value="${chambre.nmbrPersonne}"  />
                    </div>
                    <div class="input-container">
                        <label >Price :</label>
                        <input type ="number" name="prix" class="input" value="${chambre.prix}"/>
                    </div>
                    
                    <div class="input-container">
                        <label >Choose Transaction Isolation Level :</label>
                        <div class="custom_select">
                            <select name="isolationLevel" >
                                <option value="8">SERIALIZABLE</option>
                                <option value="4">REPEATABLE READ</option>
                                <option value="2">READ COMMITTED</option>
                                <option value="1">READ UNCOMMITTED</option>
                            </select>
                        </div>
                    </div>
                        
                    <div class="buttons">
                        <a  href="http://localhost:8080/TABD_TourismeProject/hotelRoomsServlet?hotel=${chambre.hotel}" class="btn fta-btn" >Cancel</a>
                        <input type="submit" value="Save" class="btn fta-btn " />
                    </div>
                    
                </form>
            </div>
        </section>
     
</body>
</html>