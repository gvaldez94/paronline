/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package py.una.pol.par.controllers;

import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import py.una.pol.par.dao.StockDao;
import py.una.pol.par.models.Stock;
import py.una.pol.par.util.UtilClass;

/**
 *
 * @author Gabriel
 */
public class StockController extends HttpServlet {

    private final StockDao cm = new StockDao();
    
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
        String vista = null;

        if (modo == null || "L".equals(modo)) {
            vista = this.abmStock(request);
        }

        if ("NW".equals(modo)) {
            vista = this.crearStock(request);
        }

        if ("ED".equals(modo)) {
            vista = this.editarStock(request);
        }
        if ("G".equals(modo)) {
            vista = this.guardarStock(request);
        }
        if ("EL".equals(modo)) {
            vista = this.eliminarStock(request);
        }
        RequestDispatcher rd = request.getRequestDispatcher(vista);
        if (rd != null) {
            rd.forward(request, response);
        }
    }

    public String abmStock(HttpServletRequest req) {
        req.setAttribute("modo", "L"); //Modo Lista
        try {
            req.setAttribute("stocks", this.cm.getAll());
        } catch (SQLException ex) {
            Logger.getLogger(Stock.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "/stock/stock.jsp";
    }

    public String crearStock(HttpServletRequest req) {
        return "/stock/nuevoStock.jsp";
    }

    public String editarStock(HttpServletRequest req) {
        req.getSession().setAttribute("id", req.getParameter("id"));
        Stock stock = cm.consultar(Integer.parseInt(req.getParameter("id")));
        req.getSession().setAttribute("stock", stock);
        return "/stock/editarStock.jsp";
    }

    public String eliminarStock(HttpServletRequest req) {
        try {
            String id = req.getParameter("id");
            this.cm.eliminar(Integer.valueOf(id));
        } catch (SQLException ex) {
            Logger.getLogger(Stock.class.getName()).log(Level.SEVERE, null, ex);
        }
        return abmStock(req);
    }

    public String guardarStock(HttpServletRequest req) {
        //Integer id, Integer productoId, Integer cantidad
        String tipo = req.getParameter("tipo");
        Integer productoId = UtilClass.leerNumero(req.getParameter("producto_id"));
        Integer cantidad = UtilClass.leerNumero(req.getParameter("cantidad"));
        Stock stock = new Stock();
        if (productoId != null && cantidad != null) {
            stock.setProductoId(productoId);
            stock.setCantidad(cantidad);
            if (tipo.compareTo("N") == 0) {
                try {
                    this.cm.crear(stock);
                } catch (SQLException ex) {
                    Logger.getLogger(Stock.class.getName()).log(Level.SEVERE, null, ex);
                }
            } else {
                try {
                    String id = (String) req.getSession().getAttribute("id");
                    stock.setId(Integer.valueOf(id));
                    this.cm.actualizar(stock);
                } catch (SQLException ex) {
                    Logger.getLogger(Stock.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return abmStock(req);
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
