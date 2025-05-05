package it.unirc.nba.dao;

import it.unirc.nba.model.Giocatore; 
import it.unirc.nba.model.Team;
import it.unirc.nba.utils.DBManager;

import java.sql.*;
import java.util.Vector;

public class TeamDAO {
    private Connection conn;

    // Metodo per trasformare un record del ResultSet in un oggetto Team
    private Team recordToTeam(ResultSet rs) throws SQLException {
        Team team = new Team();
        team.setId(rs.getInt("id"));
        team.setIdUtente(rs.getInt("idUtente"));
        team.setIdSfida(rs.getInt("idSfida"));
        team.setNomeTeam(rs.getString("nomeTeam"));
        team.setFeedbackGenerato(rs.getString("feedbackGenerato"));
        team.setPunteggio(rs.getInt("punteggio")); // Recupera il punteggio
        return team;
    }

    // Metodo per recuperare un team specifico
    public Team get(Team team) {
        Team res = null;
        conn = DBManager.startConnection();
        try {
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM team WHERE id = ?");
            ps.setInt(1, team.getId());
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                res = recordToTeam(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBManager.closeConnection();
        }
        return res;
    }

    // Metodo per recuperare tutti i team
    public Vector<Team> getAll() {
        Vector<Team> res = new Vector<>();
        conn = DBManager.startConnection();
        try {
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM team ORDER BY id");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                res.add(recordToTeam(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBManager.closeConnection();
        }
        return res;
    }

    // Metodo per salvare un nuovo team
    public boolean salva(Team team) {
        String query = "INSERT INTO team (idUtente, idSfida, nomeTeam, feedbackGenerato, punteggio) VALUES (?, ?, ?, ?, ?)";
        boolean esito = false;
        conn = DBManager.startConnection();
        try {
            PreparedStatement ps = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, team.getIdUtente());
            ps.setInt(2, team.getIdSfida());
            ps.setString(3, team.getNomeTeam());
            ps.setString(4, team.getFeedbackGenerato());
            ps.setInt(5, team.getPunteggio()); // Salva il punteggio calcolato
            int tmp = ps.executeUpdate();
            if (tmp == 1) {
                esito = true;
                ResultSet rs = ps.getGeneratedKeys();
                if (rs.next()) {
                    team.setId(rs.getInt(1));
                    System.out.println("Team inserito con ID: " + rs.getInt(1));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBManager.closeConnection();
        }
        return esito;
    }

    // Metodo per aggiornare lo stato del team
    public boolean modificaStato(Team team) {
        String query = "UPDATE team SET feedbackGenerato = ?, punteggio = ? WHERE id = ?";
        boolean esito = false;
        conn = DBManager.startConnection();
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, team.getFeedbackGenerato());
            ps.setInt(2, team.getPunteggio()); // Aggiorna il punteggio
            ps.setInt(3, team.getId());
            esito = ps.executeUpdate() == 1;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBManager.closeConnection();
        }
        return esito;
    }

    // Metodo per aggiungere un giocatore a un team
    public void aggiungiGiocatoreAlTeam(Team team, Giocatore giocatore, String ruolo) {
        String query = "INSERT INTO TeamGiocatore (idTeam, idGiocatore, ruoloAssegnato) VALUES (?, ?, ?)";
        conn = DBManager.startConnection();
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, team.getId());
            ps.setInt(2, giocatore.getId());
            ps.setString(3, ruolo);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBManager.closeConnection();
        }
    }

    // Metodo per recuperare i giocatori di un team
    public Vector<Giocatore> getGiocatoriDelTeam(Team team) {
        Vector<Giocatore> giocatori = new Vector<>();
        String query = "SELECT g.* FROM giocatore g JOIN team_giocatore tg ON g.id = tg.id_giocatore WHERE tg.id_team = ?";
        conn = DBManager.startConnection();
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, team.getId());
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Giocatore giocatore = new Giocatore();
                giocatore.setId(rs.getInt("id"));
                giocatore.setNome(rs.getString("nome"));
                giocatore.setRuolo(rs.getString("ruolo"));
                giocatore.setAltezza(rs.getInt("altezza"));
                giocatore.setAnnoEsordio(rs.getInt("annoEsordio"));
                giocatore.setNazionalita(rs.getString("nazionalita"));
                giocatore.setStile(rs.getString("stile"));
                giocatore.setValutazioneGenerale(rs.getInt("valutazioneGenerale"));
                giocatori.add(giocatore);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBManager.closeConnection();
        }
        return giocatori;
    }
    
 // Metodo per calcolare il punteggio e generare il messaggio dinamico
    public void generaFeedback() {
        if (giocatori == null || giocatori.isEmpty()) {
            feedbackGenerato = "Errore: nessun giocatore selezionato. Per favore, seleziona almeno un giocatore per creare un team.";
            punteggio = 0;
            return;
        }

        int punteggioTotale = 0;
        Giocatore migliorGiocatore = null;
        int valutazioneMassima = 0;

        StringBuilder dettagliGiocatori = new StringBuilder("Analisi del team:\n");

        // Calcolo del punteggio totale e individuazione del miglior giocatore
        for (Giocatore giocatore : giocatori) {
            int valutazione = giocatore.getValutazioneGenerale();
            punteggioTotale += valutazione;

            dettagliGiocatori.append("- ")
                             .append(giocatore.getNome())
                             .append(" (Valutazione: ")
                             .append(valutazione)
                             .append(", Ruolo: ")
                             .append(giocatore.getRuolo())
                             .append(")\n");

            if (valutazione > valutazioneMassima) {
                valutazioneMassima = valutazione;
                migliorGiocatore = giocatore;
            }
        }

        // Normalizzazione del punteggio su base 100
        int punteggioMassimo = giocatori.size() * 100; // Supponiamo che ogni giocatore possa avere un massimo di 100
        punteggio = Math.min(100, (punteggioTotale * 100) / punteggioMassimo);

        // Generazione del messaggio dinamico basato sul punteggio
        StringBuilder feedback = new StringBuilder();

        if (punteggio >= 90) {
            feedback.append("Ottima selezione! Il tuo team è straordinario!\n");
        } else if (punteggio >= 70) {
            feedback.append("Buona selezione! Ci sono margini di miglioramento.\n");
        } else {
            feedback.append("La selezione del team necessita di miglioramenti.\n");
        }

        // Dettagli sul miglior giocatore
        if (migliorGiocatore != null) {
            feedback.append("Il miglior giocatore del tuo team è ")
                    .append(migliorGiocatore.getNome())
                    .append(" con una valutazione di ")
                    .append(migliorGiocatore.getValutazioneGenerale())
                    .append(".\n");
        }

        // Inserimento dei dettagli dei giocatori
        feedback.append("\n").append(dettagliGiocatori);

        // Assegnazione del feedback generato
        feedbackGenerato = feedback.toString();
    }
    
}