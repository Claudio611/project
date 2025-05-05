<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="it.unirc.nba.model.Sfida" %>

<%
    Sfida sfida = (Sfida) request.getAttribute("sfida");
    if (sfida == null) {
%>
    <p style="color: red;">Errore: sfida non trovata.</p>
<%
    return;
    }
%>

<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <title>Modifica Sfida</title>
    <!-- Bootstrap CSS -->
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
	
	<br>
	<br>
	<br>
	<br>
	
    <div class="form-container">
        <h2 class="text-center" style="color: orange;">Modifica Sfida</h2>

        <form action="<%= request.getContextPath() %>/privato/admin/ModificaSfida" method="post">
            <!-- Campo ID disabilitato -->
            <div class="mb-3">
                <label for="id">ID Sfida:</label>
                <input type="text" class="form-control" id="id" value="<%= sfida.getId() %>" disabled>
                <input type="hidden" name="id" value="<%= sfida.getId() %>">
            </div>

            <!-- Campo Titolo -->
            <div class="mb-3">
                <label for="titolo">Titolo:</label>
                <input type="text" class="form-control" id="titolo" name="titolo" value="<%= sfida.getTitolo() %>" required>
            </div>

            <!-- Campo Descrizione -->
            <div class="mb-3">
                <label for="descrizione">Descrizione:</label>
                <textarea class="form-control" id="descrizione" name="descrizione" rows="5" required><%= sfida.getDescrizione() %></textarea>
            </div>

            <div class="text-center">
                <button type="submit" class="btn-action">Salva modifiche</button>
            </div>
        </form>
    </div>

</body>
</html>
