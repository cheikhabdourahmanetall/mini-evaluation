package com.groupeisi.minievaluation.service;

import com.groupeisi.minievaluation.dao.CoursDao;
import com.groupeisi.minievaluation.dao.ICoursDao;
import com.groupeisi.minievaluation.dto.CoursDto;

import com.groupeisi.minievaluation.entity.CoursEntity;
import com.groupeisi.minievaluation.mapper.CoursMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.List;
import java.util.Optional;

public class CoursService implements ICoursService {
    private static final Logger logger = LoggerFactory.getLogger(CoursService.class);
    private ICoursDao coursDao = new CoursDao();

    @Override
    public Optional<List<CoursDto>> findAll() {
        List<CoursEntity> coursEntities = coursDao.list(new CoursEntity());
        List<CoursDto> coursDtos = CoursMapper.toListCoursDto(coursEntities);

        return Optional.of(coursDtos);
    }

    @Override
    public boolean save(CoursDto coursDto) {
        logger.info("CoursService - Tentative d'enregistrement d'un cours : {}", coursDto);
        CoursEntity productEntity = CoursMapper.toCoursEntity(coursDto);
        return coursDao.save(productEntity);
    }

    public boolean delete(long id) {
        return coursDao.delete(id, new CoursEntity());
    }

    public boolean update(CoursDto coursDto) {
        CoursEntity coursEntity = CoursMapper.toCoursEntity(coursDto);
        return coursDao.update(coursEntity);
    }

    public CoursDto findById(long id) {
        CoursEntity coursEntity = coursDao.get(id, new CoursEntity());
        return CoursMapper.toCoursDto(coursEntity);
    }

}
