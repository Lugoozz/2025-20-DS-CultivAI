package control;

import vista.HU022_ActualizarPerfil;
import vista.HU020_GestionPerfilAgricultor;
import vista.HU020_GestionPerfilComprador;
import modelo.dbConnection;
import java.sql.*;
import javax.swing.*;

public class Controlador_HU022_ActualizarPerfil {

    private HU022_ActualizarPerfil vista;
    private int idUsuarioBD;
    private String tipoUsuarioBD;
    private boolean passwordVisible = false;

    public Controlador_HU022_ActualizarPerfil(HU022_ActualizarPerfil vista, int idUsuarioBD, String tipoUsuarioBD) {
        this.vista = vista;
        this.idUsuarioBD = idUsuarioBD;
        this.tipoUsuarioBD = tipoUsuarioBD;

        cargarDatosUsuario();
        vista.mostrarOjoCerrado();
    }

    public void cargarDatosUsuario() {
        try (Connection con = dbConnection.conectar()) {

            CallableStatement cs = con.prepareCall("{CALL sp_ObtenerPerfilUsuario(?)}");
            cs.setInt(1, idUsuarioBD);
            ResultSet rs = cs.executeQuery();

            if (rs.next()) {
                vista.setTxtNombreAct(rs.getString("nombre"));
                vista.setTxtApellidosAct(rs.getString("apellidos"));
                vista.setTxtDniAct(rs.getString("dni"));
                vista.setTxtCorreoAct(rs.getString("correo"));
                vista.setTxtTelefonoAct(rs.getString("telefono"));
                String pass = rs.getString("contrasena");
                vista.setTxtContrasenaAct(pass);
                vista.mostrarContrasena(false);
                
            }

        } catch (Exception e) {
            JOptionPane.showMessageDialog(vista, "❌ Error al cargar datos: " + e.getMessage());
        }
    }

    public void actualizarPerfil() {
        try (Connection con = dbConnection.conectar()) {

            CallableStatement cs = con.prepareCall("{CALL sp_ActualizarPerfil(?,?,?,?,?,?,?)}");
            cs.setInt(1, idUsuarioBD);
            cs.setString(2, vista.getTxtNombreAct());
            cs.setString(3, vista.getTxtApellidosAct());
            cs.setString(4, vista.getTxtDniAct());
            cs.setString(5, vista.getTxtCorreoAct());
            cs.setString(6, vista.getTxtTelefonoAct());
            cs.setString(7, vista.getTxtContrasenaAct());

            cs.executeUpdate();
            JOptionPane.showMessageDialog(vista, "✅ Datos actualizados correctamente.");

            cargarDatosUsuario(); // recarga datos actualizados

        } catch (Exception e) {
            JOptionPane.showMessageDialog(vista, "❌ Error al actualizar: " + e.getMessage());
        }
    }

    public void regresarPerfil() {
        vista.dispose();
        if ("Agricultor".equals(tipoUsuarioBD)) {
            new HU020_GestionPerfilAgricultor(idUsuarioBD).setVisible(true);
        } else {
            new HU020_GestionPerfilComprador(idUsuarioBD).setVisible(true);
        }
    }

    public void togglePasswordVisibility() {
        passwordVisible = !passwordVisible;
        vista.mostrarContrasena(passwordVisible);
    }
}
