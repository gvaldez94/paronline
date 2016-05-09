/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package py.una.pol.par.models;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 *
 * @author Gabriel
 */
public class TransaccionesDet extends BaseEntity implements Serializable {
    private Integer item;
    private Float cantidad;
    private BigDecimal precio;
    private BigDecimal subtotal;
    private Producto productos;
    private TransaccionesCab transaccionesCab;

    public TransaccionesDet() {
    }

    public TransaccionesDet(Integer id) {
        this.id = id;
    }

    public Integer getItem() {
        return item;
    }

    public void setItem(Integer item) {
        this.item = item;
    }

    public Float getCantidad() {
        return cantidad;
    }

    public void setCantidad(Float cantidad) {
        this.cantidad = cantidad;
    }

    public BigDecimal getPrecio() {
        return precio;
    }

    public void setPrecio(BigDecimal precio) {
        this.precio = precio;
    }

    public BigDecimal getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(BigDecimal subtotal) {
        this.subtotal = subtotal;
    }

    public Producto getProductos() {
        return productos;
    }

    public void setProductos(Producto productos) {
        this.productos = productos;
    }

    public TransaccionesCab getTransaccionesCab() {
        return transaccionesCab;
    }

    public void setTransaccionesCab(TransaccionesCab transaccionesCab) {
        this.transaccionesCab = transaccionesCab;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof TransaccionesDet)) {
            return false;
        }
        TransaccionesDet other = (TransaccionesDet) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "TransaccionesDet[ id=" + id + " ]";
    }
}
