<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"rel="stylesheet">
<title>login</title>
<style type="text/css">
body {
	margin: 0;
	padding: 0;
	background-image: url("../img/fondo.jpg");
	background-position: center center;
	background-repeat: no-repeat;
	opacity: 0.9;
}

body:before {
	content: '';
	position: absolute;
	top: 0;
	bottom: 0;
	left: 0;
	right: 0;
	background-color: rgba(0, 0, 0, 0.7);
}

.container {
	margin-top: 7%;
}

.btn-2 {
	width: 80%;
}
</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<form action="${pageContext.request.contextPath}/auth"
				method="POST">
				<div class="col l4 m6 s12 offset-m3 l4 offset-l4 z-depth-6 ">
					<div class="card">
						<div class="card-content center">
							<span class="card-title">INICIAR SESSION</span>
							<div class="row">
								<div class="input-field col s12 m12">
									<i class="material-icons prefix">account_circle</i> <input
										id="icon_user" type="text" name="username" class="validate">
									<label for="icon_user">Usuario</label>
								</div>
								<div class="input-field col s12 m12">
									<i class="material-icons prefix">lock</i> <input id="icon_pass"
										type="password" name="password" class="validate"> <label
										for="icon_pass">Password</label>
								</div>
							</div>
						</div>
						<div class="card-action center-align">
							<button class="btn btn-large  btn-2" type="submit">
								Ingresar <i class="material-icons right">directions_run</i>
							</button>
						</div>

						<div class="card-action center">
							<p>Bienvenidos al sitema de comercial Crediselva. Sé parte de
								las buenas practicas con el uso de la tecnologá no compartas tus
								datos personales.</p>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>          
</body>
</html>