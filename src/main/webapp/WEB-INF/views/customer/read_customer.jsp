<%@ include file="../commons/header.jsp"%>
<%@ include file="../commons/menu.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="me-md-3 ms-3 mt-4">
	<div class="row  g-2">
		<div class="col-sm-2">
			<a href="${pageContext.request.contextPath}/customer/new" class="btn btn-outline-success"><i class="bi bi-person-plus"></i> Nuevo</a>
		</div>
		<div class="col-sm-6  text-center">
			<h3>Lista de Clientes</h3>
		</div>
	</div>
	<div class="card">
		<div class="card-body table-responsive">
		<table id="myTable" class="table nowrap cell-border" style="width: 100%">
			<thead class="table-dark">
				<tr>
					<th>#</th>
					<th>TIPO</th>
					<th>N° DOC</th>
					<th>APELLIDO PATERNO</th>
					<th>APELLIDO MATERNO</th>
					<th>NOMBRES</th>
					<th>DIRECCION</th>
					<th>RE.DIRECCION</th>
					<th>DIRECCION NEG.</th>
					<th>REF. DIR. NEGOCIO</th>
					<th>UBIGEO</th>
					<th>TELEFONO 1</th>
					<th>TELEFONO 2</th>
					<th>CORREO 1</th>
					<th>CORREO 2</th>
					<th>FUENTE INGRESO</th>
					<th>SECTOR</th>
					<th>ACCION</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="customer" items="${customers}" varStatus="i">
					<tr>
						<th scope="row">${i.index+1}</th>
						<td>
							<c:if test="${customer.c_tip_doc==1}">
								DNI
							</c:if>
							<c:if test="${customer.c_tip_doc==4}">
								CARNET EXT.
							</c:if>
							<c:if test="${customer.c_tip_doc==6}">
								RUC
							</c:if>
							<c:if test="${customer.c_tip_doc==7}">
								PASAPORTE
							</c:if>
						</td>
						<td>${customer.c_num_doc}</td>
						<td>${customer.c_first_name}</td>
						<td>${customer.c_last_name}</td>
						<td>${customer.c_name}</td>
						<td>${customer.c_address}</td>
						<td>${customer.c_refe_address}</td>
						<td>${customer.c_address_business}</td>
						<td>${customer.c_refe_address_bus}</td>
						<td>${customer.n_id_ubigeo}</td>
						<td>${customer.c_phone_main}</td>
						<td>${customer.c_phone_second}</td>
						<td>${customer.c_email_main}</td>
						<td>${customer.c_email_second}</td>
						<td>${customer.c_source_money}</td>
						<td>${customer.c_sector}</td>
						<td>
							<a href=""><i class="bi bi-trash" style="color: #F92C18"></i></a> 
							<a href=""><i class="bi bi-pencil-square" style="color: #FAAB0B"></i></a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	</div>
</div>
<%@ include file="../commons/footer.jsp"%>
