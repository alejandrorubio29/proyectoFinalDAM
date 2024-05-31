package com.ite.taskManager.controllers;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ite.taskManager.dto.ProyectoDTO;
import com.ite.taskManager.dto.TangiblesDTO;
import com.ite.taskManager.dto.TareaDTO;
import com.ite.taskManager.service.ProyectoService;
import com.ite.taskManager.service.TangiblesService;
import com.ite.taskManager.service.TareaService;

@RestController
public class TareaController {	

	@Autowired
	private TareaService tareaService;

	@GetMapping("/tareas")
	public List<TareaDTO> getTareas(@RequestParam Long idUsuario, @RequestParam String fecha) {

		/// Comprobacion recepcion conexion api ////

		System.out.println("Recibida petición para obtener tareas");
		System.out.println("idUsuario: " + idUsuario);
		System.out.println("fecha: " + fecha);

		LocalDate localDate = LocalDate.parse(fecha);
		return tareaService.findByUsuario_IdAndFecha(idUsuario, localDate);
	}

	 @PostMapping("/tareas")
	    public TareaDTO createTarea(@RequestBody TareaDTO tareaDTO) {
	        System.out.println("Recibida petición para crear una tarea");
	        return tareaService.save(tareaDTO);
	    }

	
}
