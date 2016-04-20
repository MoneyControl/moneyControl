<%@ include file="top.jsp" %>

<style>
.form-control1 {
  display: block;
  width: 12%;
  height: 34px;
  padding: 6px 12px;
  font-size: 14px;
  line-height: 1.42857143;
  color: #555;
  background-color: #fff;
  background-image: none;
  border: 1px solid #ccc;
  border-radius: 4px;
  -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
          box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
  -webkit-transition: border-color ease-in-out .15s, -webkit-box-shadow ease-in-out .15s;
       -o-transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
          transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
}
.form-control1:focus {
  border-color: #66afe9;
  outline: 0;
  -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075), 0 0 8px rgba(102, 175, 233, .6);
          box-shadow: inset 0 1px 1px rgba(0,0,0,.075), 0 0 8px rgba(102, 175, 233, .6);
}
.form-control1::-moz-placeholder {
  color: #999;
  opacity: 1;
}
.form-control1:-ms-input-placeholder {
  color: #999;
}
.form-control1::-webkit-input-placeholder {
  color: #999;
}
.form-control1[disabled],
.form-control1[readonly],
fieldset[disabled] .form-control1 {
  background-color: #eee;
  opacity: 1;
}
.input-group-addon,
.input-group-btn,
.input-group .form-control1 {
  display: table-cell;
}
.input-group-addon:not(:first-child):not(:last-child),
.input-group-btn:not(:first-child):not(:last-child),
.input-group .form-control1:not(:first-child):not(:last-child) {
  border-radius: 0;
}
.input-group .form-control1:last-child,
.form-control-left {
  border-top-left-radius: 0;
  border-bottom-left-radius: 0;
}
.input-group .form-control-right:last-child {
  border-top-right-radius: 0;
  border-bottom-right-radius: 0;
}

.water {
  color: #ffffff;
  background-color: #337ab7;
  border-color: #2e6da4;
}
.energy {
  color: #fff;
  background-color: #f0ad4e;
  border-color: #eea236;
}
.size-input {
  width: 60px;
}
</style>

	<div class="container-fluid">
		<div class="row">
			<div class="col-md-7">
				
				<form action="registerBillServlet" method="post">
					
					<div class="form-group">
						<input type="text" class="form-control" placeholder="Salário do mês" name="salary" value="${user.salary }" required>
					</div>
					
					<div class="input-group">
						<input type="text" class="form-control" placeholder="Digite o número de contas mensais que deseja cadastrar" id="billsNumber" maxlength="2" required>
						<span class="input-group-btn">
							<button type="button" id="next" class="btn btn-info">Próximo <span class="glyphicon glyphicon-circle-arrow-right"></span></button>
						</span>
					</div><!-- /input-group -->
					<br>
					<div class="form-group">
						<div class="form-group alert alert-info">
							<b>Valor total das contas mensais:</b>
							<b><input class="form-control" type="text" name="fixedBills" id="fixedBills" value="" readonly ></b>
						</div>
					</div>
					<script type="text/javascript">
						
						function showResult(finalPlus){
							$('#fixedBills').val(finalPlus);
						}
					
						document.getElementById("next").onclick = function(){
													
							var bills = document.getElementById("billsNumber").value;
							
							var finalPlus = 0;
							
							for(i=1; i<=bills; i++){
								
								var plus = prompt("Digite o valor da "+i+" ª conta");
								plus = parseFloat(plus);
	
								finalPlus = finalPlus + plus;
							}
							
							showResult(finalPlus.toFixed(2));
						}
						
					</script>
					<br>
					<div class="row">
						<div class="col-md-7">
							<div class="input-group">
								<span class="input-group-addon water">  
									Água <span class="glyphicon glyphicon-tint"></span>
								</span>
								<input type="text" class="form-control" placeholder="Valor total" name="waterBill" required>						
							</div><!-- /input-group -->
						</div>
						<div class="col-md-4">
							<div class="input-group">
								<span class="input-group-addon water">  
									Dividir por /
								</span>
								<input type="text" class="form-control" name="divideWater" maxlength="2">
							</div>
						</div>
					</div>
					<br>
					
					<div class="row">
						<div class="col-md-7">
							<div class="input-group">
								<span class="input-group-addon energy">  
									Luz <span class="glyphicon glyphicon-flash"></span>
								</span>
								<input type="text" class="form-control" placeholder="Valor total" name="energyBill" required>
							</div><!-- /input-group -->
						</div>
						<div class="col-md-4">
							<div class="input-group">
								<span class="input-group-addon energy">  
									Dividir por /
								</span>
								<input type="text" class="form-control" name="divideEnergy" maxlength="2">
							</div><!-- /input-group -->
						</div>
					</div>	
					<br>
					<div class="form-group">
						<label class="control-label"> Selecione o mês à ser vinculado com os valores acima </label>
						<div class="form-group">
							<select name="idMonth" class="form-control" required>
								<option></option>
								<c:forEach var="month" items="${list}">	
									<option value="${month.idMonth }">${month.name }</option>
								</c:forEach>	
							</select>
						</div> 	
					</div>
					
					<div class="form-group">
						<div class="control-label pull-right"> <button type="submit" class="btn btn-success" class="btn btn-success"> Salvar <span class="glyphicon glyphicon-ok-sign" aria-hidden="true"></span> </button> </div>
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
			<div class="col-md-5"></div>
		</div>
	</div>
<%@ include file="footer.jsp" %>