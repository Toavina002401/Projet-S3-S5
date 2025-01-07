<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*,source.model.*" %>
<%
    String baseUrl = (String)request.getAttribute("baseUrl");
    Vector<Produits> liste = (Vector<Produits>)request.getAttribute("liste");
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
        <title>Liste des produits</title>
        <link href="<%= baseUrl %>/assets/css/styles.css" rel="stylesheet" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="<%= baseUrl %>/assets/css/Perso.css" rel="stylesheet" />
        <script src="<%= baseUrl %>/assets/js/sweetAlert.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
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
                <div class="table-container">
                    <h1 class="mb-5">Liste des produits</h1>
                    <table class="table table-bordered table-hover">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Nom du Produit</th>
                                <th>Description</th>
                                <th>Prix</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% for(int i=0;i<liste.size();i++) { %>
                                <tr>
                                    <td><%= liste.elementAt(i).getId() %></td>
                                    <td><%= liste.elementAt(i).getNom_produit() %></td>
                                    <td><%= liste.elementAt(i).getDescription() %></td>
                                    <td><%= liste.elementAt(i).getPrix() %></td>
                                    <td class="action-icons">
                                        <a href="<%= baseUrl %>/update_produit/<%= liste.elementAt(i).getId() %>" title="Modifier" class="me-4">
                                            <i class="bi bi-pencil-fill"></i>
                                        </a>
                                        <a href="<%= baseUrl %>/delete_produit/<%= liste.elementAt(i).getId() %>" title="Supprimer">
                                            <i class="bi bi-trash-fill"></i>
                                        </a>
                                    </td>
                                </tr>
                            <% } %>
                        </tbody>
                    </table>
            </div>
        </div>

        <% if (status != null && !status.isEmpty()) { %>
            <% if("success".equals(status)) { %>
                <script>
                    swal({
                        title: 'Succès',
                        text: 'Produit supprimer avec succès.',
                        icon: 'success',
                        buttons: 'OK'
                    }).then((isOkay) => {
                        if (isOkay) {
                            window.location.href = '<%= baseUrl %>/liste_produits';
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