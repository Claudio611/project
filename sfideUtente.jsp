<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.Vector" %>
<%@ page import="it.unirc.nba.model.Sfida" %>

<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <title>Lista Sfide Utente</title>
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
        }
        .create-section {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            margin-top: 30px;
            text-align: center;
            color: white;
        }
    </style>

</head>

<body style="background-color: #222; color: white;">


<% 
    Vector<Sfida> sfide = (Vector<Sfida>) request.getAttribute("sfide");
%>

    <!-- Navigation -->
    <%@ include file="frame_nav.html" %>


    <!-- Lista Sfide -->
    <section id="sfide" class="page-section">
        <div class="container text-center">
            <h2 class="section-heading text-uppercase">
                <span style="color: orange;">Sfide Disponibili</span>
            </h2>
            <p style="color: white;">Ecco tutte le sfide disponibili:</p>

            <div class="row">
                <div class="col-md-12">
                    <div class="sfide">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                	<th>Id</th>
                                    <th>Titolo</th>
                                    <th>Descrizione</th>
                                    <th>Partecipa</th>
                                </tr>
                            </thead>
                            <tbody>
                             <%
                              if (sfide != null && !sfide.isEmpty()) {
                                  for (Sfida sfida : sfide) {
                              %>
                                <tr>
                                	<td><%= sfida.getId() %></td>
                                    <td><%= sfida.getTitolo() %></td>
                                    <td><%= sfida.getDescrizione() %></td>

                                    <!-- Form per Partecipare alla Sfida -->
                                    <td>
                                        <form action="/privato/utente/richiediCreazioneTeam" method="get">
                                            <input type="hidden" name="idSfida" value="<%= sfida.getId() %>">
                                            <button type="submit" class="btn-action">PARTECIPA</button>
                                        </form>
                                    </td> 
                                </tr>
                             <%
                                  }
                              } else {
                             %>
                                <tr>
                                    <td colspan="4" style="color: red;">Nessuna sfida disponibile al momento.</td>
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
	
</body>
</html>
