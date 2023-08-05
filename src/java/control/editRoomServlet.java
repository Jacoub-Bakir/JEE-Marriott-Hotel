/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Database;
import model.chambre;

/**
 *
 * @author mac
 */
@WebServlet(name = "editRoomServlet", urlPatterns = {"/editRoomServlet"})
public class editRoomServlet extends HttpServlet {

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
            int nmbrRoom = Integer.parseInt(request.getParameter("chambre"));
            String hotel =request.getParameter("hotel");
            Database Database = new Database();
            chambre chambre = null;
                        
            try {
                chambre = Database.getRoom(nmbrRoom,hotel);
                request.setAttribute("chambre", chambre);
                RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/editRoom.jsp");
                dispatcher.include(request, response);
             } catch (Exception ex) {
                 System.out.println(ex);
             }
                        
		      
        
        
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
                Database database =new Database();
                String hotel = request.getParameter("hotel");
                HttpSession session = request.getSession();
                session.setAttribute("connection", database);
                
		chambre chambre = new chambre();
                chambre.setNumero(Integer.parseInt(request.getParameter("numero")));
                chambre.setHotel(request.getParameter("hotel"));
                chambre.setDecription(request.getParameter("description"));
                chambre.setNmbrPersonne(Integer.parseInt(request.getParameter("nmbrPersonne")));
                chambre.setPrix(Float.parseFloat(request.getParameter("prix")));   
                int isolationLevel = Integer.parseInt(request.getParameter("isolationLevel"));
		
		try {
                        database.editRoom(chambre,isolationLevel);
		} catch (Exception e) {
                    System.out.println(e);
		} 
                
               
		
                session.setAttribute("message", "nope");
                session.setAttribute("hotelName",hotel);
		
		this.getServletContext().getRequestDispatcher("/WEB-INF/commit.jsp").forward(request,response);
				
    } 
                 
   
}
