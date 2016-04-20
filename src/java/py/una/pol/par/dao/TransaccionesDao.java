/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package py.una.pol.par.dao;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import py.una.pol.par.models.Compra;
import py.una.pol.par.models.TransaccionesCab;
import py.una.pol.par.models.TransaccionesDet;
import py.una.pol.par.models.Usuarios;
import py.una.pol.par.util.DBConnection;

/**
 *
 * @author Gabriel
 */
public class TransaccionesDao {
    public void crearTransaccionesCab(TransaccionesCab cab) throws SQLException {
        try {
            Connection c = DBConnection.getConnection();
            PreparedStatement pstmt;
            pstmt = c.prepareStatement("INSERT INTO transacciones_cab (fecha, usuario_id, direccion, medio_pago, nro_tarjeta, estado) VALUES (?,?,?,?,?,?)", PreparedStatement.RETURN_GENERATED_KEYS);
            pstmt.setDate(1, new java.sql.Date(cab.getFecha().getTime()));
            pstmt.setInt(2, cab.getUsuarios().getId());
            pstmt.setString(3, cab.getDireccion());
            pstmt.setInt(4, cab.getMedioPago());
            pstmt.setString(5, cab.getNroTarjeta());
            pstmt.setString(6, cab.getEstado());
            pstmt.executeUpdate();
            ResultSet rs = pstmt.getGeneratedKeys();
            if (rs.next()) {
                cab.setId(rs.getInt(1));
            }
            pstmt.close();
            DBConnection.closeConnection(c);
        } catch (Exception ex) {
            Logger.getLogger(TransaccionesDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void crearTransaccionesDet(TransaccionesDet det) throws SQLException {
        try {
            Connection c = DBConnection.getConnection();
            PreparedStatement pstmt;
            pstmt = c.prepareStatement("INSERT INTO transacciones_det (transaccion_cab_id, item, producto_id, cantidad, precio, subtotal) VALUES (?,?,?,?,?,?)");
            pstmt.setInt(1, det.getTransaccionesCab().getId());
            pstmt.setInt(2, det.getItem());
            pstmt.setInt(3, det.getProductos().getId());
            pstmt.setInt(4, det.getCantidad());
            pstmt.setBigDecimal(5, det.getPrecio());
            pstmt.setBigDecimal(6, det.getSubtotal());
            pstmt.execute();
            pstmt.close();
            DBConnection.closeConnection(c);
        } catch (Exception ex) {
            Logger.getLogger(TransaccionesDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void actualizarTotal(BigDecimal total, int id) throws SQLException {
        try {
            Connection c = DBConnection.getConnection();
            PreparedStatement pstmt;
            pstmt = c.prepareStatement("UPDATE transacciones_cab SET total = ? WHERE id = ?");
            pstmt.setBigDecimal(1, total);
            pstmt.setInt(2, id);
            pstmt.executeUpdate();
            pstmt.close();
            DBConnection.closeConnection(c);
        } catch (Exception ex) {
            Logger.getLogger(TransaccionesDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public List<Compra> getAll(int idUsuario) throws SQLException {
        List<Compra> retorno = new ArrayList<>();
        try {
            Connection c = DBConnection.getConnection();
            PreparedStatement sql = c.prepareStatement("select * from transacciones_cab where usuario_id = ?");
            sql.setInt(1, idUsuario);

            ResultSet rs = sql.executeQuery();
            while (rs.next()) {
                Compra compra = new Compra();
                TransaccionesCab cab = new TransaccionesCab(rs.getInt(1), rs.getDate(2), rs.getString(5), rs.getString(8));
                cab.setMedioPago(rs.getInt(6));
                cab.setTotal(rs.getBigDecimal(4));
                cab.setNroTarjeta(rs.getString(7));
                Usuarios usr = new UsuarioDao().consultar(rs.getInt(3));
                cab.setUsuarios(usr);
                compra.setCab(cab);
                PreparedStatement pstmt = c.prepareStatement("select * from transacciones_det where transaccion_cab_id = ?");
                pstmt.setInt(1, cab.getId());
                ResultSet result = pstmt.executeQuery();
                List <TransaccionesDet> detalles = new ArrayList<>();
                while (result.next()){
                    TransaccionesDet det = new TransaccionesDet();
                    det.setId(result.getInt(1));
                    det.setTransaccionesCab(cab);
                    det.setItem(result.getInt(3));
                    det.setProductos(new ProductoDao().consultar(result.getInt(4)));
                    det.setCantidad(result.getInt(5));
                    det.setPrecio(result.getBigDecimal(6));
                    det.setSubtotal(result.getBigDecimal(7));
                    detalles.add(det);
                }
                compra.setDetalles(detalles);
                retorno.add(compra);
            }
            rs.close();
            sql.close();
            DBConnection.closeConnection(c);
            return retorno;
        } catch (Exception ex) {
            Logger.getLogger(TransaccionesDao.class.getName()).log(Level.SEVERE, null, ex);
            return retorno;
        }
    }
}
