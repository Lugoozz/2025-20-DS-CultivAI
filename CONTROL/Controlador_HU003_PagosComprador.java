package control;

import vista.HU003_GestionPagosComprador;
import java.sql.*;

import java.io.FileOutputStream;
import com.itextpdf.text.*;
import com.itextpdf.text.pdf.*;
import java.text.SimpleDateFormat;
import java.io.File;
import javax.swing.JTextField;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;

import modelo.dbConnection;

public class Controlador_HU003_PagosComprador extends ControladorPagosBase {
    private HU003_GestionPagosComprador vista;

    public Controlador_HU003_PagosComprador(HU003_GestionPagosComprador vista, int idUsuarioBD) {
        super(idUsuarioBD);
        this.vista = vista;
    }


    // =============================
    // Cargar todos los pagos del comprador
    // =============================
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
    
    // =============================
    // Buscar pagos por fecha
    // =============================
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
    
    public void generarReportePDF() {
        try {
            String rutaCarpeta = "ReportesComprador";
            File carpeta = new File(rutaCarpeta);
            if (!carpeta.exists()) carpeta.mkdirs();

            Connection con = dbConnection.conectar();

            String nombreUsuario = "";
            PreparedStatement ps = con.prepareStatement("SELECT nombre, apellidos FROM usuarios WHERE id_usuario = ?");
            ps.setInt(1, idUsuarioBD);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                nombreUsuario = rs.getString("nombre") + " " + rs.getString("apellidos");
            }

            String fileName = rutaCarpeta + "/ReportePagos_" + nombreUsuario.replace(" ", "_") + ".pdf";
            Document documento = new Document();
            PdfWriter.getInstance(documento, new FileOutputStream(fileName));
            documento.open();

            // Logo
            try {
                Image logo = Image.getInstance(getClass().getResource("/img/LOGO.png"));
                logo.scaleToFit(100, 100);
                logo.setAlignment(Element.ALIGN_CENTER);
                documento.add(logo);
            } catch (Exception e) {
                System.out.println("No se pudo cargar el logo: " + e.getMessage());
            }

            // Encabezado
            Font fuenteTitulo = new Font(Font.FontFamily.HELVETICA, 18, Font.BOLD);
            Paragraph titulo = new Paragraph("Reporte de Pagos del Comprador\n\n", fuenteTitulo);
            titulo.setAlignment(Element.ALIGN_CENTER);
            documento.add(titulo);

            Font fuenteTexto = new Font(Font.FontFamily.HELVETICA, 12, Font.NORMAL);
            Paragraph comprador = new Paragraph("Comprador: " + nombreUsuario + "\n", fuenteTexto);
            comprador.setAlignment(Element.ALIGN_CENTER);
            documento.add(comprador);

            String fecha = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss").format(new java.util.Date());
            Paragraph fechaReporte = new Paragraph("Fecha de generación: " + fecha + "\n\n", fuenteTexto);
            fechaReporte.setAlignment(Element.ALIGN_CENTER);
            documento.add(fechaReporte);

            // Tabla
            PdfPTable tabla = new PdfPTable(5);
            tabla.setWidthPercentage(100);
            String[] headers = {"Producto", "Cantidad", "Precio", "Subtotal", "Fecha"};
            Font fuenteEncabezado = new Font(Font.FontFamily.HELVETICA, 12, Font.BOLD);

            for (String header : headers) {
                PdfPCell celda = new PdfPCell(new Phrase(header, fuenteEncabezado));
                celda.setHorizontalAlignment(Element.ALIGN_CENTER);
                celda.setBackgroundColor(BaseColor.LIGHT_GRAY);
                tabla.addCell(celda);
            }

            CallableStatement cs = con.prepareCall("{CALL sp_ListarPagosPorComprador(?)}");
            cs.setInt(1, idUsuarioBD);
            ResultSet rs2 = cs.executeQuery();

            double totalGeneral = 0;
            while (rs2.next()) {
                tabla.addCell(rs2.getString("nombre_producto"));
                tabla.addCell(String.valueOf(rs2.getInt("cantidad")));
                tabla.addCell("S/ " + rs2.getDouble("precio"));
                tabla.addCell("S/ " + rs2.getDouble("subtotal"));
                tabla.addCell(rs2.getString("fecha_venta"));
                totalGeneral += rs2.getDouble("subtotal");
            }

            documento.add(tabla);
            Paragraph total = new Paragraph("TOTAL GENERAL: S/ " + totalGeneral, fuenteEncabezado);
            total.setAlignment(Element.ALIGN_RIGHT);
            documento.add(total);

            documento.close();
            JOptionPane.showMessageDialog(null, "✅ Reporte generado en: " + fileName);

        } catch (Exception e) {
            e.printStackTrace();
            JOptionPane.showMessageDialog(null, "❌ Error al generar el reporte PDF");
        }
    }
    
    
}
