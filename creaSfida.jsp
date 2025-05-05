<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html lang="it">
<head>
    <meta charset="UTF-8">
    <title>Crea Sfida</title>
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
        <h2 class="text-center" style="color: orange;">Crea nuova sfida</h2>

        <form action="/privato/admin/CreaSfida" method="POST">
            <!-- Campo Titolo -->
            <div class="mb-3">
                <label for="titolo">Titolo:</label>
                <input type="text" class="form-control" id="titolo" name="titolo" required>
            </div>

            <!-- Campo Descrizione -->
            <div class="mb-3">
                <label for="descrizione">Descrizione:</label>
                <textarea class="form-control" id="descrizione" name="descrizione" required></textarea>
            </div>

            <div class="text-center">
                <button type="submit" class="btn-action">Crea Sfida</button>
            </div>
        </form>
    </div>

</body>
</html>
