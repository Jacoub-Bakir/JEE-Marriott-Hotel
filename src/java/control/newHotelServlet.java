/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Database;
import model.hotel;
import sun.rmi.server.Dispatcher;


@WebServlet(name = "newHotelServlet", urlPatterns = {"/newHotelServlet"})
public class newHotelServlet extends HttpServlet {
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    RequestDispatcher dispatcher =  request.getRequestDispatcher("/WEB-INF/newHotel.jsp");
    dispatcher.forward(request, response);
        
}

protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    hotel hotel = new hotel();
    hotel.setNom(request.getParameter("nom"));
    hotel.setAdresse(request.getParameter("adresse"));
    hotel.setVille(request.getParameter("ville"));
    hotel.setCodePostal(request.getParameter("codepostal")); 
    hotel.setEtoiles(Integer.parseInt(request.getParameter("etoiles")));
    hotel.setCapacite(Integer.parseInt(request.getParameter("capacite")));
    hotel.setDisponible(1);
    
    Database hotelDB = new Database();
    
    hotelDB.insertHotel(hotel);
    RequestDispatcher dispatcher = request.getRequestDispatcher("HotelServlet");
    dispatcher.include(request, response);
       
       
    
}


}


