package com.ite.taskManager.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ite.taskManager.dto.DepartamentoDTO;
import com.ite.taskManager.model.Departamento;
import com.ite.taskManager.repository.DepartamentoRepository;

@Service
public class DepartamentoServiceImpl implements DepartamentoService{
	
	@Autowired
	DepartamentoRepository departamentoRepository; // Objeto para recuperar la información
	
	
	@Override
	public DepartamentoDTO getDepartamentoById(Long id) {
		

		return null;
	}

	@Override
	public List<DepartamentoDTO> listAllDepartamentos() {
		List<Departamento> losDepartamentos = departamentoRepository.findAll();
		List<DepartamentoDTO> losDepartamentosDTO = new ArrayList<>(); //Por ahora vacío
		
		
		for (Departamento d: losDepartamentos) {
		
			DepartamentoDTO departamentoDTO = DepartamentoDTO.Model2DTO(d); // Es estática, se llama desde la clase
			
			losDepartamentosDTO.add(departamentoDTO);
			
		}
			
			
		return losDepartamentosDTO;
	}

}
