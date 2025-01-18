<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*,source.model.*" %>
<%
    String baseUrl = (String)request.getAttribute("baseUrl");
    String status = (String)request.getAttribute("status");
    String message = (String)request.getAttribute("message");
    Vector<Produits> listeProduits = (Vector<Produits>)request.getAttribute("listeProduits");
    Vector<Laboratoires> listeLabo = (Vector<Laboratoires>)request.getAttribute("listeLabo");
    Vector<Clients> listeClients = (Vector<Clients>)request.getAttribute("listeClients");
%>
<!DOCTYPE html>
<html lang="en">    
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Insertion d'une vente</title>
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
                    <h2 class="form-title">Ajouter une Vente</h2>
                    <form action="<%= baseUrl %>/submit_vente" method="POST">
                        <!-- Date du vente -->
                        <div class="mb-3">
                            <label for="dateVente" class="form-label">Date du vente</label>
                            <input type="datetime-local" class="form-control" id="dateVente" name="dateVente" placeholder="Entrez le date du vente" required>
                        </div>
                        <!-- Produits -->
                        <div class="mb-3">
                            <label for="produit" class="form-label">Liste des produits:</label>
                            <select name="produit" id="produit" class="form-control">
                                <option value="-1" selected disabled>Tous</option>
                                <% for(int i=0;i<listeProduits.size();i++){ %>
                                    <option value="<%= listeProduits.elementAt(i).getId() %>"><%= listeProduits.elementAt(i).getNom_produit() %></option>
                                <% } %>
                            </select>
                        </div>
                        <!-- Quantite -->
                        <div class="mb-3">
                            <label for="quantite" class="form-label">Quantite</label>
                            <input type="number" class="form-control" id="quantite" name="quantite" placeholder="Entrez le quantite du produit" required>
                        </div>
                        <!-- Clients -->
                        <div class="mb-3">
                            <label for="client" class="form-label">Liste des clients:</label>
                            <select name="client" id="client" class="form-control">
                                <option value="-1" selected disabled>Clients Disponibles</option>
                                <% for(int i=0;i<listeClients.size();i++){ %>
                                    <option value="<%= listeClients.elementAt(i).getId() %>"><%= listeClients.elementAt(i).getNom() %></option>
                                <% } %>
                            </select>
                        </div>
                        <!-- Laboratoires -->
                        <div class="mb-3">
                            <label for="labo" class="form-label">Liste des laboratoires:</label>
                            <select name="labo" id="labo" class="form-control">
                                <option value="-1" selected disabled>Tous</option>
                                <% for(int i=0;i<listeLabo.size();i++){ %>
                                    <option value="<%= listeLabo.elementAt(i).getId() %>"><%= listeLabo.elementAt(i).getNom_laboratoire() %></option>
                                <% } %>
                            </select>
                        </div>
                        <!-- Bouton Submit -->
                        <div class="text-center">
                            <button type="submit" class="btn btn-submit w-100">Valider</button>
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
                        text: 'Vente ajouté avec succès.',
                        icon: 'success',
                        buttons: 'OK'
                    }).then((isOkay) => {
                        if (isOkay) {
                            window.location.href = '<%= baseUrl %>/insertion_ventes';
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



