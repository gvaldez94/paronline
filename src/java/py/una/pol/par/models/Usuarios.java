/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package py.una.pol.par.models;

import java.io.Serializable;
import java.util.List;

/**
 *
 * @author Gabriel
 */
public class Usuarios extends BaseEntity implements Serializable {
    private String nombre;
    private String apellido;
    private String loginName;
    private String passwd;
    private Integer tipoUsuario;
    private List<TransaccionesCab> transaccionesCabList;

    public Usuarios() {
    }

    public Usuarios(Integer id) {
        this.id = id;
    }

    public Usuarios(Integer id, String nombre, String apellido, String loginName, String passwd) {
        this.id = id;
        this.nombre = nombre;
        this.apellido = apellido;
        this.loginName = loginName;
        this.passwd = passwd;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getLoginName() {
        return loginName;
    }

    public void setLoginName(String loginName) {
        this.loginName = loginName;
    }

    public String getPasswd() {
        return passwd;
    }

    public void setPasswd(String passwd) {
        this.passwd = passwd;
    }

    public Integer getTipoUsuario() {
        return tipoUsuario;
    }

    public void setTipoUsuario(Integer tipoUsuario) {
        this.tipoUsuario = tipoUsuario;
    }

    public List<TransaccionesCab> getTransaccionesCabList() {
        return transaccionesCabList;
    }

    public void setTransaccionesCabList(List<TransaccionesCab> transaccionesCabList) {
        this.transaccionesCabList = transaccionesCabList;
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
        if (!(object instanceof Usuarios)) {
            return false;
        }
        Usuarios other = (Usuarios) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "py.una.pol.par.ec.Usuarios[ id=" + id + " ]";
    }
}
