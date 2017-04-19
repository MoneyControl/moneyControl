<%@ include file="topHome.jsp" %>

<link rel="stylesheet" href="css/dashboard.css">

<style>
.centro-vertical {
	position: absolute;
	top: 50%;
	left:50%;
	transform: translate(-50%,-50%);
	font-family: Times New Roman;
	font-style: none;
	font-size: 50px;
	color: #7f7f7f;
}
</style>

	<div class="col-sm-3 col-md-2 sidebar">
    	<ul class="nav nav-sidebar">
    		<li class="active"><a align="center">Opções</a></li>
    		<li class="inactive"><a href="registerBillServlet" align="justify"><span class="glyphicon glyphicon-usd color-usd"></span> Adicionar Contas</a></li>
    		<li class="inactive"><a href="listBillFalseServlet" align="justify"><span class="glyphicon glyphicon-folder-close color-folder"></span> Verificar Contas</a></li>
    		<li class="inactive"><a href="calculateTariffServlet" align="justify"><span class="glyphicon glyphicon-pencil color-pencil"></span> Calcular Tarifas</a></li>
    		<c:if test="${user.userType==1}">
    			<li class="inactive"><a href="registerUserServlet"><span class="glyphicon glyphicon-plus-sign color-plus-sign"></span> Adicionar Usuário</a></li>
    		</c:if>
    	</ul>
    </div>
	<h4 class="centro-vertical">Bem-Vindo ${user.userName }</h4>
<%@ include file="footer.jsp" %>