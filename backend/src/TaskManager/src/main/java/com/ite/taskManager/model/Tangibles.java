package com.ite.taskManager.model;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.Data;
import lombok.ToString;

@Data
@Entity
@Table(name = "tangibles")
public class Tangibles {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idTangible;

    @Column(name = "descripcion", nullable = false)
    private String descripcion;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "idProyecto", nullable = false)
    //@ToString.Exclude
    @JsonBackReference
    private Proyecto proyecto;

    @OneToMany(mappedBy = "tangible", fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    //@ToString.Exclude
    @JsonManagedReference	
    private List<Tarea> tareas;
}