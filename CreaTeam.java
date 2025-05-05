package it.unirc.nba.servlet.privato.utente;

import it.unirc.nba.dao.GiocatoreDAO;
import it.unirc.nba.dao.TeamDAO;
import it.unirc.nba.model.Giocatore;
import it.unirc.nba.model.Team;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/privato/utente/CreaTeam")
public class CreaTeam extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private TeamDAO teamDAO;
    private GiocatoreDAO giocatoreDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        teamDAO = new TeamDAO();
        giocatoreDAO = new GiocatoreDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Recupero dei parametri dal form
        String nomeTeam = request.getParameter("nomeTeam");
        String[] giocatoriSelezionati = request.getParameterValues("giocatoriSelezionati");
        String[] ruoliGiocatori = request.getParameterValues("ruoliGiocatori");

        // Recupero l'utente (se necessario) e la sfida (se necessario)
        HttpSession session = request.getSession();
        int idUtente = (int) session.getAttribute("idUtente"); // esempio
        int idSfida = Integer.parseInt(request.getParameter("idSfida"));

        // Creazione dell'oggetto Team
        Team team = new Team();
        team.setIdUtente(idUtente);
        team.setIdSfida(idSfida);
        team.setNomeTeam(nomeTeam);
        team.setConfermato(false); // inizialmente non confermato
        team.setVincoliRispettati(true); // supponiamo che siano rispettati per semplicità
        team.setFeedbackGenerato(""); // in attesa di feedback

        // Salvataggio del team nel database
        boolean teamCreato = teamDAO.salva(team);

        if (teamCreato) {
            // Aggiungi i giocatori al team
            if (giocatoriSelezionati != null && ruoliGiocatori != null) {
                for (int i = 0; i < giocatoriSelezionati.length; i++) {
                    String giocatoreIdStr = giocatoriSelezionati[i];
                    String ruolo = ruoliGiocatori[i];
                    Giocatore giocatore = giocatoreDAO.getGiocatoreById(Integer.parseInt(giocatoreIdStr));
                    if (giocatore != null) {
                        // Associa il giocatore al team tramite il metodo aggiungiGiocatoreAlTeam
                        teamDAO.aggiungiGiocatoreAlTeam(team, giocatore, ruolo);
                    }
                }
            }
            // Redirect alla pagina di conferma
            response.sendRedirect("confermaTeam.jsp");
        } else {
            // Errore nella creazione del team, riprova
            response.sendRedirect("erroreCreaTeam.jsp");
        }
    }
}
