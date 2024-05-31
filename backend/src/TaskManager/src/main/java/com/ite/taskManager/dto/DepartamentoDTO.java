package com.ite.taskManager.dto;

import java.io.Serializable;
import java.util.List;

import com.ite.taskManager.model.Departamento;
import com.ite.taskManager.model.Usuario;

import lombok.Data;

@Data
public class DepartamentoDTO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 16L;


	private Long idDepartamento;
	private String nombre;
	private List<Usuario> usuarios;

	// De Modelo a DTO

	public static DepartamentoDTO Model2DTO(Departamento departamento) {

		// Creacion departamento DTO vacío

		DepartamentoDTO departamentoDTO = new DepartamentoDTO();

		// Rellenar con valores de Departamento

		departamentoDTO.idDepartamento = departamento.getIdDepartamento();
		departamentoDTO.nombre = departamento.getNombre();
		departamentoDTO.usuarios = departamento.getUsuarios();

		return departamentoDTO;
	}

	// De DTO a Modelo

	public static Departamento DTO2Model(DepartamentoDTO departamentoDTO) {

		// Creacion departamento vacío

		Departamento departamento = new Departamento();

		// Rellenar con valores de DepartamentoDTO

		departamento.setIdDepartamento(departamentoDTO.getIdDepartamento());
		departamento.setNombre(departamentoDTO.getNombre());
		departamento.setUsuarios(departamentoDTO.getUsuarios());


		return departamento;
	}

}
