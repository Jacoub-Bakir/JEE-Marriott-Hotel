package control;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Annulation;
import model.Database;
import model.reserver_hotel;


@WebServlet("/Consulterannulationservlet")
public class consulterannulationservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public consulterannulationservlet() {
        super();
      
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            Database userDAO = new Database();
		
		ArrayList<Annulation> canceledReservationsList = null;
		
		try {
			
			canceledReservationsList = userDAO.getCanceledReservations();
			
		} catch (Exception  e) {
			
			System.out.println(e.getMessage());
		}
		
		request.setAttribute("canceledReservationsList",canceledReservationsList);
	    

		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/annulation.jsp");
		dispatcher.include(request, response);
	
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	
	}

}
