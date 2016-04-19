/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package py.una.pol.par.models;

import java.util.List;

/**
 *
 * @author Gabriel
 */
public class Compra {
    private TransaccionesCab cab;
    private List <TransaccionesDet> detalles;

    public TransaccionesCab getCab() {
        return cab;
    }

    public void setCab(TransaccionesCab cab) {
        this.cab = cab;
    }

    public List<TransaccionesDet> getDetalles() {
        return detalles;
    }

    public void setDetalles(List<TransaccionesDet> detalles) {
        this.detalles = detalles;
    }
}
