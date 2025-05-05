<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="it">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>FantaNBA</title>
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet" />
<!-- Custom CSS -->
<link href="css/styles.css" rel="stylesheet" />
<!-- Font Awesome for social icons -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<!-- Core theme CSS (includes Bootstrap) -->
<link href="css/styles.css" rel="stylesheet" />

<style>
/* Stile Navbar */
#mainNav .navbar-brand img {
	width: 300px !important;
	height: auto !important;
	max-height: 100px !important;
}

/* Tabella */
table {
	width: 100%;
	border: 2px solid #333;
	border-collapse: collapse;
}

th, td {
	border: 2px solid #333;
	padding: 10px;
	text-align: center;
}

tr {
	border-bottom: 2px solid #333;
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

/* How it works */
.how-it-works-item {
	transition: transform 0.3s ease-in-out;
	padding: 20px;
	background: white;
	border-radius: 10px;
	box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
}

.how-it-works-item:hover {
	transform: scale(1.1);
}

/* Icone */
.icon-box {
	background-color: #293133;
	color: orange;
	width: 80px;
	height: 80px;
	border-radius: 50%;
	display: flex;
	align-items: center;
	justify-content: center;
	margin: 0 auto 15px;
	box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
}

/* Pulsante */
.btn-primary {
	background-color: #293133;
	color: orange;
	border: 2px solid #293133;
}

.btn-primary:hover {
	background-color: orange;
	color: #293133;
}

/* Masthead */
.masthead-subheading, .masthead-heading {
	font-size: 2rem;
	color: white;
	text-shadow: 1px 1px 0 #000, -1px -1px 0 #000, 1px -1px 0 #000, -1px 1px 0 #000;
}

.small-heading {
	font-size: 1.8rem;
}
</style>
</head>

<body style="background-color: #293133; color: orange;" id="page-top">

	<!-- Navigation-->
	<%@ include file="frame_nav.html"%>

	<!-- Come Funziona?-->
	<section class="page-section bg-dark" id="come-funziona">
		<div class="container">
			<div class="text-center">
				<h2 class="section-heading text-uppercase">
					<span style="color: orange;">Come Funziona</span>
				</h2>

				<h3 class="section-subheading">
					<span style="color: white;">Scopri come iniziare la tua avventura nel Fantasy NBA!</span>
				</h3>

				<div class="timeline">
					<!-- Step 1: Login -->
					<div class="timeline-item">
						<div class="timeline-icon">
							<i class="fas fa-sign-in-alt fa-3x"></i>
						</div>
						<div class="timeline-content">
							<h4>Accedi</h4>
							<p>Effettua il login con il tuo account per entrare nell'area riservata e accedere alle funzionalità del gioco.</p>
						</div>
					</div>

					<!-- Step 2: Partecipa a una Sfida -->
					<div class="timeline-item">
						<div class="timeline-icon">
							<i class="fas fa-basketball-ball fa-3x"></i>
						</div>
						<div class="timeline-content">
							<h4>Partecipa a una Sfida</h4>
							<p>Visualizza le sfide disponibili e clicca su "Partecipa" per creare la tua squadra composta da 5 giocatori.</p>
						</div>
					</div>

					<!-- Step 3: Gestisci il tuo DreamTeam -->
					<div class="timeline-item">
						<div class="timeline-icon">
							<i class="fas fa-star fa-3x"></i>
						</div>
						<div class="timeline-content">
							<h4>Gestisci il tuo DreamTeam</h4>
							<p>Visualizza, modifica o elimina la tua squadra direttamente dalla sezione personale "DreamTeam".</p>
						</div>
					</div>
				</div>

				<div class="text-center mt-4">
					<a href="RichiediLogin" class="btn btn-primary btn-lg">Accedi Ora</a>
				</div>
			</div>
	</section>

	<!-- Footer-->
	<%@include file="frame_footer.html"%>

	<!-- Bootstrap core JS-->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
</body>
</html>
