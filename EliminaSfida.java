package it.unirc.nba.servlet.privato.admin;

import java.io.IOException;
import it.unirc.nba.dao.SfidaDAO;
import it.unirc.nba.model.Sfida;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/privato/admin/EliminaSfida")
public class EliminaSfida extends HttpServlet {
    private static final long serialVersionUID = 1L;

    //pagina di conferma
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");

        if (id != null) {
            try {
                int idSfida = Integer.parseInt(id);
                SfidaDAO dao = new SfidaDAO();
                Sfida sfida = dao.get(idSfida);

                if (sfida != null) {
                    request.setAttribute("sfida", sfida);
                    request.getRequestDispatcher("ConfermaEliminazione.jsp").forward(request, response);
                    return;
                }

            } catch (NumberFormatException e) {
          }
        }

        request.setAttribute("error", "Sfida non trovata o ID non valido.");
        request.getRequestDispatcher("sfide.jsp").forward(request, response);
    }

    //elimina se conferma
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");

        if (id != null) {
            try {
                int idSfida = Integer.parseInt(id);
                Sfida sfida = new Sfida();
                sfida.setId(idSfida);

                boolean success = new SfidaDAO().elimina(sfida);

                if (success) {
                	request.setAttribute("messaggio", "Sfida eliminata con successo!");
                	request.getRequestDispatcher("successo.jsp").forward(request, response);
                    return;
                }

            } catch (NumberFormatException e) {
          }
        }

        request.setAttribute("error", "Errore durante l'eliminazione.");
        request.getRequestDispatcher("sfide.jsp").forward(request, response);
    }
}
