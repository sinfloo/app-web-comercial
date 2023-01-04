<%@ include file="../commons/header.jsp"%>
<%@ include file="../commons/menu.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="container mt-4">
	<div class="card">
		<div class="card-header fs-4" >Formulario de Clientes</div>
		<div class="card-body">
			<form class="row g-3 needs-validation" action="${pageContext.request.contextPath}/customer/save" method="POST">
				<div class="col-md-3">
					<label for="txtTipoDocumento" class="form-label">Tipo Dococumento</label> 
					<select class="form-select" id="txtTipoDocumento" name="tipdoc">
						<option value="1">DNI</option>
						<option value="6">RUC</option>
						<option value="4">CARNET EXT.</option>
						<option value="7">PASAPORTE</option>
					</select>
					<div class="valid-feedback">Looks good!</div>
				</div>
				<div class="col-md-3">
					<label for="txtNro" class="form-label">Nro Documento</label> 
					<input type="text" class="form-control" id="txtNro"	value="${customer.numDoc}" required maxlength="12" name="numDoc">
					<div class="valid-feedback">Looks good!</div>
				</div>				
				<div class="col-md-6">
					<label for="txtNombres" class="form-label">Nombres</label>
					<input type="text" class="form-control" id="txtNombres" value="${customer.name}" required name="name">
					<div class="valid-feedback">Looks good!</div>
				</div>
				<div class="col-md-3">
					<label for="txtApellidoPaterno" class="form-label">Apellido Paterno</label> 
					<input type="text" class="form-control"	id="txtApellidoPaterno" value="${customer.firstname}" required name="firstname">
					<div class="valid-feedback">Looks good!</div>
				</div>
				<div class="col-md-3">
					<label for="txtApellidoMaterno" class="form-label">Apellido	Materno</label> 
					<input type="text" class="form-control" id="txtApellidoMaterno" value="${customer.lastname}" required name="lastname">
					<div class="valid-feedback">Looks good!</div>
				</div>
				<div class="col-md-3">
					<label for="txtFechaNacimiento" class="form-label">Fecha de Nacimiento</label> 
					<input type="date" class="form-control" id="txtFechaNacimiento" value="${customer.dateBirth}" required name="dateBirth">
					<div class="valid-feedback">Looks good!</div>
				</div>
				<div class="col-md-3">
					<label for="txtEstadoCivil" class="form-label">Estado Civil</label>
					<select class="form-select" id="txtEstadoCivil" name="civilStatus">
						<option value="1">SOLTERO</option>
						<option value="2">CASADO</option>
						<option value="3">DIVORCIADO</option>
					</select>
					<div class="valid-feedback">Looks good!</div>
				</div>
				<div class="col-md-6">
					<label for="txtDireccion" class="form-label">Dirección</label> 
					<input type="text" class="form-control" id="txtDireccion" value="${customer.address}" required name="address">
					<div class="valid-feedback">Looks good!</div>
				</div>
				<div class="col-md-6">
					<label for="txtRefDireccion" class="form-label">Referencia de Dirección</label> 
					<input type="text" class="form-control"id="txtRefDireccion" value="${customer.referenceAddress}" required name="referenceAddress">
					<div class="valid-feedback">Looks good!</div>
				</div>
				<div class="col-md-6">
					<label for="txtDireccionNego" class="form-label">Dirección de Negocio</label> 
					<input type="text" class="form-control" id="txtDireccionNego" value="${customer.addressBusiness}" required name="addressBusiness" >
					<div class="valid-feedback">Looks good!</div>
				</div>
				<div class="col-md-6">
					<label for="txtRefDireccionNego" class="form-label">Referencia de Dirección de Negocio</label> 
					<input type="text" class="form-control" id="txtRefDireccionNego" value="${customer.referenceAddressBusiness}" required name="referenceAddressBusiness">
					<div class="valid-feedback">Looks good!</div>
				</div>  
				<div class="col-md-4">
					<label for="txtDepartamento" class="form-label">Departamento</label>
					<select class="form-select" id="txtDepartamento">
						<option value="0">SELECCIONAR</option>
						<c:forEach var="departament" items="${departaments}">
							<option value="${departament.c_departamento_inei}">${departament.c_departamento}</option>
						</c:forEach>
					</select>
					<div class="valid-feedback">Looks good!</div>
				</div>
				<div class="col-md-4">
					<label for="txtProvincia" class="form-label">Provincia</label> <select
						class="form-select" id="txtProvincia" required>
						<option value="0" depa="0">SELECCIONAR</option>
						<c:forEach var="province" items="${provinces}">
							<option value="${province.c_provincia_inei}" depa="${province.c_departamento_inei}">${province.c_provincia}</option>
						</c:forEach>
					</select>
					<div class="valid-feedback">Looks good!</div>
				</div>
				<div class="col-md-4">
					<label for="txtDistrito" class="form-label">Distrito</label> 
					<select class="form-select" id="txtDistrito" name="ubigeo">
						<option value="0" >SELECCIONAR</option>
					</select>
					<div class="valid-feedback">Looks good!</div>
				</div>
				<div class="col-12">
					<button class="btn btn-primary" type="submit">GUARDAR CAMBIOS</button>
					<a href="${pageContext.request.contextPath}/customer/"	class="btn btn-danger" type="submit">CANCELAR</a>
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
		console.log("Provincia:" + prov_select)		
		cargarDatos(prov_select)
	})

	function cargarDatos(id) {
		var url='http://localhost:8080/app-web-comercial/customer/obtnerDistrito/'+id;
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
