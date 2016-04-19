/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package py.una.pol.par.models;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;

/**
 *
 * @author Gabriel
 */
public class Producto extends BaseEntity implements Serializable {
    private String descripcion;
    private BigDecimal precioUnit;
    private Integer unidadMedida;
    private Categoria categorias;
    private List<TransaccionesDet> transaccionesDetList;

    public Producto() {
    }

    public Producto(Integer id, String descripcion, BigDecimal precioUnit, Integer unidadMedida) {
        super.setId(id);
        this.descripcion = descripcion;
        this.precioUnit = precioUnit;
        this.unidadMedida = unidadMedida;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public BigDecimal getPrecioUnit() {
        return precioUnit;
    }

    public void setPrecioUnit(BigDecimal precioUnit) {
        this.precioUnit = precioUnit;
    }

    public Integer getUnidadMedida() {
        return unidadMedida;
    }

    public void setUnidadMedida(Integer unidadMedida) {
        this.unidadMedida = unidadMedida;
    }

    public Categoria getCategorias() {
        return categorias;
    }

    public void setCategorias(Categoria categorias) {
        this.categorias = categorias;
    }

    public List<TransaccionesDet> getTransaccionesDetList() {
        return transaccionesDetList;
    }

    public void setTransaccionesDetList(List<TransaccionesDet> transaccionesDetList) {
        this.transaccionesDetList = transaccionesDetList;
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
        if (!(object instanceof Producto)) {
            return false;
        }
        Producto other = (Producto) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "py.una.pol.par.ec.Productos[ id=" + id + " ]";
    }
}
