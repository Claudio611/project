<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>FantaNBA</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700"
	rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/styles.css" rel="stylesheet" />

<style>
#contact {
	min-height: 80vh;
	display: flex;
	align-items: center;
	justify-content: center;
}

#footer {
	display: flex;
	align-items: center;
	justify-content: center;
}

#mainNav .navbar-brand img {
	width: 300px !important;
	height: auto !important;
	max-height: 100px !important; 
}

#submitButton {
	background-color: orange !important;
	border-color: orange !important;
	opacity: 1 !important; 
	pointer-events: auto !important; 
}

.custom-login-heading {
	text-shadow: -1px -1px 0 #000, 1px -1px 0 #000, -1px 1px 0 #000, 1px 1px
		0 #000;
}

#submitButton {
	background-color: orange;
	border-color: orange;
	color: white;
	transition: background-color 0.3s, transform 0.2s;
}

#submitButton:hover {
	background-color: darkorange;
	transform: scale(1.05);
}

#name::placeholder, #password::placeholder {
	color: rgba(0, 0, 0, 0.6) !important;
}

body {
	background-image: url('https://www.example.com/sfondo.jpg');
	background-size: cover;
	background-position: center center;
	background-attachment: fixed;
	background-color: 293133;
	height: 100vh;
	margin: 0;
}

#contact {
	position: relative;
	padding-top: 100px;
	padding-bottom: 50px;
	background-color: #293133;
	overflow: hidden;
}

/* Contenitore dell'immagine di sfondo */
#contact::before {
	content: '';
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-image: url('map-image.png');
	background-size: cover;
	background-position: center;
	z-index: -1; 
}

/* Overlay per opacizzare l'immagine di sfondo */
#contact .overlay {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5);
	z-index: 0; 
}

.container {
	position: relative;
	z-index: 1;
}
</style>


</head>


<body style="background-color: #293133; color: white;" id="page-top">
	
	<!-- Navigation-->
	 <%@ include file="frame_nav.html" %>

	<section class="page-section" id="contact"
		style="margin-bottom: 0; padding-bottom: 0;">
		<div class="overlay"></div>
		<!-- Aggiungi l'overlay -->
		<div class="container">
			<div class="text-center">
				<h2 class="section-heading text-uppercase custom-login-heading">LOGIN</h2>
				<h2 class="section-subheading"
					style="color: orange; text-shadow: 1px 1px 0 rgba(0, 0, 0, 0.8), -1px -1px 0 rgba(0, 0, 0, 0.8), 1px -1px 0 rgba(0, 0, 0, 0.8), -1px 1px 0 rgba(0, 0, 0, 0.8);">Eseguire
					l'accesso</h2>
			</div>

			<!-- Modifica il form per invocare la servlet "Login" -->
			<form id="contactForm" action="Login" method="POST">
				<div class="row justify-content-center">
					<div class="col-md-6">
						<div class="form-group">
							<!-- username input-->
							<input class="form-control text-center" id="name" name="username"
								type="text" placeholder="Username *" required />
						</div>
						<div class="form-group">
							<!-- password input-->
							<input class="form-control text-center" id="password"
								name="password" type="password" placeholder="Password *"
								required />
						</div>
					</div>
				</div>

				<!-- Submit Button-->
				<div class="text-center">
					<button class="btn btn-xl text-uppercase" id="submitButton"
						type="submit"
						style="background-color: orange; border-color: orange;">
						Accedi</button>
				</div>
			</form>
		</div>
	</section>


	<!-- Footer-->
	<%@include file="frame_footer.html" %>

	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
	<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
	<!-- * *                               SB Forms JS                               * *-->
	<!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
	<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
	<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>

	<script>
		document.getElementById('loginForm').addEventListener(
				'input',
				function() {
					const username = document.getElementById('username').value;
					const password = document.getElementById('password').value;
					const submitButton = document
							.getElementById('submitButton');

					// Abilita il pulsante solo se entrambi i campi sono compilati
					if (username && password) {
						submitButton.disabled = false;
					} else {
						submitButton.disabled = true;
					}
				});
	</script>

</body>
</html>