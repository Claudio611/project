<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.Vector" %>
<%@ page import="it.unirc.nba.model.Giocatore" %>
<%@ page import="it.unirc.nba.model.Sfida" %>
<%@ page import="it.unirc.nba.model.Team" %>

<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <title>Crea Team</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="/css/styles.css" rel="stylesheet" />
    <style>
        #mainNav .navbar-brand img {
            width: 300px !important;
            height: auto !important;
            max-height: 100px !important;
        }
        
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
    // Recupero dell'oggetto Sfida e dei giocatori dalla request
    Sfida sfida = (Sfida) request.getAttribute("sfida");
    Vector<Giocatore> giocatori = (Vector<Giocatore>) request.getAttribute("giocatori");
    Team team = (Team) request.getAttribute("team");  // Nuovo oggetto Team passato dalla servlet
%>

<div class="form-container">
    <h2 class="text-center" style="color: orange;">Crea il tuo team</h2>

    <form action="/privato/utente/CreaTeam" method="POST">
        <!-- Passo l'id della sfida e l'id del team come campi nascosti -->
        <input type="hidden" name="idSfida" value="<%= sfida != null ? sfida.getId() : "" %>">
        <input type="hidden" name="idTeam" value="<%= team.getId() != 0 ? team.getId() : "" %>">

        <!-- Nome Team -->
        <div class="mb-3">
            <label for="nomeTeam">Nome del Team:</label>
            <input type="text" class="form-control" id="nomeTeam" name="nomeTeam" required>
        </div>

        <% String[] ruoli = {"PG", "SG", "SF", "PF", "C"}; %>
        <% if (giocatori != null && !giocatori.isEmpty()) { %>
            <% for (String ruolo : ruoli) { %>
                <div class="mb-3">
                    <label for="<%= ruolo.toLowerCase() %>"><%= ruolo %>:</label>
                    <select class="form-control" name="giocatori[<%= ruolo %>]" id="<%= ruolo.toLowerCase() %>" required>
                        <% for (Giocatore g : giocatori) { %>
                            <option value="<%= g.getId() %>">
                                <%= g.getNome() %> - <%= g.getNazionalita() %> (<%= g.getRuolo() %>)
                            </option>
                        <% } %>
                    </select>
                </div>
            <% } %>
        <% } else { %>
            <div class="alert alert-danger">Nessun giocatore disponibile!</div>
        <% } %>

        <button type="submit" class="btn btn-primary">Crea Team</button>
    </form>
</div>

</body>
</html>

