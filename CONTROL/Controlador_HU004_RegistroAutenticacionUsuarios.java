package control;

import vista.HU024_InicioAgricultor;
import vista.HU024_InicioComprador;
import modelo.dbConnection;
import java.sql.*;
import javax.swing.JOptionPane;

public class Controlador_HU004_RegistroAutenticacionUsuarios {

    public void iniciarSesion(String usuario, String contra, javax.swing.JFrame vistaActual) {
        try (Connection con = dbConnection.conectar()) {
            CallableStatement cs = con.prepareCall("{CALL sp_VerificarUsuario(?,?)}");
            cs.setString(1, usuario);
            cs.setString(2, contra);

            ResultSet rs = cs.executeQuery();

            if (rs.next()) {
                int idUsuarioBD = rs.getInt("id_usuario");
                String tipo = rs.getString("tipo_usuario");
                String nombre = rs.getString("nombre");
                System.out.println("Bienvenido " + nombre + " (" + tipo + ")");

                vistaActual.dispose(); // Cierra la vista actual

                if (tipo.equalsIgnoreCase("Agricultor")) {
                    new HU024_InicioAgricultor(idUsuarioBD).setVisible(true);
                } else if (tipo.equalsIgnoreCase("Comprador")) {
                    new HU024_InicioComprador(idUsuarioBD).setVisible(true);
                }
            } else {
                JOptionPane.showMessageDialog(null, "Usuario o contraseña incorrectos");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public String registrarUsuario(String nombre, String apellidos, String dni, String correo,
                                   String telefono, String contrasena, String tipo) {

        if (nombre.isEmpty() || apellidos.isEmpty() || dni.isEmpty() ||
            correo.isEmpty() || telefono.isEmpty() || contrasena.isEmpty() || tipo == null) {
            return "❌ Todos los campos son obligatorios.";
        }

        try (Connection con = dbConnection.conectar()) {
            CallableStatement cs = con.prepareCall("{CALL sp_RegistrarUsuario(?, ?, ?, ?, ?, ?, ?)}");
            cs.setString(1, nombre);
            cs.setString(2, apellidos);
            cs.setString(3, dni);
            cs.setString(4, correo);
            cs.setString(5, telefono);
            cs.setString(6, contrasena);
            cs.setString(7, tipo);
            cs.execute();

            return "✅ Usuario registrado correctamente";
        } catch (SQLException e) {
            System.err.println("Error SQL: " + e.getMessage());
            return "❌ Error al registrar usuario: " + e.getMessage();
        }
    }
    
    
}
