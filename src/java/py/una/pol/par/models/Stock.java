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
    private Integer cantidad;
    
    private Producto producto;

    public Stock() {
        
    }
    
    public Stock(Integer id, Integer productoId, Integer cantidad) {
        super.setId(id);
        this.productoId = productoId;
        this.cantidad = cantidad;
    }
    
    public Integer getProductoId() {
        return productoId;
    }

    public void setProductoId(Integer productoId) {
        this.productoId = productoId;
    }

    public Integer getCantidad() {
        return cantidad;
    }

    public void setCantidad(Integer cantidad) {
        this.cantidad = cantidad;
    }

    public Producto getProducto() {
        return producto;
    }

    public void setProducto(Producto producto) {
        this.producto = producto;
    }
    
    @Override
    public String toString() {
        return "py.una.pol.par.models.Stock[ id=" + id + " ]";
    }
    
}
