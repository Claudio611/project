<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="it.unirc.nba.model.Giocatore"%>
<%@page import="it.unirc.nba.model.TeamGiocatore" %>
<%@page import="java.util.Vector"%>

<html>
<head>
    <meta charset="UTF-8">
    <title>Area Riservata Utente</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Custom CSS -->
    <link href="/css/styles.css" rel="stylesheet" />
    <!-- Font Awesome for social icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

	<style>
    /* Stile Navbar */
    #mainNav .navbar-brand img {
        width: 300px !important;
        height: auto !important;
        max-height: 100px !important; /* Aumentare se serve */
    }
    </style>
    
    
</head>

<body style="background-color: #293133; color: white;" id="page-top">   
    
	<header>
	    <h1>Benvenuto ${sessionScope.utente.username}!</h1>
	    <p>Sei correttamente entrato in team</p>
	   
	</header>
    
    <!-- Navigation-->
	<%@include file="frame_nav.html" %>
    
	

	
<p>ciao</p> <br>
<p>ciao</p> <br>
<p>ciao</p> <br>
<p>ciao</p> <br>
<p>ciao</p> <br>
<p>ciao</p> <br>
<p>ciao</p> <br>
<p>ciao</p> <br>
<p>ciao</p> <br>
<p>ciao</p> <br>
<p>ciao</p> <br>






<!-- Footer -->
<%@include file="frame_footer.html" %>

	
</body>
</html>