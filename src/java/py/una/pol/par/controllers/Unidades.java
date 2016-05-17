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
import py.una.pol.par.dao.UnidadDao;
import py.una.pol.par.models.Unidad;
import py.una.pol.par.util.UtilClass;

/**
 *
 * @author Gabriel
 */
public class Unidades extends HttpServlet {

    private final UnidadDao cm = new UnidadDao();
    
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
            vista = this.abmUnidades(request);
        }

        if ("NW".equals(modo)) {
            vista = this.crearUnidad(request);
        }

        if ("ED".equals(modo)) {
            vista = this.editarUnidad(request);
        }
        if ("G".equals(modo)) {
            vista = this.guardarUnidad(request);
        }
        if ("EL".equals(modo)) {
            vista = this.eliminarUnidad(request);
        }
        RequestDispatcher rd = request.getRequestDispatcher(vista);
        if (rd != null) {
            rd.forward(request, response);
        }
    }

    public String abmUnidades(HttpServletRequest req) {
        req.setAttribute("modo", "L"); //Modo Lista
        try {
            req.setAttribute("unidades", this.cm.getAll());
        } catch (SQLException ex) {
            Logger.getLogger(Unidades.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "/unidades/unidades.jsp";
    }

    public String crearUnidad(HttpServletRequest req) {
        return "/unidades/crearUnidad.jsp";
    }

    public String editarUnidad(HttpServletRequest req) {
        req.getSession().setAttribute("id", req.getParameter("id"));
        Unidad unidad = cm.consultar(Integer.parseInt(req.getParameter("id")));
        req.getSession().setAttribute("unidad", unidad);
        return "/unidades/editarUnidad.jsp";
    }

    public String eliminarUnidad(HttpServletRequest req) {
        try {
            String id = req.getParameter("id");
            this.cm.eliminar(Integer.valueOf(id));
        } catch (SQLException ex) {
            Logger.getLogger(Unidades.class.getName()).log(Level.SEVERE, null, ex);
            req.setAttribute("error", ex.getMessage());
        }
        return abmUnidades(req);
    }

    public String guardarUnidad(HttpServletRequest req) {
        String tipo = req.getParameter("tipo");
        String descripcion = req.getParameter("descripcion");
        if (UtilClass.leerCadena(descripcion)) {
            Unidad unidad = new Unidad();
            unidad.setDescripcion(descripcion);
            if (tipo.compareTo("N") == 0) {
                try {
                    this.cm.crear(unidad);
                } catch (SQLException ex) {
                    Logger.getLogger(Unidades.class.getName()).log(Level.SEVERE, null, ex);
                }
            } else {
                try {
                    String id = (String) req.getSession().getAttribute("id");
                    unidad.setId(Integer.valueOf(id));
                    this.cm.actualizar(unidad);
                } catch (SQLException ex) {
                    Logger.getLogger(Unidades.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return abmUnidades(req);
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
