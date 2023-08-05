/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Database;
import model.chambre;
import model.hotel;

/**
 *
 * @author mac
 */
@WebServlet(name = "hotelRoomsServlet", urlPatterns = {"/hotelRoomsServlet"})
public class hotelRoomsServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	Database userDAO = new Database();
        
        
		
		ArrayList<chambre> hotelRoomsList = null;
                String hotel = request.getParameter("hotel");
		
		try {
			
			hotelRoomsList = userDAO.getHotelRooms(hotel);
			
		} catch (Exception  e) {
			
			System.out.println(e.getMessage());
		}
		request.setAttribute("hotelName",hotel);
		request.setAttribute("roomsList",hotelRoomsList);
	    

		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/hotelRooms.jsp");
		dispatcher.include(request, response);
	

    }

	

	
	

	
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
}
