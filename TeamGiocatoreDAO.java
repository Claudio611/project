package it.unirc.nba.dao;

import java.sql.*;
import java.util.Vector;

import it.unirc.nba.model.TeamGiocatore;
import it.unirc.nba.utils.DBManager;

public class TeamGiocatoreDAO {
    private Connection conn = null;

    // Metodo per mappare il risultato del ResultSet in un oggetto TeamGiocatore
    private TeamGiocatore recordToTeamGiocatore(ResultSet rs) throws SQLException {
        TeamGiocatore tg = new TeamGiocatore();
        tg.setIdTeam(rs.getInt("idTeam"));
        tg.setIdGiocatore(rs.getInt("idGiocatore"));
        tg.setRuoloAssegnato(rs.getString("ruoloAssegnato")); // Nuovo mapping per ruoloAssegnato
        return tg;
    }

    // Metodo per salvare un giocatore in un team con ruolo assegnato
    public boolean salva(TeamGiocatore tg) {
        String query = "INSERT INTO TeamGiocatori (idTeam, idGiocatore, ruoloAssegnato) VALUES (?, ?, ?)";
        conn = DBManager.startConnection();
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, tg.getIdTeam());
            ps.setInt(2, tg.getIdGiocatore());
            ps.setString(3, tg.getRuoloAssegnato()); // Set ruoloAssegnato
            return ps.executeUpdate() == 1;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBManager.closeConnection();
        }
        return false;
    }

    // Metodo per eliminare un giocatore da un team
    public boolean elimina(TeamGiocatore tg) {
        String query = "DELETE FROM TeamGiocatori WHERE idTeam = ? AND idGiocatore = ?";
        conn = DBManager.startConnection();
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, tg.getIdTeam());
            ps.setInt(2, tg.getIdGiocatore());
            return ps.executeUpdate() == 1;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBManager.closeConnection();
        }
        return false;
    }

    // Metodo per ottenere tutti i giocatori di un team
    public Vector<TeamGiocatore> getByTeam(int idTeam) {
        String query = "SELECT * FROM TeamGiocatori WHERE idTeam = ?";
        Vector<TeamGiocatore> res = new Vector<>();
        conn = DBManager.startConnection();
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, idTeam);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                res.add(recordToTeamGiocatore(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBManager.closeConnection();
        }
        return res;
    }

    // Metodo per aggiungere un giocatore a un team con ruolo assegnato
    public boolean aggiungiGiocatore(int idTeam, int idGiocatore, String ruoloAssegnato) {
        boolean esito = false;
        conn = DBManager.startConnection();
        try {
            String query = "INSERT INTO TeamGiocatori (idTeam, idGiocatore, ruoloAssegnato) VALUES (?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, idTeam);
            ps.setInt(2, idGiocatore);
            ps.setString(3, ruoloAssegnato); // Set ruoloAssegnato

            int rows = ps.executeUpdate();
            esito = rows > 0; // Verifica che siano stati aggiunti dei record
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBManager.closeConnection();
        }
        return esito;
    }
}