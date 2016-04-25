/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package py.una.pol.par.controllers;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import py.una.pol.par.dao.UsuarioDao;
import py.una.pol.par.models.Usuario;

/**
 *
 * @author Gabriel
 */
public class Sesion extends HttpServlet {

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
        if ( modo != null && modo.equals("C")) {
            UsuarioDao um = new UsuarioDao();
            Usuario u = (Usuario) request.getSession().getAttribute("usuario");
            if (u != null) {
                boolean cambio = um.cambiarPass(request.getParameter("actual"), request.getParameter("nueva"), u.getId());
                if (cambio) {
                    RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
                    if (rd != null) {
                        rd.forward(request, response);
                    }
                } else {
                    request.setAttribute("cambio", "No se guardo contraseña!");
                    RequestDispatcher rd = request.getRequestDispatcher("/usuarios/cambiarPass.jsp");
                    if (rd != null) {
                        rd.forward(request, response);
                    }
                }
            }
        } else {
            request.getSession().invalidate();
            
            RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
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
