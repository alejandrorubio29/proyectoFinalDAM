package com.ite.taskManager.dto;

import java.io.Serializable;
import com.ite.taskManager.model.Proyecto;
import com.ite.taskManager.model.Usuario;
import lombok.Data;

@Data
public class ProyectoDTO implements Serializable {

    private static final long serialVersionUID = 1L;

    private Long idProyecto;
    private String nombre;
    private String descripcion;
    private Usuario usuario;

    // De Modelo a DTO
    public static ProyectoDTO Model2DTO(Proyecto proyecto) {
        ProyectoDTO proyectoDTO = new ProyectoDTO();
        proyectoDTO.idProyecto = proyecto.getIdProyecto();
        proyectoDTO.nombre = proyecto.getNombre();
        proyectoDTO.descripcion = proyecto.getDescripcion();
        proyectoDTO.usuario = proyecto.getUsuario();
        return proyectoDTO;
    }

    // De DTO a Modelo
    public static Proyecto DTO2Model(ProyectoDTO proyectoDTO) {
        Proyecto proyecto = new Proyecto();
        proyecto.setIdProyecto(proyectoDTO.getIdProyecto());
        proyecto.setNombre(proyectoDTO.getNombre());
        proyecto.setDescripcion(proyectoDTO.getDescripcion());
        proyecto.setUsuario(proyectoDTO.getUsuario());
        return proyecto;
    }
}
