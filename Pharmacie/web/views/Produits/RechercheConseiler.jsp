<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*,source.model.*" %>
<%
    String baseUrl = (String)request.getAttribute("baseUrl");
    Vector<LesMois> lesmois = (Vector<LesMois>)request.getAttribute("lesmois");
    Vector<ProduitsConseil> liste = (Vector<ProduitsConseil>)request.getAttribute("liste");
%>
<!DOCTYPE html>
<html lang="en">    
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Liste des produits  conseiller du mois</title>
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
                    <h2 class="form-title">Recherche des produits conseiller les mois et l'années:</h2>
                    <form action="<%= baseUrl %>/recherche_produitConseiller" method="POST">
                        <!-- Listes des mois -->
                        <div class="mb-3">
                            <label for="produit" class="form-label">Pour les mois:</label>
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
                    <h1 class="mb-5">Liste des produits  conseiller du mois</h1>
                    <table class="table table-bordered table-hover">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Nom du Produit</th>
                                <th>Description</th>
                                <th>Prix</th>
                                <th>Mois</th>
                                <th>Annees</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% if (liste == null || liste.isEmpty() || liste.size()==0 ) { %>
                                <tr>
                                    <td colspan="4">Aucune produits conseiller trouver</td>
                                </tr>
                            <% } else { %>
                                <% for(int i=0;i<liste.size();i++) { %>
                                    <tr>
                                        <td><%= liste.elementAt(i).getId() %></td>
                                        <td><%= liste.elementAt(i).getNom_produit() %></td>
                                        <td><%= liste.elementAt(i).getDescription() %></td>
                                        <td><%= liste.elementAt(i).getPrix() %></td>
                                        <td><%= liste.elementAt(i).getMois() %></td>
                                        <td><%= liste.elementAt(i).getAnnees() %></td>
                                    </tr>
                                <% } %>
                            <% } %>
                        </tbody>
                    </table>
            </div>
        </div>

        <script src="<%= baseUrl %>/assets/js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>



