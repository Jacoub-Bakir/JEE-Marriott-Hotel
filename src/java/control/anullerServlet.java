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

import model.Annulation;
import model.Database;


@WebServlet("/AnullerServlet")
public class anullerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public anullerServlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Annulation anuller = new Annulation();
		anuller.setVisiteur(request.getParameter("v"));
		anuller.setHotel(request.getParameter("h"));
		anuller.setChambre(Integer.parseInt(request.getParameter("c")));
		anuller.setDate_debut(Timestamp.valueOf(request.getParameter("d")));
		Database db = new Database();
		String msg = db.annuler_reservationProcedure(anuller);
                
                PrintWriter out = response.getWriter();
                
                out.println("<script type='text/javascript'>\n");
                out.println("alert( \""+msg+"\");\n");
                out.println("</script>\n");
                RequestDispatcher dispatcher = request.getRequestDispatcher("ReserverServlet");
                dispatcher.include(request,response);
		
		
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}

}
