

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <style> <%@include file="/WEB-INF/newHotel.css"%> </style>
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
        <section class="main__section">
            <div class='Section' >
                <form class="profile" action="newREservation" Method="Post" autocomplete="off">
                    <h3 class="sectionTitle">Add New Reservation</h3>
                    <div class="input-container">
                        <label >Visitor Name :</label>
                        <input type="text" name="Visiteur" class="input" placeholder="Visitor Name"/>
                    </div>
                    <div class="input-container">
                        <label >Hotel Name :</label>
                        <input type="text" name="hotel" class="input" placeholder="Hotel Name"  />
                    </div>
                    <div class="input-container">
                        <label >Room Number :</label>
                        <input type="number" name="chambre" class="input" placeholder=" Room Number" />
                    </div>
                    <div class="input-container">
                        <label >Start Date :</label>
                        <input type="datetime-local" min="2022-01-01T00:00"  max="2050-06-01T00:00" 
                               onchange="document.getElementById('date_finField').min=this.value;"
                               name="date_res" class="input " id="date_resField" placeholder="start date"/>
                    </div>
                    <div class="input-container">
                        <label >End Date :</label>
                        <input type="datetime-local" min="2022-01-13T12:30"  max="2050-06-01T00:00" name="date_fin" class="input" id="date_finField" placeholder="end date"  />
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
                        <a  href="http://localhost:8080/TABD_TourismeProject/HotelServlet" class="btn fta-btn" >Cancel</a>
                        <input type="submit" value="Save" class="btn fta-btn " />
                    </div>
                    
                </form>
            </div>
        </section>
    <script>
        
        var today = new Date();
        var dd = today.getDate();
        var mm = today.getMonth() + 1; 
        var yyyy = today.getFullYear();
        var HH = today.getHours();
        var MM = today.getMinutes();

        if (dd < 10) {
           dd = '0' + dd;
        }

        if (mm < 10) {
           mm = '0' + mm;
        } 

        today = yyyy + '-' + mm + '-' + dd+'T'+HH+':'+MM+':'+'00';
        document.getElementById("date_resField").setAttribute("min", today);
      
    </script>

</body>
</html>