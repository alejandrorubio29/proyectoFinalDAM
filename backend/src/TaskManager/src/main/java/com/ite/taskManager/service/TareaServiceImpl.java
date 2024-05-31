package com.ite.taskManager.service;

import java.time.LocalDate;
import java.util.ArrayList;
import java.sql.Date;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ite.taskManager.dto.TareaDTO;
import com.ite.taskManager.model.Tangibles;
import com.ite.taskManager.model.Tarea;
import com.ite.taskManager.model.Usuario;
import com.ite.taskManager.repository.TangiblesRepository;
import com.ite.taskManager.repository.TareaRepository;
import com.ite.taskManager.repository.UsuarioRepository;

@Service
public class TareaServiceImpl implements TareaService {

	@Autowired
	TareaRepository tareaRepository;

	@Autowired
	UsuarioRepository usuarioRepository;

	@Autowired
	TangiblesRepository tangiblesRepository;

	@Override
	public TareaDTO getTareaById(Long id) {
		Tarea tarea = tareaRepository.findById(id).orElse(null);
		return tarea != null ? TareaDTO.Model2DTO(tarea) : null;
	}

	@Override
	public List<TareaDTO> listAllTareas() {
		List<Tarea> lasTareas = tareaRepository.findAll();
		List<TareaDTO> lasTareasDTO = new ArrayList<>();

		for (Tarea t : lasTareas) {
			TareaDTO tareaDTO = TareaDTO.Model2DTO(t);
			lasTareasDTO.add(tareaDTO);
		}

		return lasTareasDTO;
	}

	@Override
	public List<TareaDTO> findByUsuario_IdAndFecha(Long idUsuario, LocalDate fecha) {
		List<Tarea> tareas = tareaRepository.findByUsuario_IdUsuarioAndFecha(idUsuario, fecha);
		return tareas.stream().map(TareaDTO::Model2DTO).collect(Collectors.toList());
	}

	@Override
	public TareaDTO save(TareaDTO tareaDTO) {
		// Convertir TareaDTO a entidad Tarea
		Tarea tarea = new Tarea();
		tarea.setDescripcion(tareaDTO.getDescripcion());
		
		//tarea.setFecha(tareaDTO.getFecha());
				
		 // Verificar si se proporcionó una fecha en la solicitud
	    
	        // Si no se proporciona una fecha, establecer la fecha actual
	    	
	        tarea.setFecha(Date.valueOf(LocalDate.now()));
	    
		
		tarea.setHorasPrevistas(tareaDTO.getHorasPrevistas());
		tarea.setHorasEjecutadas(tareaDTO.getHorasEjecutadas());
		tarea.setCompletada(tareaDTO.getCompletada());
		tarea.setReunion(tareaDTO.getReunion());

		// Verificar si se proporcionó un ID de usuario en la solicitud
		
		if (tareaDTO.getUsuarioId() != null) {
			
			// Buscar y establecer Usuario usando el ID proporcionado
			
			Usuario usuario = usuarioRepository.findById(tareaDTO.getUsuarioId()).orElse(null);
			tarea.setUsuario(usuario);
		} else {
			
			// Si no se proporciona un ID de usuario, asignar al usuario con ID = 2 (Laura) por defecto
			
			Usuario usuarioDefault = usuarioRepository.findById(2L).orElse(null);
			tarea.setUsuario(usuarioDefault);
		}
		
		// Verificar si se proporcionó un ID de tangible en la solicitud
		
		if (tareaDTO.getTangibleId() != null) {
			
			// Buscar y establecer Tangible usando el ID proporcionado
			
			Tangibles tangible = tangiblesRepository.findById(tareaDTO.getTangibleId()).orElse(null);
			tarea.setTangible(tangible);
		} else {
			
			// Si no se proporciona un ID de tangible, asignar al tangible con ID 1 por defecto
			
			Tangibles tangibleDefault = tangiblesRepository.findById(1L).orElse(null);
			tarea.setTangible(tangibleDefault);
		}
		
		// Guardar la entidad Tarea
		
		Tarea savedTarea = tareaRepository.save(tarea);

		// Convertir la entidad guardada a TareaDTO y devolverla
		
		TareaDTO savedTareaDTO = TareaDTO.Model2DTO(savedTarea);

		return savedTareaDTO;
	}

}
