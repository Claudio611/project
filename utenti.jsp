<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.Vector" %>
<%@ page import="it.unirc.nba.model.Utente" %>

<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <title>Lista Utenti</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="/css/styles.css" rel="stylesheet" />
 
    <style>
        #mainNav .navbar-brand img {
            width: 300px !important;
            height: auto !important;
            max-height: 100px !important;
        }
        
        table {
            width: 100%;
            border: 2px solid #333;
            border-collapse: collapse;
            margin-top: 30px;
        }
        th, td {
            border: 2px solid #333;
            padding: 10px;
            text-align: center;
        }
        thead tr {
            background-color: #333;
        }
        thead th {
            color: orange;
        }
        tbody tr:nth-child(odd), tbody tr:nth-child(even) {
            background-color: #ffffff;
        }
        tbody tr:hover {
            background-color: orange;
        }
        .btn-action {
            background-color: orange;
            border: none;
            padding: 5px 10px;
            color: white;
            cursor: pointer;
            margin: 2px;
            text-decoration: none;
            display: inline-block;
            transition: background-color 0.3s, transform 0.2s;
        }
        .btn-action:hover {
            background-color: darkorange;
            transform: scale(1.05);
        }
        .btn-disabled {
            background-color: grey;
            border: none;
            padding: 5px 10px;
            color: white;
            cursor: not-allowed;
            margin: 2px;
            text-decoration: none;
            display: inline-block;
        }
    </style>

</head>

<body style="background-color: #222; color: white;">

<% 
    Vector<Utente> utenti = (Vector<Utente>) request.getAttribute("utenti");
%>

    <!-- Navigation -->
    <%@ include file="frame_nav.html" %>

    <!-- Lista Utenti -->
    <section id="utenti" class="page-section">
        <div class="container text-center">
            <h2 class="section-heading text-uppercase">
                <span style="color: orange;">Lista Utenti</span>
            </h2>
            <p style="color: white;">Ecco tutti gli utenti registrati:</p>

            <div class="row">
                <div class="col-md-12">
                    <div class="utenti">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>Id</th>
                                    <th>Nome</th>
                                    <th>Email</th>
                                    <th>Ruolo</th>
                                    <th>Status</th>
                                    <th>Azioni</th> <!-- Colonna per i pulsanti di attivazione/disattivazione -->
                                </tr>
                            </thead>
                            <tbody>
                             <%
                              if (utenti != null && !utenti.isEmpty()) {
                                  for (Utente utente : utenti) {
                              %>
                                <tr>
                                    <td><%= utente.getId() %></td>
                                    <td><%= utente.getUsername() %></td>
                                    <td><%= utente.getEmail() %></td>
                                    <td><%= utente.getRuolo() %></td>
                                    <td>
                                        <% if ("attivo".equalsIgnoreCase(utente.getStatus())) { %>
                                            <span style="color: green;">Attivo</span>
                                        <% } else { %>
                                            <span style="color: red;">Bloccato</span>
                                        <% } %>
                                    </td>
                                    <td>
                                        <% if ("attivo".equalsIgnoreCase(utente.getStatus())) { %>
                                            <!-- Form per disattivare l'utente -->
                                            <form action="/privato/admin/DisattivaUtente" method="post">
                                                <input type="hidden" name="id" value="<%= utente.getId() %>">
                                                <button type="submit" class="btn-action">DISATTIVA</button>
                                            </form>
                                        <% } else { %>
                                            <!-- Form per attivare l'utente -->
                                            <form action="/privato/admin/AttivaUtente" method="post">
                                                <input type="hidden" name="id" value="<%= utente.getId() %>">
                                                <button type="submit" class="btn-action">ATTIVA</button>
                                            </form>
                                        <% } %>
                                    </td>
                                </tr>
                             <%
                                  }
                              } else {
                             %>
                                <tr>
                                    <td colspan="6" style="color: red;">Nessun utente disponibile al momento.</td>
                                </tr>
                             <%
                              }
                             %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <script>
    const buttons = document.querySelectorAll('.btn-action');
    buttons.forEach(button => {
        button.addEventListener('click', function(event) {
            if (!confirm('Sei sicuro di voler procedere con questa azione?')) {
                event.preventDefault();
            }
        });
    });
</script>
    
    
</body>
</html>