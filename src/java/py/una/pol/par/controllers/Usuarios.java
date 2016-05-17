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
import py.una.pol.par.dao.UsuarioDao;
import py.una.pol.par.models.Usuario;

/**
 *
 * @author Gabriel
 */
public class Usuarios extends HttpServlet {

    private final UsuarioDao um = new UsuarioDao();
    
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
        String vista = null;
        // logged
        if (modo == null || "L".equals(modo)) {
            vista = this.abmUsuario(request);
        }

        // crear usuario
        if ("NW".equals(modo)) {
            vista = this.crearUsuario(request);
        }

        // editar usuario
        if ("ED".equals(modo)) {
            vista = this.editarUsuario(request);
        }
        
        // guardar usuario
        if ("G".equals(modo)) {
            vista = this.guardarUsuario(request);
        }
        
        // eliminar usuario
        if ("EL".equals(modo)) {
            vista = this.eliminarUsuario(request);
        }
        
        RequestDispatcher rd = request.getRequestDispatcher(vista);
        if (rd != null) {
            rd.forward(request, response);
        }
    }

    public String abmUsuario(HttpServletRequest req) {
        req.setAttribute("modo", "L"); //Modo Lista
        Usuario u = (Usuario) req.getSession().getAttribute("usuario");
        if (u == null || u.getTipoUsuario() != 0) {
            return "/index.jsp";
        }
        try {
            req.setAttribute("usuarios", this.um.getAll());
        } catch (SQLException ex) {
            Logger.getLogger(Usuarios.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "/usuarios/Usuarios.jsp";
    }

    public String crearUsuario(HttpServletRequest req) {
        return "/usuarios/crearUsuario.jsp";
    }

    public String editarUsuario(HttpServletRequest req) {
        req.getSession().setAttribute("id", req.getParameter("id"));
        return "/usuarios/editarUsuario.jsp";
    }

    public String eliminarUsuario(HttpServletRequest req) {
        try {
            String id = req.getParameter("id");
            this.um.eliminar(Integer.valueOf(id));
        } catch (SQLException ex) {
            Logger.getLogger(Usuarios.class.getName()).log(Level.SEVERE, null, ex);
        }
        return abmUsuario(req);
    }

    public String guardarUsuario(HttpServletRequest req) {
        String tipo = req.getParameter("tipo");
        String nombre = req.getParameter("nombre");
        String apellido = req.getParameter("apellido");
        String login_name = req.getParameter("login_name");
        String passwd = req.getParameter("passwd");
        String email = req.getParameter("email");
        Integer tipoUsuario = Integer.parseInt(req.getParameter("tipoUsuario"));
        Usuario usr = new Usuario();
        usr.setApellido(apellido);
        usr.setLoginName(login_name);
        usr.setNombre(nombre);
        usr.setPasswd(passwd);
        usr.setTipoUsuario(tipoUsuario);
        usr.setEmail(email);
        if (tipo.compareTo("N") == 0) {
            try {
                this.um.crear(usr);
            } catch (SQLException ex) {
                Logger.getLogger(Usuarios.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            try {
                String id = (String) req.getParameter("id");
                usr.setId(Integer.valueOf(id));
                this.um.actualizar(usr);
                req.getSession().setAttribute("usuario", usr);
            } catch (SQLException ex) {
                Logger.getLogger(Usuarios.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return "/index.jsp";
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
