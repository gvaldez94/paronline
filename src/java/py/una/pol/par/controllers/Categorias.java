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
import py.una.pol.par.dao.CategoriaDao;
import py.una.pol.par.util.UtilClass;

/**
 *
 * @author Gabriel
 */
public class Categorias extends HttpServlet {

    private final CategoriaDao cm = new CategoriaDao();
    
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
            vista = this.abmCategoria(request);
        }

        if ("NW".equals(modo)) {
            vista = this.crearCategoria(request);
        }

        if ("ED".equals(modo)) {
            vista = this.editarCategoria(request);
        }
        if ("G".equals(modo)) {
            vista = this.guardarCategoria(request);
        }
        if ("EL".equals(modo)) {
            vista = this.eliminarCategoria(request);
        }
        RequestDispatcher rd = request.getRequestDispatcher(vista);
        if (rd != null) {
            rd.forward(request, response);
        }
    }

    public String abmCategoria(HttpServletRequest req) {
        req.setAttribute("modo", "L"); //Modo Lista
        try {
            req.setAttribute("categorias", this.cm.getAll());
        } catch (SQLException ex) {
            Logger.getLogger(Categorias.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "/categorias/categorias.jsp";
    }

    public String crearCategoria(HttpServletRequest req) {
        return "/categorias/crearCategoria.jsp";
    }

    public String editarCategoria(HttpServletRequest req) {
        req.getSession().setAttribute("id", req.getParameter("id"));
        py.una.pol.par.models.Categoria cat = cm.consultar(Integer.parseInt(req.getParameter("id")));
        req.getSession().setAttribute("categoria", cat);
        return "/categorias/editarCategoria.jsp";
    }

    public String eliminarCategoria(HttpServletRequest req) {
        try {
            String id = req.getParameter("id");
            this.cm.eliminar(Integer.valueOf(id));
        } catch (SQLException ex) {
            Logger.getLogger(Categorias.class.getName()).log(Level.SEVERE, null, ex);
        }
        return abmCategoria(req);
    }

    public String guardarCategoria(HttpServletRequest req) {
        String tipo = req.getParameter("tipo");
        String descripcion = req.getParameter("descripcion");
        if (UtilClass.leerCadena(descripcion)) {
            py.una.pol.par.models.Categoria cat = new py.una.pol.par.models.Categoria();
            cat.setDescripcion(descripcion);
            if (tipo.compareTo("N") == 0) {
                try {
                    this.cm.crear(cat);
                } catch (SQLException ex) {
                    Logger.getLogger(Categorias.class.getName()).log(Level.SEVERE, null, ex);
                }
            } else {
                try {
                    String id = (String) req.getSession().getAttribute("id");
                    cat.setId(Integer.valueOf(id));
                    this.cm.actualizar(cat);
                } catch (SQLException ex) {
                    Logger.getLogger(Categorias.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return abmCategoria(req);
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
