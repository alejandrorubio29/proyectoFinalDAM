package com.ite.taskManager.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ite.taskManager.dto.TangiblesDTO;
import com.ite.taskManager.service.TangiblesService;

@RestController
public class TangiblesController {
	
	
	/*@Autowired
	private TangiblesService tangibleService;
	
	
	@GetMapping("/tangibles")
	public List<TangiblesDTO> getTangibles(@RequestParam Long usuarioId) {
		return tangibleService.getTangiblesByUsuarioId(usuarioId);
	}*/
	
	
}
