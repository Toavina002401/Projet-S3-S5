package source.controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpServletRequest;
import source.connexion.Seconnecter;
import source.model.Clients;
import source.model.Corps;
import source.model.Laboratoires;
import source.model.LesMois;
import source.model.Produits;
import source.model.ProduitsConseil;
import source.model.RechercheClients;
import source.model.RechercheVente;
import source.model.TypeAge;
import source.model.TypeProduits;
import source.model.Vente;


@Controller
public class AdminController {

    @ModelAttribute
    public void addCommonAttributes(Model model){
        String baseUrl = "/Pharmacie";
        model.addAttribute("baseUrl", baseUrl);
    }

    @GetMapping("/")
    public ModelAndView index() throws Exception {
        ModelAndView mav = new ModelAndView("Home");
        return mav;
    }

    /*Produits */

        @GetMapping("/insertion_produits")
        public ModelAndView insertionProduits() throws Exception {
            ModelAndView mav = new ModelAndView("Produits/Insertion");
            return mav;
        }

        @GetMapping("/insertion_produitsConseiller")
        public ModelAndView insertionProduitsConseiller() throws Exception {
            ModelAndView mav = new ModelAndView("Produits/InsertionConseiler");
            Vector<Produits> liste = Produits.getAll();
            Vector<LesMois> lesmois = LesMois.getAll();
            mav.addObject("liste", liste);
            mav.addObject("lesmois", lesmois);
            return mav;
        }

        @GetMapping("/recherche_produits")
        public ModelAndView rechercheProduits() throws Exception {
            ModelAndView mav = new ModelAndView("Produits/Recherche");
            Vector<TypeAge> listeAge = TypeAge.getAll();
            Vector<Corps> listeCorps = Corps.getAll();
            mav.addObject("listeCorps", listeCorps);
            mav.addObject("listeAge", listeAge);
            return mav;
        }

        @GetMapping("/liste_produitsConseiller")
        public ModelAndView rechercheProduitsConseiller() throws Exception {
            ModelAndView mav = new ModelAndView("Produits/RechercheConseiler");
            Vector<LesMois> lesmois = LesMois.getAll();
            mav.addObject("lesmois", lesmois);
            return mav;
        }

        @GetMapping("/liste_produits")
        public ModelAndView listeProduits() throws Exception {
            ModelAndView mav = new ModelAndView("Produits/Liste");
            Vector<Produits> liste = Produits.getAll();
            mav.addObject("liste", liste);
            return mav;
        }

        @PostMapping("/submit_produit")
        public ModelAndView submitProduit(@RequestParam("nomProduit") String nomProduit, @RequestParam("descriptionProduit") String descriptionProduit,  @RequestParam("prixProduit") double prixProduit) throws Exception {
            ModelAndView mav = new ModelAndView("Produits/Insertion");
            try {
                Produits prod = new Produits();
                prod.setNom_produit(nomProduit);
                prod.setDescription(descriptionProduit);
                prod.setPrix(prixProduit);
                prod.save();
                mav.addObject("status", "success");
                mav.addObject("produit", prod);
            } catch (Exception e) {
                mav.addObject("status", "error");
                mav.addObject("message", e.getMessage());
            }
            return mav;
        }

        @GetMapping("/delete_produit/{id}")
        public ModelAndView deleteProduits(@PathVariable("id") int id) throws Exception {
            ModelAndView mav = new ModelAndView("Produits/Liste");
            try {
                Produits.delete(id);
                mav.addObject("status", "success");
            } catch (Exception e) {
                mav.addObject("status", "error");
                mav.addObject("message", e.getMessage());
            }
            Vector<Produits> liste = Produits.getAll();
            mav.addObject("liste", liste);
            return mav;
        }

        @GetMapping("/update_produit/{id}")
        public ModelAndView updateProduits(@PathVariable("id") int id) throws Exception {
            Produits prod = Produits.getById(id);
            ModelAndView mav = new ModelAndView("Produits/Update");
            mav.addObject("produit", prod);
            return mav;
        }

        @PostMapping("/submit_produit_update")
        public ModelAndView submitProduit(@RequestParam("idProduits") int idProduits,@RequestParam("nomProduit") String nomProduit, @RequestParam("descriptionProduit") String descriptionProduit,  @RequestParam("prixProduit") double prixProduit) throws Exception {
            ModelAndView mav = new ModelAndView("Produits/Update");
            try {
                Produits prod = new Produits();
                prod.setId(idProduits);
                prod.setNom_produit(nomProduit);
                prod.setDescription(descriptionProduit);
                prod.setPrix(prixProduit);
                prod.update();
                mav.addObject("status", "success");
                mav.addObject("produit", prod);
            } catch (Exception e) {
                mav.addObject("status", "error");
                mav.addObject("message", e.getMessage());
            }
            return mav;
        }


