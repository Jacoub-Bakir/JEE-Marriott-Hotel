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
import javax.servlet.http.HttpSession;
import model.Database;
import model.reserver_hotel;

/**
 *
 * @author mac
 */
@WebServlet(name = "newREservation", urlPatterns = {"/newREservation"})
public class newREservation extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/newReservation.jsp");
        dispatcher.include(request, response);
    }	
	
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reserver_hotel reservation= new reserver_hotel();
		Database reservationDB = new Database();
                
                reservation.setVisiteur(request.getParameter("Visiteur"));
                reservation.setHotel(request.getParameter("hotel"));
                reservation.setChambre(Integer.parseInt(request.getParameter("chambre")));
                String date_resStr = request.getParameter("date_res").replace("T", " ")+":00";
                String date_finStr = request.getParameter("date_fin").replace("T", " ")+":00";
                Timestamp date_res =Timestamp.valueOf(date_resStr);
                Timestamp date_fin = Timestamp.valueOf(date_finStr);
                reservation.setDate_res(date_res);
                reservation.setDate_fin(date_fin);
                int isolationLevel = Integer.parseInt(request.getParameter("isolationLevel"));
                String msg = reservationDB.reserver_chambreProcedure(reservation,isolationLevel);
                
                HttpSession session = request.getSession();
                session.setAttribute("connection", reservationDB);
                session.setAttribute("message", msg);
                RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/commit.jsp");
                dispatcher.include(request, response);
                
	}
	
}
