package com.ite.taskManager.service;

import java.util.List;

import com.ite.taskManager.dto.UsuarioDTO;

public interface UsuarioService {
    UsuarioDTO getUsuarioById(Long id);
    List<UsuarioDTO> listAllUsuarios();
}