        @PostMapping("/rechercheMulticritere_produit")
        public ModelAndView rechercheMulticritereProduit(@RequestParam("typeAge") int typeAge, @RequestParam("corps") int corps,  @RequestParam("symptome") String symptome) throws Exception {
            ModelAndView mav = new ModelAndView("Produits/Recherche");
            try {
                Vector<Produits> liste = Produits.getRechercheMulticriter(corps, typeAge, symptome);
                mav.addObject("liste", liste);
            } catch (Exception e) {
                mav.addObject("status", "error");
                mav.addObject("message", e.getMessage());
            }
            Vector<TypeAge> listeAge = TypeAge.getAll();
            Vector<Corps> listeCorps = Corps.getAll();
            mav.addObject("listeCorps", listeCorps);
            mav.addObject("listeAge", listeAge);
            return mav;
        }

        // @PostMapping("/recherche_produitConseiller")
        // public ModelAndView submitProduitConseiller(@RequestParam Map<String, String> allParams) throws Exception {
        //     // Récupérer les mois sélectionnés
        //     List<Integer> selectedMois = allParams.entrySet().stream()
        //             .filter(entry -> entry.getKey().startsWith("mois_") && entry.getValue().equals("on"))
        //             .map(entry -> Integer.parseInt(entry.getKey().replace("mois_", "")))
        //             .toList();

        //     // Récupérer l'année sélectionnée
        //     String annee = allParams.get("annees");
        //     ModelAndView mav = new ModelAndView("Produits/RechercheConseiler");
        //     Vector<LesMois> lesmois = LesMois.getAll();
        //     Vector<ProduitsConseil> liste = ProduitsConseil.getAll(selectedMois, annee);
        //     mav.addObject("lesmois", lesmois);
        //     mav.addObject("liste", liste);
        //     return mav;
        // }

        @PostMapping("/recherche_produitConseiller")
        public ModelAndView submitProduitConseiller(@RequestParam Map<String, String> allParams) throws Exception {
            // Initialiser une liste des mois sélectionnés
            List<Integer> selectedMois = new ArrayList<>();

            // Vérifier si "Tous" est sélectionné
            boolean tousLesMois = allParams.containsKey("mois_-1") && allParams.get("mois_-1").equals("on");

            if (!tousLesMois) {
                // Ajouter uniquement les mois spécifiques
                selectedMois = allParams.entrySet().stream()
                        .filter(entry -> entry.getKey().startsWith("mois_") && entry.getValue().equals("on"))
                        .map(entry -> Integer.parseInt(entry.getKey().replace("mois_", "")))
                        .toList();
            }

            // Récupérer l'année sélectionnée
            String annee = allParams.get("annees");

            // Valider l'année (optionnel, selon vos besoins)
            if (annee == null || annee.equals("-1")) {
                throw new IllegalArgumentException("Veuillez sélectionner une année valide.");
            }

            // Charger les données nécessaires pour la vue
            ModelAndView mav = new ModelAndView("Produits/RechercheConseiler");
            Vector<LesMois> lesmois = LesMois.getAll();
            Vector<ProduitsConseil> liste = ProduitsConseil.getAll(selectedMois, annee);

            // Ajouter les données au modèle
            mav.addObject("lesmois", lesmois);
            mav.addObject("liste", liste);

            return mav;
        }


        @PostMapping("/submit_produitConseiller")
        public ModelAndView submitProduitInsertionConseiller(HttpServletRequest request) throws Exception {
            ModelAndView mav = new ModelAndView("Produits/InsertionConseiler");
            Connection conn = null;
            try {
                // Récupérer les paramètres
                int produitId = Integer.parseInt(request.getParameter("produit"));
                String annees = request.getParameter("annees");
                List<Integer> moisIds = new ArrayList<>();
                
                // Parcourir les paramètres pour détecter les mois sélectionnés
                Enumeration<String> paramNames = request.getParameterNames();
                while (paramNames.hasMoreElements()) {
                    String paramName = paramNames.nextElement();
                    if (paramName.startsWith("mois_")) {
                        int moisId = Integer.parseInt(paramName.substring(5)); // Extraire l'ID après "mois_"
                        moisIds.add(moisId);
                    }
                }

                // Vérifier les entrées
                if (produitId == -1 || annees == null || moisIds.isEmpty()) {
                    throw new Exception("Tous les champs doivent être remplis.");
                }

                // Insertion dans la base de données
                conn = Seconnecter.connect();
                String insertQuery = "INSERT INTO ConseilProduits (id_produits, id_mois, annees) VALUES (?, ?, ?)";
                try (PreparedStatement pstmt = conn.prepareStatement(insertQuery)) {
                    for (int moisId : moisIds) {
                        pstmt.setInt(1, produitId);
                        pstmt.setInt(2, moisId);
                        pstmt.setInt(3, Integer.parseInt(annees));
                        pstmt.addBatch();
                    }
                    pstmt.executeBatch(); // Exécuter toutes les insertions en une seule fois
                }

                // Message de succès
                mav.addObject("status", "success");
                mav.addObject("message", "Les recommandations ont été ajoutées avec succès.");
            } catch (Exception e) {
                mav.addObject("status", "error");
                mav.addObject("message", "Erreur lors de l'ajout des recommandations : " + e.getMessage());
            } finally {
                if (conn != null) {
                    conn.close();
                }
            }
            Vector<Produits> liste = Produits.getAll();
            Vector<LesMois> lesmois = LesMois.getAll();
            mav.addObject("liste", liste);
            mav.addObject("lesmois", lesmois);
            return mav;
        }

        


