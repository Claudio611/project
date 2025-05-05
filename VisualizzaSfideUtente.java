package it.unirc.nba.servlet.privato.utente;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Vector;

import it.unirc.nba.dao.SfidaDAO;
import it.unirc.nba.model.Sfida;

/**
 * Servlet implementation class VisualizzaSfideUtente
 */
@WebServlet("/privato/utente/VisualizzaSfideUtente")
public class VisualizzaSfideUtente extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VisualizzaSfideUtente() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {    
	    	//passo 1 parametri in input (no)
	    	
	    	//passo 2 elaborazione
	    	SfidaDAO sfidaDAO = new SfidaDAO();
	    	Vector<Sfida> sfide = sfidaDAO.getAll();
	    	
	    	//passo 3 set attributi
	    	request.setAttribute("sfide",  sfide);
	    	
	    	//passo 4 scelta della view
	    	System.out.println(sfide.size());
	    	request.getRequestDispatcher("sfideUtente.jsp").forward(request, response);
	    }
	}

