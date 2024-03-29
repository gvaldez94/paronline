/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package py.una.pol.par.controllers;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
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
import py.una.pol.par.models.Carrito;
import py.una.pol.par.models.Pedido;
import py.una.pol.par.models.Producto;
import py.una.pol.par.models.Stock;
import py.una.pol.par.util.UtilClass;

/**
 *
 * @author Gabriel
 */
public class Buscar extends HttpServlet {

    ProductoDao productoDao = new ProductoDao();
    StockDao stockDao = new StockDao();
    
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String modo = request.getParameter("modo");
        request.setAttribute("resultadoCompra", null);
        if ("B".equals(modo)) {
            String descripcion = request.getParameter("descripcion");
            Integer categoria_id = Integer.parseInt((request.getParameter("categoria")));
            ProductoDao prodDao = new ProductoDao();
            try {
                List<Producto> productos = prodDao.consultar(categoria_id, descripcion);
                List<Stock> stocks = stockDao.getAll();
                List<Stock> stockList = new ArrayList<Stock>();
                
                for (Producto prod : productos) {
                    for (Stock stock : stocks) {
                        if (Objects.equals(prod.getId(), stock.getProductoId())) {
                            stockList.add(stock);
                        }
                    }
                }
                
                request.getSession().setAttribute("productos", productos);
                request.getSession().setAttribute("stockList", stockList);
                RequestDispatcher rd = request.getRequestDispatcher("resultadoProductos.jsp");
                if (rd != null) {
                    rd.forward(request, response);
                }
            } catch (SQLException ex) {
                Logger.getLogger(Buscar.class.getName()).log(Level.SEVERE, null, ex);
                RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
                if (rd != null) {
                    rd.forward(request, response);
                }
            }
        } else if ("C".equals(modo)) {
            Carrito c = (Carrito) request.getSession().getAttribute("carrito");
            if (c == null) {
                c = new Carrito();
            }
            Integer cantidad = UtilClass.leerNumero(request.getParameter("cantidad"));
            int idProd = Integer.parseInt(request.getParameter("id"));
            Producto p = new ProductoDao().consultar(idProd);
            Stock stock = stockDao.consultar(UtilClass.leerNumero(request.getParameter("stock")));

            Logger.getLogger("INFO").info("Cantidad form: " + cantidad);
            Logger.getLogger("INFO").info("stock: " + stock.getCantidad());

            if (cantidad !=null && (stock.getCantidad()>=cantidad)){
                c.add(p, cantidad.floatValue());
                request.getSession().setAttribute("carrito", c);
            } 

            for (Pedido pe : c.getAll()) {
                Logger.getLogger("INFO").info("pe.cantidad " + pe.getCantidad());
                Logger.getLogger("INFO").info("pe.prod.desc " + pe.getProducto().getDescripcion());
            }
            RequestDispatcher rd = request.getRequestDispatcher("index.jsp"); // buscar cambiado por index
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
