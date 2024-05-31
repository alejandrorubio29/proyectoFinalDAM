package com.ite.taskManager.service;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ite.taskManager.dto.ProyectoDTO;
import com.ite.taskManager.dto.TangiblesDTO;
import com.ite.taskManager.model.Proyecto;
import com.ite.taskManager.model.Tangibles;
import com.ite.taskManager.repository.ProyectoRepository;

@Service
public class ProyectoServiceImpl implements ProyectoService {

	/*@Autowired
    private ProyectoRepository proyectoRepository;

    
	public List<ProyectoDTO> getProyectosByUsuarioId(Long usuarioId) {
        List<Proyecto> proyectos = proyectoRepository.findByUsuarioId(usuarioId);
        return proyectos.stream().map(ProyectoDTO::Model2DTO).collect(Collectors.toList());
	}


	@Override
	public ProyectoDTO getProyectoById(Long id) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public List<ProyectoDTO> listAllProyectos() {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public List<ProyectoDTO> getProyectoByUsuarioId(Long usuarioId) {
		// TODO Auto-generated method stub
		return null;
	}*/

	
	
}
