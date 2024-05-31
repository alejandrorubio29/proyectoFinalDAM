package com.ite.taskManager.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.ite.taskManager.model.Tangibles;

@Repository
@Transactional
public interface TangiblesRepository extends JpaRepository<Tangibles,Long> {

   //List<Tangibles> findByUsuarioId(Long usuarioId);
}




