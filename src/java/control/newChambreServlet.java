package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Database;
import model.chambre;


@WebServlet("/newChambreServlet")
public class newChambreServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public newChambreServlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String hotel = request.getParameter("hotel");
		request.setAttribute("hotel",hotel);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/newChambre.jsp");
                dispatcher.include(request, response);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
                String hotel = request.getParameter("hotel");
                chambre chambre = new chambre();
		chambre.setNumero(Integer.parseInt(request.getParameter("numero")));
		chambre.setNmbrPersonne(Integer.parseInt(request.getParameter("nmbrPersonne")));
		chambre.setHotel(hotel);
		chambre.setDecription(request.getParameter("description"));
		chambre.setPrix(Float.parseFloat(request.getParameter("prix")));
		Database database = new Database();
		database.insertChambre(chambre);
                
                request.setAttribute("hotel", hotel);
		RequestDispatcher dispatcher = request.getRequestDispatcher("hotelRoomsServlet");
                dispatcher.include(request, response);
		
	}

}
