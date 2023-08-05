/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.sql.Timestamp;
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
import model.reserver_hotel;

/**
 *
 * @author mac
 */
@WebServlet(name = "commitServlet", urlPatterns = {"/commitServlet"})
public class commitServlet extends HttpServlet {

   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
    }	
	
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
        
        HttpSession session =  request.getSession();  
        Database connection = (Database)session.getAttribute("connection");
        PrintWriter out = response.getWriter();
        String msg = (String) session.getAttribute("message");
    
        try { 
            
                if(request.getParameter("transactionResult").equals("Commit")){

                        connection.commitTransaction(connection);
                        out.println("<script type='text/javascript'>\n");
                        out.println("alert( \"transaction commited\");\n");
                        out.println("</script>\n");
                        
                        

                }else if(request.getParameter("transactionResult").equals("Rollback")){
                    connection.rollbackTransaction(connection);
                    out.println("<script type='text/javascript'>\n");
                    out.println("alert( \"transaction aborted\");\n");
                    out.println("</script>\n");

                    
                }
            
            
        }catch (SQLException ex) {
                System.out.println(ex);;
        }
        if(msg!="nope"){
                
                if(request.getParameter("transactionResult").equals("Commit")){
                    out.println("<script type='text/javascript'>\n");
                    out.println("alert( \""+msg+"\");\n");
                    out.println("</script>\n");
                }else if(request.getParameter("transactionResult").equals("Rollback")){
                    out.println("<script type='text/javascript'>\n");
                    out.println("alert( \"Reservation Canceled\");\n");
                    out.println("</script>\n");
                }
                
                RequestDispatcher dispatcher = request.getRequestDispatcher("ReserverServlet");
                dispatcher.include(request, response);
            } else{
                
                String hotel = (String)session.getAttribute("hotelName");
                ArrayList<chambre> roomList = new ArrayList<chambre>();
                try {
                        
                        roomList = connection.getHotelRooms(hotel);

                } catch (Exception e) {

                       System.out.println(e);
                }
                request.setAttribute("hotelName",hotel);
                request.setAttribute("roomsList",roomList);
                RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/hotelRooms.jsp");
                dispatcher.include(request, response);
        }    
	
    
}
}
