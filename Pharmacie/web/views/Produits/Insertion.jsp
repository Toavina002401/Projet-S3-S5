<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
  String baseUrl = (String)request.getAttribute("baseUrl");
  String status = (String)request.getAttribute("status");
  String message = (String)request.getAttribute("message");
%>
<!DOCTYPE html>
<html lang="en">    
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Insertion d'un produit</title>
        <link href="<%= baseUrl %>/assets/css/styles.css" rel="stylesheet" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="<%= baseUrl %>/assets/css/Perso.css" rel="stylesheet" />
        <script src="<%= baseUrl %>/assets/js/sweetAlert.min.js"></script>
    </head>
    <body>
        <!-- Inclure le header -->
        <%
            String headerPath = "/WEB-INF/views/Templates/Headers.jsp";
            request.getRequestDispatcher(headerPath).include(request, response);
        %>

        <!-- Page content-->
        <div class="container">
            <div class="text-center mt-5">
                <div class="form-container">
                    <h2 class="form-title">Ajouter un Produit</h2>
                    <form action="<%= baseUrl %>/submit_produit" method="POST">
                        <!-- Champ Nom de Produit -->
                        <div class="mb-3">
                            <label for="nomProduit" class="form-label">Nom du Produit</label>
                            <input type="text" class="form-control" id="nomProduit" name="nomProduit" placeholder="Entrez le nom du produit" required>
                        </div>
                        <!-- Champ Description -->
                        <div class="mb-3">
                            <label for="descriptionProduit" class="form-label">Description</label>
                            <textarea class="form-control" id="descriptionProduit" name="descriptionProduit" rows="4" placeholder="Entrez une description" required></textarea>
                        </div>
                        <!-- Champ Prix -->
                        <div class="mb-3">
                            <label for="prixProduit" class="form-label">Prix</label>
                            <input type="number" class="form-control" step="0.01" id="prixProduit" name="prixProduit" placeholder="Entrez le prix en euros" required>
                        </div>
                        <!-- Bouton Submit -->
                        <div class="text-center">
                            <button type="submit" class="btn btn-submit w-100">Ajouter</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <% if (status != null && !status.isEmpty()) { %>
            <% if("success".equals(status)) { %>
                <script>
                    swal({
                        title: 'Succès',
                        text: 'Produit ajouté avec succès.',
                        icon: 'success',
                        buttons: 'OK'
                    }).then((isOkay) => {
                        if (isOkay) {
                            window.location.href = '<%= baseUrl %>/insertion_produits';
                        }
                    });
                </script>
            <% } else { %>
                <script>
                    swal({
                        title: 'Erreur',
                        text: '<%= message %>',
                        icon: 'error',
                        buttons: 'OK'
                    }).then((isOkay) => {
                        if (isOkay) {
                            window.history.back();
                        }
                    });
                </script>
            <% } %> 
        <% } %> 
        <script src="<%= baseUrl %>/assets/js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>



