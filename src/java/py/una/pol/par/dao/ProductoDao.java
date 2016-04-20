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
import py.una.pol.par.models.Producto;
import py.una.pol.par.util.DBConnection;

/**
 *
 * @author Gabriel
 */
public class ProductoDao {
    public void crear(Producto prod) throws SQLException {
        try {
            Connection c = DBConnection.getConnection();
            PreparedStatement pstmt;
            pstmt = c.prepareStatement("INSERT INTO productos (descripcion, categoria_id, precio_unit, unidad_medida) VALUES (?,?,?,?)");
            pstmt.setString(1, prod.getDescripcion());
            pstmt.setInt(2, prod.getCategorias().getId());
            pstmt.setBigDecimal(3, prod.getPrecioUnit());
            pstmt.setInt(4, prod.getUnidadMedida());
            pstmt.execute();
            pstmt.close();
            DBConnection.closeConnection(c);
        } catch (Exception ex) {
            Logger.getLogger(ProductoDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void actualizar(Producto prod) throws SQLException {
        try {
            Connection c = DBConnection.getConnection();
            PreparedStatement pstmt;
            pstmt = c.prepareStatement("UPDATE productos SET descripcion = ?, categoria_id = ?, precio_unit = ?, unidad_medida = ? WHERE id = ?");
            pstmt.setString(1, prod.getDescripcion());
            pstmt.setInt(2, prod.getCategorias().getId());
            pstmt.setBigDecimal(3, prod.getPrecioUnit());
            pstmt.setInt(4, prod.getUnidadMedida());
            pstmt.setInt(5, prod.getId());
            pstmt.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(ProductoDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void eliminar(Integer prodId) throws SQLException {
        try {
            Connection c = DBConnection.getConnection();
            PreparedStatement pstmt = c.prepareStatement("DELETE FROM productos WHERE id = ?");
            pstmt.setInt(1, prodId);
            pstmt.executeUpdate();
            DBConnection.closeConnection(c);
        } catch (Exception ex) {
            Logger.getLogger(ProductoDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void disminuir(Integer prodId, int cant) throws SQLException {
        try {
            Connection c = DBConnection.getConnection();
            PreparedStatement pstmt = c.prepareStatement("UPDATE productos set cantidad = ? WHERE id = ?");
            pstmt.setInt(1, cant);
            pstmt.setInt(2, prodId);
            pstmt.executeUpdate();
            DBConnection.closeConnection(c);
        } catch (Exception ex) {
            Logger.getLogger(ProductoDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public List<Producto> getAll() throws SQLException {
        List<Producto> retorno = new ArrayList<Producto>();
        try {
            Connection c = DBConnection.getConnection();
            Statement stmt = c.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM productos ORDER BY descripcion");    
            while (rs.next()) {
                Producto prod = new Producto(rs.getInt(1), rs.getString(2), rs.getBigDecimal(4), rs.getInt(5));
                Categoria cat = new CategoriaDao().consultar(rs.getInt(3));
                prod.setCategorias(cat);
                retorno.add(prod);
            }
            rs.close();
            stmt.close();
            DBConnection.closeConnection(c);
            return retorno;
        } catch (Exception ex) {
            Logger.getLogger(ProductoDao.class.getName()).log(Level.SEVERE, null, ex);
            return retorno;
        }
    }

    public List<Producto> consultar(int idCategoria, String desc) throws SQLException {
        List<Producto> retorno = new ArrayList<Producto>();
        try {
            Connection c = DBConnection.getConnection();
            PreparedStatement pstmt;
            desc = "%"+desc + "%";
            if (idCategoria != 0) {
                pstmt = c.prepareStatement("SELECT * FROM productos WHERE lower(descripcion) like ? and categoria_id = ? ORDER BY descripcion asc");
                pstmt.setString(1, desc.toLowerCase());
                pstmt.setInt(2, idCategoria);
            } else {
                pstmt = c.prepareStatement("SELECT * FROM productos WHERE lower(descripcion) like ? ORDER BY descripcion asc");
                pstmt.setString(1, desc.toLowerCase());
            }
            ResultSet rs = pstmt.executeQuery();    
            while (rs.next()) {
                Producto prod = new Producto(rs.getInt(1), rs.getString(2), rs.getBigDecimal(4), rs.getInt(5));
                Categoria cat = new CategoriaDao().consultar(rs.getInt(3));
                prod.setCategorias(cat);
                retorno.add(prod);
            }
            rs.close();
            pstmt.close();
            DBConnection.closeConnection(c);
            return retorno;
        } catch (Exception ex) {
            Logger.getLogger(ProductoDao.class.getName()).log(Level.SEVERE, null, ex);
            return retorno;
        }
    }

    public Producto consultar(Integer prodId) {
        try {
            Connection c = DBConnection.getConnection();
            PreparedStatement pstmt = c.prepareStatement("SELECT * FROM productos WHERE id = ?");
            pstmt.setInt(1, prodId);
            ResultSet rs = pstmt.executeQuery();
            rs.next();
            Producto prod = new Producto(rs.getInt(1), rs.getString(2), rs.getBigDecimal(4), rs.getInt(5));
            Categoria cat = new CategoriaDao().consultar(rs.getInt(3));
            prod.setCategorias(cat);
            DBConnection.closeConnection(c);
            return prod;
        } catch (Exception ex) {
            Logger.getLogger(CategoriaDao.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
}
