package control;

import vista.HU003_GestionPagosAgricultor;
import modelo.dbConnection;
import java.sql.*;

import java.io.FileOutputStream;
import com.itextpdf.text.*;
import com.itextpdf.text.pdf.*;
import java.text.SimpleDateFormat;
import java.io.File;
import javax.swing.JTextField;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;


public class Controlador_HU003_PagosAgricultor extends ControladorPagosBase{
    
    private HU003_GestionPagosAgricultor vista;

    public Controlador_HU003_PagosAgricultor(HU003_GestionPagosAgricultor vista, int idUsuarioBD) {
        super(idUsuarioBD);
        this.vista = vista;
    }
 
    // ==============================
    // Cargar todas las ventas
    // ==============================
    public void cargarVentas() {
        DefaultTableModel modelo = new DefaultTableModel();
        modelo.addColumn("Producto");
        modelo.addColumn("Cantidad");
        modelo.addColumn("Precio");
        modelo.addColumn("Subtotal");
        modelo.addColumn("Fecha");

        double totalGanado = 0;

        try (Connection con = dbConnection.conectar()) {
            CallableStatement cs = con.prepareCall("{CALL sp_ListarVentasAgricultor(?)}");
            cs.setInt(1, idUsuarioBD);
            ResultSet rs = cs.executeQuery();

            while (rs.next()) {
                double subtotal = rs.getDouble("subtotal");
                totalGanado += subtotal;

                modelo.addRow(new Object[]{
                    rs.getString("producto"),
                    rs.getInt("cantidad"),
                    rs.getDouble("precio_unitario"),
                    subtotal,
                    rs.getString("fecha_venta")
                });
            }

            vista.getTablaVentas().setModel(modelo);
            vista.getTxtGananciaTotal().setText(String.valueOf(totalGanado));

        } catch (SQLException e) {
            JOptionPane.showMessageDialog(vista, "Error al cargar ventas: " + e.getMessage());
        }
    }

    // ==============================
    // Buscar ventas por fecha
    // ==============================
        
    public void buscarVentasPorFecha() {
        java.util.Date fechaSeleccionada = vista.getDcFechaVenta().getDate();

        if (fechaSeleccionada == null) {
            JOptionPane.showMessageDialog(vista, "Seleccione una fecha primero.", "Aviso", JOptionPane.WARNING_MESSAGE);
            return;
        }

        java.sql.Date fechaSQL = new java.sql.Date(fechaSeleccionada.getTime());

        DefaultTableModel modelo = new DefaultTableModel();
        modelo.addColumn("Producto");
        modelo.addColumn("Cantidad");
        modelo.addColumn("Precio");
        modelo.addColumn("Subtotal");
        modelo.addColumn("Fecha");

        double totalGanado = 0;

        try (Connection con = dbConnection.conectar();
             CallableStatement cs = con.prepareCall("{CALL sp_BuscarVentasPorFechaExacta(?, ?)}")) {

            cs.setInt(1, idUsuarioBD);
            cs.setDate(2, fechaSQL);
            try (ResultSet rs = cs.executeQuery()) {
                while (rs.next()) {
                    double subtotal = rs.getDouble("subtotal");
                    totalGanado += subtotal;

                    modelo.addRow(new Object[]{
                        rs.getString("nombre_producto"),
                        rs.getInt("cantidad"),
                        rs.getDouble("precio"),        // <-- usar "precio"
                        subtotal,
                        rs.getString("fecha_venta")
                    });
                }
            }

            vista.getTablaVentas().setModel(modelo);

            java.text.DecimalFormat df = new java.text.DecimalFormat("#0.00");
            vista.getTxtGananciaTotal().setText(df.format(totalGanado));

        } catch (SQLException e) {
            JOptionPane.showMessageDialog(vista, "Error al buscar por fecha: " + e.getMessage());
        }
    }

