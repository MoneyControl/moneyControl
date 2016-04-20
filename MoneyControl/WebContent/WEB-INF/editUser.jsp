<%@ include file="top.jsp" %>

	<div class="container-fluid">
		<div class="row">
			<div class="col-md-7">
				<form method="post" action="editUserServlet">
					
					<div class="form-group">
						<label class="control-label"> Nome </label>
						<div class="form-group">
							<input type="text" name="userName" maxlength="100" required class="form-control" value="${user.userName }">
						</div>
					</div>
					
					<div class="form-group">
						<label class="control-label"> Sobrenome </label>
						<div class="form-group">
							<input type="text" name="userLastName" maxlength="255" required class="form-control" value="${user.userLastName }">
						</div>
					</div>
					
					<div class="form-group">
						<label class="control-label"> Salário </label>
						<div class="form-group">
							<input type="text" name="salary" maxlength="50" required class="form-control" value="${user.salary }">
						</div>
					</div>
					
					<div class="form-group">
						<label class="control-label"> Email </label>
						<div class="form-group">
							<input type="text" name="email" maxlength="80" required class="form-control" value="${user.email }">
						</div>
					</div>
					
					<div class="form-group">
						<div class="control-label pull-right">
							<button type="reset" class="btn btn-danger">
								Restaurar <span class="glyphicon glyphicon-erase"
									aria-hidden="true"></span>
							</button>
							<button type="submit" class="btn btn-success">
								Salvar <span class="glyphicon glyphicon-ok-sign"
									aria-hidden="true"></span>
							</button>
						</div>
					</div>
					
				</form>
				
				<br>
				<br>
				
				<c:if test="${edited == true }">
					<div class="alert alert-success alert-dismissible" role="alert">
						<span class="glyphicon glyphicon-thumbs-up"></span>
						Editado com sucesso!
						<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					</div>
				</c:if>
				<c:if test="${edited == false }">
					<div class="alert alert-danger alert-dismissible" role="alert">
						<span class="glyphicon glyphicon-alert"></span>
						Erro ao editar.
						<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					</div>
				</c:if>
				
			</div>
		</div>
	</div>
				
<%@ include file="footer.jsp" %>