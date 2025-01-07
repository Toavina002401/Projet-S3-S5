<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*,source.model.*" %>
<%
    String baseUrl = (String)request.getAttribute("baseUrl");
    Vector<Corps> listeCorps = (Vector<Corps>)request.getAttribute("listeCorps");
    Vector<TypeAge> listeTypeAge = (Vector<TypeAge>)request.getAttribute("listeAge");
    Vector<Produits> liste = (Vector<Produits>)request.getAttribute("liste");
%>
<!DOCTYPE html>
<html lang="en">    
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Recherche des produit</title>
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
                    <h2 class="form-title">Recherche multicritere</h2>
                    <form action="<%= baseUrl %>/rechercheMulticritere_produit" method="POST">
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
                        <!-- Partie du corps -->
                        <div class="mb-3">
                            <label for="corps" class="form-label">Partie du corps</label>
                            <select name="corps" id="corps" class="form-control">
                                <option value="-1" selected>Tous</option>
                                <% for(int i=0;i<listeCorps.size();i++){ %>
                                    <option value="<%= listeCorps.elementAt(i).getId() %>"><%= listeCorps.elementAt(i).getPartie() %></option>
                                <% } %>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label for="descriptionProduit" class="form-label">Symptome</label>
                            <textarea class="form-control" id="symptome" name="symptome" rows="4" placeholder="Entrez une symptome"></textarea>
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
                    <h1 class="mb-5">Resultat des recherche multicritere</h1>
                    <table class="table table-bordered table-hover">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Nom du Produit</th>
                                <th>Description</th>
                                <th>Prix</th>
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
                                        <td><%= liste.elementAt(i).getNom_produit() %></td>
                                        <td><%= liste.elementAt(i).getDescription() %></td>
                                        <td><%= liste.elementAt(i).getPrix() %></td>
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



