<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*,source.model.*" %>
<%
    String baseUrl = (String)request.getAttribute("baseUrl");
    String status = (String)request.getAttribute("status");
    String message = (String)request.getAttribute("message");
    Vector<TypeAge> listeTypeAge = (Vector<TypeAge>)request.getAttribute("listeAge");
    Vector<TypeProduits> listeType = (Vector<TypeProduits>)request.getAttribute("listeType");
    Vector<RechercheVente> liste = (Vector<RechercheVente>)request.getAttribute("liste");
%>
<!DOCTYPE html>
<html lang="en">    
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Recherche des ventes d'une produits</title>
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
                    <h2 class="form-title">Recherche du vente du produits</h2>
                    <form action="<%= baseUrl %>/rechercheMulticritere_vente" method="POST">
                        <!-- Type d'age disponible -->
                        <div class="mb-3">
                            <label for="typeAge" class="form-label">Type d'age disponible:</label>
                            <select name="typeAge" id="typeAge" class="form-control">
                                <option value="-1" selected >Tous</option>
                                <% for(int i=0;i<listeTypeAge.size();i++){ %>
                                    <option value="<%= listeTypeAge.elementAt(i).getId() %>"><%= listeTypeAge.elementAt(i).getLibele() %></option>
                                <% } %>
                            </select>
                        </div>
                        <!-- Type du produits -->
                        <div class="mb-3">
                            <label for="typeprod" class="form-label">Type de produits disponible:</label>
                            <select name="typeprod" id="typeprod" class="form-control">
                                <option value="-1" selected >Tous</option>
                                <% for(int i=0;i<listeType.size();i++){ %>
                                    <option value="<%= listeType.elementAt(i).getId() %>"><%= listeType.elementAt(i).getLibele() %></option>
                                <% } %>
                            </select>
                        </div>
                        <!-- Bouton Submit -->
                        <div class="text-center">
                            <button type="submit" class="btn btn-submit w-100">Recherche</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>


        <!-- Page content-->
        <div class="container">
            <div class="text-center mt-5">
                <div class="table-container">
                    <h1 class="mb-5">Resultat des recherche des ventes:</h1>
                    <table class="table table-bordered table-hover">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Nom du Produit</th>
                                <th>Date du vente</th>
                                <th>Prix Unitaire</th>
                                <th>Quantite</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% if (liste == null || liste.isEmpty() || liste.size()==0 ) { %>
                                <tr>
                                    <td colspan="4">Aucune produits trouver</td>
                                </tr>
                            <% } else { %>
                                <% for(int i=0;i<liste.size();i++) { %>
                                    <tr>
                                        <td><%= liste.elementAt(i).getId() %></td>
                                        <td><%= liste.elementAt(i).getNomProduits() %></td>
                                        <td><%= liste.elementAt(i).getDateVente() %></td>
                                        <td><%= liste.elementAt(i).getPrixUnitaire() %></td>
                                        <td><%= liste.elementAt(i).getQuantite() %></td>
                                    </tr>
                                <% } %>
                            <% } %>
                    </table>
            </div>
        </div>

        <% if (status != null && !status.isEmpty()) { %>
            <% if("error".equals(status)) { %>
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



