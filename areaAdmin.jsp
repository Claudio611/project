<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>Area Riservata Admin</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="/css/styles.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <!-- Font principali -->
    <link href="https://fonts.googleapis.com/css2?family=Lora:wght@400;700&family=Playfair+Display&display=swap" rel="stylesheet">

    <style>
        body {
            font-family: 'Lora', serif;
            background-color: #293133;
            color: white;
            background-image: url('/assets/img/sfondo aree/sfondo2.jpg'); 
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
            text-align: center; /* Centra il testo */
        }

        footer {
            margin-top: auto;
        }
    </style>
</head>

<body id="page-top">

<%
    String nomeAdmin = (String) session.getAttribute("nomeAdmin");
%>

<!-- Navbar -->
<%@ include file="frame_nav.html" %>

<br>
<br>
<br>
<br>
	
	
<section class="welcome-section">
    <h1 class="section-header">Ciao <%= nomeAdmin %>!</h1>
    <p>Benvenuto nella tua area riservata. Qui puoi creare nuove sfide, visualizzare quelle già esistenti, e gestire il tuo lavoro da admin! 🏀</p>

    <br>
    <p>Particolarmente ispirato? crea una nuova sfida!</p>

    <!-- Sezione creazione sfida -->
    <form action="/privato/admin/richiediCreazioneSfida" method="get">
        <button class="btn btn-primary" type="submit">
            <i class="fas fa-plus-circle"></i> Crea una nuova sfida
        </button>
    </form>

	<br>
	<p>Qualche ripensamento?Gestisci le sfide che hai già creato!</p> 

    <form action="/privato/admin/VisualizzaSfideAdmin" method="get">
        <button class="btn btn-primary" type="submit">
            <i class="fas fa-eye"></i> Visualizza le sfide esistenti
        </button>
    </form>
</section>

<!-- Footer -->
<%@ include file="frame_footer.html" %>

</body>
</html>
