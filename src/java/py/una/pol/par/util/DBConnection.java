/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package py.una.pol.par.util;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.InitialContext;
import javax.sql.DataSource;

/**
 *
 * @author Gabriel
 */
public class DBConnection {
    
    public static Connection getConnection() throws Exception {
        Connection con;
        InitialContext cxt;
        cxt = new InitialContext();
        if (cxt == null) {
            throw new Exception("No se encontro context");
        }
        DataSource ds = (DataSource) cxt.lookup("java:/comp/env/jdbc/postgres");
        con = ds.getConnection();
        return con;
    }

    public static void closeConnection(Connection conn) {
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException ex) {
                Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
}
