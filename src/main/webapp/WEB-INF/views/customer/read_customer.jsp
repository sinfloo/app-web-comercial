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
					<th>NOMBRES </th>
					<th>DIRECCION</th>
					<th>TELEFONO</th>
					<th>CORREO</th>
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
						<td>${customer.c_name} ${customer.c_first_name} ${customer.c_last_name}</td>
						<td>${customer.c_address}</td>
						<td>${customer.c_phone_main}</td>
						<td>${customer.c_email_main}</td>
						<td>
							<a href="${pageContext.request.contextPath}/customer/edit/${customer.c_num_doc}"><i class="bi bi-pencil-square" style="color: #FAAB0B"></i></a>
							<a href="${pageContext.request.contextPath}/customer/view/${customer.c_num_doc}"><i class="bi bi-eye">Detalle</i></a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	</div>
</div>
<%@ include file="../commons/footer.jsp"%>
