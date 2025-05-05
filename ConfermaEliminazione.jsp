<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<html lang="it">
<head>
    <meta charset="UTF-8">
    <title>Conferma Eliminazione Sfida</title>
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
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        .main-container {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 40px 15px;
        }

        .form-container {
            max-width: 600px;
            width: 100%;
            padding: 30px;
            border: 2px solid #333;
            border-radius: 10px;
            background-color: #333;
            text-align: center;
        }

        h2 {
            color: orange;
            margin-bottom: 30px;
        }

        .btn-action, .btn-cancel {
            border: none;
            padding: 10px 25px;
            color: white;
            margin: 10px;
            text-decoration: none;
            display: inline-block;
            border-radius: 5px;
        }

        .btn-action {
            background-color: orange;
        }

        .btn-action:hover {
            background-color: #ff9800;
        }

        .btn-cancel {
            background-color: #555;
        }

        .btn-cancel:hover {
            background-color: #777;
        }
    </style>
</head>
<body>

<%@ include file="frame_nav.html" %>

<div class="main-container">
    <div class="form-container">
        <h2>Conferma eliminazione sfida</h2>

        <p>Sei sicuro di voler eliminare la sfida: <strong>${sfida.titolo}</strong>?</p>

        <form action="/privato/admin/EliminaSfida" method="POST" style="display: inline;">
            <input type="hidden" name="id" value="${sfida.id}" />
            <input type="hidden" name="conferma" value="true" />
            <button type="submit" class="btn-action">Conferma</button>
        </form>

        <a href="VisualizzaSfide" class="btn-cancel">Annulla</a>
    </div>
</div>

</body>
</html>
