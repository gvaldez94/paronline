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
import py.una.pol.par.models.Categoria;
import py.una.pol.par.util.DBConnection;

/**
 *
 * @author Gabriel
 */
public class CategoriaDao {
    public void crear(Categoria cat) throws SQLException {
        try {
            Connection c = DBConnection.getConnection();
            PreparedStatement pstmt;
            pstmt = c.prepareStatement("INSERT INTO categoria (descripcion) VALUES (?)");
            pstmt.setString(1, cat.getDescripcion());
            pstmt.execute();
            pstmt.close();
            DBConnection.closeConnection(c);
        } catch (Exception ex) {
            Logger.getLogger(CategoriaDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void actualizar(Categoria cat) throws SQLException {
        try {
            Connection c = DBConnection.getConnection();
            PreparedStatement pstmt;
            pstmt = c.prepareStatement("UPDATE categoria SET descripcion = ? WHERE id = ?");
            pstmt.setString(1, cat.getDescripcion());
            pstmt.setInt(2, cat.getId());
            pstmt.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(CategoriaDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void eliminar(Integer catId) throws SQLException {
        try {
            Connection c = DBConnection.getConnection();
            PreparedStatement pstmt = c.prepareStatement("DELETE FROM categoria WHERE id = ?");
            pstmt.setInt(1, catId);
            pstmt.executeUpdate();
            DBConnection.closeConnection(c);
        } catch (Exception ex) {
            Logger.getLogger(CategoriaDao.class.getName()).log(Level.SEVERE, null, ex);
            throw new SQLException("No se puede eliminar categoría, existe al menos un producto utilizándola.");
        }
    }
    public Categoria consultar(Integer catId) {
        try {
            Connection c = DBConnection.getConnection();
            PreparedStatement pstmt = c.prepareStatement("SELECT * FROM categoria WHERE id = ?");
            pstmt.setInt(1, catId);
            ResultSet rs = pstmt.executeQuery();
            Categoria cat = new Categoria();
            rs.next();
            cat.setId(rs.getInt(1));
            cat.setDescripcion(rs.getString(2));
            DBConnection.closeConnection(c);
            return cat;
        } catch (Exception ex) {
            Logger.getLogger(CategoriaDao.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    public List<Categoria> getAll() throws SQLException {
        List<Categoria> retorno = new ArrayList<Categoria>();
        try {
            Connection c = DBConnection.getConnection();
            Statement stmt = c.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM categoria ORDER BY descripcion");

            while (rs.next()) {
                Categoria cat = new Categoria(rs.getInt(1), rs.getString(2));
                retorno.add(cat);
            }

            rs.close();
            stmt.close();
            DBConnection.closeConnection(c);
            
            return retorno;
        } catch (Exception ex) {
            Logger.getLogger(CategoriaDao.class.getName()).log(Level.SEVERE, null, ex);
            return retorno;
        }
    }
}