    public void generarReportePDF() {
        try (Connection con = dbConnection.conectar()) {
            // Obtener datos del usuario
            PreparedStatement ps = con.prepareStatement("SELECT nombre, apellidos FROM usuarios WHERE id_usuario = ?");
            ps.setInt(1, idUsuarioBD);
            ResultSet rs = ps.executeQuery();
            String nombreUsuario = "";
            if (rs.next()) {
                nombreUsuario = rs.getString("nombre") + " " + rs.getString("apellidos");
            }

            // Crear carpeta para reportes
            String rutaCarpeta = "Reportes";
            File carpeta = new File(rutaCarpeta);
            if (!carpeta.exists()) carpeta.mkdirs();

            String fileName = rutaCarpeta + "/ReporteVentas_" + nombreUsuario.replace(" ", "_") + ".pdf";

            Document documento = new Document();
            PdfWriter.getInstance(documento, new FileOutputStream(fileName));
            documento.open();

            Font fuenteTitulo = new Font(Font.FontFamily.HELVETICA, 18, Font.BOLD);
            Paragraph titulo = new Paragraph("Reporte de Ventas\n\n", fuenteTitulo);
            titulo.setAlignment(Element.ALIGN_CENTER);
            documento.add(titulo);

            PdfPTable tabla = new PdfPTable(4);
            tabla.setWidthPercentage(100);

            String[] headers = {"Producto", "Cantidad", "Precio", "Subtotal"};
            for (String header : headers) {
                PdfPCell celda = new PdfPCell(new Phrase(header));
                celda.setHorizontalAlignment(Element.ALIGN_CENTER);
                celda.setBackgroundColor(BaseColor.LIGHT_GRAY);
                tabla.addCell(celda);
            }

            PreparedStatement ps2 = con.prepareStatement(
                "SELECT p.nombre_producto, dv.cantidad, p.precio, dv.subtotal " +
                "FROM detalleventas dv " +
                "JOIN ventas v ON dv.id_venta = v.id_venta " +
                "JOIN productos p ON dv.id_producto = p.id_producto " +
                "WHERE p.id_agricultor = ?");
            ps2.setInt(1, idUsuarioBD);
            ResultSet rs2 = ps2.executeQuery();

            double total = 0;
            while (rs2.next()) {
                tabla.addCell(rs2.getString("nombre_producto"));
                tabla.addCell(String.valueOf(rs2.getInt("cantidad")));
                tabla.addCell("S/ " + rs2.getDouble("precio"));
                tabla.addCell("S/ " + rs2.getDouble("subtotal"));
                total += rs2.getDouble("subtotal");
            }

            documento.add(tabla);

            Paragraph totalText = new Paragraph("\nTOTAL GENERAL: S/ " + total, fuenteTitulo);
            totalText.setAlignment(Element.ALIGN_RIGHT);
            documento.add(totalText);

            documento.close();
            JOptionPane.showMessageDialog(vista, "✅ Reporte generado: " + fileName);

        } catch (Exception e) {
            e.printStackTrace();
            JOptionPane.showMessageDialog(vista, "❌ Error al generar el PDF: " + e.getMessage());
        }
    }
    
    public void cargarPagosComprador(DefaultTableModel modelo, JTextField txtTotalGastado) {
        modelo.setRowCount(0);
        double totalGastado = 0;

        try (Connection conn = dbConnection.conectar();
             CallableStatement cs = conn.prepareCall("{CALL sp_ListarPagosPorComprador(?)}")) {

            cs.setInt(1, idUsuarioBD);
            try (ResultSet rs = cs.executeQuery()) {
                while (rs.next()) {
                    Object[] fila = {
                        rs.getInt("id_venta"),
                        rs.getString("nombre_producto"),
                        rs.getInt("cantidad"),
                        rs.getDouble("precio"),
                        rs.getDouble("subtotal"),
                        rs.getTimestamp("fecha_venta")
                    };
                    modelo.addRow(fila);
                    totalGastado += rs.getDouble("subtotal");
                }
            }

            txtTotalGastado.setText("S/ " + String.format("%.2f", totalGastado));

        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Error al cargar pagos: " + e.getMessage());
        }
    }
    
    public void buscarPagosPorFecha(java.util.Date fechaSeleccionada, DefaultTableModel modelo, JTextField txtTotalGastado) {
        if (fechaSeleccionada == null) {
            JOptionPane.showMessageDialog(null, "Seleccione una fecha para buscar los pagos.");
            return;
        }

        java.sql.Date fechaSQL = new java.sql.Date(fechaSeleccionada.getTime());
        modelo.setRowCount(0);
        double totalGastado = 0;

        try (Connection conn = dbConnection.conectar();
             CallableStatement cs = conn.prepareCall("{CALL sp_BuscarPagosPorFecha(?, ?)}")) {

            cs.setInt(1, idUsuarioBD);
            cs.setDate(2, fechaSQL);

            try (ResultSet rs = cs.executeQuery()) {
                while (rs.next()) {
                    Object[] fila = {
                        rs.getInt("id_venta"),
                        rs.getString("nombre_producto"),
                        rs.getInt("cantidad"),
                        rs.getDouble("precio"),
                        rs.getDouble("subtotal"),
                        rs.getTimestamp("fecha_venta")
                    };
                    modelo.addRow(fila);
                    totalGastado += rs.getDouble("subtotal");
                }
            }

            txtTotalGastado.setText("S/ " + String.format("%.2f", totalGastado));

        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Error al buscar pagos: " + e.getMessage());
        }
    }
    
    
}
