<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Money Control</title>

<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/glyphicons-colors.css">

<style>
.table-hover > tbody > tr:hover {
  background-color: #222;
  color: #fff;
}

.nav-sidebar > .active > a,
.nav-sidebar > .active > a:hover,
.nav-sidebar > .active > a:focus {
  color: #fff;
  background-color: #428bca;
}
</style>

</head>
<body>

<nav class="navbar navbar-inverse navbar-static-top">
	<div class="container-fluid">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="homeServlet">Money
				Control <span class="glyphicon glyphicon-piggy-bank color-piggy"> </span>
			</a>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="registerBillServlet"><span class="glyphicon glyphicon-usd color-usd"></span> Adicionar Contas</a></li>
				<li><a href="listBillFalseServlet"><span class="glyphicon glyphicon-folder-close color-folder"></span> Verificar Contas</a></li>
				<li><a href="calculateTariffServlet" align="justify"><span class="glyphicon glyphicon-pencil color-pencil"></span> Calcular Tarifas</a></li>
			</ul>

			<ul class="nav navbar-nav navbar-right">
				
				<li class="dropdown">
				
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
							
							<span class="">${user.userName }</span><span class="glyphicon glyphicon-option-vertical"></span>
						</a>
					
						<ul class="dropdown-menu" aria-labelledby="dropdownMenuDivider">
							<li><a href="editUserServlet">Editar Perfil <c:if test="${user.userType==0 }"><span class="glyphicon glyphicon-user" aria-hidden="true"></span></c:if>
								<c:if test="${user.userType==1 }"><img src="img/fundo-transparente-1.png" height="47" class="ironman-icon pull-right"></c:if>
							</a></li>
	
							<li role="separator" class="divider"></li>
	
							<li><a href="logoutServlet" <c:if test="${user.userType==1 }">align="center"</c:if>> Sair <span
									class="glyphicon glyphicon-log-out" aria-hidden="true"></span>
							</a></li>
						</ul>
				</li>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
<!-- /.container-fluid --> </nav>