package control;

import modelo.dbConnection;
import java.sql.*;


public abstract class ControladorPagosBase {
    protected int idUsuarioBD;

    public ControladorPagosBase(int idUsuarioBD) {
        this.idUsuarioBD = idUsuarioBD;
    }

    // Ejemplo: si ambos generan PDF, pero con diferente contenido
    public abstract void generarReportePDF();

    // Aquí puedes poner funciones comunes (ejemplo: conexión o validaciones)
    protected Connection conectarBD() throws SQLException {
        return dbConnection.conectar();
    }
}