    /*Fin produits */

    /*Ventes */
        @GetMapping("/insertion_ventes")
        public ModelAndView insertionVentes() throws Exception {
            ModelAndView mav = new ModelAndView("Ventes/Insertion");
            Vector<Produits> listeProduits = Produits.getAll();
            Vector<Laboratoires> listeLabo = Laboratoires.getAll();
            Vector<Clients> listeClients = Clients.getAll();
            mav.addObject("listeLabo", listeLabo);
            mav.addObject("listeProduits", listeProduits);
            mav.addObject("listeClients", listeClients);
            return mav;
        }

        @GetMapping("/liste_ventes")
        public ModelAndView listeVentes() throws Exception {
            ModelAndView mav = new ModelAndView("Ventes/Liste");
            Vector<TypeAge> listeAge = TypeAge.getAll();
            Vector<TypeProduits> listeType = TypeProduits.getAll();
            mav.addObject("listeAge", listeAge);
            mav.addObject("listeType", listeType);
            return mav;
        }

        @PostMapping("/submit_vente")
        public ModelAndView submitVente(@RequestParam("dateVente") String dateVente, @RequestParam("produit") int produit,  @RequestParam("quantite") int quantite,  @RequestParam("labo") int labo,@RequestParam("client") int client) throws Exception {
            ModelAndView mav = new ModelAndView("Ventes/Insertion");
            LocalDateTime dateTime = LocalDateTime.parse(dateVente);
            String formattedDate = dateTime.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
            try {
                Vente vente = new Vente();
                vente.setDate_vente(formattedDate);
                vente.setIdproduits(produit);
                vente.setQuantite(quantite);
                vente.setIdlabo(labo);
                vente.setIdclient(client);
                vente.save();
                mav.addObject("status", "success");
            } catch (Exception e) {
                mav.addObject("status", "error");
                mav.addObject("message", formattedDate+" avec "+ produit + " " + quantite + " " + labo);
            }
            Vector<Produits> listeProduits = Produits.getAll();
            Vector<Laboratoires> listeLabo = Laboratoires.getAll();
            Vector<Clients> listeClients = Clients.getAll();
            mav.addObject("listeLabo", listeLabo);
            mav.addObject("listeProduits", listeProduits);
            mav.addObject("listeClients", listeClients);
            return mav;
        }

        @PostMapping("/rechercheMulticritere_vente")
        public ModelAndView rechercheMulticritereVente(@RequestParam("typeAge") int typeAge, @RequestParam("typeprod") int typeprod) throws Exception {
            ModelAndView mav = new ModelAndView("Ventes/Liste");
            try {
                Vector<RechercheVente> liste = RechercheVente.getRecherche(typeprod, typeAge);
                mav.addObject("liste", liste);
            } catch (Exception e) {
                mav.addObject("status", "error");
                mav.addObject("message", e.getMessage());
            }
            Vector<TypeAge> listeAge = TypeAge.getAll();
            Vector<TypeProduits> listeType = TypeProduits.getAll();
            mav.addObject("listeAge", listeAge);
            mav.addObject("listeType", listeType);
            return mav;
        }

    /*Fin ventes */

    /*Clients */
        @GetMapping("/recherche_clientsVente")
        public ModelAndView rechercheClientsVente() throws Exception {
            ModelAndView mav = new ModelAndView("clients/Recherche");
            return mav;
        }

        @PostMapping("/submit_Clientvente")
        public ModelAndView submitClientvente(@RequestParam("dateVente") String dateVente) throws Exception {
            ModelAndView mav = new ModelAndView("clients/Recherche");
            Vector<RechercheClients> valiny = new Vector<RechercheClients>();
            try {
                valiny = RechercheClients.rechercheClient(dateVente);
                mav.addObject("liste", valiny);
            } catch (Exception e) {
                mav.addObject("status", "error");
                mav.addObject("message", e.getMessage());
            }

            return mav;
        }

