package control;

import modelo.dbConnection;
import java.sql.*;
import javax.swing.JOptionPane;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;

public class Controlador_HU001_GestionCatalogoProductos {
    
    public void registrarProducto(int idUsuarioBD, String nombre, double precio, int stock, String unidad, JTable tablaProductos) {
        try (Connection conn = dbConnection.conectar()) {

            CallableStatement stmt = conn.prepareCall("{CALL sp_RegistrarProducto(?, ?, ?, ?, ?)}");
            stmt.setInt(1, idUsuarioBD);
            stmt.setString(2, nombre);
            stmt.setDouble(3, precio);
            stmt.setInt(4, stock);
            stmt.setString(5, unidad);
            stmt.execute();

            JOptionPane.showMessageDialog(null, "✅ Producto registrado correctamente");
            stmt.close();

            // 🔄 Recargar los productos
            cargarProductos(idUsuarioBD, tablaProductos);

        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "❌ Error al registrar producto: " + e.getMessage());
        }
    }

    public void cargarProductos(int idUsuarioBD, JTable tablaProductos) {
        DefaultTableModel modelo = (DefaultTableModel) tablaProductos.getModel();
        modelo.setRowCount(0);

        try (Connection conn = dbConnection.conectar()) {
            CallableStatement cs = conn.prepareCall("{call sp_ListarProductosPorUsuario(?)}");
            cs.setInt(1, idUsuarioBD);
            ResultSet rs = cs.executeQuery();

            while (rs.next()) {
                Object[] fila = {
                    rs.getString("nombre_producto"),
                    rs.getDouble("precio"),
                    rs.getInt("stock"),
                    rs.getString("unidad_medida")
                };
                modelo.addRow(fila);
            }

            rs.close();
            cs.close();

        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Error al cargar productos: " + e.getMessage());
        }
    }
    
    public DefaultTableModel buscarProductos(String nombreProducto) {
        DefaultTableModel modelo = new DefaultTableModel();
        modelo.addColumn("ID");
        modelo.addColumn("Nombre");
        modelo.addColumn("Precio");
        modelo.addColumn("Stock");
        modelo.addColumn("Unidad");

        try (Connection con = dbConnection.conectar()) {
            CallableStatement cs = con.prepareCall("{CALL sp_BuscarProducto(?)}");
            cs.setString(1, nombreProducto);
            ResultSet rs = cs.executeQuery();

            while (rs.next()) {
                modelo.addRow(new Object[]{
                    rs.getInt("id_producto"),
                    rs.getString("nombre_producto"),
                    rs.getDouble("precio"),
                    rs.getInt("stock"),
                    rs.getString("unidad_medida")
                });
            }
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Error al buscar productos: " + e.getMessage());
        }

        return modelo;
    }
    
    public boolean agregarAlCarrito(int idUsuario, int idProducto, int cantidad, double stock) {
        if (cantidad > stock) {
            JOptionPane.showMessageDialog(null, "Stock insuficiente.");
            return false;
        }

        try (Connection con = dbConnection.conectar()) {
            CallableStatement cs = con.prepareCall("{CALL sp_AgregarCarrito(?,?,?)}");
            cs.setInt(1, idUsuario);
            cs.setInt(2, idProducto);
            cs.setInt(3, cantidad);
            cs.execute();
            JOptionPane.showMessageDialog(null, "✅ Producto agregado al carrito.");
            return true;
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Error al agregar al carrito: " + e.getMessage());
            return false;
        }
    }
    
    
}
