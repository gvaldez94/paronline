/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package py.una.pol.par.controllers;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import py.una.pol.par.dao.CategoriaDao;
import py.una.pol.par.dao.ProductoDao;
import py.una.pol.par.models.Categoria;
import py.una.pol.par.models.Producto;
import py.una.pol.par.util.UtilClass;

/**
 *
 * @author Gabriel
 */
public class Productos extends HttpServlet {

    private final ProductoDao cm = new ProductoDao();

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
        request.setAttribute("error", null);
        request.setAttribute("resultadoCompra", null);
        String vista = null;

        if (modo == null || "L".equals(modo)) {
            vista = this.abmProducto(request);
        }

        if ("NW".equals(modo)) {
            vista = this.crearProducto(request);
        }

        if ("ED".equals(modo)) {
            vista = this.editarProducto(request);
        }
        if ("G".equals(modo)) {
            vista = this.guardarProducto(request);
        }
        if ("EL".equals(modo)) {
            vista = this.eliminarProducto(request);
        }
        RequestDispatcher rd = request.getRequestDispatcher(vista);
        if (rd != null) {
            rd.forward(request, response);
        }
    }

    public String abmProducto(HttpServletRequest req) {
        req.setAttribute("modo", "L"); //Modo Lista
        try {
            req.setAttribute("productos", this.cm.getAll());
        } catch (SQLException ex) {
            Logger.getLogger(Productos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "/productos/productos.jsp";
    }

    public String crearProducto(HttpServletRequest req) {
        return "/productos/crearProducto.jsp";
    }

    public String editarProducto(HttpServletRequest req) {
        req.getSession().setAttribute("id", req.getParameter("id"));
        Producto prod = cm.consultar(Integer.parseInt(req.getParameter("id")));
        req.getSession().setAttribute("producto", prod);
        return "/productos/editarProducto.jsp";
    }

    public String eliminarProducto(HttpServletRequest req) {
        try {
            String id = req.getParameter("id");
            this.cm.eliminar(Integer.valueOf(id));
        } catch (SQLException ex) {
            Logger.getLogger(Productos.class.getName()).log(Level.SEVERE, null, ex);
            req.setAttribute("error", ex.getMessage());
        }
        return abmProducto(req);
    }

    public String guardarProducto(HttpServletRequest req) {
        //Integer id, String descripcion, BigDecimal precioUnit, int cantidad
        String tipo = req.getParameter("tipo");
        String descripcion = req.getParameter("descripcion");
        BigDecimal precioUnit = UtilClass.leerBigDecimal(req.getParameter("precio_unit"));
        Integer unidadMedida = UtilClass.leerNumero(req.getParameter("unidad_medida"));
        int categoria_id = Integer.valueOf(req.getParameter("categoria"));
        Categoria c = new CategoriaDao().consultar(categoria_id);
        Producto prod = new Producto();
        if (UtilClass.leerCadena(descripcion) && precioUnit != null && unidadMedida != null) {
            prod.setDescripcion(descripcion);
            prod.setPrecioUnit(precioUnit);
            prod.setUnidadMedida(unidadMedida);
            prod.setCategorias(c);
            if (tipo.compareTo("N") == 0) {
                try {
                    this.cm.crear(prod);
                } catch (SQLException ex) {
                    Logger.getLogger(Productos.class.getName()).log(Level.SEVERE, null, ex);
                }
            } else {
                try {
                    String id = (String) req.getSession().getAttribute("id");
                    prod.setId(Integer.valueOf(id));
                    this.cm.actualizar(prod);
                } catch (SQLException ex) {
                    Logger.getLogger(Productos.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return abmProducto(req);
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
