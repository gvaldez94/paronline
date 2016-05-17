/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package py.una.pol.par.controllers;

import java.io.IOException;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;
import java.util.Objects;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import py.una.pol.par.dao.ProductoDao;
import py.una.pol.par.dao.StockDao;
import py.una.pol.par.dao.TransaccionesDao;
import py.una.pol.par.models.TransaccionesCab;
import py.una.pol.par.models.Usuario;
import py.una.pol.par.models.Stock;
import py.una.pol.par.models.Carrito;
import py.una.pol.par.models.Pedido;
import py.una.pol.par.models.TransaccionesDet;
import py.una.pol.par.util.UtilClass;

/**
 *
 * @author Gabriel
 */
public class TransaccionesController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @SuppressWarnings("null")
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Usuario u = (Usuario) request.getSession().getAttribute("usuario");
        request.setAttribute("resultadoCompra", null);
        if (u != null) {
            TransaccionesCab cab = new TransaccionesCab();
            cab.setUsuarios(u);
            String direccion = request.getParameter("direccion");
            int tipo = Integer.valueOf(request.getParameter("tipo"));
            cab.setDireccion(direccion);
            cab.setMedioPago(tipo);
            String tarjeta = "";
            if (tipo == 1) {
                tarjeta = request.getParameter("nroTarjeta");
                cab.setNroTarjeta(tarjeta);
            }
            Date day = Date.valueOf(LocalDate.now());
            cab.setFecha(day);
            cab.setEstado("I");
            TransaccionesDao tdao = new TransaccionesDao();
            if ((tipo == 1 && UtilClass.leerCadena(tarjeta) && UtilClass.leerCadena(direccion)) || (tipo == 0 && UtilClass.leerCadena(direccion))) {
                try {
                    cab = tdao.crearTransaccionesCab(cab);
                    int id = cab.getId();
                    Carrito c = (Carrito) request.getSession().getAttribute("carrito");
                    if (c != null) {
                        List<Pedido> pedidos = c.getAll();
                        int item = 1;
                        BigDecimal total = new BigDecimal(0);
                        ProductoDao prodao = new ProductoDao();
                        StockDao stockDao = new StockDao();
                        for (Pedido p : pedidos) {
                            TransaccionesDet td = new TransaccionesDet();
                            List<Stock> stockList = stockDao.getAll();
                            Stock stock = null;
                            for (Stock s : stockList) {
                                // la logica del negocio seria acabar con el primer stock cargado
                                // encontrar el primer stock que se ha cargado y descontarlo de el.
                                if (Objects.equals(s.getProductoId(), p.getProducto().getId()) && (s.getCantidad() >= p.getCantidad())) {
                                    stock = s;
                                    break;
                                }
                            }
                            td.setCantidad(p.getCantidad());
                            td.setProductos(p.getProducto());
                            td.setItem(item);
                            item++;
                            td.setPrecio(p.getProducto().getPrecioUnit());
                            BigDecimal cant = new BigDecimal(td.getCantidad());
                            Logger.getLogger("INFO").info("Stock - pedido: " + (stock.getCantidad()-cant.intValue()));
                            stockDao.disminuir(stock.getId(), stock.getCantidad()-cant.intValue());
                            td.setSubtotal(td.getPrecio().multiply(cant));
                            td.setTransaccionesCab(cab);
                            total = total.add(td.getSubtotal());
                            tdao.crearTransaccionesDet(td);
                        }
                        tdao.actualizarTotal(total, id);
                        request.getSession().setAttribute("carrito", null);
                        RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
                        request.setAttribute("resultadoCompra", "Su compra ha sido exitosa!.");
                        if (rd != null) {
                            rd.forward(request, response);
                        }
                    }
                } catch (Exception ex) {
                    tdao.rollback(cab.getId());
                    request.getSession().setAttribute("carrito", null);
                    Logger.getLogger(TransaccionesController.class.getName()).log(Level.SEVERE, null, ex);
                    if (!"Stock insuficiente.".equals(ex.getMessage()))
                        request.setAttribute("resultadoCompra", "Lo sentimos, ocurrió un error inesperado, intente de nuevo más tarde.");
                    else
                        request.setAttribute("resultadoCompra", ex.getMessage());
                    RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
                    if (rd != null) {
                        rd.forward(request, response);
                    }
                }
            } else {
                RequestDispatcher rd = request.getRequestDispatcher("/carrito.jsp");
                if (rd != null) {
                    rd.forward(request, response);
                }
            }
        } else {
            RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
            if (rd != null) {
                rd.forward(request, response);
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
