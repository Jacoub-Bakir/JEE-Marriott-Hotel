/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Database;
import model.reserver_hotel;
import model.visiteur;

/**
 *
 * @author mac
 */
@WebServlet(name = "NewVisitorSrevlet", urlPatterns = {"/NewVisitorSrevlet"})
public class NewVisitorSrevlet extends HttpServlet {

   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/newVisitor.jsp");
        dispatcher.include(request, response);
    }	
	
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		visiteur visiteur= new visiteur();
		Database visiteurDB = new Database();
                
                visiteur.setNomVisiteur(request.getParameter("nomVisiteur"));
                visiteur.setAdress(request.getParameter("adresse"));
                visiteur.setTel(Integer.parseInt(request.getParameter("tel")));
                System.out.println(request.getParameter("nomVisiteur"));
                visiteurDB.insertVisiteur(visiteur);
                
                RequestDispatcher dispatcher = request.getRequestDispatcher("VisitorServlet");
                dispatcher.include(request, response);
                
	}
}
