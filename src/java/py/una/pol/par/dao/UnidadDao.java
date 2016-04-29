/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package py.una.pol.par.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import py.una.pol.par.util.DBConnection;
import py.una.pol.par.models.Unidad;

/**
 *
 * @author Gabriel
 */
public class UnidadDao {
    public void crear(Unidad unidad) throws SQLException {
        try {
            Connection c = DBConnection.getConnection();
            PreparedStatement pstmt;
            pstmt = c.prepareStatement("INSERT INTO unidad (descripcion) VALUES (?)");
            pstmt.setString(1, unidad.getDescripcion());
            pstmt.execute();
            pstmt.close();
            DBConnection.closeConnection(c);
        } catch (Exception ex) {
            Logger.getLogger(UnidadDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void actualizar(Unidad unidad) throws SQLException {
        try {
            Connection c = DBConnection.getConnection();
            PreparedStatement pstmt;
            pstmt = c.prepareStatement("UPDATE unidad SET descripcion = ? WHERE id = ?");
            pstmt.setString(1, unidad.getDescripcion());
            pstmt.setInt(2, unidad.getId());
            pstmt.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(UnidadDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void eliminar(Integer unidadId) throws SQLException {
        try {
            Connection c = DBConnection.getConnection();
            PreparedStatement pstmt = c.prepareStatement("DELETE FROM unidad WHERE id = ?");
            pstmt.setInt(1, unidadId);
            pstmt.executeUpdate();
            DBConnection.closeConnection(c);
        } catch (Exception ex) {
            Logger.getLogger(UnidadDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public Unidad consultar(Integer unidadId) {
        try {
            Connection c = DBConnection.getConnection();
            PreparedStatement pstmt = c.prepareStatement("SELECT * FROM unidad WHERE id = ?");
            pstmt.setInt(1, unidadId);
            ResultSet rs = pstmt.executeQuery();
            Unidad unidad = new Unidad();
            rs.next();
            unidad.setId(rs.getInt(1));
            unidad.setDescripcion(rs.getString(2));
            DBConnection.closeConnection(c);
            return unidad;
        } catch (Exception ex) {
            Logger.getLogger(UnidadDao.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    public List<Unidad> getAll() throws SQLException {
        List<Unidad> retorno = new ArrayList<Unidad>();
        try {
            Connection c = DBConnection.getConnection();
            Statement stmt = c.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM unidad ORDER BY descripcion");

            while (rs.next()) {
                Unidad unidad = new Unidad(rs.getInt(1), rs.getString(2));
                retorno.add(unidad);
            }

            rs.close();
            stmt.close();
            DBConnection.closeConnection(c);
            
            return retorno;
        } catch (Exception ex) {
            Logger.getLogger(UnidadDao.class.getName()).log(Level.SEVERE, null, ex);
            return retorno;
        }
    }
}
