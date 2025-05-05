<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>FantaNBA</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="css/styles.css" rel="stylesheet" />

    <style>
        body {
            background-color: #293133;
            color: white;
            font-family: 'Montserrat', sans-serif;
        }

        #registrazione {
            min-height: 80vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .container {
            background-color: rgba(0, 0, 0, 0.7);
            padding: 40px;
            border-radius: 10px;
            width: 100%;
            max-width: 500px;
        }

        .text-center h2 {
            font-size: 2rem;
            color: orange;
            text-shadow: 1px 1px 0 rgba(0, 0, 0, 0.8), -1px -1px 0 rgba(0, 0, 0, 0.8);
        }

        .text-center h3 {
            color: orange;
            font-size: 1.2rem;
            margin-top: 10px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-control {
            background-color: #2c2f34;
            border: 1px solid #3a3f47;
            color: white;
            padding: 15px;
            border-radius: 5px;
            font-size: 1rem;
            text-align: center;
        }

        .form-control::placeholder {
            color: rgba(255, 255, 255, 0.7);
        }

        #submitButton {
            background-color: orange;
            border-color: orange;
            color: white;
            padding: 10px 30px;
            font-size: 1.1rem;
            border-radius: 5px;
            transition: background-color 0.3s, transform 0.2s;
        }

        #submitButton:hover {
            background-color: darkorange;
            transform: scale(1.05);
        }

        #registrazione .overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            z-index: 0;
        }

        .custom-login-heading {
            text-shadow: -1px -1px 0 #000, 1px -1px 0 #000, -1px 1px 0 #000, 1px 1px 0 #000;
        }
    </style>

</head>

<body style="background-color: #293133; color: white;" id="page-top">
    
    <!-- Navigation-->
    <%@ include file="frame_nav.html" %>

    <section class="page-section" id="registrazione">
        <div class="overlay"></div>
        <div class="container">
            <div class="text-center">
                <h2 class="section-heading text-uppercase custom-login-heading">REGISTRATI</h2>
                <h3 class="section-subheading"
                    style="color: orange;">Crea il tuo account</h3>
            </div>

            <!-- Form di registrazione -->
            <form id="registrazioneForm" action="/richiediRegistrazione" method="POST">
                <div class="form-group">
                    <input class="form-control" id="name" name="username" type="text" placeholder="Username *" required />
                </div>
                <div class="form-group">
                    <input class="form-control" id="email" name="email" type="email" placeholder="Email *" required />
                </div>
                <div class="form-group">
                    <input class="form-control" id="password" name="password" type="password" placeholder="Password *" required />
                </div>

                <!-- Submit Button-->
                <div class="text-center">
                    <button class="btn" id="submitButton" type="submit">
                        Registrati
                    </button>
                </div>
            </form>
        </div>
    </section>

    <!-- Footer-->
    <%@include file="frame_footer.html" %>

    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="js/scripts.js"></script>
</body>
</html>
