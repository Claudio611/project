<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>Area Riservata Utente</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="/css/styles.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Lora:wght@400;700&family=Playfair+Display&display=swap" rel="stylesheet">

    <style>
        body {
            font-family: 'Lora', serif;
            background-color: #293133;
            color: white;
            background-image: url('/assets/img/sfondoAree/sfondo4.jpg'); 
            background-size: cover;
            background-position: center;
            position: relative;
            z-index: 1;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        body::before {
            content: "";
            position: fixed;
            top: 0;
            left: 0;
            height: 100%;
            width: 100%;
            background: rgba(0, 0, 0, 0.65);
            z-index: -1;
        }

        #mainNav .navbar-brand img {
            width: 300px !important;
            height: auto !important;
            max-height: 100px !important;
        }

        .section-header {
            text-align: center;
            font-size: 2.5rem;
            margin-bottom: 15px;
            color: #f8f9fa;
        }

        .btn-primary {
            background-color: orange;
            color: black;
            border: 2px solid #293133;
            font-size: 1.2rem;
        }

        .btn-primary:hover {
            background-color: orange;
            color: white;
        }

        .welcome-section {
            min-height: 300px;
            padding: 30px; 
            margin: 80px auto; 
            width: 80%;
            max-width: 900px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            text-align: center;
        }

        .motivational-quote {
            margin-top: 30px;
            font-family: 'Playfair Display', serif;
            font-size: 1.5rem;
            font-style: italic;
            color: #ffdd88;
        }

        footer {
            margin-top: auto;
        }
    </style>
</head>

<body id="page-top">

<%
    String nomeUtente = (String) session.getAttribute("nomeUtente");
    Boolean hasTeam = (Boolean) session.getAttribute("hasTeam");
    if (hasTeam == null) hasTeam = false;
%>

<!-- Navbar -->
<%@ include file="frame_nav.html" %>

<br><br>

<section class="welcome-section">
    <h1 class="section-header">Ciao <%= nomeUtente %>!</h1>
    <p style="font-size: 1.4rem;">Benvenuto nella tua area riservata! Qui potrai creare il tuo Dream Team NBA e affrontare le sfide settimanali! 🏀</p>

    <p style="font-size: 1.4rem;">Ogni settimana nuove sfide ti aspettano. Seleziona il tuo team di 5 giocatori e prova a vincere! 🏆</p>

    <!-- Pulsante per  sfida -->
    <form action="/privato/utente/VisualizzaSfideUtente" method="get">
        <button class="btn btn-primary" type="submit">
            <i class="fas fa-users"></i> Partecipa alle sfide
        </button>
    </form>

	<br>

    <h2>Come funziona?</h2>
    <p style="font-size: 1.2rem;">Il sito ti permette di partecipare a sfide settimanali, 
    scegliendo un Dream Team di 5 giocatori, uno per ogni ruolo (PG, SG, SF, PF, C). 
    Ogni sfida ha temi specifici, crea il team migliore!
    <br>
    E ricorda:   
    </p>

    <div class="motivational-quote">
        "Il successo è il risultato della preparazione, del lavoro duro e dell'apprendimento dai fallimenti." – Kobe Bryant
    </div>
</section>


<!-- Footer -->
<%@ include file="frame_footer.html" %>

</body>
</html>
