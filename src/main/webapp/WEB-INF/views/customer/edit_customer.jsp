<%@ include file="../commons/header.jsp"%>
<%@ include file="../commons/menu.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="container mt-4">
	<div class="card">
		<div class="card-header fs-6" style="font-weight: bold;"><i class="bi bi-people"></i> FORMULARIO DE CLIENTES</div>
		<div class="card-body">
			<form class="row g-3 needs-validation" action="${pageContext.request.contextPath}/customer/save" method="POST">
				<div class="col-md-2">
					<label for="txtTipoDocumento"><i class="bi bi-card-list"></i> Tipo Documento</label> 
					<select class="form-select form-select-sm" id="txtTipoDocumento" name="tipdoc">
						<option value="1">DNI</option>
						<option value="6">RUC</option>
						<option value="4">CARNET EXT.</option>
						<option value="7">PASAPORTE</option>
					</select>
				</div>
				<div class="col-md-2">
					<label><i class="bi bi-credit-card"></i> Nro Documento</label> 
					<input type="text" class="form-control form-control-sm" value="${customer.numDoc}" required maxlength="12" name="numDoc">
				</div>				
				<div class="col-md-3">
					<label><i class="bi bi-pencil-square"></i> Nombres</label>
					<input type="text" class="form-control form-control-sm" id="txtNombres" value="${customer.name}" required name="name">
				</div>
				<div class="col-md-3">
					<label><i class="bi bi-pencil-square"></i> Apellido Paterno</label> 
					<input type="text" class="form-control form-control-sm"	id="txtApellidoPaterno" value="${customer.firstname}" required name="firstname">
				</div>
				<div class="col-md-2">
					<label><i class="bi bi-pencil-square"></i> Apellido	Materno</label> 
					<input type="text" class="form-control form-control-sm" id="txtApellidoMaterno" value="${customer.lastname}" required name="lastname">
				</div>
				<div class="col-md-3">
					<label><i class="bi bi-calendar2-day-fill"></i> Fecha de Nacimiento</label> 
					<input type="date" class="form-control form-control-sm" id="txtFechaNacimiento" value="${customer.dateBirth}" required name="dateBirth">
				</div>
				<div class="col-md-3">
					<label><i class="bi bi-people-fill"></i> Estado Civil</label>
					<select class="form-select form-select-sm" id="txtEstadoCivil" name="civilStatus">
						<option value="1">SOLTERO</option>
						<option value="2">CASADO</option>
						<option value="3">DIVORCIADO</option>
					</select>
				</div>
				<div class="col-md-3">
					<label><i class="bi bi-phone"></i> Telefono 1</label> 
					<input type="text" class="form-control form-control-sm" value="${customer.phoneMain}" required name="phoneMain">
				</div>
				<div class="col-md-3">
					<label><i class="bi bi-phone"></i> Telefono 2</label> 
					<input type="text" class="form-control form-control-sm" value="${customer.phoneSecond}" name="phoneSecond">
				</div>
				<div class="col-md-6">
					<label><i class="bi bi-house"></i> Dirección</label> 
					<input type="text" class="form-control form-control-sm" id="txtDireccion" value="${customer.address}" required name="address">
				</div>
				<div class="col-md-6">
					<label><i class="bi bi-house"></i> Referencia de Dirección</label> 
					<input type="text" class="form-control form-control-sm"id="txtRefDireccion" value="${customer.referenceAddress}" required name="referenceAddress">
				</div>
				<div class="col-md-6">
					<label><i class="bi bi-building"></i> Dirección de Negocio</label> 
					<input type="text" class="form-control form-control-sm" id="txtDireccionNego" value="${customer.addressBusiness}" required name="addressBusiness" >
				</div>
				<div class="col-md-6">
					<label><i class="bi bi-building"></i> Referencia de Dirección de Negocio</label> 
					<input type="text" class="form-control form-control-sm" id="txtRefDireccionNego" value="${customer.referenceAddressBusiness}" required name="referenceAddressBusiness">
				</div>  
				<div class="col-md-4">
					<label><i class="bi bi-caret-down-fill"></i> Departamento</label>
					<select class="form-select form-select-sm" id="txtDepartamento">
						<option value="0">SELECCIONAR</option>
						<c:forEach var="departament" items="${departaments}">
							<option value="${departament.c_departamento_inei}">${departament.c_departamento}</option>
						</c:forEach>
					</select>
				</div>
				<div class="col-md-4">
					<label><i class="bi bi-caret-down-fill"></i> Provincia</label> 
					<select	class="form-select form-select-sm" id="txtProvincia" required>
						<option value="0" depa="0">SELECCIONAR</option>
						<c:forEach var="province" items="${provinces}">
							<option value="${province.c_provincia_inei}" depa="${province.c_departamento_inei}">${province.c_provincia}</option>
						</c:forEach>
					</select>
				</div>
				<div class="col-md-4">
					<label><i class="bi bi-caret-down-fill"></i> Distrito</label> 
					<select class="form-select form-select-sm" id="txtDistrito" name="ubigeo">
						<option value="0" >SELECCIONAR</option>
					</select>
				</div>
				<div class="col-md-4">
					<label><i class="bi bi-envelope"></i> Correo 1</label> 
					<input type="text" class="form-control form-control-sm" value="${customer.emailMain}" name="emailMain">
				</div>
				<div class="col-md-4">
					<label><i class="bi bi-envelope"></i> Correo 2</label> 
					<input type="text" class="form-control form-control-sm" value="${customer.emailSecond}" name="emailSecond">
				</div>
				<div class="col-md-4">
					<label><i class="bi bi-cart-plus"></i> Fuente de Ingreso</label> 
					<input type="text" class="form-control form-control-sm" value="${customer.sourceMoney}" name="sourceMoney">
				</div>
				<div class="col-md-6">
					<label><i class="bi bi-building"></i> Mercado</label> 
					<input type="text" class="form-control form-control-sm" value="${customer.market}" name="market">
				</div>
				<div class="col-md-6">
					<label><i class="bi bi-building"></i> Sector</label> 
					<input type="text" class="form-control form-control-sm" value="${customer.sector}" name="sector">
				</div>
				<div class="col-md-12">
					<div class="row g-2">
						<div class="col-md-3 d-grid mt-1">
							<button class="btn btn-primary" type="submit"><i class="bi bi-save"></i> GUARDAR</button>
						</div>	
						<div class="col-md-2 d-grid mt-1">
							<a href="${pageContext.request.contextPath}/customer/"	class="btn btn-outline-danger" type="submit"><i class="bi bi-x-circle"></i> CANCELAR</a>
						</div>	
					</div>				
				</div>				
			</form>
		</div>
	</div>
