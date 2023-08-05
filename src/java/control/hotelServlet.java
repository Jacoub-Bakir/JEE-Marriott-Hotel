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

import model.hotel;

/**
 *
 * @author mac
 */
@WebServlet(name = "HotelServlet", urlPatterns = {"/HotelServlet"})
public class hotelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	Database userDAO = new Database();
        
        
		
		ArrayList<hotel> hotelsList = null;
		
		try {
			
			hotelsList = userDAO.getHotels();
			
		} catch (Exception  e) {
			
			System.out.println(e.getMessage());
		}
		
		request.setAttribute("hotelsList",hotelsList);
	    

		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/hotels.jsp");
		dispatcher.include(request, response);
	

    }

	

	
	

	
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
    
}
