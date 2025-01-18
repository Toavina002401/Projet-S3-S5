<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*,source.model.*" %>
<%
    String baseUrl = (String)request.getAttribute("baseUrl");
    String status = (String)request.getAttribute("status");
    String message = (String)request.getAttribute("message");
    Vector<RechercheClients> liste = (Vector<RechercheClients>)request.getAttribute("liste");
%>
<!DOCTYPE html>
<html lang="en">    
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Recherche des clients</title>
        <link href="<%= baseUrl %>/assets/css/styles.css" rel="stylesheet" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="<%= baseUrl %>/assets/css/Perso.css" rel="stylesheet" />
        <script src="<%= baseUrl %>/assets/js/sweetAlert.min.js"></script>
        <style>
            .form-unique{
                display: flex;
                flex-direction: row;
                justify-content: center;
                align-items: center;
            }
            .form-unique div {
                flex-basis: 50%;
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
                    <h3 class="form-title">Recherche des clients qui a effectuer des ventes le:</h3>
                    <form action="<%= baseUrl %>/submit_Clientvente" method="POST">
                        <!-- Date du vente -->
                        <div class="mb-3">
                            <label for="dateVente" class="form-label">Date du vente</label>
                            <input type="date" class="form-control" id="dateVente" name="dateVente" placeholder="Entrez le date du vente" required>
                        </div>
                        <!-- Bouton Submit -->
                        <div class="text-center">
                            <button type="submit" class="btn btn-submit w-100">Recherche</button>
                        </div>
                    </form>
                    <form action="<%= baseUrl %>/submit_Clientvente2" method="POST">
                        <!-- Date du vente -->
                        <div class="mb-3">
                            <label for="dateVente" class="form-label">Entre le:</label>
                            <div class="form-unique">
                                <div>
                                    <label for="dateVenteDeb">Date debut</label>
                                    <input type="date" class="form-control" id="dateVenteDeb" name="dateVenteDeb" required>
                                </div>
                                <div>
                                    <label for="dateVenteFin">Date Fin</label>
                                    <input type="date" class="form-control" id="dateVenteFin" name="dateVenteFin" required>
                                </div>
                            </div>
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
                    <h1 class="mb-5">Resultat des recherche des clients qui en effectuer des ventes:</h1>
                    <table class="table table-bordered table-hover">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Nom du Clients</th>
                                <th>Date du vente</th>
                                <th>Nom du Produits</th>
                                <th>Quantite</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% if (liste == null || liste.isEmpty() || liste.size()==0 ) { %>
                                <tr>
                                    <td colspan="4">Aucune client trouver</td>
                                </tr>
                            <% } else { %>
                                <% for(int i=0;i<liste.size();i++) { %>
                                    <tr>
                                        <td><%= liste.elementAt(i).getId() %></td>
                                        <td><%= liste.elementAt(i).getNomClient() %></td>
                                        <td><%= liste.elementAt(i).getDateDeVente() %></td>
                                        <td><%= liste.elementAt(i).getNomProduits() %></td>
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



