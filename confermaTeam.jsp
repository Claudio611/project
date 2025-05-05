<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="it.unirc.nba.model.Team" %>
<%@ page import="it.unirc.nba.model.Giocatore" %>
<%@ page import="it.unirc.nba.model.Sfida" %>
<%@ page import="java.util.Vector" %>

<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <title>Conferma Team</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="/css/styles.css" rel="stylesheet" />
    <style>
        body {
            background-color: #222;
            color: white;
        }
        .form-container {
            max-width: 600px;
            margin: 50px auto;
            padding: 30px;
            border: 2px solid #333;
            border-radius: 10px;
            background-color: #333;
        }
        label {
            font-weight: bold;
            color: orange;
        }
        .btn-action {
            background-color: orange;
            border: none;
            padding: 10px 20px;
            color: white;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
            margin-top: 20px;
        }
        .btn-action:hover {
            background-color: #ff9800;
        }
    </style>
</head>
<body>

<%@ include file="frame_nav.html" %>

<%
    // Recupera il team appena creato e la sfida
    Team team = (Team) request.getAttribute("team");
    Vector<Giocatore> giocatori = (Vector<Giocatore>) request.getAttribute("giocatori");
    Sfida sfida = (Sfida) request.getAttribute("sfida");

    // Controlla se team e giocatori sono disponibili
    if (team == null || giocatori == null || sfida == null) {
        response.sendRedirect("erroreCreaTeam.jsp");
        return;
    }
%>

<h2 class="text-center mb-4" style="color: orange;">Riepilogo Team</h2>

<!-- Dettagli del team -->
<div class="form-container">
    <h4>Nome del Team: <%= team.getNomeTeam() %></h4>
    <p><strong>Sfida:</strong> <%= sfida.getTitolo() %></p>
    <p><strong>Stato:</strong> <%= team.isConfermato() ? "Confermato" : "Non Confermato" %></p>

    <h5 class="mt-4">Giocatori Selezionati:</h5>
    <ul>
        <% for (Giocatore giocatore : giocatori) { %>
            <li><%= giocatore.getNome() %> (<%= giocatore.getRuolo() %>)</li>
        <% } %>
    </ul>

    <!-- Bottoni per confermare o modificare il team -->
    <form action="/privato/utente/confermaTeam" method="post">
        <button type="submit" class="btn btn-success btn-action">Conferma Team</button>
    </form>
    <a href="/privato/utente/creaTeam.jsp" class="btn btn-warning btn-action">Modifica Team</a>
</div>

</body>
</html>
