/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package py.una.pol.par.models;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

/**
 *
 * @author Gabriel
 */
public class TransaccionesCab extends BaseEntity implements Serializable {
    private Date fecha;
    private BigDecimal total;
    private String direccion;
    private Integer medioPago;
    private String nroTarjeta;
    private String estado;
    private List<TransaccionesDet> transaccionesDetList;
    private Usuarios usuarios;

    public TransaccionesCab() {
    }

    public TransaccionesCab(Integer id) {
        this.id = id;
    }

    public TransaccionesCab(Integer id, Date fecha, String direccion, String estado) {
        this.id = id;
        this.fecha = fecha;
        this.direccion = direccion;
        this.estado = estado;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public BigDecimal getTotal() {
        return total;
    }

    public void setTotal(BigDecimal total) {
        this.total = total;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public Integer getMedioPago() {
        return medioPago;
    }

    public void setMedioPago(Integer medioPago) {
        this.medioPago = medioPago;
    }

    public String getNroTarjeta() {
        return nroTarjeta;
    }

    public void setNroTarjeta(String nroTarjeta) {
        this.nroTarjeta = nroTarjeta;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public List<TransaccionesDet> getTransaccionesDetList() {
        return transaccionesDetList;
    }

    public void setTransaccionesDetList(List<TransaccionesDet> transaccionesDetList) {
        this.transaccionesDetList = transaccionesDetList;
    }

    public Usuarios getUsuarios() {
        return usuarios;
    }

    public void setUsuarios(Usuarios usuarios) {
        this.usuarios = usuarios;
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
        if (!(object instanceof TransaccionesCab)) {
            return false;
        }
        TransaccionesCab other = (TransaccionesCab) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "py.una.pol.par.ec.TransaccionesCab[ id=" + id + " ]";
    }
}
