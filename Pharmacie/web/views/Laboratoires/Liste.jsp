<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*,source.model.*" %>
<%
    String baseUrl = (String)request.getAttribute("baseUrl");
    Vector<Laboratoires> liste = (Vector<Laboratoires>)request.getAttribute("liste");
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
        <title>Liste des laboratoires</title>
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
                    <h1 class="mb-5">Liste des laboratoires</h1>
                    <table class="table table-bordered table-hover">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Nom du Laboratoire</th>
                                <th>Adresse</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% for(int i=0;i<liste.size();i++) { %>
                                <tr>
                                    <td><%= liste.elementAt(i).getId() %></td>
                                    <td><%= liste.elementAt(i).getNom_laboratoire() %></td>
                                    <td><%= liste.elementAt(i).getAdresse() %></td>
                                    <td class="action-icons">
                                        <a href="<%= baseUrl %>/update_laboratoire/<%= liste.elementAt(i).getId() %>" title="Modifier" class="me-4">
                                            <i class="bi bi-pencil-fill"></i>
                                        </a>
                                        <a href="<%= baseUrl %>/delete_laboratoire/<%= liste.elementAt(i).getId() %>" title="Supprimer" class="me-4"> 
                                            <i class="bi bi-trash-fill"></i>
                                        </a>
                                        <a href="#" class="stock-link" data-id="<%= liste.elementAt(i).getId() %>" data-nom="<%= liste.elementAt(i).getNom_laboratoire() %>"  title="Stock">
                                            <i class="bi bi-bag"></i>
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
                        text: 'Laboratoire supprimer avec succès.',
                        icon: 'success',
                        buttons: 'OK'
                    }).then((isOkay) => {
                        if (isOkay) {
                            window.location.href = '<%= baseUrl %>/liste_laboratoires';
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

        <script>
            document.querySelectorAll('.stock-link').forEach(link => {
                link.addEventListener('click', function(event) {
                    event.preventDefault(); // Empêche le comportement par défaut du lien
                    const laboratoireId = this.getAttribute('data-id');
                    const nom = this.getAttribute('data-nom');
                    const phrase = 'Afficher tous les produits disponibles dans '+nom+' à une date spécifiée :';
                    console.log(phrase);
                    swal({
                        title: 'Gestion du Stock',
                        text: phrase,
                        content: {
                            element: "input",
                            attributes: {
                                placeholder: "Date et Heure",
                                type: "datetime-local",
                                name: "dateHeure"
                            },
                        },
                        buttons: true,
                        dangerMode: true,
                    }).then((value) => {
                        if (value) {
                            let date = new Date(value); // Crée un objet Date à partir de la valeur
                            let year = date.getFullYear();
                            let month = String(date.getMonth() + 1).padStart(2, '0'); // Ajouter un zéro devant pour les mois < 10
                            let day = String(date.getDate()).padStart(2, '0');
                            let hours = String(date.getHours()).padStart(2, '0');
                            let minutes = String(date.getMinutes()).padStart(2, '0');
                            let seconds = '00'; // Vous pouvez définir les secondes à 00 ou les récupérer si nécessaire
                            // Formatage de la nouvelle chaîne de date et heure
                            let formattedDate = year+'-'+month+'-'+day+'%20'+hours+':'+minutes+':'+seconds;
                            let lien = '<%= baseUrl %>/stock/'+laboratoireId+'/'+formattedDate;
                            window.location.href = lien;
                        }
                    });
                });
            });
        </script>

        <script src="<%= baseUrl %>/assets/js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>