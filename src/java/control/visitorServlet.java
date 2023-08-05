package control;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Database;
import model.reserver_hotel;
import model.visiteur;


@WebServlet("/VisitorServlet")
public class visitorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public visitorServlet() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
Database userDAO = new Database();
		
		ArrayList<visiteur> visitorList = null;
		
		try {
			
			visitorList = userDAO.getVisitors();
			
		} catch (Exception  e) {
			
			System.out.println(e.getMessage());
		}
		
		request.setAttribute("visitorsList",visitorList);
	    

		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/visitors.jsp");
		dispatcher.include(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            doGet(request,response);
	}

}
