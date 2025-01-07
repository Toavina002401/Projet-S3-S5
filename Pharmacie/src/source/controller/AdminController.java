package source.controller;

import java.util.Vector;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import source.model.Laboratoires;
import source.model.Produits;


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

    /*Fin produits */


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