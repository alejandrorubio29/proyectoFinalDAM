package com.ite.taskManager.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ite.taskManager.dto.UsuarioDTO;
import com.ite.taskManager.model.Usuario;
import com.ite.taskManager.repository.UsuarioRepository;

@Service
public class UsuarioServiceImpl implements UsuarioService {

    @Autowired
    UsuarioRepository usuarioRepository;

    @Override
    public UsuarioDTO getUsuarioById(Long id) {
        Usuario usuario = usuarioRepository.findById(id).orElse(null);
        return usuario != null ? UsuarioDTO.Model2DTO(usuario) : null;
    }

    @Override
    public List<UsuarioDTO> listAllUsuarios() {
        List<Usuario> losUsuarios = usuarioRepository.findAll();
        List<UsuarioDTO> losUsuariosDTO = new ArrayList<>();
        
        for (Usuario u : losUsuarios) {
            UsuarioDTO usuarioDTO = UsuarioDTO.Model2DTO(u);
            losUsuariosDTO.add(usuarioDTO);
        }
        
        return losUsuariosDTO;
    }
}
