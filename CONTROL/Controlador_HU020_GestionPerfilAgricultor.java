package control;

import vista.HU020_GestionPerfilAgricultor;
import modelo.dbConnection;

import java.sql.*;

import javax.swing.JOptionPane;

public class Controlador_HU020_GestionPerfilAgricultor {
    private HU020_GestionPerfilAgricultor vista;
    private int idUsuarioBD;

    public Controlador_HU020_GestionPerfilAgricultor(HU020_GestionPerfilAgricultor vista, int idUsuarioBD) {
        this.vista = vista;
        this.idUsuarioBD = idUsuarioBD;
    }

    /** Carga el perfil desde BD y rellena la vista usando los setters públicos. */
    public void cargarPerfil() {
        try (Connection con = dbConnection.conectar()) {

            CallableStatement cs = con.prepareCall("{CALL sp_ObtenerPerfilUsuario(?)}");
            cs.setInt(1, idUsuarioBD);

            try (ResultSet rs = cs.executeQuery()) {
                if (rs.next()) {
                    // usa los setters públicos de la vista
                    vista.setTxtNombre(rs.getString("nombre"));
                    vista.setTxtApellidos(rs.getString("apellidos"));
                    vista.setTxtDni(rs.getString("dni"));
                    vista.setTxtCorreo(rs.getString("correo"));
                    vista.setTxtTelefono(rs.getString("telefono"));
                    vista.setTxtContrasena(rs.getString("contrasena"));
                }
            }

            cs.close();

        } catch (SQLException e) {
            // MessageBox en la vista (o System.out) según prefieras
            JOptionPane.showMessageDialog(vista, "❌ Error al cargar perfil: " + e.getMessage());
            e.printStackTrace();
        }
    }

    /** Si quieres añadir más métodos de lógica del perfil, agrégalos aquí:
     *  actualizarPerfil(...), cambiarContrasena(...), validarCampos(...), etc.
     */
}
