package com.ite.taskManager.service;

import java.time.LocalDate;
import java.util.List;

import com.ite.taskManager.dto.TareaDTO;
import com.ite.taskManager.model.Usuario;

public interface TareaService {
    TareaDTO getTareaById(Long id);
    List<TareaDTO> listAllTareas();
    List<TareaDTO> findByUsuario_IdAndFecha(Long idUsuario, LocalDate fecha);
	TareaDTO save(TareaDTO tareaDTO);
}
