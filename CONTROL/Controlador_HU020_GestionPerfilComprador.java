package control;

import vista.HU020_GestionPerfilComprador;
import modelo.dbConnection;
import java.sql.*;
import javax.swing.*;

public class Controlador_HU020_GestionPerfilComprador {

    private HU020_GestionPerfilComprador vista;
    private int idUsuarioBD;
    private boolean passwordVisible = false;

    public Controlador_HU020_GestionPerfilComprador(HU020_GestionPerfilComprador vista, int idUsuarioBD) {
        this.vista = vista;
        this.idUsuarioBD = idUsuarioBD;

        cargarPerfil();
        vista.mostrarOjoCerrado();
    }

    public void cargarPerfil() {
        try (Connection con = dbConnection.conectar()) {

            CallableStatement cs = con.prepareCall("{CALL sp_ObtenerPerfilUsuario(?)}");
            cs.setInt(1, idUsuarioBD);

            ResultSet rs = cs.executeQuery();

            if (rs.next()) {
                vista.setTxtNombre(rs.getString("nombre"));
                vista.setTxtApellidos(rs.getString("apellidos"));
                vista.setTxtDni(rs.getString("dni"));
                vista.setTxtCorreo(rs.getString("correo"));
                vista.setTxtTelefono(rs.getString("telefono"));
                vista.setTxtContrasena(rs.getString("contrasena"));
            }

            rs.close();
            cs.close();

        } catch (SQLException e) {
            JOptionPane.showMessageDialog(vista, "❌ Error al cargar perfil: " + e.getMessage());
        }
    }

    public void togglePasswordVisibility() {
        passwordVisible = !passwordVisible;
        vista.mostrarContrasena(passwordVisible);
    }
}

