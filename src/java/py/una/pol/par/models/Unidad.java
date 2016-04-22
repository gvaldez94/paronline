/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package py.una.pol.par.models;

import java.io.Serializable;

/**
 *
 * @author Gabriel
 */
public class Unidad extends BaseEntity implements Serializable {
    private String descripcion;

    public Unidad() {
        
    }
    
    public Unidad(Integer id, String descripcion) {
        super.setId(id);
        this.descripcion = descripcion;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
    
    @Override
    public String toString() {
        return "py.una.pol.par.models.Unidad[ id=" + id + " ]";
    }
}
