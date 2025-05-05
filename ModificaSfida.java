package it.unirc.nba.servlet.privato.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import it.unirc.nba.dao.SfidaDAO;
import it.unirc.nba.model.Sfida;

import java.io.IOException;

@WebServlet("/privato/admin/ModificaSfida")
public class ModificaSfida extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ModificaSfida() {
		super();
	}

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idSfida = request.getParameter("id");
		if (idSfida != null) {
			try {
				int id = Integer.parseInt(idSfida);
				SfidaDAO sfidaDAO = new SfidaDAO();
				Sfida sfida = sfidaDAO.get(id);
				if (sfida != null) {
					request.setAttribute("sfida", sfida);
					request.getRequestDispatcher("/privato/admin/modificaSfida.jsp").forward(request, response);
					return;
				}
			} catch (NumberFormatException e) {
				e.printStackTrace(); 
			}
		}
		response.sendRedirect(request.getContextPath() + "/privato/admin/errore.jsp");
	}

	//modifica sfida
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int idSfida = Integer.parseInt(request.getParameter("id"));
			String titolo = request.getParameter("titolo");
			String descrizione = request.getParameter("descrizione");

			Sfida sfida = new Sfida();
			sfida.setId(idSfida);
			sfida.setTitolo(titolo);
			sfida.setDescrizione(descrizione);

			SfidaDAO sfidaDAO = new SfidaDAO();
			boolean success = sfidaDAO.modifica(sfida);

			if (success) {
				response.sendRedirect(request.getContextPath() + "/privato/admin/successo.jsp");
			} else {
				response.sendRedirect(request.getContextPath() + "/privato/admin/errore.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace(); // log
			response.sendRedirect(request.getContextPath() + "/privato/admin/errore.jsp");
		}
	}
}
