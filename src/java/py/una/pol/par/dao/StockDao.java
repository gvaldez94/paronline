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
import py.una.pol.par.models.Stock;
import py.una.pol.par.models.Producto;
import py.una.pol.par.dao.ProductoDao;

/**
 *
 * @author Gabriel
 */
public class StockDao {  
    public void crear(Stock stock) throws SQLException {
        try {
            Connection c = DBConnection.getConnection();
            PreparedStatement pstmt;
            pstmt = c.prepareStatement("INSERT INTO stock (producto_id, cantidad) VALUES (?,?)");
            pstmt.setInt(1, stock.getProductoId());
            pstmt.setInt(2, stock.getCantidad());
            pstmt.execute();
            pstmt.close();
            DBConnection.closeConnection(c);
        } catch (Exception ex) {
            Logger.getLogger(StockDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void actualizar(Stock stock) throws SQLException {
        try {
            Connection c = DBConnection.getConnection();
            PreparedStatement pstmt;
            pstmt = c.prepareStatement("UPDATE stock SET producto_id = ?, cantidad = ? WHERE id = ?");
            pstmt.setInt(1, stock.getProductoId());
            pstmt.setInt(2, stock.getCantidad());
            pstmt.setInt(3, stock.getId());
            pstmt.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(StockDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void eliminar(Integer stockId) throws SQLException {
        try {
            Connection c = DBConnection.getConnection();
            PreparedStatement pstmt = c.prepareStatement("DELETE FROM stock WHERE id = ?");
            pstmt.setInt(1, stockId);
            pstmt.executeUpdate();
            DBConnection.closeConnection(c);
        } catch (Exception ex) {
            Logger.getLogger(StockDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void disminuir(Integer stockId, int cant) throws SQLException {
        try {
            Connection c = DBConnection.getConnection();
            PreparedStatement pstmt = c.prepareStatement("UPDATE stock set cantidad = ? WHERE id = ?");
            pstmt.setInt(1, cant);
            pstmt.setInt(2, stockId);
            pstmt.executeUpdate();
            DBConnection.closeConnection(c);
        } catch (Exception ex) {
            Logger.getLogger(StockDao.class.getName()).log(Level.SEVERE, null, ex);
            throw new SQLException("Stock insuficiente.");
        }
    }

    public List<Stock> getAll() throws SQLException {
        List<Stock> retorno = new ArrayList<Stock>();
        ProductoDao productoDao = new ProductoDao();
        try {
            Connection c = DBConnection.getConnection();
            Statement stmt = c.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM stock ORDER BY id");
            while (rs.next()) {
                Stock stock = new Stock(rs.getInt(1), rs.getInt(2), rs.getInt(3));
                Producto producto = productoDao.consultar(rs.getInt(2));
                stock.setProducto(producto);
                retorno.add(stock);
            }
            rs.close();
            stmt.close();
            DBConnection.closeConnection(c);
            return retorno;
        } catch (Exception ex) {
            Logger.getLogger(StockDao.class.getName()).log(Level.SEVERE, null, ex);
            return retorno;
        }
    }

    public Stock consultar(Integer stockId) {
        try {
            Connection c = DBConnection.getConnection();
            ProductoDao productoDao = new ProductoDao();
            PreparedStatement pstmt = c.prepareStatement("SELECT * FROM stock WHERE id = ?");
            pstmt.setInt(1, stockId);
            ResultSet rs = pstmt.executeQuery();
            rs.next();
            Producto producto = productoDao.consultar(rs.getInt(2));
            Stock stock = new Stock(rs.getInt(1), rs.getInt(2), rs.getInt(3));
            stock.setProducto(producto);
            DBConnection.closeConnection(c);
            return stock;
        } catch (Exception ex) {
            Logger.getLogger(StockDao.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

}
