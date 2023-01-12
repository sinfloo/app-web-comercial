<%@ include file="../commons/header.jsp"%>
<%@ include file="../commons/menu.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="container mt-4">
	<ol class="list-group">
		<li	class="list-group-item justify-content-between align-items-start">
			<div class="row">
				<div class="col-sm-1">
					<div class="fw-bold">
						<i class="bi bi-card-list"></i> Tipo
					</div>
					<c:if test="${customer.tipdoc==1}">
					DNI
					</c:if>
					<c:if test="${customer.tipdoc==4}">
					CARNET EXT.
					</c:if>
					<c:if test="${customer.tipdoc==6}">
					RUC
					</c:if>
					<c:if test="${customer.tipdoc==7}">
					PASAPORTE
					</c:if>
				</div>
				<div class="col-sm-2">
					<div class="fw-bold"><i class="bi bi-card-list"></i> N°</div>
					${customer.numDoc}
				</div>
				<div class="col-sm-3">
					<div class="fw-bold"><i class="bi bi-check-square"></i> Nombres</div>
					${customer.name}
				</div>
				<div class="col-sm-3">
					<div class="fw-bold"><i class="bi bi-check-square"></i> Apellido Paterno</div>
					${customer.firstname}
				</div>
				<div class="col-sm-3">
					<div class="fw-bold"><i class="bi bi-check-square"></i> Apellido Materno</div>
					${customer.lastname}
				</div>
			</div>
		</li>		
		<li	class="list-group-item justify-content-between align-items-start">
			<div class="row">
				<div class="col-sm-3">
					<div class="fw-bold"><i class="bi bi-calendar2-day-fill"></i> Fecha Nacimiento</div>
					${customer.dateBirth}
				</div>
				<div class="col-sm-3">
					<div class="fw-bold"><i class="bi bi-people-fill"></i> Estado Civil</div>
					${customer.civilStatus}
				</div>
				<div class="col-sm-3">
					<div class="fw-bold"><i class="bi bi-phone"></i> Telefono Principal</div>
					${customer.phoneMain}
				</div>
				<div class="col-sm-3">
					<div class="fw-bold"><i class="bi bi-phone"></i> Telefono Secundario</div>
					${customer.phoneSecond}
				</div>
			</div>
		</li>		
		<li	class="list-group-item justify-content-between align-items-start">
			<div class="row">
				<div class="col-sm-6">
					<div class="fw-bold"><i class="bi bi-house"></i> Dirección</div>
					${customer.address}
				</div>
				<div class="col-sm-6">
					<div class="fw-bold"><i class="bi bi-house"></i> Referencia de Dirección</div>
					${customer.referenceAddress}
				</div>
			</div>
		</li>		
		<li	class="list-group-item justify-content-between align-items-start">
			<div class="row">
				<div class="col-sm-6">
					<div class="fw-bold"><i class="bi bi-building"></i> Dirección de Negocio</div>
					${customer.addressBusiness}
				</div>
				<div class="col-sm-6">
					<div class="fw-bold"><i class="bi bi-building"></i> Referencia de Dirección de Negocio</div>
					${customer.referenceAddressBusiness}
				</div>
			</div>
		</li>		
		<li	class="list-group-item justify-content-between align-items-start">
			<div class="row">
				<div class="col-sm-4">
					<div class="fw-bold"><i class="bi bi-geo-alt"></i> Ubigeo</div>
					${ubigeo.departament.c_departamento}-${ubigeo.province.c_provincia}-${ubigeo.district.c_distrito}
				</div>
				<div class="col-sm-4">
					<div class="fw-bold"><i class="bi bi-envelope"></i> Correo Principal</div>
					${customer.emailMain}
				</div>
				<div class="col-sm-4">
					<div class="fw-bold"><i class="bi bi-envelope"></i> Correo Secundario</div>
					${customer.emailSecond}
				</div>
			</div>
		</li>		
		<li	class="list-group-item justify-content-between align-items-start">
			<div class="row">
				<div class="col-sm-4">
					<div class="fw-bold"><i class="bi bi-building"></i> Sector</div>
					${customer.sector.description}
				</div>
				<div class="col-sm-4">
					<div class="fw-bold"><i class="bi bi-toggle-on"></i> Estado</div>
					${customer.state}
				</div>
				<div class="col-sm-4">
					<div class="fw-bold"><i class="bi bi-hand-index"></i> Action</div>
					<a href="${pageContext.request.contextPath}/customer/" class="btn btn-success"><i class="bi bi-reply"></i> Volver</a>
				</div>
			</div>
		</li>		
	</ol>
</div>
<%@ include file="../commons/footer.jsp"%>
