/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package py.una.pol.par.models;

/**
 *
 * @author Gabriel
 */
public class Pedido {
    private Float cantidad;
    private Producto producto;

    public Pedido ()
    {
    }

    public Pedido(Producto p, Float cantidad) {
        this.producto = p;
        this.cantidad = cantidad;
    }

    public Float getCantidad() {
        return cantidad;
    }

    public void setCantidad(Float cantidad) {
        this.cantidad = cantidad;
    }

    public Producto getProducto() {
        return producto;
    }

    public void setProducto(Producto producto) {
        this.producto = producto;
    }
}
