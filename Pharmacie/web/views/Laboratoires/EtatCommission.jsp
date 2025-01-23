<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*,source.model.*" %>
<%
    String baseUrl = (String)request.getAttribute("baseUrl");
    String status = (String)request.getAttribute("status");
    String message = (String)request.getAttribute("message");
    Vector<Vendeurs> listeMasculin = (Vector<Vendeurs>)request.getAttribute("listeMasculin");
    Vector<Vendeurs> listeFeminin = (Vector<Vendeurs>)request.getAttribute("listeFeminin");
%>
<!DOCTYPE html>
<html lang="en">    
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Etats des laboratoires</title>
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
                    <h3 class="form-title">Etat pour une periode données:</h3>
                    <form action="<%= baseUrl %>/submit_EtatVendeurs" method="POST">
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
                        <!-- Limite de commission -->
                        <div class="mb-3">
                            <label for="limite" class="form-label">Limite du commission</label>
                            <input type="number" class="form-control" id="limite" name="limite" required>
                        </div>
                        <!-- Bouton Submit -->
                        <div class="text-center">
                            <button type="submit" class="btn btn-submit w-100">Recherche</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>


        <!-- Page content -->
        <div class="container">
            <div class="text-center mt-5">
                <div class="table-container">
                    <h3 class="mb-5">État pour les Masculin qui ont effectué des ventes avec ces commissions :</h3>
                    <table class="table table-bordered table-hover">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Nom</th>
                                <th>Adresse</th>
                                <th>Prix Vente</th>
                                <th>Commissions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% 
                                double totalPrixVenteMasculin = 0;
                                double totalCommissionMasculin = 0;

                                if (listeMasculin == null || listeMasculin.isEmpty() || listeMasculin.size() == 0) { 
                            %>
                                <tr>
                                    <td colspan="5">Aucune recherche trouvée pour cette période</td>
                                </tr>
                            <% 
                                } else { 
                                    for (int i = 0; i < listeMasculin.size(); i++) {
                                        totalPrixVenteMasculin += listeMasculin.elementAt(i).getTotalVente();
                                        totalCommissionMasculin += listeMasculin.elementAt(i).getTotalCommision();
                            %>
                                <tr>
                                    <td><%= listeMasculin.elementAt(i).getId() %></td>
                                    <td><%= listeMasculin.elementAt(i).getNom() %></td>
                                    <td><%= listeMasculin.elementAt(i).getAdresse() %></td>
                                    <td><%= listeMasculin.elementAt(i).getTotalVente() %></td>
                                    <td><%= listeMasculin.elementAt(i).getTotalCommision() %></td>
                                </tr>
                            <% 
                                    } 
                                } 
                            %>
                            <!-- Ligne des totaux -->
                            <tr>
                                <td colspan="3"><strong>Total</strong></td>
                                <td><%= totalPrixVenteMasculin %></td>
                                <td><%= totalCommissionMasculin %></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>

            <div class="text-center mt-5">
                <div class="table-container">
                    <h3 class="mb-5">État pour les Féminin qui ont effectué des ventes avec ces commissions :</h3>
                    <table class="table table-bordered table-hover">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Nom</th>
                                <th>Adresse</th>
                                <th>Prix Vente</th>
                                <th>Commissions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% 
                                double totalPrixVenteFeminin = 0;
                                double totalCommissionFeminin = 0;

                                if (listeFeminin == null || listeFeminin.isEmpty() || listeFeminin.size() == 0) { 
                            %>
                                <tr>
                                    <td colspan="5">Aucune recherche trouvée pour cette période</td>
                                </tr>
                            <% 
                                } else { 
                                    for (int i = 0; i < listeFeminin.size(); i++) {
                                        totalPrixVenteFeminin += listeFeminin.elementAt(i).getTotalVente();
                                        totalCommissionFeminin += listeFeminin.elementAt(i).getTotalCommision();
                            %>
                                <tr>
                                    <td><%= listeFeminin.elementAt(i).getId() %></td>
                                    <td><%= listeFeminin.elementAt(i).getNom() %></td>
                                    <td><%= listeFeminin.elementAt(i).getAdresse() %></td>
                                    <td><%= listeFeminin.elementAt(i).getTotalVente() %></td>
                                    <td><%= listeFeminin.elementAt(i).getTotalCommision() %></td>
                                </tr>
                            <% 
                                    } 
                                } 
                            %>
                            <!-- Ligne des totaux -->
                            <tr>
                                <td colspan="3"><strong>Total</strong></td>
                                <td><%= totalPrixVenteFeminin %></td>
                                <td><%= totalCommissionFeminin %></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
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



