package com.groupeisi.minievaluation.controller;

import com.groupeisi.minievaluation.dto.CoursDto;
import com.groupeisi.minievaluation.service.CoursService;
import com.groupeisi.minievaluation.service.ICoursService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Controller
public class CoursController {
    private static final Logger logger = LoggerFactory.getLogger(CoursController.class);
    private final ICoursService coursService = new CoursService();


    @GetMapping(name = "cours", value ="/")
    public String showCours(Model model) {

        try {
            Optional<List<CoursDto>> cours = coursService.findAll();
            if (cours.isPresent()) {
                logger.info("Liste des cours récupérée avec succès");
                model.addAttribute("coursList", cours.get());
            } else {
                logger.info("Aucun cours trouvé");
                model.addAttribute("coursList", new ArrayList<>());
            }
        } catch (Exception e) {
            logger.error("Erreur lors de la récupération des produits", e);
        }

        return "cours";
    }

    @PostMapping("/cours/delete")
    public String deleteCours(@RequestParam("id") long id) {
        try {
            boolean isDeleted = coursService.delete(id);
            if (isDeleted) {
                logger.info("Cours supprimé avec succès.");
            } else {
                logger.warn("Échec de la suppression du cours.");
            }
        } catch (Exception e) {
            logger.error("Erreur lors de la suppression du cours", e);
        }
        return "redirect:/"; // Redirection vers la liste des cours
    }


    @GetMapping("/cours/edit")
    public String showEditCoursForm(@RequestParam("id") long id, Model model) {
        CoursDto cours = coursService.findById(id);
        if (cours != null) {
            model.addAttribute("cours", cours);
        } else {
            return "redirect:/"; // Rediriger si le cours n'existe pas
        }
        return "editCours"; // Nom de la page JSP de modification
    }

    @PostMapping("/cours/update")
    public String updateCours(
            @RequestParam("id") long id,
            @RequestParam("matiere") String matiere,
            @RequestParam("professeur") String professeur,
            @RequestParam("classe") String classe) {

        CoursDto coursDto = new CoursDto();
        coursDto.setId(id);
        coursDto.setMatiere(matiere);
        coursDto.setProfesseur(professeur);
        coursDto.setClasse(classe);

        try {
            boolean isUpdated = coursService.update(coursDto);
            if (isUpdated) {
                logger.info("Cours mis à jour avec succès.");
            } else {
                logger.warn("Échec de la mise à jour du cours.");
            }
        } catch (Exception e) {
            logger.error("Erreur lors de la mise à jour du cours", e);
        }
        return "redirect:/";
    }


    @PostMapping("/cours")
    public String saveProduct(
            @RequestParam("matiere") String matiere,
            @RequestParam("professeur") String professeur,
            @RequestParam("classe") String classe)
    {
        CoursDto coursDto = new CoursDto();
        coursDto.setMatiere(matiere);
        coursDto.setProfesseur(professeur);
        coursDto.setClasse(classe);

        try {
            boolean coursSaved = coursService.save(coursDto);
            if (coursSaved) {
                logger.info("Cours enregistré avec succès");
            } else {
                logger.warn("Échec de l'enregistrement du cours");
            }
        } catch (Exception e) {
            logger.error("Erreur lors de l'enregistrement du cours", e);
        }
        return "redirect:/";
    }
}
