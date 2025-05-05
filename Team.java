package it.unirc.nba.model;

import java.util.Vector;

public class Team {
    private int id;
    private int idUtente;
    private int idSfida;
    private String nomeTeam;
    private Vector<Giocatore> giocatori;
    private String feedbackGenerato;
    private int punteggio;

    public Team() {}

    public Team(int id, int idUtente, int idSfida, String nomeTeam, Vector<Giocatore> giocatori, String feedbackGenerato, int punteggio) {
        this.id = id;
        this.idUtente = idUtente;
        this.idSfida = idSfida;
        this.nomeTeam = nomeTeam;
        this.giocatori = giocatori;
        this.feedbackGenerato = feedbackGenerato;
        this.punteggio = punteggio;
    }

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getIdUtente() { return idUtente; }
    public void setIdUtente(int idUtente) { this.idUtente = idUtente; }

    public int getIdSfida() { return idSfida; }
    public void setIdSfida(int idSfida) { this.idSfida = idSfida; }

    public String getNomeTeam() { return nomeTeam; }
    public void setNomeTeam(String nomeTeam) { this.nomeTeam = nomeTeam; }

    public Vector<Giocatore> getGiocatori() { return giocatori; }
    public void setGiocatori(Vector<Giocatore> giocatori) { this.giocatori = giocatori; }

    public String getFeedbackGenerato() { return feedbackGenerato; }
    public void setFeedbackGenerato(String feedbackGenerato) { this.feedbackGenerato = feedbackGenerato; }

    public int getPunteggio() { return punteggio; }
    public void setPunteggio(int punteggio) { this.punteggio = punteggio; }

    // Metodo per calcolare il punteggio e generare il feedback
    public void generaFeedback() {
        if (giocatori == null || giocatori.isEmpty()) {
            feedbackGenerato = "Errore: nessun giocatore selezionato.";
            punteggio = 0;
            return;
        }

        int punteggioTotale = 0;

        // Somma degli attributi dei giocatori per calcolare il punteggio totale
        for (Giocatore giocatore : giocatori) {
            punteggioTotale += giocatore.getValutazioneGenerale(); // Usa valutazioneGenerale come metrica principale
        }

        // Normalizzazione del punteggio su base 100
        int punteggioMassimo = giocatori.size() * 100; // Supponiamo che ogni giocatore abbia un massimo di 100
        punteggio = Math.min(100, (punteggioTotale * 100) / punteggioMassimo);

        // Generazione del feedback basato sull'intervallo del punteggio
        if (punteggio >= 90) {
            feedbackGenerato = "Ottima selezione! Il tuo team è straordinario!";
        } else if (punteggio >= 70) {
            feedbackGenerato = "Buona selezione! Ci sono margini di miglioramento.";
        } else {
            feedbackGenerato = "La selezione del team necessita di miglioramenti.";
        }
    }

    @Override
    public String toString() {
        return "Team [id=" + id + ", idUtente=" + idUtente + ", idSfida=" + idSfida + ", nomeTeam=" + nomeTeam
                + ", giocatori=" + giocatori + ", feedbackGenerato=" + feedbackGenerato + ", punteggio=" + punteggio + "]";
    }
}