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
		<table id="myTables" class="table nowrap cell-border" style="width: 100%">
			<thead class="table-dark">
				<tr class="text-center">
					<th>#</th>
					<th>TIPO</th>
					<th>N° DOC</th>
					<th>NOMBRES </th>
					<th>DIRECCION</th>
					<th>TELEFONO</th>
					<th>ESTADO</th>
					<th>ACCION</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="customer" items="${customers.content}" varStatus="i">
					<tr>
						<th scope="row" class="text-center">${i.index+1}</th>
						<td class="text-center">
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
						<td class="text-center">${customer.c_num_doc}</td>
						<td>${customer.c_name} ${customer.c_first_name} ${customer.c_last_name}</td>
						<td>${customer.c_address}</td>
						<td class="text-center">${customer.c_phone_main}</td>
						<td class="text-center">
							<c:if test="${customer.c_state==1}">
								<span class="badge bg-info">NUEVO</span>
							</c:if>
							<c:if test="${customer.c_state==2}">
								<span class="badge bg-success">CLIENTE</span>
							</c:if>
							<c:if test="${customer.c_state==3}">
								<span class="badge bg-warning">EX-CLIENTE</span>
							</c:if>
							<c:if test="${customer.c_state==4}">
								<span class="badge bg-danger">SUSPENDIDO</span>
							</c:if>
						</td>
						<td class="text-center">
							<a href="${pageContext.request.contextPath}/customer/edit/${customer.c_num_doc}"><span class="badge bg-warning rounded-pill"><i class="bi bi-pencil-square"></i></span></a>
							<a href="${pageContext.request.contextPath}/customer/view/${customer.c_num_doc}"><span class="badge bg-primary rounded-pill"><i class="bi bi-eye">Detalle</i></span></a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
			<nav aria-label="Page navigation">
				<c:if test="${customers.totalPages > 0}">
					<ul class="pagination justify-content-center">
						<c:if test="${currentPage==1}">
							<li class="page-item disabled"><a class="page-link" href="#">Anterior</a></li>
						</c:if>		
						<c:if test="${currentPage>1}">
							<li class="page-item"><a class="page-link" href="#">Anterior</a></li>
						</c:if>					
						<c:forEach var = "pageNumber"  items = "${pageNumbers}" varStatus="i">
							<c:if test="${pageNumber==currentPage}">
								<li class="page-item active"><a class="page-link" href="${pageContext.request.contextPath}/customer/?size=${customers.size}&page=${pageNumber}" >${i.index+1}</a></li>
							</c:if>											
							<c:if test="${pageNumber!=currentPage}">
								<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/customer/?size=${customers.size}&page=${pageNumber}" >${i.index+1}</a></li>
							</c:if>											
						</c:forEach>
						<c:if test="${currentPage==totalPages}">
							<li class="page-item disabled"><a class="page-link" href="#">Siguiente</a></li>	
						</c:if>							
						<c:if test="${currentPage<totalPages}">
							<li class="page-item"><a class="page-link" href="#">Siguiente</a></li>	
						</c:if>							
					</ul>
				</c:if>
			</nav>
		</div>
	</div>
</div>
<%@ include file="../commons/footer.jsp"%>
