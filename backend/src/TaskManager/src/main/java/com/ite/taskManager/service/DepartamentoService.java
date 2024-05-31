package com.ite.taskManager.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ite.taskManager.dto.DepartamentoDTO;

@Service
public interface DepartamentoService {

	
	// Métodos que implementará el servicio
	DepartamentoDTO getDepartamentoById(Long id);
	List<DepartamentoDTO> listAllDepartamentos();	
	
}
