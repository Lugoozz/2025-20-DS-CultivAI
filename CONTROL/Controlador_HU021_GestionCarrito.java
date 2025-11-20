package control;

import vista.HU023_GestionCarrito;
import modelo.dbConnection;
import java.sql.*;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;

public class Controlador_HU021_GestionCarrito {

    private HU023_GestionCarrito vista;
    private int idUsuarioBD;

    public Controlador_HU021_GestionCarrito(HU023_GestionCarrito vista, int idUsuarioBD) {
        this.vista = vista;
        this.idUsuarioBD = idUsuarioBD;
        cargarCarrito();
    }

    // ===============================
    // MÉTODOS PRINCIPALES DEL CARRITO
    // ===============================

    public void cargarCarrito() {
        DefaultTableModel modelo = new DefaultTableModel();
        modelo.addColumn("Nombre");
        modelo.addColumn("Cantidad");
        modelo.addColumn("Medida");
        modelo.addColumn("Subtotal");

        try (Connection con = dbConnection.conectar()) {
            PreparedStatement ps = con.prepareStatement(
                "SELECT p.nombre_producto, c.cantidad, p.unidad_medida, c.subtotal " +
                "FROM carrito c INNER JOIN productos p ON c.id_producto = p.id_producto " +
                "WHERE c.id_usuario = ?"
            );
            ps.setInt(1, idUsuarioBD);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                modelo.addRow(new Object[]{
                    rs.getString("nombre_producto"),
                    rs.getInt("cantidad"),
                    rs.getString("unidad_medida"),
                    rs.getDouble("subtotal")
                });
            }

            vista.setTablaCarritoModel(modelo);
            calcularTotal();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(vista, "Error al cargar carrito: " + e.getMessage());
        }
    }

    public void calcularTotal() {
        double total = 0.0;

        for (int i = 0; i < vista.getTablaCarrito().getRowCount(); i++) {
            double subtotal = Double.parseDouble(vista.getTablaCarrito().getValueAt(i, 3).toString());
            total += subtotal;
        }

        vista.setTxtTotal(String.valueOf(total));
    }

    public void quitarDelCarrito() {
        int fila = vista.getTablaCarrito().getSelectedRow();
        if (fila == -1) {
            JOptionPane.showMessageDialog(vista, "Seleccione un producto del carrito.");
            return;
        }

        String nombreProducto = vista.getTablaCarrito().getValueAt(fila, 0).toString();

        try (Connection con = dbConnection.conectar()) {
            PreparedStatement ps = con.prepareStatement(
                "SELECT id_producto FROM productos WHERE nombre_producto = ?"
            );
            ps.setString(1, nombreProducto);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                int idProducto = rs.getInt("id_producto");

                CallableStatement cs = con.prepareCall("{CALL sp_QuitarDelCarrito(?,?)}");
                cs.setInt(1, idUsuarioBD);
                cs.setInt(2, idProducto);
                cs.execute();

                JOptionPane.showMessageDialog(vista, "❌ Producto eliminado del carrito.");
                cargarCarrito();
            }
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(vista, "Error al eliminar: " + e.getMessage());
        }
    }

    public void finalizarCompra() {
        try (Connection con = dbConnection.conectar()) {
            CallableStatement cs = con.prepareCall("{CALL sp_FinalizarCompra(?)}");
            cs.setInt(1, idUsuarioBD);
            cs.execute();

            JOptionPane.showMessageDialog(vista, "✅ Compra realizada con éxito!");
            cargarCarrito();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(vista, "Error al finalizar la compra: " + e.getMessage());
        }
    }
}
