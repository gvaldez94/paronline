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
import py.una.pol.par.models.Usuario;
import py.una.pol.par.util.DBConnection;

/**
 *
 * @author Gabriel
 */
public class UsuarioDao {
    public void crear(Usuario usr) throws SQLException {
        try {
            Connection c = DBConnection.getConnection();
            PreparedStatement pstmt;
            pstmt = c.prepareStatement("INSERT INTO usuarios (nombre, apellido, login_name, passwd, tipo_usuario, email) VALUES (?,?,?,md5(?),?,?)");
            pstmt.setString(1, usr.getNombre());
            pstmt.setString(2, usr.getApellido());
            pstmt.setString(3, usr.getLoginName());
            pstmt.setString(4, usr.getPasswd());
            pstmt.setInt(5, usr.getTipoUsuario());
            pstmt.setString(6, usr.getEmail());
            pstmt.execute();
            pstmt.close();
            DBConnection.closeConnection(c);
        } catch (Exception ex) {
            Logger.getLogger(UsuarioDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void actualizar(Usuario usr) throws SQLException {
        try {
            Connection c = DBConnection.getConnection();
            PreparedStatement pstmt;
            // se le pasa el hash de la contrasenha desde html con un hidden field
            pstmt = c.prepareStatement("UPDATE usuarios SET nombre = ?, apellido=?, login_name=?, passwd= ?, tipo_usuario=?, email=? WHERE id=?");
            pstmt.setString(1, usr.getNombre());
            pstmt.setString(2, usr.getApellido());
            pstmt.setString(3, usr.getLoginName());
            pstmt.setString(4, usr.getPasswd());
            pstmt.setInt(5, usr.getTipoUsuario());
            pstmt.setString(6, usr.getEmail());
            pstmt.setInt(7, usr.getId());
            pstmt.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(UsuarioDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void eliminar(Integer usrId) throws SQLException {
        try {
            Connection c = DBConnection.getConnection();
            PreparedStatement pstmt = c.prepareStatement("DELETE FROM usuarios WHERE id = ?");
            pstmt.setInt(1, usrId);
            pstmt.executeUpdate();
            DBConnection.closeConnection(c);
        } catch (Exception ex) {
            Logger.getLogger(UsuarioDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Usuario consultar(Integer usrId) {
        try {
            Connection c = DBConnection.getConnection();
            PreparedStatement pstmt = c.prepareStatement("SELECT * FROM usuarios WHERE id = ?");
            pstmt.setInt(1, usrId);
            ResultSet rs = pstmt.executeQuery();
            Usuario user = new Usuario();
            rs.next();
            user.setId(rs.getInt(1));
            user.setNombre(rs.getString(2));
            user.setApellido(rs.getString(3));
            user.setLoginName(rs.getString(4));
            user.setPasswd(rs.getString(5));
            user.setTipoUsuario(rs.getInt(6));
            user.setEmail(rs.getString(7));
            DBConnection.closeConnection(c);
            return user;
        } catch (Exception ex) {
            Logger.getLogger(UsuarioDao.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    public List<Usuario> getAll() throws SQLException {
        List<Usuario> retorno = new ArrayList<Usuario>();
        try {
            Connection c = DBConnection.getConnection();
            Statement stmt = c.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM usuarios ORDER BY apellido, nombre");
            while (rs.next()) {
                Usuario usr = new Usuario(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(7));
                retorno.add(usr);
            }
            rs.close();
            stmt.close();
            DBConnection.closeConnection(c);
            return retorno;
        } catch (Exception ex) {
            Logger.getLogger(UsuarioDao.class.getName()).log(Level.SEVERE, null, ex);
            return retorno;
        }
    }

    public Usuario login(String loginName, String passwd) throws SQLException {
        Usuario retorno = null;
        try {
            Connection c = DBConnection.getConnection();
            PreparedStatement pstmt = c.prepareStatement("SELECT * FROM usuarios WHERE login_name = ? AND passwd = md5(?)");
            pstmt.setString(1, loginName);
            pstmt.setString(2, passwd);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                Usuario u = new Usuario();
                u.setId(rs.getInt("id"));
                u.setNombre(rs.getString("nombre"));
                u.setApellido(rs.getString("apellido"));
                u.setLoginName(rs.getString("login_name"));
                u.setPasswd(rs.getString(5));
                u.setTipoUsuario(rs.getInt(6));
                u.setEmail(rs.getString(7));
                retorno = u;
            }
            rs.close();
            pstmt.close();
            DBConnection.closeConnection(c);
            return retorno;
        } catch (Exception ex) {
            Logger.getLogger(UsuarioDao.class.getName()).log(Level.SEVERE, null, ex);
            return retorno;
        }
    }

    public boolean cambiarPass(String actual, String nueva, int id) {
        int rows;
        try {
            Connection c = DBConnection.getConnection();
            PreparedStatement pstmt;
            pstmt = c.prepareStatement("UPDATE usuarios SET passwd= md5(?) WHERE id=? and passwd=md5(?)");
            pstmt.setString(1, nueva);
            pstmt.setInt(2, id);
            pstmt.setString(3, actual);
            rows = pstmt.executeUpdate();
            return rows != 0;
        } catch (Exception ex) {
            Logger.getLogger(UsuarioDao.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }
}
