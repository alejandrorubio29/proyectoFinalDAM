package com.ite.taskManager.dto;

import java.io.Serializable;
import com.ite.taskManager.model.Tangibles;
import com.ite.taskManager.model.Proyecto;
import lombok.Data;

@Data
public class TangiblesDTO implements Serializable {

    private static final long serialVersionUID = 19L;

    private Long idTangible;
    private String descripcion;
    private Integer cantidad;
    private Proyecto proyecto;

    // De Modelo a DTO
    public static TangiblesDTO Model2DTO(Tangibles tangible) {
        TangiblesDTO tangibleDTO = new TangiblesDTO();
        tangibleDTO.idTangible = tangible.getIdTangible();
        tangibleDTO.descripcion = tangible.getDescripcion();
        tangibleDTO.proyecto = tangible.getProyecto();
        return tangibleDTO;
    }

    // De DTO a Modelo
    public static Tangibles DTO2Model(TangiblesDTO tangibleDTO) {
        Tangibles tangible = new Tangibles();
        tangible.setIdTangible(tangibleDTO.getIdTangible());
        tangible.setDescripcion(tangibleDTO.getDescripcion());
        tangible.setProyecto(tangibleDTO.getProyecto());
        return tangible;
    }
}
