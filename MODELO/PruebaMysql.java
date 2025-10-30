package Conexiones;


public class PruebaMysql {
    public static void main(String[] args) {

        dbConnection dbc=new dbConnection();
        dbc.conectar();
    }
    
}
