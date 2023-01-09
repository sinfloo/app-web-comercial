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
					<input type="hidden" value="${customer.id_customer}" name="id_customer">
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
					<input type="text" class="form-control form-control-sm" value="${customer.phoneMain}" required maxlength="9" name="phoneMain">
				</div>
				<div class="col-md-3">
					<label><i class="bi bi-phone"></i> Telefono 2</label> 
					<input type="text" class="form-control form-control-sm" value="${customer.phoneSecond}" maxlength="9" name="phoneSecond">
				</div>
				<div class="col-md-6">
					<label><i class="bi bi-house"></i> Dirección</label> 
					<input type="text" class="form-control form-control-sm" value="${customer.address}" required name="address">
				</div>
				<div class="col-md-6">
					<label><i class="bi bi-house"></i> Referencia de Dirección</label> 
					<input type="text" class="form-control form-control-sm" value="${customer.referenceAddress}" required name="referenceAddress">
				</div>
				<div class="col-md-6">
					<label><i class="bi bi-building"></i> Dirección de Negocio</label> 
					<input type="text" class="form-control form-control-sm" value="${customer.addressBusiness}" required name="addressBusiness" >
				</div>
				<div class="col-md-6">
					<label><i class="bi bi-building"></i> Referencia de Dirección de Negocio</label> 
					<input type="text" class="form-control form-control-sm"  value="${customer.referenceAddressBusiness}" required name="referenceAddressBusiness">
				</div>  
				<div class="col-md-4">
					<label><i class="bi bi-caret-down-fill"></i> Departamento</label>
					<select class="form-select form-select-sm" id="txtDepartamento">
						<option value="0">SELECCIONAR</option>
						<c:if test="${ubigeo!=null}">
							<option selected value="${ubigeo.departament.c_departamento_inei}">${ubigeo.departament.c_departamento}</option>
						</c:if>
						<c:forEach var="departament" items="${departaments}">
							<option value="${departament.c_departamento_inei}">${departament.c_departamento}</option>
						</c:forEach>
					</select>
				</div>
				<div class="col-md-4">
					<label><i class="bi bi-caret-down-fill"></i> Provincia</label> 
					<select	class="form-select form-select-sm" id="txtProvincia" required>
						<option value="0" >SELECCIONAR</option>
						<c:if test="${ubigeo!=null}">
							<option selected value="${ubigeo.province.c_provincia_inei}">${ubigeo.province.c_provincia}</option>
						</c:if>
					</select>
				</div>
				<div class="col-md-4">
					<label><i class="bi bi-caret-down-fill"></i> Distrito</label> 
					<select class="form-select form-select-sm" id="txtDistrito" name="ubigeo">
						<option value="0" >SELECCIONAR</option>
						<c:if test="${ubigeo!=null}">
							<option selected value="${ubigeo.n_id_ubigeo}">${ubigeo.district.c_distrito}</option>
						</c:if>
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
	$("#txtDepartamento").on('change', function() {
		// para obter el id del departamento
		let dep_select = $("#txtDepartamento").val()	
		getProvince(dep_select)
	})


	function getProvince(id_departament) {
		var url='/app-web-comercial/customer/getProvince/'+id_departament;
		$.ajax({
			type : 'GET',
			url : url,
			contentType: 'application/json',
			async : true,
			success : function(response) {				
				showProvince(response)
			}
		});
	}
	function showProvince(response) {
		$("#txtProvincia").empty();
		$('#txtProvincia').append(new Option('SELECCIONAR', '0'))
         for (var i = 0; i < response.length; i++) {
        	 $('#txtProvincia').append(new Option(response[i].c_provincia, response[i].c_provincia_inei))
		}
		$('#txtProvincia option:first').prop('selected',true); //Para colocar el primer valor
		 
	}
	$("#txtProvincia").on('change', function() {
		// para obter el id del departamento
		let prov_select = $("#txtProvincia").val()		
		getDistrict(prov_select)
	})
	function getDistrict(id_province) {
		var url='/app-web-comercial/customer/getDistrict/'+id_province;
		$.ajax({
			type : 'GET',
			url : url,
			contentType: 'application/json',
			async : true,
			success : function(response) {				
				showDistrict(response)
			}
		});
	}


	function showDistrict(response) {
		$("#txtDistrito").empty();
		$('#txtDistrito').append(new Option('SELECCIONAR', '0'))
         for (var i = 0; i < response.length; i++) {
        	 $('#txtDistrito').append(new Option(response[i].c_distrito, response[i].n_id_ubigeo))
		}
		$('#txtDistrito option:first').prop('selected',true); //Para colocar el primer valor
		 
	}
</script>
