/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package py.una.pol.par.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import py.una.pol.par.dao.ProductoDao;
import py.una.pol.par.util.DBConnection;

/**
 *
 * @author Maciel
 */
public class ValidarLoginName extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            // TODO output your page here. You may use following sample code.
            try {
                Connection c = DBConnection.getConnection();
                Statement stmt = c.createStatement();
                String loginName = request.getParameter("login_name");
                /* Buscar una mejor manera de hacer esta parte, si java deja */
                /*try {
                    ResultSet rs = stmt.executeQuery("SELECT COUNT(*) AS total FROM public.usuarios WHERE login_name LIKE " + loginName);
                    out.write("no_valido");
                } catch (Exception ex) {
                    Logger.getLogger(ValidarLoginName.class.getName()).log(Level.SEVERE, null, ex + "SELECT COUNT(*) AS total FROM public.usuarios WHERE login_name LIKE " + loginName);
                    out.write("valido");
                }*/
                PreparedStatement st = c.prepareStatement("SELECT * FROM public.usuarios WHERE login_name = ?");
                st.setString(1, loginName);
                try {
                    st.executeUpdate();
                    out.write("no_valido"); // si se ejecuta bien el executeUpdate hay resultados entonces ya existe el login_name.
                } catch (Exception ex) {
                    out.write("valido"); // hay una exepcion, no hay login_name en la tabla usuarios.
                }
                /* */
                DBConnection.closeConnection(c);
            } catch (Exception ex) {
                Logger.getLogger(ValidarLoginName.class.getName()).log(Level.SEVERE, null, ex);
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
        return "Retorna una respuesta indicando si el nombre de usuario "
                + "establecido en el registro es único.";
    }// </editor-fold>

}
