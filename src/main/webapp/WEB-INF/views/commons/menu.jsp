<nav class="navbar navbar-expand-lg navbar-dark" style="background-color: #F2006E;font-style: normal;font: Courier">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">CREDI-SELVA</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/"><i class="bi bi-house"></i> Home</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle active" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            <i class="bi bi-cast"></i> Comercial
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/credits/"><i class="bi bi-file-earmark-text"></i> Creditos</a></li>
             <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#"><i class="bi bi-archive"></i> Productos</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/customer/"><i class="bi bi-person"></i> Clientes</a></li>
          </ul>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle active" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
           <i class="bi bi-file-bar-graph"></i> Reportes
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="#"><i class="bi bi-person-vcard"></i> Clientes</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#"><i class="bi bi-file-earmark-text"></i> Créditos</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#">Otros</a></li>
          </ul>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle active" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            <i class="bi bi-wrench"></i> Mantenimiento
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="#">Usuarios</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#">Perfiles</a></li>
          </ul>
        </li>
      </ul>
      <ul class="navbar-nav  mb-2 mb-lg-0">
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle active" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            <i class="bi bi-person-fill"></i> Ejecutivo Comercial
          </a>
          <ul class="dropdown-menu dropdown-menu-end text-center">
            <li><a class="dropdown-item" href="#"><img src="${pageContext.request.contextPath}/img/users/default_1.png" class="rounded-pill" width="80"></a></li>
            <li><a class="dropdown-item" href="#">Ejecutivo Comercial</a></li>
            <li><a class="dropdown-item" href="#"><i class="bi bi-envelope"></i> comercial@crediselva.com</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#"><i class="bi bi-arrow-right-square-fill"></i> Salir del Sistema</a></li>
          </ul>
        </li>
      </ul>
    </div>
  </div>
</nav>