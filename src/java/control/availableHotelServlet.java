/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Annulation;
import model.Database;
import model.chambre;
import model.hotel;

/**
 *
 * @author mac
 */
@WebServlet(name = "availableHotelServlet", urlPatterns = {"/availableHotelServlet"})
public class availableHotelServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/dateAvailable.jsp");
            dispatcher.include(request, response);
	

    }

	

	
	

	
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Database userDAO = new Database();
        
        ArrayList<chambre> roomsList=null;
        
                
        String date_resStr = request.getParameter("date_res").replace("T", " ")+":00";
        String date_finStr = request.getParameter("date_fin").replace("T", " ")+":00";
        int isolationLevel = Integer.parseInt(request.getParameter("isolationLevel"));
        
        
        Timestamp date_res =Timestamp.valueOf(date_resStr);
        Timestamp date_fin = Timestamp.valueOf(date_finStr);
        ArrayList<Timestamp> dates = new ArrayList<Timestamp>();
            dates.add(date_res);
            dates.add(date_fin);	
		try {
			
			roomsList = userDAO.consulter_hotelsProcedure(date_res, date_fin,isolationLevel);
			
		} catch (Exception  e) {
			
			System.out.println(e.getMessage());
		}
		
		request.setAttribute("roomsList",roomsList);
                request.setAttribute("roomsListObject",roomsList.toString());
                request.setAttribute("reservationDates",dates);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/availabeHotelsRooms.jsp");
		dispatcher.include(request, response);
    }
}
