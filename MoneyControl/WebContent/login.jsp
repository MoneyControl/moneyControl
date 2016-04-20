<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Money Control</title>

<link rel="stylesheet" href="css/bootstrap.css">

<style>
.font-h2{
	font-family: Times New Roman;
}

.form-signin {
	max-width: 450px;
	margin: 0 auto;
}

.centro-vertical {
	position: absolute;
	top: 50%;
	left:50%;
	transform: translate(-50%,-50%);
	font-family: inherit;
}

.button {
  color: #ccc;
  background-color: #242424;
  border-color: #242424;
}
.button:focus,
.button.focus {
  color: #ccc;
  background-color: #7f7f7f;
  border-color: #8c8c8c;
}
.button:hover {
  color: #ccc;
  background-color: #7f7f7f;
  border-color: #adadad;
}
.button:active,
.button.active,
.open > .dropdown-toggle.button {
  color: #ccc;
  background-color: #7f7f7f;
  border-color: #adadad;
}
.button:active:hover,
.button.active:hover,
.open > .dropdown-toggle.button:hover,
.button:active:focus,
.button.active:focus,
.open > .dropdown-toggle.button:focus,
.button:active.focus,
.button.active.focus,
.open > .dropdown-toggle.button.focus {
  color: #ccc;
  background-color: #d4d4d4;
  border-color: #8c8c8c;
}
.button:active,
.button.active,
.open > .dropdown-toggle.button {
  background-image: none;
}
.button.disabled,
.button[disabled],
fieldset[disabled] .button,
.button.disabled:hover,
.button[disabled]:hover,
fieldset[disabled] .button:hover,
.button.disabled:focus,
.button[disabled]:focus,
fieldset[disabled] .button:focus,
.button.disabled.focus,
.button[disabled].focus,
fieldset[disabled] .button.focus,
.button.disabled:active,
.button[disabled]:active,
fieldset[disabled] .button:active,
.button.disabled.active,
.button[disabled].active,
fieldset[disabled] .button.active {
  background-color: #242424;
  border-color: #242424;
}
.button .badge {
  color: #242424;
  background-color: #ccc;
}
</style>

</head>
<body>

	<div class="container">
		<form class="form-signin centro-vertical" action="loginServlet" method="post">
			<h2 class="form-signin-heading font-h2" align="center">
				Money Control <span class="glyphicon glyphicon-piggy-bank"></span>
			</h2>
			<label for="inputUserName" class="sr-only"></label> <br> <input
				type="email" id="inputUserName" class="form-control input-lg"
				placeholder="Email" name="email" required>
			<label for="inputPassword" class="sr-only"></label> <br> <input
				type="password" id="inputPassword" class="form-control input-lg"
				placeholder="Senha" name="password" required> <br>
			<button class="btn btn-lg btn-success btn-block button" type="submit">Entrar</button>
		</form>
		<br>
		<br>
		<c:if test="${loggedin == false }">
			<div class="alert alert-danger alert-dismissible" role="alert">
				<span class="glyphicon glyphicon-alert"></span>
					<b>Email ou senha incorreto(s).</b>
				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			</div>
		</c:if>
		
	</div>
	
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="js/jquery-1.11.3.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
	<br>
</body>
</html>