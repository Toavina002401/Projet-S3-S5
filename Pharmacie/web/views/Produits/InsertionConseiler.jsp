<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*,source.model.*" %>
<%
    String baseUrl = (String)request.getAttribute("baseUrl");
    String status = (String)request.getAttribute("status");
    String message = (String)request.getAttribute("message");
    Vector<Produits> liste = (Vector<Produits>)request.getAttribute("liste");
    Vector<LesMois> lesmois = (Vector<LesMois>)request.getAttribute("lesmois");
%>
<!DOCTYPE html>
<html lang="en">    
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Insertion des produits conseiller du mois</title>
        <link href="<%= baseUrl %>/assets/css/styles.css" rel="stylesheet" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="<%= baseUrl %>/assets/css/Perso.css" rel="stylesheet" />
        <script src="<%= baseUrl %>/assets/js/sweetAlert.min.js"></script>
        <style>
            .flex-container {
                display: flex;
                flex-wrap: wrap;
                gap: 05px; /* Espacement entre les éléments */
            }
            
            .flex-container > div {
                flex: 1 1 auto; /* Les éléments s'ajustent automatiquement */
                min-width: 150px; /* Largeur minimale pour chaque élément */
            }
        </style>
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
                    <h2 class="form-title">Formulaire d'insertion des produits conseiller du mois</h2>
                    <form action="<%= baseUrl %>/submit_produitConseiller" method="POST">
                        <!-- Champ Nom de Produit -->
                        <div class="mb-3">
                            <label for="produit" class="form-label">Selection d'un ou plusieur produits:</label>
                            <select name="produit" id="produit" class="form-control">
                                <option value="-1" selected disabled>Nom des produits</option>
                                <% for(int i=0;i<liste.size();i++){ %>
                                    <option value="<%= liste.elementAt(i).getId() %>"><%= liste.elementAt(i).getNom_produit() %></option>
                                <% } %>
                            </select>
                        </div>
                        <!-- Listes des mois -->
                        <div class="mb-3">
                            <label for="produit" class="form-label">recommendation pour les mois:</label>
                            <div class="flex-container">
                                <% for(int i=0;i<lesmois.size();i++){ %>
                                    <div>
                                        <input type="checkbox" name="mois_<%= lesmois.elementAt(i).getId() %>" id="mois_<%= lesmois.elementAt(i).getId() %>">
                                        <label for="mois_<%= lesmois.elementAt(i).getId() %>" class="form-label"><%= lesmois.elementAt(i).getLibele() %></label>
                                    </div>
                                <% } %>
                            </div>
                        </div>
                        <!-- Listes des annees -->
                        <div class="mb-3">
                            <label for="annees" class="form-label">pour l'années:</label>
                            <select name="annees" id="annees" class="form-control">
                                <option value="-1" selected disabled>Listes des années dispo</option>
                                <option value="2025">2025</option>
                                <option value="2024">2024</option>
                                <option value="2023">2023</option>
                                <option value="2022">2022</option>
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
                        text: 'Produit conseiller ajouté avec succès.',
                        icon: 'success',
                        buttons: 'OK'
                    }).then((isOkay) => {
                        if (isOkay) {
                            window.location.href = '<%= baseUrl %>/insertion_produitsConseiller';
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



