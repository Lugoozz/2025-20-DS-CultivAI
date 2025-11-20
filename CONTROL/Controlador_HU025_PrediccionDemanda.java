package control;

import modelo.dbConnection;
import vista.HU025_PrediccionesDemanda;
import java.sql.*;
import javax.swing.table.DefaultTableModel;
import javax.swing.JOptionPane;

public class Controlador_HU025_PrediccionDemanda {

    private HU025_PrediccionesDemanda vista;
    private int idUsuarioBD;

    public Controlador_HU025_PrediccionDemanda(HU025_PrediccionesDemanda vista, int idUsuarioBD) {
        this.vista = vista;
        this.idUsuarioBD = idUsuarioBD;

        cargarProductos();
    }

    // =======================
    // 1. CARGAR PRODUCTOS
    // =======================
    public void cargarProductos() {
        DefaultTableModel modelo = new DefaultTableModel();
        modelo.addColumn("Producto");

        try (Connection con = dbConnection.conectar()) {

            CallableStatement cs = con.prepareCall("{CALL sp_ObtenerTodosProductos()}");
            ResultSet rs = cs.executeQuery();

            while (rs.next()) {
                modelo.addRow(new Object[]{ rs.getString("nombre_producto") });
            }

            vista.setModeloTablaProductos(modelo);

        } catch (SQLException e) {
            JOptionPane.showMessageDialog(vista, "❌ Error al cargar productos: " + e.getMessage());
        }
    }


    // =======================
    // 2. CALCULAR PREDICCIÓN
    // =======================
    public void calcularPrediccion() {

        String producto = vista.getProductoSeleccionado();
        String periodo = vista.getPeriodoSeleccionado();

        if (producto == null) {
            JOptionPane.showMessageDialog(vista, "Seleccione un producto para predecir.");
            return;
        }

        // Obtener ventas desde procedimiento almacenado
        int ventasHistoricas = obtenerVentas(producto);

        // ============================
        // IA SIMBÓLICA (REGLAS)
        // ============================

        int demandaCalculada = 0;
        String tendencia = "";
        String riesgo = "";
        String recomendacion = "";

        if (ventasHistoricas > 80) {
            demandaCalculada = ventasHistoricas + 20;
            tendencia = "Alta demanda";
            riesgo = "Bajo";
            recomendacion = "Aumentar inventario y producción.";
        } else if (ventasHistoricas >= 40) {
            demandaCalculada = ventasHistoricas + 10;
            tendencia = "Demanda estable";
            riesgo = "Medio";
            recomendacion = "Mantener inventario actual.";
        } else {
            demandaCalculada = ventasHistoricas + 5;
            tendencia = "Baja demanda";
            riesgo = "Alto";
            recomendacion = "Revisar estrategia o reducir compras.";
        }

        // Ajuste por estacionalidad
        if (periodo.contains("Diciembre") || periodo.contains("Enero")) {
            demandaCalculada += 5;
            recomendacion += " Considerar incremento por estacionalidad.";
        }

        // Enviar resultados a la vista
        vista.setTxtDemandaEsperada(String.valueOf(demandaCalculada));
        vista.setTxtTendencia(tendencia);
        vista.setTxtNivelRiesgo(riesgo);
        vista.setTxtRecomendacion(recomendacion);
    }


    // =======================
    // 3. OBTENER VENTAS (SP)
    // =======================
    private int obtenerVentas(String nombreProducto) {
        try (Connection con = dbConnection.conectar()) {

            CallableStatement cs = con.prepareCall("{CALL sp_ObtenerVentasProducto(?)}");
            cs.setString(1, nombreProducto);

            ResultSet rs = cs.executeQuery();
            if (rs.next()) {
                return rs.getInt("ventas");
            }

        } catch (SQLException e) {
            JOptionPane.showMessageDialog(vista, "❌ Error consultando ventas: " + e.getMessage());
        }
        return 0;
    }
}
