package com.ite.taskManager.dto;

import java.io.Serializable;
import java.sql.Date;

import com.ite.taskManager.model.Tarea;
import com.ite.taskManager.model.Usuario;
import com.ite.taskManager.model.Tangibles;
import lombok.Data;

@Data
public class TareaDTO implements Serializable {

    private static final long serialVersionUID = 18L;

    private Long idTarea;
    private String descripcion;
    private Date fecha;
    private Double horasPrevistas;
    private Double horasEjecutadas;
    private Boolean completada;
    private Boolean reunion;
    //private Usuario usuario;
    //private Tangibles tangible;
    
    private Long usuarioId;  // Solo el ID del usuario
    private Long tangibleId; // Solo el ID del tangible
    
    private String tangibleDescripcion; 
    private String proyectoDescripcion;

    // De Modelo a DTO
    public static TareaDTO Model2DTO(Tarea tarea) {
        TareaDTO tareaDTO = new TareaDTO();
        tareaDTO.idTarea = tarea.getIdTarea();
        tareaDTO.descripcion = tarea.getDescripcion();
        tareaDTO.fecha = tarea.getFecha();
        tareaDTO.horasPrevistas = tarea.getHorasPrevistas();
        tareaDTO.horasEjecutadas = tarea.getHorasEjecutadas();
        tareaDTO.completada = tarea.getCompletada();
        tareaDTO.reunion = tarea.getReunion();
        //tareaDTO.usuario = tarea.getUsuario();
        //tareaDTO.tangible = tarea.getTangible();
        tareaDTO.usuarioId = tarea.getUsuario().getIdUsuario();
        tareaDTO.tangibleId = tarea.getTangible().getIdTangible();
        tareaDTO.tangibleDescripcion = tarea.getTangible().getDescripcion(); 
        //tareaDTO.proyectoDescripcion = tarea.getTangible().getProyecto().getDescripcion();
        
        
        return tareaDTO;
    }

    // De DTO a Modelo
    public static Tarea DTO2Model(TareaDTO tareaDTO) {
        Tarea tarea = new Tarea();
        tarea.setIdTarea(tareaDTO.getIdTarea());
        tarea.setDescripcion(tareaDTO.getDescripcion());
        tarea.setFecha(tareaDTO.getFecha());
        tarea.setHorasPrevistas(tareaDTO.getHorasPrevistas());
        tarea.setHorasEjecutadas(tareaDTO.getHorasEjecutadas());
        tarea.setCompletada(tareaDTO.getCompletada());
        tarea.setReunion(tareaDTO.getReunion());
        //tarea.setUsuario(tareaDTO.getUsuario());
        //tarea.setTangible(tareaDTO.getTangible());
        return tarea;
    }
}
