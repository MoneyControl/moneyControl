<%@ include file="top.jsp"%>

<style>
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

.panel-warning > .panel-heading {
  color: #ffffff;
  background-color: #f0ad4e;
  border-color: #f0ad4e;
}
.panel-warning {
  border-top-color: #f0ad4e;
  border-bottom-color: #f0ad4e;
  border-left-color: #f0ad4e;
  border-right-color: #f0ad4e;
}
</style>

	<div class="container-fluid">
		<div class="row">
			<div class="col-md-7">
				<div class="row">
					<div class="col-md-7">
						<div class="input-group">
							<span class="input-group-addon water">  
								Água <span class="glyphicon glyphicon-tint"></span>
							</span>
							<input type="text" class="form-control" placeholder="Valor total" id="waterBill" required>						
						</div><!-- /input-group -->
					</div>
					<div class="col-md-4">
						<div class="input-group">
							<span class="input-group-addon water">  
								Dividir por /
							</span>
							<input type="text" class="form-control" id="waterDivisor" maxlength="2">
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
							<input type="text" class="form-control" placeholder="Valor total" id="energyBill" required>
						</div><!-- /input-group -->
					</div>
					<div class="col-md-4">
						<div class="input-group">
							<span class="input-group-addon energy">  
								Dividir por /
							</span>
							<input type="text" class="form-control" id="energyDivisor" maxlength="2">
						</div><!-- /input-group -->
					</div>
				</div>
				<br>
				<div class="row">
					<div class="col-md-6">
						<div class="panel panel-primary">
				  			<div class="panel-heading">
				  				<strong>Resultado </strong><span class="glyphicon glyphicon-tint"></span>
				  			</div>
				  			<table class="table table-responive">
				  				<tr>
				  					<td><b id="resultWater"></b></td>
				  				</tr>
				  			</table>
						</div>
					</div>
					<div class="col-md-6">
						<div class="panel panel-warning">
				  			<div class="panel-heading">
				  				<strong>Resultado </strong><span class="glyphicon glyphicon-flash"></span>
				  			</div>
				  			<table class="table table-responive">
				  				<tr>
				  					<td><b id="resultEnergy"></b></td>
				  				</tr>
				  			</table>
				  		</div>
					</div>
				</div>
			</div>
			<div class="col-md-5">
				<div class="row">
					<div class="form-group">
						<button type="button" id="btn-water" class="btn btn-primary">Calcular <span class="glyphicon glyphicon-ok-sign"></span></button>
					</div>
				</div>
			</div>
			
			<div class="col-md-5">
				<div class="row">
					<div class="form-group">
						<button type="button" id="btn-energy" class="btn btn-warning">Calcular <span class="glyphicon glyphicon-ok-sign"></span></button>
					</div>
				</div>
			</div>
					
			<script>
				//função para mostrar resultado da divisão
				function showWaterResult(resultWater){
					document.getElementById("resultWater").innerHTML = "R$ "+resultWater;
				}
				
				//função acionada ao clicar o botão calcular superior
				document.getElementById("btn-water").onclick = function(){
					
					var waterBill = document.getElementById("waterBill").value;
					waterBill = parseFloat(waterBill);
					
					var waterDivisor = document.getElementById("waterDivisor").value;
					waterDivisor = parseFloat(waterDivisor);
					
					var resultWater = waterBill / waterDivisor;
					
					showWaterResult(resultWater);
				}
				
				//função para mostrar resultado da divisão
				function showEnergyResult(resultEnergy){
					document.getElementById("resultEnergy").innerHTML = "R$ "+resultEnergy;
				}
				
				//função acionada ao clicar o botão calcular inferior
				document.getElementById("btn-energy").onclick = function(){
					
					var energyBill = document.getElementById("energyBill").value;
					energyBill = parseFloat(energyBill);
					
					var energyDivisor = document.getElementById("energyDivisor").value;
					energyDivisor = parseFloat(energyDivisor);
					
					var resultEnergy = energyBill / energyDivisor;
					
					showEnergyResult(resultEnergy);
				}
			</script>
		</div>
	</div>
	
<%@ include file="footer.jsp"%>