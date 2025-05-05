package it.unirc.nba.servlet.privato.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import it.unirc.nba.dao.SfidaDAO;
import it.unirc.nba.model.Sfida;

/**
 * Servlet implementation class CreaSfida
 */
@WebServlet("/privato/admin/CreaSfida")
public class CreaSfida extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public CreaSfida() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //Recupero parametri i
        String titolo = request.getParameter("titolo");
        String descrizione = request.getParameter("descrizione");

        //Verifica campi vuoti
        if (titolo == null || titolo.trim().isEmpty() || descrizione == null || descrizione.trim().isEmpty()) {
            //Se uno dei campi è vuoto vado a errore.jsp
            response.sendRedirect("errore.jsp");
            return;
        }

        //Creazione dell'oggetto Sfida
        Sfida sfida = new Sfida();
        sfida.setTitolo(titolo);
        sfida.setDescrizione(descrizione);

        //Salvataggio della sfida nel DB
        SfidaDAO sfidaDAO = new SfidaDAO();

        try {
            boolean successo = sfidaDAO.salva(sfida);

            if (successo) {
                //Se la sfida è stata creata con successo, successo.jsp
                response.sendRedirect("successo.jsp");
            } else {
                //In caso di errore, errore.jsp
                response.sendRedirect("errore.jsp");
            }
        } catch (Exception e) {
            // In caso di eccezione, errore.jsp
            e.printStackTrace();
            response.sendRedirect("errore.jsp");
        }
    }
}
