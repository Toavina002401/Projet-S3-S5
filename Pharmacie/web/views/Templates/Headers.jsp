<%
String baseUrl = (String)request.getAttribute("baseUrl");
%>
<!-- Responsive navbar-->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
        <a class="navbar-brand" href="<%= baseUrl %>/"><span class="display-6 fw-bold">Pharmacie  </span><span class="fs-6 text-secondary">Projet-S3-S5</span></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                <li class="nav-item me-3"><a class="nav-link active" aria-current="page" href="<%= baseUrl %>/">Home</a></li>
                <li class="nav-item dropdown me-3">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Produits</a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="<%= baseUrl %>/insertion_produits">Insertion d'un produit</a></li>
                        <li><a class="dropdown-item" href="<%= baseUrl %>/insertion_produitsConseiller">Insertion des produits conseiller du mois</a></li>
                        <li><a class="dropdown-item" href="<%= baseUrl %>/liste_produits">Liste des produits</a></li>
                        <li><a class="dropdown-item" href="<%= baseUrl %>/liste_produitsConseiller">Liste des produits  conseiller du mois</a></li>
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href="<%= baseUrl %>/recherche_produits">Recherche multicritere</a></li>
                    </ul>
                </li>
                <li class="nav-item dropdown me-3">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Maladies</a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="<%= baseUrl %>/insertion_maladies">Insertion d'une maladie</a></li>
                        <li><a class="dropdown-item" href="<%= baseUrl %>/liste_maladies">Liste des maladies</a></li>
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href="#">Recherche d'une maladie</a></li>
                    </ul>
                </li>
                <li class="nav-item dropdown me-3">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Laboratoires</a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="<%= baseUrl %>/insertion_laboratoires">Insertion d'une laboratoire</a></li>
                        <li><a class="dropdown-item" href="<%= baseUrl %>/liste_laboratoires">Liste des laboratoires</a></li>
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href="#">Recherche d'une laboratoire</a></li>
                    </ul>
                </li>
                <li class="nav-item dropdown me-3">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Clients</a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="<%= baseUrl %>/insertion_clients">Insertion d'une Clients</a></li>
                        <li><a class="dropdown-item" href="<%= baseUrl %>/liste_clients">Liste des Clients</a></li>
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href="<%= baseUrl %>/recherche_clientsVente">Recherche des Clients</a></li>
                    </ul>
                </li>
                <li class="nav-item dropdown me-3">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Ventes</a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="<%= baseUrl %>/insertion_ventes">Insertion d'une vente</a></li>
                        <li><a class="dropdown-item" href="<%= baseUrl %>/liste_ventes">Liste des ventes</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>