/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package py.una.pol.par.controllers;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import py.una.pol.par.dao.ProductoDao;
import py.una.pol.par.models.Carrito;
import py.una.pol.par.models.Producto;
import py.una.pol.par.util.UtilClass;

/**
 *
 * @author Gabriel
 */
public class Buscar extends HttpServlet {

    ProductoDao productoDao = new ProductoDao();
    
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
        if ("B".equals(modo)) {
            String descripcion = request.getParameter("descripcion");
            Integer categoria_id = Integer.parseInt((request.getParameter("categoria")));
            ProductoDao prodDao = new ProductoDao();
            try {
                List<Producto> productos = prodDao.consultar(categoria_id, descripcion);
                request.getSession().setAttribute("productos", productos);
                RequestDispatcher rd = request.getRequestDispatcher("resultadoProductos.jsp");
                if (rd != null) {
                    rd.forward(request, response);
                }
            } catch (SQLException ex) {
                Logger.getLogger(Buscar.class.getName()).log(Level.SEVERE, null, ex);
                RequestDispatcher rd = request.getRequestDispatcher("buscar.jsp");
                if (rd != null) {
                    rd.forward(request, response);
                }
            }
        }
        if ("C".equals(modo)) {
            Carrito c = (Carrito) request.getSession().getAttribute("carrito");
            if (c == null) {
                c = new Carrito();
            }
            Integer cantidad = UtilClass.leerNumero(request.getParameter("cantidad"));
            int idProd = Integer.parseInt(request.getParameter("id"));
            Producto p = new ProductoDao().consultar(idProd);
            /*
            if (cantidad !=null && p.getCantidad()>=cantidad){
                c.add(p, cantidad);
                request.getSession().setAttribute("carrito", c);
            } 
            */
            RequestDispatcher rd = request.getRequestDispatcher("buscar.jsp");
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
