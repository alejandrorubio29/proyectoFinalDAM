package com.ite.taskManager.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ite.taskManager.dto.ProyectoDTO;
import com.ite.taskManager.service.ProyectoService;

@RestController
public class ProyectoController {
	
	/*@Autowired
	private ProyectoService proyectoService;
	
	@GetMapping("/proyectos")
	public List<ProyectoDTO> getProyectos(@RequestParam Long usuarioId) {
		return proyectoService.getProyectoByUsuarioId(usuarioId);
	}*/
	
}
