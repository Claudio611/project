package it.unirc.nba.servlet.privato.utente;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import it.unirc.nba.dao.TeamDAO;
import it.unirc.nba.model.Team;

/**
 * Servlet implementation class ConfermaTeam
 */
@WebServlet("/privato/utente/ConfermaTeam")
public class ConfermaTeam extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private TeamDAO teamDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        teamDAO = new TeamDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Recupero l'ID del team da confermare
        int idTeam = Integer.parseInt(request.getParameter("idTeam"));

        // Recupero il team dal database
        //Team team = teamDAO.getTeamById(idTeam);

        //if (team != null) {
            // Imposto il team come confermato
           // team.setConfermato(true);
            //boolean success = teamDAO.modifica(team);

           // if (success) {
                // Redirect alla pagina di successo
             //   response.sendRedirect("/privato/utente/successo.jsp");
         //   } else {
                // Se l'aggiornamento fallisce, ritorno un errore
           //     response.sendRedirect("/privato/utente/errore.jsp");
          //  }
        //} else {
            // Se il team non è stato trovato, errore
           // response.sendRedirect("/privato/utente/errore.jsp");
     //   }
    }
}

