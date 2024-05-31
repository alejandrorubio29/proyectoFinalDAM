package com.ite.taskManager.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.ite.taskManager.model.Departamento;


@Repository
@Transactional
public interface DepartamentoRepository extends JpaRepository<Departamento,Long> {

	
	
}

