<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*,source.model.*" %>
<%
  String baseUrl = (String)request.getAttribute("baseUrl");
  String status = (String)request.getAttribute("status");
  String message = (String)request.getAttribute("message");
  Vector<Genre> listeGenre = (Vector<Genre>)request.getAttribute("listeGenre");
%>
<!DOCTYPE html>
<html lang="en">    
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Insertion d'une laboratoire</title>
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
                    <h2 class="form-title">Ajouter une Laboratoire</h2>
                    <form action="<%= baseUrl %>/submit_laboratoire" method="POST">
                        <!-- Champ Nom du laboratoire -->
                        <div class="mb-3">
                            <label for="nomProduit" class="form-label">Nom du laboratoire</label>
                            <input type="text" class="form-control" id="nomLaboratoire" name="nomLaboratoire" placeholder="Entrez le nom du laboratoire" required>
                        </div>
                        <!-- Champ adresse -->
                        <div class="mb-3">
                            <label for="nomProduit" class="form-label">Adresse</label>
                            <input type="text" class="form-control" id="adresse" name="adresse" placeholder="Entrez l'adresse" required>
                        </div>
                        <!-- Genre -->
                        <div class="mb-3">
                            <label for="idGenre" class="form-label">Genre:</label>
                            <select name="idGenre" id="idGenre" class="form-control">
                                <option selected disabled></option>
                                <% for(int i=0;i<listeGenre.size();i++){ %>
                                    <option value="<%= listeGenre.elementAt(i).getId() %>"><%= listeGenre.elementAt(i).getSexe() %></option>
                                <% } %>
                            </select>
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
                        text: 'Laboratoire ajouté avec succès.',
                        icon: 'success',
                        buttons: 'OK'
                    }).then((isOkay) => {
                        if (isOkay) {
                            window.location.href = '<%= baseUrl %>/insertion_laboratoires';
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