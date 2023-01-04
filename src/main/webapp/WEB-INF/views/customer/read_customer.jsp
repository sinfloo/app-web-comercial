<%@ include file="../commons/header.jsp"%>
<%@ include file="../commons/menu.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="container mt-4">
	<div class="row row-cols-lg-autog-3 text-center">
		<div class="col-sm-2">
			<a href="${pageContext.request.contextPath}/customer/new" class="btn btn-outline-primary">
				<i class="bi bi-person-plus"></i> Agregar Nuevo</a>
		</div>
		<div class="col-sm-6">
			<h3>Lista de Clientes</h3>
		</div>
	</div>
	<br>
	<div class="table-responsive">
		<table id="myTable" class="table nowrap cell-border" style="width: 100%">
			<thead class="table-dark">
				<tr>
					<th>#</th>
					<th>TIPO</th>
					<th>N° DOC</th>
					<th>APELLIDO PATERNO</th>
					<th>APELLIDO MATERNO</th>
					<th>NOMBRES</th>
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
<%@ include file="../commons/footer.jsp"%>
