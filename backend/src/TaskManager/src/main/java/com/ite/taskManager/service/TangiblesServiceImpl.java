package com.ite.taskManager.service;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ite.taskManager.dto.TangiblesDTO;
import com.ite.taskManager.dto.TareaDTO;
import com.ite.taskManager.model.Tangibles;
import com.ite.taskManager.model.Tarea;
import com.ite.taskManager.repository.TangiblesRepository;

@Service
public class TangiblesServiceImpl implements TangiblesService {

   /* @Autowired
    TangiblesRepository tangiblesRepository;

    @Override
    public TangiblesDTO getTangibleById(Long id) {
        Tangibles tangible = tangiblesRepository.findById(id).orElse(null);
        return tangible != null ? TangiblesDTO.Model2DTO(tangible) : null;
    }

    @Override
    public List<TangiblesDTO> listAllTangibles() {
        List<Tangibles> losTangibles = tangiblesRepository.findAll();
        List<TangiblesDTO> losTangiblesDTO = new ArrayList<>();
        
        for (Tangibles t : losTangibles) {
            TangiblesDTO tangibleDTO = TangiblesDTO.Model2DTO(t);
            losTangiblesDTO.add(tangibleDTO);
        }
        
        return losTangiblesDTO;
    }

	@Override
	public List<TangiblesDTO> getTangiblesByUsuarioId(Long usuarioId) {
        List<Tangibles> tangibles = tangiblesRepository.findByUsuarioId(usuarioId);
        return tangibles.stream().map(TangiblesDTO::Model2DTO).collect(Collectors.toList());
	}*/
}
