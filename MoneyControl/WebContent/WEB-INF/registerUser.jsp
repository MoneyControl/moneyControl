<%@ include file="top.jsp" %>

	<div class="container-fluid">
		<div class="row">
			<div class="col-md-7">
				<form method="post" action="registerUserServlet">
					
					<div class="form-group">
						<label class="control-label"> Nome </label>
						<div class="form-group">
							<input type="text" name="userName" maxlength="100" required class="form-control">
						</div>
					</div>
					
					<div class="form-group">
						<label class="control-label"> Sobrenome </label>
						<div class="form-group">
							<input type="text" name="userLastName" maxlength="255" required class="form-control">
						</div>
					</div>
					
					<div class="form-group">
						<label class="control-label"> Salário </label>
						<div class="form-group">
							<input type="text" name="salary" maxlength="50" required class="form-control">
						</div>
					</div>
					
					<div class="form-group">
						<label class="control-label"> Email </label>
						<div class="form-group">
							<input type="text" name="email" maxlength="80" required class="form-control">
						</div>
					</div>
					
					<div class="form-group">
						<label class="control-label"> Tipo de Usuário </label>
						<select name="userType" class="form-control" required>
							<option></option>
							<option value="1">Administrador</option>
							<option value="0">Usuário Comum</option>
						</select>
					</div>
					
					<div class="form-group">
						<label class="control-label"> Senha </label>
						<div class="form-group">
							<input type="password" name="password" maxlength="255" required class="form-control">
						</div>
					</div>

					<div class="form-group">
						<div class="control-label pull-right">
							<button type="reset" class="btn btn-danger">
								Limpar <span class="glyphicon glyphicon-erase"s
									aria-hidden="true"></span>
							</button>
							<button type="submit" class="btn btn-success">
								Cadastrar <span class="glyphicon glyphicon-ok-sign"
									aria-hidden="true"></span>
							</button>
						</div>
					</div>
					
				</form>
				
				<br>
				<br>
				
				<c:if test="${registered == true }">
					<div class="alert alert-success alert-dismissible" role="alert">
						<span class="glyphicon glyphicon-thumbs-up"></span>
						Cadastrado com sucesso!
						<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					</div>
				</c:if>
				<c:if test="${registered == false }">
					<div class="alert alert-danger alert-dismissible" role="alert">
						<span class="glyphicon glyphicon-alert"></span>
						Erro ao cadastrar.
						<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					</div>
				</c:if>
				
			</div>
		</div>
	</div>
				
<%@ include file="footer.jsp" %>