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
public class Stock extends BaseEntity implements Serializable {
    private Integer productoId;
    private Integer unidadId;
    private Integer cantidad;

    public Stock() {
        
    }
    
    public Stock(Integer id, Integer productoId, Integer unidadId, Integer cantidad) {
        super.setId(id);
        this.productoId = productoId;
        this.unidadId = unidadId;
        this.cantidad = cantidad;
    }
    
    public Integer getProductoId() {
        return productoId;
    }

    public void setProductoId(Integer productoId) {
        this.productoId = productoId;
    }

    public Integer getUnidadId() {
        return unidadId;
    }

    public void setUnidadId(Integer unidadId) {
        this.unidadId = unidadId;
    }
    
    

    public Integer getCantidad() {
        return cantidad;
    }

    public void setCantidad(Integer cantidad) {
        this.cantidad = cantidad;
    }

    @Override
    public String toString() {
        return "py.una.pol.par.models.Stock[ id=" + id + " ]";
    }
    
}
