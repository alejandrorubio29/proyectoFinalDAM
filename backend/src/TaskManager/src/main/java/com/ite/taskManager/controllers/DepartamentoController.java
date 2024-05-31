package com.ite.taskManager.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ite.taskManager.dto.DepartamentoDTO;
import com.ite.taskManager.service.DepartamentoService;

@RestController
public class DepartamentoController {
		
	@Autowired
	private DepartamentoService departamentoService;
	
	
	@GetMapping("/")
	public String index() {
		return "Controlador de Departamentos";
	}

	@GetMapping("/departamentos")
	public List<DepartamentoDTO> getAll() {
		
		List<DepartamentoDTO> losDepartamentos = departamentoService.listAllDepartamentos();
		return losDepartamentos;
		
		
	}
	
	
	
}
