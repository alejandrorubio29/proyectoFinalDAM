package com.ite.taskManager.repository;

import java.time.LocalDate;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.ite.taskManager.model.Tarea;
import com.ite.taskManager.model.Usuario;

@Repository
@Transactional
public interface TareaRepository extends JpaRepository<Tarea,Long> {

	List<Tarea> findByUsuario_IdUsuarioAndFecha(Long idUsuario, LocalDate fecha);	
}