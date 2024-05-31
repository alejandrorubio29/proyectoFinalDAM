package com.ite.taskManager.dto;

import java.io.Serializable;
import com.ite.taskManager.model.Usuario;
import com.ite.taskManager.model.Departamento;
import lombok.Data;

@Data
public class UsuarioDTO implements Serializable {

    private static final long serialVersionUID = 17L;

    private Long idUsuario;
    private String nombre;
    private String rol;
    private Departamento departamento;

    // De Modelo a DTO
    
    public static UsuarioDTO Model2DTO(Usuario usuario) {
        UsuarioDTO usuarioDTO = new UsuarioDTO();
        usuarioDTO.idUsuario = usuario.getIdUsuario();
        usuarioDTO.nombre = usuario.getNombre();
        usuarioDTO.rol = usuario.getRol();
        usuarioDTO.departamento = usuario.getDepartamento();
        return usuarioDTO;
    }

    // De DTO a Modelo
    
    public static Usuario DTO2Model(UsuarioDTO usuarioDTO) {
        Usuario usuario = new Usuario();
        usuario.setIdUsuario(usuarioDTO.getIdUsuario());
        usuario.setNombre(usuarioDTO.getNombre());
        usuario.setRol(usuarioDTO.getRol());
        usuario.setDepartamento(usuarioDTO.getDepartamento());
        return usuario;
    }
}
