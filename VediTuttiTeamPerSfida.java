package it.unirc.nba.servlet.privato.admin;

import java.io.IOException;
import java.util.Vector;

import it.unirc.nba.dao.TeamDAO;
import it.unirc.nba.model.Team;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/privato/admin/VediTuttiTeamPerSfida")
public class VediTuttiTeamPerSfida extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Passo 1: recupero del parametro 'id' dalla richiesta
        String idSfida = request.getParameter("id");
        
        // Verifica se il parametro 'id' è presente
        if (idSfida == null || idSfida.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Il parametro 'id' è necessario");
            return;
        }

        // Passo 2: elaborazione - converto l'id e recupero i team associati a questa sfida
        try {
            int id = Integer.parseInt(idSfida); // Converto il parametro id a intero
            
            // Creazione istanza di TeamDAO e recupero dei team per la sfida
            TeamDAO teamDAO = new TeamDAO();
            Vector<Team> teamList = teamDAO.getAllTeamsForSfida(id); // Recupero i team associati alla sfida

            // Passo 3: setto l'attributo per la visualizzazione
            request.setAttribute("teamList", teamList);

            // Passo 4: invio la risposta alla JSP per la visualizzazione
            request.getRequestDispatcher("teamPerSfida.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            // Se l'id non è valido (non è un numero), gestisco l'errore
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "L'ID sfida non è valido");
        }
    }
}

