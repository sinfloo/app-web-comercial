<%@ include file="commons/header.jsp"%>
<%@ include file="commons/menu.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="container mt-4">
	<div class="card">
		<div class="card-header">DATOS DEL CLIENTE</div>
		<div class="card-body">
			<form class="row  align-items-center"
				action="${pageContext.request.contextPath}/credits/obtain"
				method="POST">
				<div class="col-sm-4">
					<div class="input-group">
						<input type="text" class="form-control"
							placeholder="" name="name" value="${customer.c_name}">
					</div>
				</div>
				<div class="col-sm-4">
					<div class="input-group">
						<input type="text" class="form-control"
							placeholder="Ingrese Numero" name="document" value="${customer.c_num_doc}">
						<button class="btn btn-primary" type="submit">Buscar</button>
					</div>
				</div>

			</form>
		</div>
	</div>
	<br>
	<div class="card">
		<div class="card-header">CREDITOS</div>
		<div class="card-body">
			<table class="table">
				<thead class="table-dark">
					<tr>
						<th scope="col">#</th>
						<th scope="col">First</th>
						<th scope="col">Last</th>
						<th scope="col">Handle</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th scope="row">1</th>
						<td>Mark</td>
						<td>Otto</td>
						<td>@mdo</td>
					</tr>
					<tr>
						<th scope="row">2</th>
						<td>Jacob</td>
						<td>Thornton</td>
						<td>@fat</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>
<%@ include file="commons/footer.jsp"%>