</div>
<%@ include file="../commons/footer.jsp"%>
<script>
	$("#txtDepartamento").on('change', function() {
		$('#txtProvincia option:first').prop('selected',true);
		$("#txtDistrito").empty();
		$('#txtDistrito').append(new Option('SELECCIONAR', '0'))
		$('#txtDistrito option:first').prop('selected',true); //Para colocar el primer valor
		// para obter el id del departamento
		let dep_select = $("#txtDepartamento").val()
		$("#txtProvincia").find('option[depa]') // busca solo input con atributo depa
		.each(function(index, element) {
			$element = $(element)
			if ($element.attr('depa') === dep_select) {
				$element.show() // muestra el input
			} else {
				$element.hide() // si no lo oculta
			}
		})
	})
	$("#txtProvincia").on('change', function() {
		// para obter el id del departamento
		let prov_select = $("#txtProvincia").val()
		alert("Provincia:" + prov_select)		
		cargarDatos(prov_select)
	})

	function cargarDatos(id) {
		var url='/app-web-comercial/customer/obtnerDistrito/'+id;
		$.ajax({
			type : 'GET',
			url : url,
			contentType: 'application/json',
			async : true,
			success : function(response) {				
				mostrarDatos(response)
			}
		});
	}


	function mostrarDatos(response) {
		$("#txtDistrito").empty();
		$('#txtDistrito').append(new Option('SELECCIONAR', '0'))
         for (var i = 0; i < response.length; i++) {
        	 $('#txtDistrito').append(new Option(response[i].c_distrito, response[i].n_id_ubigeo))
		}
		$('#txtDistrito option:first').prop('selected',true); //Para colocar el primer valor
		 
	}
</script>
