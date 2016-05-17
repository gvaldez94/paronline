/*
 * To change this template, choose Tools | Templates
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
import py.una.pol.par.dao.UsuarioDao;
import py.una.pol.par.models.Usuario;

/**
 *
 * @author Maciel
 */
public class Login extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        request.getSession().setAttribute("error", null);
        request.setAttribute("resultadoCompra", null);
        UsuarioDao um = new UsuarioDao();
        String modo = request.getParameter("modo");
        if (modo != null && modo.compareTo("login") == 0) {
            String usuario = request.getParameter("login_name");
            String passwd = request.getParameter("passwd");
            Usuario u = (Usuario) request.getSession().getAttribute("usuario");
            if (u != null) {
                RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
                if (rd != null) {
                    rd.forward(request, response);
                }
            }
            try {
                u = um.login(usuario, passwd);
            } catch (SQLException ex) {
                Logger.getLogger(UsuarioDao.class.getName()).log(Level.SEVERE, null, ex);
            }
            String vista = "/index.jsp";
            if (u != null) {
                request.getSession().setAttribute("usuario", u);
                String url = (String) request.getSession().getAttribute("url");
                if (url != null) {
                    vista = url;
                }
            } else {
                request.setAttribute("error", "Usuario o contraseña incorrectos!");
                vista = "/login.jsp";
            }
            RequestDispatcher rd = request.getRequestDispatcher(vista);
            if (rd != null) {
                rd.forward(request, response);
            }
        } else {
            RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
            if (rd != null) {
                rd.forward(request, response);
            }
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
