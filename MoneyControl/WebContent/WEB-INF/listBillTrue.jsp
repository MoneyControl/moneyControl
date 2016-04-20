<%@ include file="top.jsp"%>

<style>
.btn-oval {
	border-radius: 50px;		
}
</style>

<div class="container-fluid">
	<div class="panel panel-default">
		<!-- Default panel contents -->
		<div class="panel-heading">
			<span class="glyphicon glyphicon-folder-open"></span> &middot;Contas Pagas <b>
				</b> <span class="pull-right"><a href="listBillFalseServlet">Contas Não Pagas <span class="glyphicon glyphicon-paperclip"></span></a></span>
		</div>


		<!-- Table -->
		<table class="table table-hover table-bordered">
			<thead>
				<tr>
					<td class="text-center alert-info"><b><span class="glyphicon glyphicon-calendar"></span></b></td>
					<td class="text-center alert-info"><b><span class="glyphicon glyphicon-briefcase"></span> O que eu recebi</b></td>
					<td class="text-center alert-danger"><b><span class="glyphicon glyphicon-pushpin"></span> O que eu gastei</b></td>
					<td class="text-center alert-success"><b><span class="glyphicon glyphicon-usd"></span> O que sobrou</b></td>
					<td class="text-center alert-info"><b>Marcar como não paga</b></td>
				</tr>
			</thead>

			<tbody>
				<c:if test="${empty list }">
					<tr class="danger">
						<td colspan="5">Você não pagou nenhuma conta D=!</td>
					</tr>
				</c:if>

				<c:forEach var="bill" items="${list }">
					<tr>
						<td class="text-center">${bill.month.name }</td>
						<td class="text-center">R$ <fmt:formatNumber maxFractionDigits="2" minFractionDigits="2" value="${bill.user.salary }"></fmt:formatNumber> </td>
						<td class="text-center">R$ <fmt:formatNumber maxFractionDigits="2" minFractionDigits="2" value="${bill.fixedBills }"></fmt:formatNumber></td>
						<td class="text-center">R$ <fmt:formatNumber maxFractionDigits="2" minFractionDigits="2" value="${bill.user.salary - bill.fixedBills }"></fmt:formatNumber></td>
						<td class="text-center"><a href="changeBillStatusInverseServlet?idBill=${bill.idBill }"
						   class="btn btn-danger btn-sm btn-oval"><span class="glyphicon glyphicon-send"></span>
						</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
		<c:if test="${statusChanged == true }">
			<div class="alert alert-success alert-dismissible" role="alert">
				<span class="glyphicon glyphicon-thumbs-up"></span>
				Conta movida com sucesso!
				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			</div>
		</c:if>
		<c:if test="${statusChanged == false }">
			<div class="alert alert-danger alert-dismissible" role="alert">
				<span class="glyphicon glyphicon-alert"></span>
				Erro ao mover conta.
				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			</div>
		</c:if>
</div>

<%@ include file="footer.jsp"%>