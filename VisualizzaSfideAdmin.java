package it.unirc.nba.servlet.privato.admin;

import java.io.IOException;
import java.util.Vector;

import it.unirc.nba.dao.SfidaDAO;
import it.unirc.nba.model.Sfida;
import it.unirc.nba.model.Utente;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/privato/admin/VisualizzaSfideAdmin")
public class VisualizzaSfideAdmin extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
    	//passo 1 parametri in input (no)
    	
    	//passo 2 elaborazione
    	SfidaDAO sfidaDAO = new SfidaDAO();
    	Vector<Sfida> sfide = sfidaDAO.getAll();
    	
    	//passo 3 set attributi
    	request.setAttribute("sfide",  sfide);
    	
    	//passo 4 scelta della view
    	System.out.println(sfide.size());
    	request.getRequestDispatcher("sfide.jsp").forward(request, response);
    }
}

