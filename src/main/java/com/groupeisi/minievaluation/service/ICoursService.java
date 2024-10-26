package com.groupeisi.minievaluation.service;

import com.groupeisi.minievaluation.dto.CoursDto;

import java.util.List;
import java.util.Optional;

public interface ICoursService {

    Optional<List<CoursDto>> findAll();

    boolean save(CoursDto coursDto);

    boolean delete(long id); // Pour supprimer un cours par ID

    boolean update(CoursDto coursDto); // Pour mettre à jour un cours

    CoursDto findById(long id); // Pour récupérer un cours par ID
}