        @PostMapping("/submit_Clientvente2")
        public ModelAndView submitClientvente2(@RequestParam("dateVenteDeb") String dateVenteDeb,@RequestParam("dateVenteFin") String dateVenteFin) throws Exception {
            ModelAndView mav = new ModelAndView("clients/Recherche");
            Vector<RechercheClients> valiny = new Vector<RechercheClients>();
            try {
                valiny = RechercheClients.rechercheClient2(dateVenteDeb,dateVenteFin);
                mav.addObject("liste", valiny);
            } catch (Exception e) {
                mav.addObject("status", "error");
                mav.addObject("message", e.getMessage());
            }
            return mav;
        }
    /*Fin Clients */

    /*Maladies */
        @GetMapping("/insertion_maladies")
        public ModelAndView insertionMaladies() throws Exception {
            ModelAndView mav = new ModelAndView("Maladies/Insertion");
            return mav;
        }

        @GetMapping("/liste_maladies")
        public ModelAndView listeMaladies() throws Exception {
            ModelAndView mav = new ModelAndView("Maladies/Liste");
            return mav;
        }

    /*Fin maladies */


    /*Laboratoires */
        @GetMapping("/insertion_laboratoires")
        public ModelAndView insertionLaboratoires() throws Exception {
            ModelAndView mav = new ModelAndView("Laboratoires/Insertion");
            return mav;
        }

        @GetMapping("/liste_laboratoires")
        public ModelAndView listeLaboratoires() throws Exception {
            ModelAndView mav = new ModelAndView("Laboratoires/Liste");
            Vector<Laboratoires> liste = Laboratoires.getAll();
            mav.addObject("liste", liste);
            return mav;
        }

        @PostMapping("/submit_laboratoire")
        public ModelAndView submitLaboratoire(@RequestParam("nomLaboratoire") String nomLaboratoire, @RequestParam("adresse") String adresse) throws Exception {
            ModelAndView mav = new ModelAndView("Laboratoires/Insertion");
            try {
                Laboratoires labo = new Laboratoires();
                labo.setNom_laboratoire(nomLaboratoire);
                labo.setAdresse(adresse);
                labo.save();
                mav.addObject("status", "success");
                mav.addObject("laboratoire", labo);
            } catch (Exception e) {
                mav.addObject("status", "error");
                mav.addObject("message", "misy "+e.getMessage());
            }
            return mav;
        }

        @GetMapping("/delete_laboratoire/{id}")
        public ModelAndView deleteLaboratoires(@PathVariable("id") int id) throws Exception {
            ModelAndView mav = new ModelAndView("Laboratoires/Liste");
            try {
                Laboratoires.delete(id);
                mav.addObject("status", "success");
            } catch (Exception e) {
                mav.addObject("status", "error");
                mav.addObject("message", e.getMessage());
            }
            Vector<Laboratoires> liste = Laboratoires.getAll();
            mav.addObject("liste", liste);
            return mav;
        }

        @GetMapping("/update_laboratoire/{id}")
        public ModelAndView updateLaboratoires(@PathVariable("id") int id) throws Exception {
            Laboratoires labo = Laboratoires.getById(id);
            ModelAndView mav = new ModelAndView("Laboratoires/Update");
            mav.addObject("laboratoire", labo);
            return mav;
        }

        @PostMapping("/submit_laboratoire_update")
        public ModelAndView submitLaboratoire(@RequestParam("idLaboratoire") int idLaboratoire,@RequestParam("nomLaboratoire") String nomLaboratoire, @RequestParam("adresse") String adresse) throws Exception {
            ModelAndView mav = new ModelAndView("Laboratoires/Update");
            try {
                Laboratoires labo = new Laboratoires();
                labo.setId(idLaboratoire);
                labo.setNom_laboratoire(nomLaboratoire);
                labo.setAdresse(adresse);
                labo.update();
                mav.addObject("status", "success");
                mav.addObject("laboratoire", labo);
            } catch (Exception e) {
                mav.addObject("status", "error");
                mav.addObject("message", e.getMessage());
            }
            return mav;
        }

    /*Fin laboratoires */


    /*Stocks */
        @GetMapping("/stock/{id}/{date}")
        public ModelAndView getStock(@PathVariable("id") int id, @PathVariable("date") String date) {
            ModelAndView mav = new ModelAndView("Stocks/Index");
            try {

            } catch (Exception e) {
                e.printStackTrace();
            }
            return mav;
        }
    /*Fin stocks */
}