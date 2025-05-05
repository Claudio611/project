package it.unirc.nba.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;

import it.unirc.nba.dao.UtenteDAO;
import it.unirc.nba.model.Utente;

@WebServlet("/registrazione")
public class Registrazione extends HttpServlet {

    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/fantanba";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "root";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
    	        // Ottieni i parametri dal form di registrazione
    	        String username = request.getParameter("username");
    	        String email = request.getParameter("email");
    	        String password = request.getParameter("password");

    	        // Verifica che tutti i campi siano compilati
    	        if (username == null || email == null || password == null || username.isEmpty() || email.isEmpty() || password.isEmpty()) {
    	            request.setAttribute("errore", "Tutti i campi sono obbligatori.");
    	            request.getRequestDispatcher("registrazione.jsp").forward(request, response);
    	            return;
    	        }

    	        // Crea l'oggetto Utente
    	        Utente utente = new Utente();
    	        utente.setUsername(username);
    	        utente.setEmail(email);
    	        utente.setPassword(password);  
    	        utente.setRuolo("utente"); 
    	        utente.setStatus("ATTIVO"); 

    	        // A questo punto, puoi inserire l'utente nel database tramite il DAO
    	        UtenteDAO utenteDAO = new UtenteDAO();
    	        boolean registrato = utenteDAO.registraUtente(utente);  // Aggiungi un metodo nel DAO per gestire l'inserimento

    	        if (registrato) {
    	            // Se l'utente è stato registrato correttamente, reindirizza al login
    	            response.sendRedirect("login.jsp");
    	        } else {
    	            // In caso di errore, mostra un messaggio
    	            request.setAttribute("errore", "Errore nella registrazione, riprova.");
    	            request.getRequestDispatcher("registrazione.jsp").forward(request, response);
    	        }
    	    }
}