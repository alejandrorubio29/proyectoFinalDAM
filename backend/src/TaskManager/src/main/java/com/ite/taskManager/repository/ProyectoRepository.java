package com.ite.taskManager.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.ite.taskManager.model.Proyecto;

@Repository
@Transactional
public interface ProyectoRepository extends JpaRepository<Proyecto, Long> {
    //List<Proyecto> findByUsuarioId(Long usuarioId);
}