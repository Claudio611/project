<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.Vector" %>
<%@ page import="it.unirc.nba.model.Team" %>>

<html>
<head>
    <title>Team per Sfida</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" />
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

<%@ include file="frame_nav.html" %>

<div class="container mt-5">
    <h2 class="text-center mb-4" style="color: orange;">Team partecipanti alla sfida</h2>
            <table class="table table-bordered table-striped text-white">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Utente</th>
                        <th>Nome Team</th>
                        <th>Data Creazione</th>
                        <th>Vincoli Rispettati</th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach var="team" items="${teamList}">
                    <tr>
                        <td>${team.id}</td>
                        <td>${team.idUtente}</td>
                        <td>${team.nomeTeam}</td>
                        <td>${team.dataCreazione}</td>
                        <td><c:if test="${team.vincoliRispettati}">Sì</c:if><c:if test="${!team.vincoliRispettati}">No</c:if></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
</div>

</body>
</html>
