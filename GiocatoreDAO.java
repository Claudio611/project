package it.unirc.nba.dao;

import java.sql.*;
import java.util.Vector;
import it.unirc.nba.model.Giocatore;
import it.unirc.nba.utils.DBManager;

public class GiocatoreDAO {
    private Connection conn = null;

    public Giocatore get(Giocatore giocatore) {
        Giocatore res = null;
        conn = DBManager.startConnection();
        try {
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM giocatore WHERE id = ?");
            ps.setInt(1, giocatore.getId());
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                res = recordToGiocatore(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBManager.closeConnection();
        }
        return res;
    }

    public Vector<Giocatore> getGiocatoriByTeam(int idTeam) {
        Vector<Giocatore> res = new Vector<>();
        conn = DBManager.startConnection();
        try {
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM giocatore WHERE id = ?");
            ps.setInt(1, idTeam);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Giocatore giocatore = recordToGiocatore(rs);
                res.add(giocatore);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBManager.closeConnection();
        }
        return res;
    }

    public boolean salva(Giocatore giocatore) {
        String query = "INSERT INTO giocatore (nome, ruolo, altezza, annoEsordio, nazionalita, stile, valutazioneGenerale, id) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        boolean esito = false;
        conn = DBManager.startConnection();
        try {
            PreparedStatement ps = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, giocatore.getNome());
            ps.setString(2, giocatore.getRuolo());
            ps.setInt(3, giocatore.getAltezza());
            ps.setInt(4, giocatore.getAnnoEsordio());
            ps.setString(5, giocatore.getNazionalita());
            ps.setString(6, giocatore.getStile());
            ps.setInt(7, giocatore.getValutazioneGenerale());
            ps.setInt(8, giocatore.getId());

            int tmp = ps.executeUpdate();
            if (tmp == 1) {
                esito = true;
                ResultSet rs = ps.getGeneratedKeys();
                if (rs.next()) {
                    giocatore.setId(rs.getInt(1));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBManager.closeConnection();
        }
        return esito;
    }

    public boolean elimina(Giocatore giocatore) {
        String query = "DELETE FROM giocatore WHERE id = ?";
        boolean esito = false;
        conn = DBManager.startConnection();
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, giocatore.getId());
            int tmp = ps.executeUpdate();
            esito = tmp == 1;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBManager.closeConnection();
        }
        return esito;
    }

    public boolean modifica(Giocatore giocatore) {
        String query = "UPDATE giocatore SET nome = ?, ruolo = ?, altezza = ?, annoEsordio = ?, nazionalita = ?, stile = ?, valutazioneGenerale = ?, id = ? WHERE id = ?";
        boolean esito = false;
        conn = DBManager.startConnection();
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, giocatore.getNome());
            ps.setString(2, giocatore.getRuolo());
            ps.setInt(3, giocatore.getAltezza());
            ps.setInt(4, giocatore.getAnnoEsordio());
            ps.setString(5, giocatore.getNazionalita());
            ps.setString(6, giocatore.getStile());
            ps.setInt(7, giocatore.getValutazioneGenerale());
            ps.setInt(8, giocatore.getId());
            ps.setInt(9, giocatore.getId());

            int tmp = ps.executeUpdate();
            esito = tmp == 1;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBManager.closeConnection();
        }
        return esito;
    }

    private Giocatore recordToGiocatore(ResultSet rs) throws SQLException {
        Giocatore giocatore = new Giocatore();
        giocatore.setId(rs.getInt("id"));
        giocatore.setNome(rs.getString("nome"));
        giocatore.setRuolo(rs.getString("ruolo"));
        giocatore.setAltezza(rs.getInt("altezza"));
        giocatore.setAnnoEsordio(rs.getInt("annoEsordio"));
        giocatore.setNazionalita(rs.getString("nazionalita"));
        giocatore.setStile(rs.getString("stile"));
        giocatore.setValutazioneGenerale(rs.getInt("valutazioneGenerale"));

        // Calcolo personalizzato del punteggio
        int punteggio = calcolaPunteggio(giocatore);
        giocatore.setPunteggio(punteggio); // Imposta il punteggio calcolato

        return giocatore;
    }

    // Metodo per calcolare il punteggio di un giocatore (esempio semplificato)
    private int calcolaPunteggio(Giocatore giocatore) {
        // Esempio: somma di valutazioneGenerale e altezza diviso 10
        return (giocatore.getValutazioneGenerale() + giocatore.getAltezza()) / 10;
    }

    // Metodo per ottenere un singolo giocatore tramite ID
    public Giocatore getGiocatoreById(int id) {
        Giocatore res = null;
        conn = DBManager.startConnection();
        try {
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM giocatore WHERE id = ?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                res = recordToGiocatore(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBManager.closeConnection();
        }
        return res;
    }

    public Vector<Giocatore> getAll() {
        Vector<Giocatore> giocatori = new Vector<>();
        conn = DBManager.startConnection();
        try {
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM giocatore ORDER BY nome");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                giocatori.add(recordToGiocatore(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBManager.closeConnection();
        }
        return giocatori;
    }
    
}
