
package com.ite.taskManager.model;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.Data;
import lombok.ToString;

@Data
@Entity
@Table(name = "tarea")
public class Tarea {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idTarea;

    @Column(name = "descripcion", nullable = false)
    private String descripcion;

    @Column(name = "fecha")
    private Date fecha;

    @Column(name = "horas_previstas", nullable = false)
    private Double horasPrevistas;

    @Column(name = "horas_ejecutadas")
    private Double horasEjecutadas;

    @Column(name = "completada")
    private Boolean completada;

    @Column(name = "reunion")
    private Boolean reunion;
    
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "idUsuario")
    //@ToString.Exclude
    //@JsonBackReference
    @JsonIgnore 
    private Usuario usuario;
 
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "idTangible")
    //@ToString.Exclude
    //@JsonBackReference
    @JsonIgnore 
    private Tangibles tangible;
}
