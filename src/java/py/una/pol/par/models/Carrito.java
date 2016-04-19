/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package py.una.pol.par.models;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Gabriel
 */
public class Carrito {
    private List<Pedido> pedidos = new ArrayList<Pedido>();

    public void add(Producto p, Float cantidad) {
        Pedido pedido = new Pedido();
        pedido.setCantidad(cantidad);
        pedido.setProducto(p);
        if (this.buscar(p, cantidad) == null) {
            pedidos.add(pedido);
        }

    }

    public Pedido buscar(Producto p, Float cantidad) {
        for (Pedido pedido : this.getAll()) {
            if (p.getId() == pedido.getProducto().getId()) {
                pedido.setCantidad(pedido.getCantidad() + cantidad);
                return pedido;
            }
        }
        return null;
    }

    public void remove(Producto p) {
        Pedido pedido = this.buscar(p, 0f);
        pedidos.remove(pedido);
    }

    public List<Pedido> getAll() {
        return pedidos;
    }
}
